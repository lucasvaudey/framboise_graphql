"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var __param = (this && this.__param) || function (paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.UserResolver = void 0;
const bcryptjs_1 = require("bcryptjs");
const jsonwebtoken_1 = require("jsonwebtoken");
const isAuth_1 = require("../utils/isAuth");
const type_graphql_1 = require("type-graphql");
const crypto_js_1 = __importDefault(require("crypto-js"));
const User_1 = require("../models/User");
const isAdmin_1 = require("../utils/isAdmin");
const openGate_1 = require("../utils/openGate");
let ErrorType = class ErrorType {
};
__decorate([
    (0, type_graphql_1.Field)(() => String),
    __metadata("design:type", String)
], ErrorType.prototype, "label", void 0);
__decorate([
    (0, type_graphql_1.Field)(),
    __metadata("design:type", String)
], ErrorType.prototype, "message", void 0);
ErrorType = __decorate([
    (0, type_graphql_1.ObjectType)()
], ErrorType);
let UserResponse = class UserResponse {
};
__decorate([
    (0, type_graphql_1.Field)(() => User_1.User, { nullable: true }),
    __metadata("design:type", User_1.User)
], UserResponse.prototype, "user", void 0);
UserResponse = __decorate([
    (0, type_graphql_1.ObjectType)()
], UserResponse);
let Token = class Token {
};
__decorate([
    (0, type_graphql_1.Field)(() => String),
    __metadata("design:type", String)
], Token.prototype, "access", void 0);
__decorate([
    (0, type_graphql_1.Field)(() => String),
    __metadata("design:type", String)
], Token.prototype, "refresh", void 0);
Token = __decorate([
    (0, type_graphql_1.ObjectType)()
], Token);
let ConnectionResponse = class ConnectionResponse {
};
__decorate([
    (0, type_graphql_1.Field)(() => Token, { nullable: true }),
    __metadata("design:type", Object)
], ConnectionResponse.prototype, "token", void 0);
__decorate([
    (0, type_graphql_1.Field)(() => ErrorType, { nullable: true }),
    __metadata("design:type", Object)
], ConnectionResponse.prototype, "error", void 0);
ConnectionResponse = __decorate([
    (0, type_graphql_1.ObjectType)()
], ConnectionResponse);
let UserResolver = class UserResolver {
    async me({ payload }) {
        const user = await User_1.User.findOne({
            where: { id: payload === null || payload === void 0 ? void 0 : payload.userId },
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
    async changePassword({ payload }, oldPassword, newPassword) {
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
        const user = await User_1.User.findOne({ where: { id: payload === null || payload === void 0 ? void 0 : payload.userId } });
        if (!user) {
            return {
                error: {
                    label: "changePwd",
                    message: "cannot find user",
                },
                token: null,
            };
        }
        const oldPasswordValid = await (0, bcryptjs_1.compare)(oldPassword, user.password);
        if (!oldPasswordValid) {
            return {
                error: {
                    label: "changePwd",
                    message: "Old password not valid",
                },
                token: null,
            };
        }
        user.password = await (0, bcryptjs_1.hash)(newPassword, 10);
        await User_1.User.save(user);
        return {
            error: null,
            token: {
                access: (0, isAuth_1.createAccessToken)(user),
                refresh: (0, isAuth_1.createRefreshToken)(user),
            },
        };
    }
    async refreshToken({ req }) {
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
        const payload = (0, jsonwebtoken_1.verify)(token, process.env.SECRET_REFRESH);
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
        const user = await User_1.User.findOne({ where: { id: userId } });
        if (!user) {
            return {
                error: {
                    label: "refreshToken",
                    message: "INVALID_TOKEN",
                },
                token: null,
            };
        }
        const actualPass = crypto_js_1.default.enc.Base64.stringify(crypto_js_1.default.HmacSHA256(user.password, process.env.SECRET_JID));
        if (payload.jid == actualPass) {
            console.log("success");
            return {
                token: {
                    access: (0, isAuth_1.createAccessToken)(user),
                    refresh: (0, isAuth_1.createRefreshToken)(user),
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
    async connect(emailOrPseudo, password) {
        const userEmail = await User_1.User.findOne({ where: { email: emailOrPseudo } });
        var user = userEmail;
        if (!userEmail) {
            const userPseudo = await User_1.User.findOne({
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
        const valid = await (0, bcryptjs_1.compare)(password, user.password);
        if (!valid) {
            return {
                error: {
                    label: "connection",
                    message: "Cannot connect user",
                },
                token: null,
            };
        }
        return {
            token: {
                access: (0, isAuth_1.createAccessToken)(user),
                refresh: (0, isAuth_1.createRefreshToken)(user),
            },
            error: null,
        };
    }
    async openTheGate({ payload }) {
        const user = User_1.User.findOne({ where: { id: payload === null || payload === void 0 ? void 0 : payload.userId } });
        if (!user) {
            return false;
        }
        (0, openGate_1.openGate)();
        return true;
    }
    async register(email, password) {
        const hashedPassword = await (0, bcryptjs_1.hash)(password, 10);
        const user = await User_1.User.findOne({ where: { email } });
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
        await User_1.User.insert({
            email: email,
            password: hashedPassword,
            admin: true,
        });
        const userCreated = await User_1.User.findOne({ where: { email } });
        if (userCreated) {
            return {
                error: null,
                token: {
                    access: (0, isAuth_1.createAccessToken)(userCreated),
                    refresh: (0, isAuth_1.createRefreshToken)(userCreated),
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
};
__decorate([
    (0, type_graphql_1.Query)(() => UserResponse),
    (0, type_graphql_1.UseMiddleware)(isAuth_1.isAuth),
    __param(0, (0, type_graphql_1.Ctx)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object]),
    __metadata("design:returntype", Promise)
], UserResolver.prototype, "me", null);
__decorate([
    (0, type_graphql_1.Mutation)(() => ConnectionResponse),
    (0, type_graphql_1.UseMiddleware)(isAuth_1.isAuth),
    __param(0, (0, type_graphql_1.Ctx)()),
    __param(1, (0, type_graphql_1.Arg)("oldPassword")),
    __param(2, (0, type_graphql_1.Arg)("newPassword")),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object, String, String]),
    __metadata("design:returntype", Promise)
], UserResolver.prototype, "changePassword", null);
__decorate([
    (0, type_graphql_1.Mutation)(() => ConnectionResponse),
    __param(0, (0, type_graphql_1.Ctx)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object]),
    __metadata("design:returntype", Promise)
], UserResolver.prototype, "refreshToken", null);
__decorate([
    (0, type_graphql_1.Mutation)(() => ConnectionResponse),
    __param(0, (0, type_graphql_1.Arg)("emailOrUsername")),
    __param(1, (0, type_graphql_1.Arg)("password")),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String, String]),
    __metadata("design:returntype", Promise)
], UserResolver.prototype, "connect", null);
__decorate([
    (0, type_graphql_1.Mutation)(() => Boolean),
    (0, type_graphql_1.UseMiddleware)(isAuth_1.isAuth),
    __param(0, (0, type_graphql_1.Ctx)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object]),
    __metadata("design:returntype", Promise)
], UserResolver.prototype, "openTheGate", null);
__decorate([
    (0, type_graphql_1.Mutation)(() => ConnectionResponse),
    (0, type_graphql_1.UseMiddleware)(isAuth_1.isAuth),
    (0, type_graphql_1.UseMiddleware)(isAdmin_1.isAdmin),
    __param(0, (0, type_graphql_1.Arg)("email")),
    __param(1, (0, type_graphql_1.Arg)("password")),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String, String]),
    __metadata("design:returntype", Promise)
], UserResolver.prototype, "register", null);
UserResolver = __decorate([
    (0, type_graphql_1.Resolver)()
], UserResolver);
exports.UserResolver = UserResolver;
//# sourceMappingURL=user.resolver.js.map