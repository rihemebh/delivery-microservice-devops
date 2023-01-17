import { Controller, Get } from '@nestjs/common';
import { Body, Post } from '@nestjs/common/decorators';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  getHello(): string {
    return this.appService.getHello();
  }

  @Get('get-all')
  getAll(){
    return this.appService.getAll();
  }
  @Post("add-order")
  create(@Body() order) {
    var created = this.appService.addOrder(order);
 
    return created;
  }


  
}
