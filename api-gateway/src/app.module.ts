import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { TerminusModule } from '@nestjs/terminus';
import { makeCounterProvider, makeGaugeProvider, PrometheusModule } from "@willsoto/nestjs-prometheus";
import { OpenTelemetryModule } from 'nestjs-otel';

const OpenTelemetryModuleConfig = OpenTelemetryModule.forRoot({
  metrics: {
    hostMetrics: true, // Includes Host Metrics
    apiMetrics: {
      enable: true, // Includes api metrics
      defaultAttributes: {
        // You can set default labels for api metrics
        custom: 'label',
      },
      ignoreRoutes: ['/favicon.ico'], // You can ignore specific routes (See https://docs.nestjs.com/middleware#excluding-routes for options)
      ignoreUndefinedRoutes: false, //Records metrics for all URLs, even undefined ones
    },
  },
});


@Module({
  imports: [TerminusModule, PrometheusModule.register(), OpenTelemetryModuleConfig],
  controllers: [AppController],
  providers: [AppService,   
    makeCounterProvider({
    name: "orders",
    help: "Counts number of orders",
    labelNames: ["orders_count"]
  }),],
})
export class AppModule {}
