// SPDX-License-Identifier: MIT
pragma solidity >0.5.0 < 0.9.0;

contract condition{
    bool public value=true;

    function check(uint a) public returns(bool)
    {
        if(a>100)
        {
            value=true;
            return value;
        }
        else 
        {
            value=false;
            return value;
        }
    }
}