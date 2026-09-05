//SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import "forge-std/Test.sol";
import "../script/DeploySimpleStorage.s.sol";
import "../src/SimpleStorage.sol";

contract TestSimpleStorage is Test{

DeploySimpleStorage deploySimpleStrorageContractObject;
SimpleStorage simpleStorageContractObject ;



// msg.sender of this function is who?
function setUp() public{
    
    console2.log("-->", msg.sender);
    
    // 1-msg.sender = TestSimpleStorage Contract
    deploySimpleStrorageContractObject = new DeploySimpleStorage();


    simpleStorageContractObject = deploySimpleStrorageContractObject.run();
}

function test_store() public {
    console2.log("-->", msg.sender);
    simpleStorageContractObject.addPersonNameAndFavoriteNumber("selcuk",19);
    assertEq(simpleStorageContractObject.retrieveName2FavoriteNumber("selcuk"), 19);

}



function test_personList() public {
    
    simpleStorageContractObject.addPersonNameAndFavoriteNumber("koyuncu",99);
    simpleStorageContractObject.addPersonNameAndFavoriteNumber("selcuk",9);
    simpleStorageContractObject.addPersonNameAndFavoriteNumber("yasar",1);

    string memory s = simpleStorageContractObject.popPerson();
    vm.assertEq(s, "yasar");

    string memory x = simpleStorageContractObject.popPerson();
    vm.assertEq(x, "selcuk");

}
 
function test_owner() public view{
    assertEq(simpleStorageContractObject.i_contract_owner() , address(deploySimpleStrorageContractObject));

}


}