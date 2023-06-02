import { Module } from '@nestjs/common';
import {ConfigModule, ConfigService} from 'src/config';
import {FaucetController} from "./faucet.controller";
import {FaucetService} from "./faucet.service";
import {EthersModule, SEPOLIA_NETWORK} from "nestjs-ethers";

@Module({
    imports: [
        EthersModule.forRootAsync({
            imports: [ConfigModule],
            inject: [ConfigService],
            providers: [ConfigService],
            useFactory: async (configService: ConfigService) => ({
                network: SEPOLIA_NETWORK,
                custom: configService.get('RPC_URL'),
            }),
        }),
        ConfigModule,
    ],
    controllers: [FaucetController],
    providers: [FaucetService],
})
export class FaucetModule {}
