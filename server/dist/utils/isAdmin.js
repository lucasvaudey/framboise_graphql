"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.isAdmin = void 0;
const jsonwebtoken_1 = require("jsonwebtoken");
const User_1 = require("../models/User");
const isAdmin = async ({ context }, next) => {
    var _a;
    const authorization = context.req.headers.authorization;
    if (!authorization) {
        throw new Error("MISSING TOKEN");
    }
    const token = authorization.split(" ")[1];
    try {
        const payload = (0, jsonwebtoken_1.verify)(token, process.env.SECRET_JWT);
        context.payload = payload;
    }
    catch (err) {
        throw Error("TOKEN_EXPIRED");
    }
    const user = await User_1.User.findOne({ where: { id: (_a = context.payload) === null || _a === void 0 ? void 0 : _a.userId } });
    if (!user) {
        throw new Error("TOKEN INVALID");
    }
    if (!user.admin) {
        throw new Error("NOT AUTHORIZED");
    }
    return next();
};
exports.isAdmin = isAdmin;
//# sourceMappingURL=isAdmin.js.map