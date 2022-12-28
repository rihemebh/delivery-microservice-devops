export class Product {
     id : string;
     name : string;
     description : string;
     price : number;
     rate : number;
     imagePath : string;
     category  : string;
     available : boolean;
     constructor(id: string,name: string,description: string, price: number, rate: number, imagePath: string,
         category: string, available: boolean) {
            this.id = id;
            this.name = name;
            this.description = description;
            this.price = price;
            this.rate  = rate;
            this . imagePath = imagePath;
            this.category = category;
            this.available = available;
                 }
}