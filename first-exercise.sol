pragma solidity >=0.7.0 <0.9.0;
contract simplifyStorage{
//uint store = '67'
   // string names = 'ashu'
    //bool istrue = true
    uint storeValue;
    function set(uint x)public{
        storeValue =x*5;
    }
    function get() public view returns (uint){
        return storeValue;
    }
}
