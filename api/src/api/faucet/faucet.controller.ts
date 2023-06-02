import {Body, Controller, Get, HttpStatus, Param, Post, Res} from '@nestjs/common';
import {ApiCreatedResponse, ApiOkResponse, ApiOperation, ApiTags} from '@nestjs/swagger';
import { Response } from 'express';
import { instanceToPlain } from 'class-transformer';
import {FaucetService} from "./faucet.service";
import {FaucetRequestDto} from "./dto/faucet-request.dto";

@Controller('v1/faucet')
@ApiTags('FAUCET API')
export class FaucetController {
    constructor(private readonly service: FaucetService) {}

    @Get('balance')
    @ApiOperation({ summary: '계약 잔액 조회 API' })
    @ApiOkResponse({ description: '계약 잔액 를 조회 한다.' })
    async getContractBalance(@Res() res: Response) {
        const response = await this.service.getContractBalance();
        return res.status(HttpStatus.OK).json(instanceToPlain(response));
    }

    @Get('balance/:address')
    @ApiOperation({ summary: '특정 주소의 잔액 조회 API' })
    @ApiOkResponse({ description: '특정 주소의 잔액 를 조회 한다.' })
    async getBalance(@Param('address') address: string, @Res() res: Response) {
        const responseDto = await this.service.getFaucetAmounts(address);
        return res.status(HttpStatus.OK).json(instanceToPlain(responseDto));
    }

    @Post('withdraw')
    @ApiOperation({
        summary: 'faucet 요청 하는 API',
        description: 'faucet 요청 한다.',
    })
    @ApiCreatedResponse({ description: 'faucet 요청 한다.' })
    async withdraw(
        @Body() requestDto: FaucetRequestDto,
        @Res() res: Response,
    ) {
        const result = await this.service.withdraw(requestDto);
        return res.status(HttpStatus.OK).json(instanceToPlain(result));
    }

}
