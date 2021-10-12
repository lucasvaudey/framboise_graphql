import { Query, Resolver } from "type-graphql";

@Resolver()
export class UserResolver {
  @Query(() => Boolean)
  async users(): Promise<Boolean> {
    return true;
  }
}
