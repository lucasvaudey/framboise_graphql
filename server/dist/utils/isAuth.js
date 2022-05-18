"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.createRefreshToken = exports.createAccessToken = exports.isAuth = void 0;
const jsonwebtoken_1 = require("jsonwebtoken");
const jsonwebtoken_2 = require("jsonwebtoken");
const crypto_js_1 = __importDefault(require("crypto-js"));
const isAuth = ({ context }, next) => {
    const authorization = context.req.headers.authorization;
    if (!authorization) {
        throw new Error("MISSING TOKEN");
    }
    const token = authorization.split(" ")[1];
    try {
        const payload = (0, jsonwebtoken_2.verify)(token, process.env.SECRET_JWT);
        context.payload = payload;
    }
    catch (err) {
        throw Error("TOKEN_EXPIRED");
    }
    return next();
};
exports.isAuth = isAuth;
const createAccessToken = (user) => {
    return (0, jsonwebtoken_1.sign)({ userId: user.id }, process.env.SECRET_JWT, {
        expiresIn: process.env.EXPIRES_IN_TOKEN,
    });
};
exports.createAccessToken = createAccessToken;
const createRefreshToken = (user) => {
    return (0, jsonwebtoken_1.sign)({
        jid: crypto_js_1.default.enc.Base64.stringify(crypto_js_1.default.HmacSHA256(user.password, process.env.SECRET_JID)),
        userId: user.id,
    }, process.env.SECRET_REFRESH, {
        expiresIn: process.env.EXPIRES_IN_TOKEN_REFRESH,
    });
};
exports.createRefreshToken = createRefreshToken;
//# sourceMappingURL=isAuth.js.map