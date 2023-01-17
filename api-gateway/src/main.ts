import { Logger } from '@nestjs/common';
import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { initNestJsTracing, wrapNestJsModule } from '@recap.dev/client';
import otelSDK from './tracing';


async function bootstrap() {
  await otelSDK.start();
  const app = await NestFactory.create(AppModule);
  await app.listen(3000);
  Logger.log(`CONNECTION STRING: ${process.env.CONNECTION_STRING}`);
  Logger.log(`Product Host: ${process.env.PRODUCT_HOST}`);
  Logger.log(`Order Host: ${process.env.ORDER_HOST}`);
}

bootstrap();
