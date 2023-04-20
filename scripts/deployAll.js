const { utils } = require("ethers");

async function main() {

    // Get owner/deployer's wallet address
    const [owner] = await hre.ethers.getSigners();

    // Get contract that we want to deploy
    const contractFactory = await hre.ethers.getContractFactory("MNFT");

    // Deploy contract with the correct constructor arguments
    const contract = await contractFactory.deploy();

    // Wait for this transaction to be mined
    await contract.deployed();

    // Get contract address
    console.log("Contract deployed to:", contract.address);

    // Deploy Themes contracts
    const ThemesData00 = await hre.ethers.getContractFactory("ThemesData00");
    const themes00 = await ThemesData00.deploy(contract.address);
    await themes00.deployed();
    console.log("ThemesData00 contract deployed to:", themes00.address);
    
    const ThemesData01 = await hre.ethers.getContractFactory("ThemesData01");
    const themes01 = await ThemesData01.deploy(contract.address);
    await themes01.deployed();
    console.log("ThemesData01 contract deployed to:", themes01.address);
    
    const ThemesData02 = await hre.ethers.getContractFactory("ThemesData02");
    const themes02 = await ThemesData02.deploy(contract.address);
    await themes02.deployed();
    console.log("ThemesData02 contract deployed to:", themes02.address);

    // Deploy Parts contracts
    const PartsData00 = await hre.ethers.getContractFactory("PartsData00");
    const parts00 = await PartsData00.deploy(contract.address);
    await parts00.deployed();
    console.log("PartsData00 contract deployed to:", parts00.address);

    const PartsData0102 = await hre.ethers.getContractFactory("PartsData0102");
    const parts0102 = await PartsData0102.deploy(contract.address);
    await parts0102.deployed();
    console.log("PartsData0102 contract deployed to:", parts0102.address);

    const PartsData0304 = await hre.ethers.getContractFactory("PartsData0304");
    const parts0304 = await PartsData0304.deploy(contract.address);
    await parts0304.deployed();
    console.log("PartsData0304 contract deployed to:", parts0304.address);

    const PartsData0506 = await hre.ethers.getContractFactory("PartsData0506");
    const parts0506 = await PartsData0506.deploy(contract.address);
    await parts0506.deployed();
    console.log("PartsData0506 contract deployed to:", parts0506.address);

    const PartsData0708 = await hre.ethers.getContractFactory("PartsData0708");
    const parts0708 = await PartsData0708.deploy(contract.address);
    await parts0708.deployed();
    console.log("PartsData0708 contract deployed to:", parts0708.address);

    const PartsData0910 = await hre.ethers.getContractFactory("PartsData0910");
    const parts0910 = await PartsData0910.deploy(contract.address);
    await parts0910.deployed();
    console.log("PartsData0910 contract deployed to:", parts0910.address);

    const PartsData1112 = await hre.ethers.getContractFactory("PartsData1112");
    const parts1112 = await PartsData1112.deploy(contract.address);
    await parts1112.deployed();
    console.log("PartsData1112 contract deployed to:", parts1112.address);

    const PartsData131415 = await hre.ethers.getContractFactory("PartsData131415");
    const parts131415 = await PartsData131415.deploy(contract.address);
    await parts131415.deployed();
    console.log("PartsData131415 contract deployed to:", parts131415.address);
    
  }
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error)
      process.exit(1)
    })
  