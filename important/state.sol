// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 < 0.9.0;

contract State
{
    uint public age;
    //  To set up another state variable, we use the exact same method
    uint public num;

    //  age=20; We Cannot do this since it is a state variable
    //  Either we have to declare the value at the time of variable creation or set up a constructor to initialize a variable
    /*constructor()
    {
        age=10;
    }   
    */  

    //Or we can also declare a set function
    function setAge() public 
    {
        age=10;
        num=num+1;
    }
    function setNum() public 
    {
        num=0;
    }
}