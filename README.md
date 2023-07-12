#   Self Guide to Solidity 

1.  Solidity is an object-oriented, high-level language for implementing smart contracts. Smart contracts are programs that govern the behavior of accounts within the Ethereum state.

2.  Solidity is a curly-bracket language designed to target the Ethereum Virtual Machine (EVM). It is influenced by C++, Python, and JavaScript. You can find more details about which languages Solidity has been inspired by in the language influences section.

3.  Solidity is statically typed, supports inheritance, libraries, and complex user-defined types, among other features.

4.  With Solidity, you can create contracts for uses such as voting, crowdfunding, blind auctions, and multi-signature wallets.

5.  When deploying contracts, you should use the latest released version of Solidity. Apart from exceptional cases, only the latest version receives security fixes. Furthermore, breaking changes, as well as new features, are introduced regularly. We currently use a 0.y.z version number to indicate this fast pace of change.


##   Steps followed :
1.  Basic steps we write the code :
```Solidity
// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract Identity{
    string name;
    uint age;

    constructor()  
    {
        name="Ravi";
        age=17;
    }

    function getName() view public returns (string memory)
    {
        return name;
    }

    function getAge() view public returns (uint)
    {
        return age;
    }
}
```

2.  More about state of a variable in Solidity:
```solidity
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
```

3.  More about local variable:
```solidity
// SPDX-License-Identifier: MIT
pragma solidity >0.5.0 < 0.9.0;
 /**
   * @title ContractName
   * @dev ContractDescription
   * @custom:dev-run-script identity.sol
   */

contract local
{
    function store() pure public returns(uint) //    Pure means the function is not interfering with out state variables
    {
        //  uint age=10;
        //  return age;

        string memory name="ravi";  //  We need to use the word memory to tell the function taht the string is stored in the storage since it is not declared from beforehand
        uint age=11;
        return age;
    }
}
```
4.  About Getter and Setter functions:
```solidity
// SPDX-License-Identifier: MIT
pragma solidity >0.5.0 < 0.9.0;
 /**
   * @title ContractName
   * @dev ContractDescription
   * @custom:dev-run-script identity.sol
   */

contract local
{
    //  Setter and getter functions
    uint age=10;

    //  pure - We dont want to do any change to the state of a function
    //  view - Same as pure but we want to only view

    function getter() public view returns(uint)
    {
        return age;
    }
    function setter() public
    {
        age=age+1;
    }
}
```

5.  If we declare public with the age variable, automatically a getter function gets created:
```solidity
uint public age=10;
```

## Notes:
>   When you call a setter function it creates a transaction that needs to be mined and costs gas because it changes the blockchain. Vice versa for getter function.
>   When you declare a public state variable a getter function is automatically created.
>   By default variable visibility is private.

6.  View vs pure

>   View is used only in cases where we want to read only from a state variable.
>   Pure is used in cases where we do not read or write from a state variable.

7.  Constructor:
```bash
// SPDX-License-Identifier: MIT
pragma solidity >0.5.0 < 0.9.0;
 /**
   * @title ContractName
   * @dev ContractDescription
   * @custom:dev-run-script identity.sol
   */

contract local
{
    uint public count;

    constructor(uint new_count)
    {
        count=new_count;
    }
}
```

## Notes:
>   Executed only once.
>   You can create only one constructor and that is optional.
>   A default constructor is created by the compiler if there is no explicitly defined constructor.

8.  Integers in Solidity:
>   int - signed (int8 to int 256 [sizes])
>   uint - unsigned ( " )
>   Range -> -128 to +127 

9.  There was a problem previously which caaused ethers to vanish:
```solidity
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
```
In this code of run with solidity v0.5.0, the money will result to zero after the setter method is called.
Fixed in newer versions.

10. Arrays:
Eg1:
```solidity
// SPDX-License-Identifier: MIT
pragma solidity >0.5.0 < 0.9.0;

contract array
{
    uint [4] public arr=[10,20,30,40];

    function setter(uint index,uint value) public {
        arr[index]=value;
    }
}
```
Eg2:
```solidity
// SPDX-License-Identifier: MIT
pragma solidity >0.5.0 < 0.9.0;

contract array
{
    uint[] public arr;

    function pushElement(uint item) public 
    {
        arr.push(item);
    }
}
```
Eg3:
```solidity
// SPDX-License-Identifier: MIT
pragma solidity >0.5.0 < 0.9.0;

contract array
{
    uint[] public arr;

    function pushElement(uint item) public 
    {
        arr.push(item);
    }
    function len() public view returns(uint)
    {
        return arr.length;
    } 
    function popElement() public
    {
        arr.pop();  //  Delete content of last index
    } 
}
```

11. Fixed size array
## Notes:
### Byte Array
>   1byte = 8bits
>   1 hex digit = 4bits
>   Everything that will be stored in the byte array will be in the form of hexadecimal digits.

```solidity
// SPDX-License-Identifier: MIT
pragma solidity >0.5.0 < 0.9.0;

contract array
{
    bytes3 public b3;   // 3 bytes array
    bytes2 public b2;   //2bytes array

    function setter() public 
    {
        b3='abc';
        b2='ab';
    }
}
```
## Notes:
>   Byte arrays cannot be modified.
>   Padding of 0 is added at the end if the value does not occupy the entire space.

12. Dynamic size array:
Eg1:
```solidity
// SPDX-License-Identifier: MIT
pragma solidity >0.5.0 < 0.9.0;

contract array
{
    bytes public b1="abc";

    function pushElement() public 
    {
        b1.push('d');
    }
}
```
Eg2:
```solidity
// SPDX-License-Identifier: MIT
pragma solidity >0.5.0 < 0.9.0;

contract array
{
    bytes public b1="abc";

    function pushElement() public 
    {
        b1.push('d');
    }

    function getElement(uint i) public view returns(bytes1)
    {
        return  b1[i];
    } 

    function len() public view returns(uint)
    {
        return b1.length;
    }
}
```

13. Loops in solidity:
Eg1:       While loop >>
```solidity
// SPDX-License-Identifier: MIT
pragma solidity >0.5.0 < 0.9.0;

contract loops
{
    uint[3] public arr;
    uint public count;

    function loop() public 
    {
        while(count<arr.length)
        {
            arr[count]=(count+1)*10;
            count++;
        }
    }
}
```

Eg2:    For loop >>
```solidity
// SPDX-License-Identifier: MIT
pragma solidity >0.5.0 < 0.9.0;

contract loops
{
    uint[3] public arr;
    uint public count;

    function loop() public 
    {
        for(count=0;count<arr.length;count++)
        {
            arr[count]=(count+1)*10;
        }
    }
}
```

Eg3:
```solidity
// SPDX-License-Identifier: MIT
pragma solidity >0.5.0 < 0.9.0;

contract loops
{
    uint[3] public arr;
    uint public count;

    function loop() public 
    {
        do
        {
            arr[count]=(count+1)*10;
            count++;
        }
        while(count<arr.length);
    }
}

14. If-else:
Eg1:
```solidity
// SPDX-License-Identifier: MIT
pragma solidity >0.5.0 < 0.9.0;

contract condition{
    function check(int a) public pure returns(string memory)
    {
        string memory value;
        if(a>0)
        {
            value="greater than zero";
        }
        else if(a==0)
        {
            value="equal to zero";
        }
        else 
        {
            value="less than zero";
        }
        return value;
    }
}
```

15. Boolean daatatype:
```bash
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
```

16. Structure:
Eg1:
```solidity
// SPDX-License-Identifier: MIT
pragma solidity >0.5.0 < 0.9;

struct Student{
    uint roll;
    string name;
}

contract Demo{
    Student public s1;
    constructor(uint _roll,string memory _name)
    {
        s1.roll=_roll;    
        s1.name=_name;
    }

}
```

Wg2:
```solidity
// SPDX-License-Identifier: MIT
pragma solidity >0.5.0 < 0.9;

struct Student{
    uint roll;
    string name;
}

contract Demo{
    Student public s1;
    constructor(uint _roll,string memory _name)
    {
        s1.roll=_roll;    
        s1.name=_name;
    }

    function change(uint _roll,string memory _name) public
    {
        Student memory new_student=Student({
            roll:_roll,
            name:_name
        });

        s1=new_student;
    }
}
```

17. Enum:

Eg1:
```solidity
// SPDX-License-Identifier: MIT
pragma solidity >0.5.0 < 0.9.0;

contract enum1
{
    enum user{allowed,not_allowed,wait}

    user public u1=user.allowed;
    user public u2=user.not_allowed;
    user public u3=user.wait;
}
```

Eg2:
```solidity
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
```

18. Mapping:
Eg1:
```solidity
// SPDX-License-Identifier: MIT
pragma solidity >0.5.0 < 0.9.0;

contract mapping1
{
    mapping(uint=> string) public roll_no;

    function setter(uint keys,string memory value) public 
    {
        roll_no[keys]=value;
    }
}
```

Eg2:
```solidity
// SPDX-License-Identifier: MIT
pragma solidity >0.5.0 < 0.9.0;

contract mapping1
{
    struct Student{
        string name;
        uint class;
    }
    
    mapping(uint=> Student) public data;

    function setter(uint _roll,uint _class,string memory _name) public 
    {
        data[_roll]= Student(_name,_class);
    }
}
```

## Notes:
>   The key cannot be types mapping,dynamic 
>   array, enum and struct.
>   The values can be of any type.
>   Mappings are always stored irrespective of
>   whether they are declared in contract storage or not.

19. Storage VS memory
![SVSM](./important/StoraageVsMemorySolidity.png)