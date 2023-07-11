// SPDX-License-Identifier: MIT
pragma solidity >0.5.0 < 0.9.0;
 /**
   * @title ContractName
   * @dev ContractDescription
   * @custom:dev-run-script identity.sol
   */

contract local
{
    uint8 money=255;

    function setter() public{
        money=money+1;
    }
}