import { verify } from "jsonwebtoken";
import { User } from "../models/User";
import { MyContext } from "../types/MyContext";
import { MiddlewareFn } from "type-graphql";

export const isAdmin: MiddlewareFn<MyContext> = async ({ context }, next) => {
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
  const user = await User.findOne({ where: { id: context.payload?.userId } });
  if (!user) {
    throw new Error("TOKEN INVALID");
  }
  if (!user.admin) {
    throw new Error("NOT AUTHORIZED");
  }
  return next();
};
