pragma solidity ^0.4.24;

contract ConvertLib {

    // .. since beginning of the year
    uint16[12] days_since = [
    11,
    42,
    70,
    101,
    131,
    162,
    192,
    223,
    254,
    284,
    315,
    345
    ];

   function stringToBytes32(string memory source) pure public returns (bytes32 result) {
         bytes memory tempEmptyStringTest = bytes(source);
         if (tempEmptyStringTest.length == 0) {
            return 0x0;
         }

         assembly {
                result := mload(add(source, 32))
         }
   }

    function b32toString(bytes32 x) pure public returns (string) {
        // gas usage: about 1K gas per char.
        bytes memory bytesString = new bytes(32);
        uint charCount = 0;

        for (uint j = 0; j < 32; j++) {
            byte char = byte(bytes32(uint(x) * 2 ** (8 * j)));
            if (char != 0) {
                bytesString[charCount] = char;
                charCount++;
            }
        }

        bytes memory bytesStringTrimmed = new bytes(charCount);

        for (j = 0; j < charCount; j++) {
            bytesStringTrimmed[j] = bytesString[j];
        }

        return string(bytesStringTrimmed);
    }

    function b32toHexString(bytes32 x) pure public returns (string) {
        bytes memory b = new bytes(64);
        for (uint i = 0; i < 32; i++) {
            uint8 by = uint8(uint(x) / (2**(8*(31 - i))));
            uint8 high = by/16;
            uint8 low = by - 16*high;
            if (high > 9) {
                high += 39;
            }
            if (low > 9) {
                low += 39;
            }
            b[2*i] = byte(high+48);
            b[2*i+1] = byte(low+48);
        }

        return string(b);
    }
}
