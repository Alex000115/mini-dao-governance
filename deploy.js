const hre = require("hardhat");

async function main() {

  const Token = await hre.ethers.getContractFactory("GovToken");
  const token = await Token.deploy();
  await token.waitForDeployment();

  const DAO = await hre.ethers.getContractFactory("DAO");
  const dao = await DAO.deploy(await token.getAddress());
  await dao.waitForDeployment();

  console.log("Token:", await token.getAddress());
  console.log("DAO:", await dao.getAddress());
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
