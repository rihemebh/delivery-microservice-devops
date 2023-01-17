import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { ProductDocument } from './product.schema';
import { Model } from 'mongoose';

@Injectable()
export class AppService {
  products : Array<any>;

  constructor(@InjectModel("Product") private productModel: Model<ProductDocument>){
    this.products = [];
  }
  async create(product : any) {
    const createdProduct = new this.productModel(product);
    return createdProduct.save();
  
  }
  async getAllProducts(){
 
    return this.productModel.find().exec();
  }
  getHello(): string {
    return 'Hello World!';
  }
}
