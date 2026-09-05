//SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import "forge-std/Test.sol";

contract SimpleStorage is Test{


    error NOT_CONTRACT_OWNER();

    modifier onlyOwner()  {
        if(msg.sender != i_contract_owner){
            revert NOT_CONTRACT_OWNER();
        }
        _;
    }


    /* variable decralation */
    uint256 internal myFavoriteNumber;

    /* variable decralation */
    address public immutable i_contract_owner;

    /* variable decralation */
    mapping(string => uint256)internal accountMapping;

    /*type definition*/
    struct Person {
        string name;
        uint256 hisFavoriteNumber;
    }

    /* variable decralation */
    Person[] internal personList;

    function popPerson() public returns( string memory){
        Person memory p = personList[personList.length-1];
        personList.pop();
        return p.name;
    }

    function getPersonlist() public view returns(Person[] memory ){
        return personList;
    }

    // msg.sender of this constructor is DeploySimpleStorage contract
    constructor(){
        console2.log("-->", msg.sender);
        i_contract_owner = msg.sender;
        myFavoriteNumber = 0;
    }

    function addPersonNameAndFavoriteNumber(string memory _name, uint256 _fav) public {
        personList.push( Person(_name,_fav));
        accountMapping[_name]= _fav;
    }

    function retrieveName2FavoriteNumber(string memory _name) public view returns(uint256){
        uint256 favoriteNumber  = accountMapping[_name];
        return favoriteNumber;
    }

    /*nonpayable*/
    function setMyFavoriteNumber(uint256 _favoriteNumber) public  {
        myFavoriteNumber = _favoriteNumber;
    } 


    function getMyFavoriteNumber() public view  returns (uint256){
        return myFavoriteNumber;
    }

}