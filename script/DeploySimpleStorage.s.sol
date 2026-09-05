//SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
import "../src/SimpleStorage.sol";
import "forge-std/Test.sol";

contract DeploySimpleStorage is Test{
    SimpleStorage simpleStorageContractObject;

    //msg.sender of this function is TestSimpleStorage Contact
    function run() public returns(SimpleStorage) {

        console2.log("-->", msg.sender);
        //msg.sender to below function is DeploySimpleStorage 
        simpleStorageContractObject = new SimpleStorage();
        return simpleStorageContractObject;
    }

}