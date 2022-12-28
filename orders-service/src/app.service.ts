import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { OrderDocument } from './order.schema';

@Injectable()
export class AppService {
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
