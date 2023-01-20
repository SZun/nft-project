const { expect } = require("chai");
const hre = require("hardhat");

describe("Spacebear", function () {
  it("be able to mint a token", async function () {
    // deploy a lock contract where funds can be withdrawn
    // one year in the future
    const Spacebear = await hre.ethers.getContractFactory("Spacebear");
    const spacebearInstance = await Spacebear.deploy();

    const [owner, otherAccount] = await ethers.getSigners();
    await spacebearInstance.safeMint(otherAccount.address)

    expect(await spacebearInstance.ownerOf(0)).to.equal(otherAccount.address);
  });
});
