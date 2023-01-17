import { Module } from '@nestjs/common';
import { MongooseModule } from '@nestjs/mongoose';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ProductSchema } from './product.schema';

@Module({
  imports: [ 
  MongooseModule.forRoot(process.env.CONNECTION_STRING , {dbName: 'restaurant'}),
  MongooseModule.forFeature([
    { name: 'Product', schema: ProductSchema },
   
  ]),],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
