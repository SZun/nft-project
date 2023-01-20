pragma solidity ^0.8.4;

import "forge-std/Test.sol";
import "forge-std/Vm.sol";
import "../src/Spacebears.sol";

contract SpacebearsTest is Test {

    Spacebear spacebear;
    function setUp() public {
        spacebear = new Spacebear();
    }

    function testNameIsSpacebear() public {
        assertEq(spacebear.name(), "Spacebear");
    }

    function testMintingNFTs() public {
        spacebear.safeMint(msg.sender);
        assertEq(spacebear.ownerOf(0), msg.sender);
        assertEq(spacebear.tokenURI(0),  "https://ethereum-blockchain-developer.com/2022-06-nft-truffle-hardhat-foundry/nftdata/spacebear_1.json");
    }

    function testNftCreationWrongOwner() public {
        vm.startPrank(address(0x1));
        vm.expectRevert("Ownable: caller is not the owner");
        spacebear.safeMint(address(0x1));
        vm.stopPrank();
    }
    function testNftBuyToken() public {
        vm.startPrank(address(0x1));
        spacebear.buyToken();
        vm.stopPrank();
        assertEq(spacebear.ownerOf(0), address(0x1));
    }
}
