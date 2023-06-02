import { Injectable, Logger, NotFoundException } from '@nestjs/common';
import { ConfigService } from "../../config";
import { Contract } from "@ethersproject/contracts";
import { BigNumber } from '@ethersproject/bignumber'
import * as abi from "./abi/FAUCET_ABI"
import { isEmpty } from "./../../common/util/is-empty";
import {
    EthersContract,
    EthersSigner,
    InjectContractProvider,
    InjectSignerProvider,
} from 'nestjs-ethers';
import {convertFormatUnits, convertParseUnits} from "../../common/util/utils";
import { formatEther } from 'ethers/lib/utils';
import {FaucetRequestDto} from "./dto/faucet-request.dto";


@Injectable()
export class FaucetService {
    constructor(
        @InjectContractProvider()
        private readonly contract: EthersContract,
        @InjectSignerProvider()
        private readonly signer: EthersSigner,
        private readonly configureService: ConfigService,
    ) {}

    private readonly logger = new Logger(FaucetService.name);

    async getContractBalance() {
        const contractAddress = this.configureService.get("FAUCET_CONTRACT_ADDRESS");
        this.logger.log('getContractBalance > address : ' + contractAddress.toString());

        const contract: Contract = this.contract.create(
            contractAddress,
            abi.ABI,
        );
        const network = await contract?.provider?.getNetwork();
        if (!network) {
            throw new Error('No provider injected');
        }
        const balance: BigNumber = await contract.contractBalance();
        if (isEmpty(balance) === true) {
            throw new NotFoundException("NOT_FOUND_BALANCE");
        }
        const amount = formatEther(balance);
        this.logger.log('getContractBalance > amount : ' + amount);
        return amount;
    }

    async getFaucetAmounts(ownerAddress: string) {
        const contractAddress = this.configureService.get("FAUCET_CONTRACT_ADDRESS");
        this.logger.log('getFaucetAmounts > address : ' + contractAddress.toString());

        const contract: Contract = this.contract.create(
            contractAddress,
            abi.ABI,
        );
        const network = await contract?.provider?.getNetwork();
        if (!network) {
            throw new Error('No provider injected');
        }
        const balance: BigNumber = await contract.getFaucetAmounts(ownerAddress);
        if (isEmpty(balance) === true) {
            throw new NotFoundException("NOT_FOUND_BALANCE");
        }
        const amount = formatEther(balance);
        this.logger.log('getFaucetAmounts > amount : ' + amount);
        return amount;
    }

    async withdraw(requestDto: FaucetRequestDto) {
        const privateKey = this.configureService.get("PRIVATE_KEY");
        const contractAddress = this.configureService.get("FAUCET_CONTRACT_ADDRESS");
        this.logger.log('withdraw > contractAddress : ' + contractAddress.toString());
        this.logger.log('withdraw > privateKey : ' + privateKey.toString());

        const wallet = this.signer.createWallet(privateKey);
        const contract: Contract = this.contract.create(
            contractAddress,
            abi.ABI,
            wallet,
        );
        const network = await contract?.provider?.getNetwork();
        if (!network) {
            throw new Error('No provider injected');
        }
        const signerNetwork = await contract?.signer.provider?.getNetwork();
        if (!signerNetwork) {
            throw new Error('No signer injected');
        }
        const toAddress = requestDto.toAddress; //0.1
        const faucetAmounts = BigNumber.from(10).pow(18).div(BigNumber.from(10));
        this.logger.log('withdraw > faucetAmounts : ' + faucetAmounts);

        const tx = await contract.withdraw(faucetAmounts, toAddress);
        if (isEmpty(tx) === true) {
            throw new NotFoundException("NOT_FOUND_BALANCE");
        }
        this.logger.log('withdraw > tx.hash : ' + tx.hash);
        return tx.hash;
    }

}
