
import { Prop, Schema, SchemaFactory } from '@nestjs/mongoose';
import { HydratedDocument } from 'mongoose';


export type OrderDocument = HydratedDocument<Order>;
@Schema()

export class Order{
@Prop()
    username : string;
    @Prop()
    items : [];
}


export const OrderSchema = SchemaFactory.createForClass(Order);