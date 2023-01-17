import { Injectable, Logger } from '@nestjs/common';
import { InjectMetric } from '@willsoto/nestjs-prometheus';
import axios from 'axios';
import { Counter } from 'prom-client';

@Injectable()
export class AppService {
  constructor( @InjectMetric("orders") public orderCounter: Counter<string>){}
  private readonly logger = new Logger(AppService.name);
   PRODUCT_URL = `http://${process.env.PRODUCT_HOST}:3002`;
   ORDER_URL = `http://${process.env.ORDER_HOST}:3001`;
  getHello(): string {
    return 'Hello World!';
  }
  getProducts() {
    this.logger.log(`Retrieve all Products`);
    var data = axios.get(`${this.PRODUCT_URL}/get-all`)
    .then(function (response) {

      return   response.data;
    })
    .catch(function (error) {
      return error
    });
    return data;
  
  }

  createProduct(product){
    this.logger.log(` Create new product`);
    var data = axios.post(`${this.PRODUCT_URL}/add-product`, product)
    .then(function (response) {
      this.logger.log(`product created  : ${response.data}`);
      return   response.data;
    })
    .catch(function (error) {
      this.logger.error(error);
      return error
    });
    return data;
  
      
  }

  addOrder(order: any) {
    this.orderCounter.inc(); 
    var data = axios.post(`${this.ORDER_URL}/add-order`, order)
    .then(function (response) {

      return   response.data;
    })
    .catch(function (error) {
      return error
    });

    return data;
  }

  getOrders() {

    var data ;
    data = axios.get(`${this.ORDER_URL}/get-all`)
    .then(function (response) {

      return   response.data;
    })
    .catch(function (error) {
      return error
    });
    return data;
  }
}
