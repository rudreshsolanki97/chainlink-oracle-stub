const Oracle = artifacts.require("Oracle");
const { assert, expect } = require("chai");

contract("Oracle", async (accounts) => {

  let contractInst;

  before(async () => {
    contractInst = await Oracle.deployed()
  });

  it("owner test", async () => {
    expect(accounts[0]!==await contractInst.owner(), "first address is initial owner")
  })

})