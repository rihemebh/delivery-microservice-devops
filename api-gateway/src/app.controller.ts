import { Body, Controller, Get, Post } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}


  @Get("/products")
  getProducts(){
    return this.appService.getProducts();
  }

  @Post("create-product")
  createProduct(@Body() product){
    return this.appService.createProduct(product);
  }

  @Post("add-order")
  addOrder(@Body() order){
    return this.appService.addOrder(order);
  }

  @Get("orders")
  getOrders(){
    return this.appService.getOrders();
  }
}
