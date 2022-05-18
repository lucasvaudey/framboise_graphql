import { sign } from "jsonwebtoken";
import { verify } from "jsonwebtoken";
import { MyContext } from "src/types/MyContext";
import { MiddlewareFn } from "type-graphql";
import CryptoJS from "crypto-js";
import { User } from "../models/User";

export const isAuth: MiddlewareFn<MyContext> = ({ context }, next) => {
  const authorization = context.req.headers.authorization;
  if (!authorization) {
    throw new Error("MISSING TOKEN");
  }
  const token = authorization.split(" ")[1];
  try {
    const payload = verify(token, process.env.SECRET_JWT);
    context.payload = payload as any;
  } catch (err) {
    throw Error("TOKEN_EXPIRED");
  }
  return next();
};

export const createAccessToken = (user: User) => {
  return sign({ userId: user.id }, process.env.SECRET_JWT, {
    expiresIn: process.env.EXPIRES_IN_TOKEN,
  });
};
export const createRefreshToken = (user: User) => {
  return sign(
    {
      jid: CryptoJS.enc.Base64.stringify(
        CryptoJS.HmacSHA256(user.password, process.env.SECRET_JID)
      ),
      userId: user.id,
    },
    process.env.SECRET_REFRESH,
    {
      expiresIn: process.env.EXPIRES_IN_TOKEN_REFRESH,
    }
  );
};
