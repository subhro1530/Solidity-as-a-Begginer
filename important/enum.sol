// SPDX-License-Identifier: MIT
pragma solidity >0.5.0 < 0.9.0;

contract enum1
{
    enum user{allowed,not_allowed,wait}

    user public u1=user.allowed;
    //  user public u2=user.not_allowed;
    //  user public u3=user.wait;

    uint public lottery=1000;
    function owner() public {
        if(u1==user.allowed)
        {
            lottery--;
        }
        if(lottery == 0)
            u1=user.not_allowed;
    }

    function changeOwner() public{
        if(u1==user.allowed)
            u1=user.not_allowed;
        else
            u1=user.allowed;
    }
}