import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { Product } from './product.dto';
import { ProductDocument } from './product.schema';

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
}
