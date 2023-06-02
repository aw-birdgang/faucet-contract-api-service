import { IsNotEmpty, IsString } from 'class-validator';
import { ApiProperty } from '@nestjs/swagger';

export class FaucetRequestDto {
  @IsNotEmpty({ message: '받는 주소(toAddress)은 필수 값 입니다.' })
  @IsString({ message: '받는 주소(toAddress)의 형식이 올 바르지 않습 니다.' })
  @ApiProperty({ description: '받는 주소' })
  toAddress: string;
}
