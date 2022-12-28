import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ConfigModule } from '@nestjs/config';
import { MongooseModule } from '@nestjs/mongoose';
import { ProductSchema } from './product.schema';


@Module({
  imports: [  ConfigModule.forRoot({
    isGlobal: true,
  }),
  MongooseModule.forRoot("mongodb+srv://riheme:riheme@cluster0.jqpjhyi.mongodb.net" , {dbName: 'restaurant'}),
  MongooseModule.forFeature([
    { name: 'Product', schema: ProductSchema },
   
  ]),],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
