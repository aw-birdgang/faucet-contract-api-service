// import { BigNumberish, formatUnits, parseUnits } from "ethers";
// import {formatEther} from "ethers/src.ts/utils/units";
// import {BigNumber} from "@ethersproject/bignumber";
//
// export function getVariableName<TResult>(getVar: () => TResult): string {
//   const m = /\(\)=>(.*)/.exec(
//     getVar.toString().replace(/(\r\n|\n|\r|\s)/gm, ''),
//   );
//   if (!m) {
//     throw new Error(
//       "The function does not contain a statement matching 'return variableName;'",
//     );
//   }
//   const fullMemberName = m[1];
//   const memberParts = fullMemberName.split('.');
//   return memberParts[memberParts.length - 1];
// }
//
// export function convertToNumber(value: string): number {
//     return parseInt(value, 10);
// }

import {formatUnits, parseUnits } from "ethers/lib/utils";
import {BigNumber} from "@ethersproject/bignumber";

//
export function convertParseUnits(amount: string) {
    return parseUnits(amount, 18);
}

export function convertFormatUnits(amount: BigNumber): string {
    return formatUnits(amount, 18);
}

//
// export function convertFormatEther(amount: BigNumber): string {
//     return formatEther(amount);
// }
//
// export function convertParseUnits(amount: string): BigNumber {
//     return parseUnits(amount, 6);
// }
//
// export function convertParseUnitsGPEX(amount: string): BigNumber {
//     return parseUnits(amount, 8);
// }
//
// export function convertFormatUnits(amount: BigNumber): string {
//     return formatUnits(amount, 6);
// }
