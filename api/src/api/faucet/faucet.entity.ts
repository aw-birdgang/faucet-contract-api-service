import { ApiProperty } from '@nestjs/swagger';

export class Faucet {
  @ApiProperty({ description: 'id' })
  id: string;

  @ApiProperty({ description: '지갑 아이디' })
  walletId: string;

  @ApiProperty({ description: '지갑 주소' })
  address: string;

  @ApiProperty({ description: '개인 키' })
  privateKey: string;

  @ApiProperty({ description: '계정 번호' })
  childNumber: number;

  static of(params: Partial<Faucet>): Faucet {
    const faucet = new Faucet();
    Object.assign(faucet, params);
    return faucet;
  }
}
