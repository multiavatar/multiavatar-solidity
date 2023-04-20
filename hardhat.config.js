require('dotenv').config();

require("@nomiclabs/hardhat-waffle");
require('@nomiclabs/hardhat-ethers');

require("hardhat-gas-reporter");

task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();
  const provider = hre.ethers.provider;

  for (const account of accounts) {
      console.log(
          "%s (%i ETH)",
          account.address,
          hre.ethers.utils.formatEther(
              // getBalance returns wei amount, format to ETH amount
              await provider.getBalance(account.address)
          )
      );
  }
});


const ALCHEMY_API_KEY_GOERLI = process.env.ALCHEMY_API_KEY_GOERLI;
const ALCHEMY_API_KEY_SEPOLIA = process.env.ALCHEMY_API_KEY_SEPOLIA;

const PRIVATE_KEY_GOERLI = process.env.PRIVATE_KEY_GOERLI;
const PRIVATE_KEY_SEPOLIA = process.env.PRIVATE_KEY_SEPOLIA;


// You need to export an object to set up your config
// Go to https://hardhat.org/config/ to learn more

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: {
      version: "0.8.12",  
  },
  mocha: {
    timeout: 1000000
  },
  gasReporter: {
    currency: 'USD',
    gasPrice: 5,
    enabled: true
  },
  networks: {
    sepolia: {
      url: `https://eth-sepolia.g.alchemy.com/v2/${ALCHEMY_API_KEY_SEPOLIA}`,
      accounts: [PRIVATE_KEY_SEPOLIA],
      gasPrice: 1000000000
    },
    goerli: {
      url: `https://eth-goerli.alchemyapi.io/v2/${ALCHEMY_API_KEY_GOERLI}`,
      accounts: [PRIVATE_KEY_GOERLI],
      gasPrice: 1000000000
    },
    hardhat: {
      gas: "auto",
      gasPrice: 5000000000,
      blockGasLimit: 0x1fffffffffffff,
      allowUnlimitedContractSize: true,
      timeout: 1800000
    }
  }
};
