pragma solidity ^0.5.7;
contract payGran{
    address owner;
    uint funds;
    bool isdecresed ;
    constructor() payable public{
        owner =msg.sender;
        funds=msg.value;
        isdecresed=false;
    }
    modifier onlyOwner{
        require(msg.sender==owner);
        _;
    }
    modifier mustdeceased{
        require(isdecresed==true);
        _;

    }
    address payable[] familyWallet ;
    mapping(address=>uint) inheritance;
    function setInheritance( address payable wallet,uint amount) public {
        familyWallet.push(wallet);
        inheritance[wallet]=amount;
    }
     function payout() private mustdeceased{
        for(uint i=0;i<familyWallet.length;i++){
            familyWallet[i].transfer(inheritance[familyWallet[i]]);
        }
     }
    function deceased() public onlyOwner{
        isdecresed=true;
        payout();
    }
}