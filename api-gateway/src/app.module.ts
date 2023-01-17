import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TerminusModule } from '@nestjs/terminus';
import { makeCounterProvider, makeGaugeProvider, PrometheusModule } from "@willsoto/nestjs-prometheus";
import { APP_INTERCEPTOR } from '@nestjs/core';
import { LoggingInterceptor } from './logging.interceptor';
@Module({
  imports: [TerminusModule, PrometheusModule.register()],
  controllers: [AppController],
  providers: [AppService,   
    makeCounterProvider({
    name: "orders",
    help: "Counts number of orders",
    labelNames: ["orders_count"]
  }),],
})
export class AppModule {}
