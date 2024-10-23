// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import "forge-std/Test.sol";

import {DeployBasicNft} from "../script/DeployBasicNft.s.sol";
import {BasicNft} from "../src/BasicNft.sol";

contract TestBasicNft is Test {

    address public USER = address(1);
    string public constant PUG = "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";
    string constant NFT_NAME = "Basic_NFT";
    string constant NFT_SYMBOL = "BNFT";

    DeployBasicNft deployer;
    BasicNft basicNft;
    
    function setUp() public {
        deployer = new DeployBasicNft();

        basicNft = deployer.run();
    }

    function testExpectedNameIsCorrect() public view {
        string memory actualName = "Basic_NFT";
        string memory expectedName = basicNft.name();

        assert(keccak256(abi.encodePacked(actualName)) == keccak256(abi.encodePacked(expectedName)));
    }

    function testUserCanMintAndHaveBalance() public {
        vm.prank(USER);
        basicNft.mintToken(PUG);

        assert(basicNft.balanceOf(USER) == 1);
        assert(keccak256(abi.encodePacked(PUG)) == keccak256(abi.encodePacked(basicNft.tokenUri(0))));
    }
}