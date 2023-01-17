import { Body, Controller, Get, Post } from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  getHello(): string {
    return this.appService.getHello();
  }

  @Get('get-all')
  getAll() {
    var products = this.appService.getAllProducts();
    var productsString = JSON.stringify(Object.assign({}, products)); 
    return products;
  }

  @Post("create-product")
  create(@Body() product) {
    var created = this.appService.create(product);
 
    return created;
  }
}
