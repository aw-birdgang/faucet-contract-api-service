import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { FaucetModule } from './api/faucet/faucet.module';

@Module({
  imports: [FaucetModule],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
