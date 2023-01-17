import { Body, Controller, Get, Post } from '@nestjs/common';
import axios from 'axios';
import { AppService } from './app.service';
import {
  HealthCheckService,
  HealthCheck,
  MemoryHealthIndicator,
  DiskHealthIndicator,
} from '@nestjs/terminus';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService, private healthCheckService: HealthCheckService,
    private memoryHealthIndicator: MemoryHealthIndicator,) {}

  @Get()
  getHello(): string {
    return this.appService.getHello();
  }
  @Get("/health")
  @HealthCheck()
  getHealth(){
    return this.healthCheckService.check([
      () => this.memoryHealthIndicator.checkHeap('memory heap', 300 * 1024 * 1024),
      () => this.memoryHealthIndicator.checkRSS('memory RSS', 300 * 1024 * 1024),
    ]);

  
  }

  @Get("/products")
  getProducts(){
    return this.appService.getProducts(); 
  }

  @Post("/add-product")
  addProduct(@Body() product){
    return this.appService.createProduct(product); 
  }

  @Post("/add-order")
  addOrder(@Body() order){
    return this.appService.addOrder(order); 
  }

  @Get("/orders")
  getOrders(){
    return this.appService.getOrders();    }
}
