pragma solidity 0.8.10;

import "forge-std/Test.sol";
import "../src/Spacebears.sol";

contract SpacebearsTest is Test {

    Spacebear spacebear;
    function setUp() public {
        spacebear = new Spacebear();
    }

    function testNameIsSpacebear() public {
        assertEq(spacebear.name(), "Spacebear");
    }
}