import { NestFactory } from '@nestjs/core';
import { MicroserviceOptions, Transport } from '@nestjs/microservices';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.createMicroservice(
    AppModule,
    {
      transport: Transport.TCP,
      options: {
        host: "127.0.0.1",
        port: 3001
      }
    },
  );
  await app.listen();
}
bootstrap();


