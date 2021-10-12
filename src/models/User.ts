import { Field, ID, Int, ObjectType } from "type-graphql";
import { BaseEntity, Column, Entity, PrimaryGeneratedColumn } from "typeorm";

@Entity()
@ObjectType()
export class User extends BaseEntity {
  @PrimaryGeneratedColumn()
  @Field(() => ID)
  id: number;

  @Column()
  password: string;

  @Column()
  @Field(() => String)
  email: string;

  /**
   * Nombre de fois qu'on a ouvert le portail
   */
  @Column({ default: 0 })
  @Field(() => Int, { defaultValue: 0 })
  count: number;

  @Column({ default: false })
  @Field(() => Boolean, { defaultValue: false })
  admin: boolean;
}
