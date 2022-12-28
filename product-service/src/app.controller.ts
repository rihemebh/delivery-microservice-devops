import { InjectModel } from '@nestjs/azure-database';
import { Controller, Get } from '@nestjs/common';
import { AppService } from './app.service';
import { Product } from './product.dto';
import { Container } from '@azure/cosmos';
import { MessagePattern } from '@nestjs/microservices';
import { delay, of } from 'rxjs';
import { Body } from '@nestjs/common/decorators';
@Controller("products")
export class AppController {
  constructor(private readonly appService: AppService) {}

  @MessagePattern({ cmd: "products" })
  getAll() {
    var products = this.appService.getAllProducts();
    var productsString = JSON.stringify(Object.assign({}, products)); 
    //JSON.parse(productsString)
    return products;
  }

  @MessagePattern({ cmd: "create-product" })
  create(@Body() product) {
    var created = this.appService.create(product);
 
    return created;
  }

}
