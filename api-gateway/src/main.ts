import { Logger } from '@nestjs/common';
import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule, { logger: ['error', 'warn']});
  await app.listen(3000);
  Logger.log(`CONNECTION STRING: ${process.env.CONNECTION_STRING}`);
  Logger.log(`Product Host: ${process.env.PRODUCT_HOST}`);
  Logger.log(`Order Host: ${process.env.ORDER_HOST}`);
}

bootstrap();
