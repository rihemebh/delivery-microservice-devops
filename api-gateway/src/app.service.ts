import { Injectable, Inject } from "@nestjs/common";
import { ClientProxy } from "@nestjs/microservices";
import { map } from "rxjs/operators"

@Injectable()
export class AppService {

  constructor(
    @Inject("PRODUCTS") private readonly clientServiceProduct: ClientProxy,
    @Inject("ORDERS") private readonly clientServiceOrder: ClientProxy
  ){}


  getProducts() {
    const pattern = { cmd: "products" };
    const payload = {};
    return this.clientServiceProduct
      .send<string>(pattern, payload)
      .pipe(
        map((message) => (message))
      );
  }

  createProduct(product){
  
      const pattern = { cmd: "create-product" };
      const payload = product;
      return this.clientServiceProduct
        .send<string>(pattern, payload)
        .pipe(
          map((message) => (message))
        );

  }

  addOrder(order: any) {
    const pattern = { cmd: "add-order" };
      const payload = order;
      return this.clientServiceOrder
        .send<string>(pattern, payload)
        .pipe(
          map((message) => (message))
        );
  }

  getOrders() {
    const pattern = { cmd: "orders" };
      const payload = {};
      return this.clientServiceOrder
        .send<string>(pattern, payload)
        .pipe(
          map((message) => (message))
        );
  }

}
