import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { MongooseModule } from '@nestjs/mongoose'
import { OrderSchema } from './order.schema';
@Module({
imports: [
    MongooseModule.forRoot(process.env.CONNECTION_STRING || "mongodb+srv://riheme:riheme@cluster0.jqpjhyi.mongodb.net" , {dbName: 'restaurant'}),
     MongooseModule.forFeature([
       { name: 'Order', schema: OrderSchema },
      
     ]),],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
