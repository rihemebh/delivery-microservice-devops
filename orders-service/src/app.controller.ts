import { Body, Controller } from '@nestjs/common';
import { MessagePattern } from '@nestjs/microservices';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  
  @MessagePattern({ cmd: "add-order" })
  create(@Body() order) {
    var created = this.appService.addOrder(order);
 
    return created;
  }


  @MessagePattern({ cmd: "orders" })
  getAll() {
 
    return this.appService.getAll();
  }
}
