import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { OrderDocument } from './order.schema';
import { Model } from 'mongoose';

@Injectable()
export class AppService {
  getHello(): string {
    return 'Hello World!';
  }
  orders : Array<any>;
  constructor(@InjectModel("Order") private orderModel: Model<OrderDocument>){
    this.orders = [];
  }
  getAll() {
   return this.orderModel.find().exec();
  }
  addOrder(order: any) {
    const createdOrder = new this.orderModel(order);
    return createdOrder.save();
    
  }
}
