import { compare, hash } from "bcryptjs";
import { verify } from "jsonwebtoken";
import { MyContext } from "src/types/MyContext";
import { createAccessToken, createRefreshToken, isAuth } from "../utils/isAuth";
import {
  Arg,
  Ctx,
  Field,
  Mutation,
  ObjectType,
  Query,
  registerEnumType,
  Resolver,
  UseMiddleware,
} from "type-graphql";
import CryptoJS from "crypto-js";
import { User } from "../models/User";
import { isAdmin } from "../utils/isAdmin";
import { openGate } from "../utils/openGate";

@ObjectType()
class ErrorType {
  @Field(() => String)
  label: string;
  @Field()
  message: string;
}

@ObjectType()
class UserResponse {
  @Field(() => User, { nullable: true })
  user: User;
}

@ObjectType()
class Token {
  @Field(() => String)
  access: string;
  @Field(() => String)
  refresh: string;
}

enum PointageType {
  START = "START",
  END = "END",
  BREAK_START = "BREAK_START",
  BREAK_END = "BREAK_END",
}

registerEnumType(PointageType, {
  name: "PointageType",
  description: "Type de pointage ex: Arrivé, départ, pause",
});

@ObjectType()
class ConnectionResponse {
  @Field(() => Token, { nullable: true })
  token: Token | null;
  @Field(() => ErrorType, { nullable: true })
  error: ErrorType | null;
}

export interface TokenRefreshData {
  userId: number;
  jid: string;
}

@Resolver()
export class UserResolver {
  @Query(() => UserResponse)
  @UseMiddleware(isAuth)
  async me(@Ctx() { payload }: MyContext) {
    const user = await User.findOne({
      where: { id: payload?.userId },
    });
    if (!user) {
      return {
        user: null,
      };
    }
    console.log(user);
    return {
      user: user,
    };
  }

  @Mutation(() => ConnectionResponse)
  @UseMiddleware(isAuth)
  async changePassword(
    @Ctx() { payload }: MyContext,
    @Arg("oldPassword") oldPassword: string,
    @Arg("newPassword") newPassword: string
  ): Promise<ConnectionResponse> {
    if (oldPassword.length < 5) {
      return {
        error: {
          label: "changePwd",
          message: "old password not valid",
        },
        token: null,
      };
    }
    if (newPassword.length < 5) {
      return {
        error: {
          label: "changePwd",
          message: "new password too short",
        },
        token: null,
      };
    }
    const user = await User.findOne({ where: { id: payload?.userId } });
    if (!user) {
      return {
        error: {
          label: "changePwd",
          message: "cannot find user",
        },
        token: null,
      };
    }
    const oldPasswordValid = await compare(oldPassword, user.password);
    if (!oldPasswordValid) {
      return {
        error: {
          label: "changePwd",
          message: "Old password not valid",
        },
        token: null,
      };
    }
    user.password = await hash(newPassword, 10);
    await User.save(user);
    //succesfuly update the password
    return {
      error: null,
      token: {
        access: createAccessToken(user),
        refresh: createRefreshToken(user),
      },
    };
  }

  @Mutation(() => ConnectionResponse)
  async refreshToken(@Ctx() { req }: MyContext): Promise<ConnectionResponse> {
    const authorization = req.headers.authorization;
    if (!authorization) {
      return {
        error: {
          label: "refreshToken",
          message: "MISSING TOKEN",
        },
        token: null,
      };
    }
    const token = authorization.split(" ")[1];
    const payload = verify(
      token,
      process.env.SECRET_REFRESH
    ) as TokenRefreshData;
    if (!payload) {
      return {
        error: {
          label: "refreshToken",
          message: "INVALID_TOKEN",
        },
        token: null,
      };
    }

    const userId = payload.userId;
    console.log(userId);
    const user = await User.findOne({ where: { id: userId } });
    if (!user) {
      return {
        error: {
          label: "refreshToken",
          message: "INVALID_TOKEN",
        },
        token: null,
      };
    }
    const actualPass = CryptoJS.enc.Base64.stringify(
      CryptoJS.HmacSHA256(user.password, process.env.SECRET_JID)
    );
    if (payload.jid == actualPass) {
      console.log("success");
      return {
        token: {
          access: createAccessToken(user),
          refresh: createRefreshToken(user),
        },
        error: null,
      };
    }
    return {
      token: null,
      error: {
        label: "refreshToken",
        message: "PASSWORD_HAS_CHANGED",
      },
    };
  }

  @Mutation(() => ConnectionResponse)
  async connect(
    @Arg("emailOrUsername") emailOrPseudo: string,
    @Arg("password") password: string
  ): Promise<ConnectionResponse> {
    const userEmail = await User.findOne({ where: { email: emailOrPseudo } });
    var user = userEmail;
    if (!userEmail) {
      const userPseudo = await User.findOne({
        where: { pseudo: emailOrPseudo },
      });
      user = userPseudo;
      if (!userPseudo) {
        return {
          error: {
            label: "connection",
            message: "Cannot connect user",
          },
          token: null,
        };
      }
    }
    if (!user) {
      return {
        error: {
          label: "connection",
          message: "Cannot connect user",
        },
        token: null,
      };
    }
    const valid = await compare(password, user.password);
    if (!valid) {
      return {
        error: {
          label: "connection",
          message: "Cannot connect user",
        },
        token: null,
      };
    }
    // login successful

    return {
      token: {
        access: createAccessToken(user),
        refresh: createRefreshToken(user),
      },
      error: null,
    };
  }

  @Mutation(() => Boolean)
  @UseMiddleware(isAuth)
  async openTheGate(@Ctx() { payload }: MyContext): Promise<Boolean> {
    const user = await User.findOne({ where: { id: payload?.userId } });
    if (!user) {
      return false;
    }
    user.count++;
    user.save();
    const result = await openGate();
    if (!result) {
      return false;
    }
    return true;
  }

  @Query(() => [User], { nullable: true })
  @UseMiddleware(isAuth)
  async listUser(): Promise<User[] | null> {
    const userList = await User.find();
    if (!userList) {
      return null;
    }
    return userList;
  }

  @Mutation(() => Boolean)
  @UseMiddleware(isAuth)
  @UseMiddleware(isAdmin)
  async deleteUser(@Arg("email") email: String): Promise<Boolean> {
    const user = await User.findOne({ where: { email: email } });
    if (!user) {
      return false;
    }
    await User.remove(user);
    return true;
  }

  @Mutation(() => ConnectionResponse)
  @UseMiddleware(isAuth)
  @UseMiddleware(isAdmin)
  async register(
    @Arg("email") email: string,
    @Arg("password") password: string,
    @Arg("name") name: string
  ): Promise<ConnectionResponse> {
    const hashedPassword = await hash(password, 10);
    const user = await User.findOne({ where: { email } });
    if (user) {
      return {
        error: {
          label: "register",
          message: "email already exists",
        },
        token: null,
      };
    }
    if (email.length < 3) {
      return {
        error: {
          label: "register",
          message: "email not valid",
        },
        token: null,
      };
    }
    if (password.length < 5) {
      return {
        error: {
          label: "register",
          message: "password too short",
        },
        token: null,
      };
    }
    if (!email.includes("@") || !email.includes(".")) {
      return {
        error: {
          label: "register",
          message: "email not valid",
        },
        token: null,
      };
    }
    await User.insert({
      email: email,
      password: hashedPassword,
      name: name,
    });
    const userCreated = await User.findOne({ where: { email } });
    if (userCreated) {
      return {
        error: null,
        token: {
          access: createAccessToken(userCreated),
          refresh: createRefreshToken(userCreated),
        },
      };
    }
    return {
      error: {
        label: "registration",
        message: "error while retreving user",
      },
      token: null,
    };
  }

  //TODO: connection et pointage my time
  // @Mutation(() => Boolean)
  // async pointage(): // @Arg("type") type: PointageType,
  // // @Arg("date") time: Date
  // Promise<boolean> {
  //   return true;
  // }

  // @Mutation(() => Boolean)
  // @UseMiddleware(isAuth)
  // async myTimeConnection(
  //   @Arg("emailMyTime") email: String,
  //   @Arg("passwordMyTime") password: String
  // ): Promise<boolean> {
  //   const url = `https://api.mytime.fr/oauth/get-token?email=${email}&password=${password}`;
  //   console.log(url);
  //   //const response = await fetch(url, { method: "GET" });
  //   //const data = await response.text();
  //   //console.log(data);
  //   return false;
  // }
}
