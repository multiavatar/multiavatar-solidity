const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("MNFT", function () {
  it("Should deploy the contract and test the Satoshi avatar", async function () {
    
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

    expect(await contract.multiavatar('Satoshi', false)).to.equal('<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 231 231"><path d="M33.83,33.83a115.5,115.5,0,1,1,0,163.34,115.49,115.49,0,0,1,0-163.34Z" style="fill:#ff2f2b;"/><path d="m115.5 51.75a63.75 63.75 0 0 0-10.5 126.63v14.09a115.5 115.5 0 0 0-53.729 19.027 115.5 115.5 0 0 0 128.46 0 115.5 115.5 0 0 0-53.729-19.029v-14.084a63.75 63.75 0 0 0 53.25-62.881 63.75 63.75 0 0 0-63.65-63.75 63.75 63.75 0 0 0-0.09961 0z" style="fill:#E2AF6B;"/><path d="m141.75 195a114.79 114.79 0 0 1 38 16.5 115.53 115.53 0 0 1-128.46 0 114.79 114.79 0 0 1 38-16.5l26.23 13 26.27-13z" style="fill:#2385c6;"/><polygon points="115.5 208.03 115.5 207.74 82.72 188.91 80.45 198.86 101.46 222.72" style="fill:#b8d0e0;"/><polygon points="115.5 208.03 115.5 207.74 148.28 188.91 150.55 198.86 129.54 222.72" style="fill:#b8d0e0;"/><path d="m94.19 136.84h42.632a3.7801 3.78 0 0 1 3.7802 3.78v3.22a15.231 15.23 0 0 1-15.211 15.16h-19.781a15.251 15.25 0 0 1-15.221-15.16v-3.22a3.8002 3.8 0 0 1 3.7802-3.78z" style="fill:#fff;stroke-linecap:round;stroke-linejoin:round;stroke-width:3px;stroke:#000;"/><path d="m130.96 136.84v21.16m-30.911-21.16v21.16m10.34-21.16v22.16m10.31-22.2v22.2" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:3px;stroke:#000;"/><path d="m32.902 67.662c-0.36295 1.7227-6.2342 30.695 5.6133 52.596 4.5843 8.4743 9.0081 13.239 12.75 15.893a67.7 67.7 0 0 1-3.4688-21.35 67.7 67.7 0 0 1 2.332-17.658c-4.4914-2.4646-10.868-6.9012-13.834-13.52-4.1626-9.285-3.6155-14.673-3.3926-15.961zm165.19 0c0.22292 1.2882 0.77005 6.6759-3.3926 15.961-2.9664 6.6183-9.3426 11.055-13.834 13.52a67.7 67.7 0 0 1 2.332 17.658 67.7 67.7 0 0 1-3.4688 21.35c3.7419-2.6532 8.1657-7.4183 12.75-15.893 11.847-21.9 5.9762-50.873 5.6133-52.596z" style="fill:#a21d00;"/><path d="m115.73 13.191c-7.3787-0.13351-13.509 5.7888-13.631 13.168-0.10128 5.8827 3.4508 10.518 8.0566 12.52 1.061 0.46115 2.1869 0.78009 3.3418 0.95703v8.4291c0.66778-0.02035 1.3358-0.03077 2.0039-0.03125 0.66547-9e-5 1.3309 0.0097 1.9961 0.0293v-8.4115c2.6002-0.38406 5.1586-1.5484 7.3086-3.625 4.2322-4.0878 4.9991-9.8755 3.1582-14.549-1.8407-4.6726-6.3502-8.3834-12.232-8.4863z" style="fill:#fff;"/><path d="m172.7 90.75h-6.54c-0.14-0.1-0.26-0.22-0.4-0.3-4.48-2.76-22.75-2.11-33.71 1.2-1 0.3-1.91 0.61-2.75 0.94-1.8937 0.79244-3.8739 1.3597-5.9 1.69-5.5051 0.79002-10.403 0.79002-15.908 0-2.0261-0.33034-4.0063-0.89756-5.9-1.69-0.84-0.33-1.76-0.64-2.75-0.94-11-3.31-29.23-4-33.71-1.2-0.13832 0.08869-0.2688 0.18906-0.39 0.3h-6.55c-1.1046 0-2 0.89543-2 2v4.66c-0.0013 0.98185 0.49088 1.8986 1.31 2.44l1.9 1.27c0.59238 0.38889 0.93475 1.0622 0.9 1.77-0.14175 5.4854 0.88072 10.939 3 16 3.58 8.38 16 10.9 24.93 10.9 2.6976 0.0771 5.3921-0.2361 8-0.93 4.35-1.43 8.24-7.36 10.45-12.42 1.7607-3.8506 2.7493-8.009 2.91-12.24 7.3e-4 -0.7138 0.38183-1.3731 1-1.73 3.2281-1.951 6.5798-1.951 9.8079 0 0.61817 0.3569 0.99927 1.0162 1 1.73 0.16067 4.231 1.1493 8.3894 2.91 12.24 2.21 5.06 6.1 11 10.45 12.42 2.6079 0.6939 5.3024 1.0071 8 0.93 8.92 0 21.35-2.52 24.93-10.9 2.1193-5.0614 3.1418-10.515 3-16-0.0348-0.70778 0.30762-1.3811 0.9-1.77l1.9-1.27c0.81913-0.54136 1.3113-1.4582 1.31-2.44v-4.6c0.0336-1.1048-0.83521-2.0274-1.94-2.06z" style="fill:#000;stroke-linecap:round;stroke-linejoin:round;stroke-width:2.5;stroke:none;"/></svg>');

    expect(await contract.multiavatar('Satoshi', true)).to.equal('PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHZpZXdCb3g9IjAgMCAyMzEgMjMxIj48cGF0aCBkPSJNMzMuODMsMzMuODNhMTE1LjUsMTE1LjUsMCwxLDEsMCwxNjMuMzQsMTE1LjQ5LDExNS40OSwwLDAsMSwwLTE2My4zNFoiIHN0eWxlPSJmaWxsOiNmZjJmMmI7Ii8+PHBhdGggZD0ibTExNS41IDUxLjc1YTYzLjc1IDYzLjc1IDAgMCAwLTEwLjUgMTI2LjYzdjE0LjA5YTExNS41IDExNS41IDAgMCAwLTUzLjcyOSAxOS4wMjcgMTE1LjUgMTE1LjUgMCAwIDAgMTI4LjQ2IDAgMTE1LjUgMTE1LjUgMCAwIDAtNTMuNzI5LTE5LjAyOXYtMTQuMDg0YTYzLjc1IDYzLjc1IDAgMCAwIDUzLjI1LTYyLjg4MSA2My43NSA2My43NSAwIDAgMC02My42NS02My43NSA2My43NSA2My43NSAwIDAgMC0wLjA5OTYxIDB6IiBzdHlsZT0iZmlsbDojRTJBRjZCOyIvPjxwYXRoIGQ9Im0xNDEuNzUgMTk1YTExNC43OSAxMTQuNzkgMCAwIDEgMzggMTYuNSAxMTUuNTMgMTE1LjUzIDAgMCAxLTEyOC40NiAwIDExNC43OSAxMTQuNzkgMCAwIDEgMzgtMTYuNWwyNi4yMyAxMyAyNi4yNy0xM3oiIHN0eWxlPSJmaWxsOiMyMzg1YzY7Ii8+PHBvbHlnb24gcG9pbnRzPSIxMTUuNSAyMDguMDMgMTE1LjUgMjA3Ljc0IDgyLjcyIDE4OC45MSA4MC40NSAxOTguODYgMTAxLjQ2IDIyMi43MiIgc3R5bGU9ImZpbGw6I2I4ZDBlMDsiLz48cG9seWdvbiBwb2ludHM9IjExNS41IDIwOC4wMyAxMTUuNSAyMDcuNzQgMTQ4LjI4IDE4OC45MSAxNTAuNTUgMTk4Ljg2IDEyOS41NCAyMjIuNzIiIHN0eWxlPSJmaWxsOiNiOGQwZTA7Ii8+PHBhdGggZD0ibTk0LjE5IDEzNi44NGg0Mi42MzJhMy43ODAxIDMuNzggMCAwIDEgMy43ODAyIDMuNzh2My4yMmExNS4yMzEgMTUuMjMgMCAwIDEtMTUuMjExIDE1LjE2aC0xOS43ODFhMTUuMjUxIDE1LjI1IDAgMCAxLTE1LjIyMS0xNS4xNnYtMy4yMmEzLjgwMDIgMy44IDAgMCAxIDMuNzgwMi0zLjc4eiIgc3R5bGU9ImZpbGw6I2ZmZjtzdHJva2UtbGluZWNhcDpyb3VuZDtzdHJva2UtbGluZWpvaW46cm91bmQ7c3Ryb2tlLXdpZHRoOjNweDtzdHJva2U6IzAwMDsiLz48cGF0aCBkPSJtMTMwLjk2IDEzNi44NHYyMS4xNm0tMzAuOTExLTIxLjE2djIxLjE2bTEwLjM0LTIxLjE2djIyLjE2bTEwLjMxLTIyLjJ2MjIuMiIgc3R5bGU9ImZpbGw6bm9uZTtzdHJva2UtbGluZWNhcDpyb3VuZDtzdHJva2UtbGluZWpvaW46cm91bmQ7c3Ryb2tlLXdpZHRoOjNweDtzdHJva2U6IzAwMDsiLz48cGF0aCBkPSJtMzIuOTAyIDY3LjY2MmMtMC4zNjI5NSAxLjcyMjctNi4yMzQyIDMwLjY5NSA1LjYxMzMgNTIuNTk2IDQuNTg0MyA4LjQ3NDMgOS4wMDgxIDEzLjIzOSAxMi43NSAxNS44OTNhNjcuNyA2Ny43IDAgMCAxLTMuNDY4OC0yMS4zNSA2Ny43IDY3LjcgMCAwIDEgMi4zMzItMTcuNjU4Yy00LjQ5MTQtMi40NjQ2LTEwLjg2OC02LjkwMTItMTMuODM0LTEzLjUyLTQuMTYyNi05LjI4NS0zLjYxNTUtMTQuNjczLTMuMzkyNi0xNS45NjF6bTE2NS4xOSAwYzAuMjIyOTIgMS4yODgyIDAuNzcwMDUgNi42NzU5LTMuMzkyNiAxNS45NjEtMi45NjY0IDYuNjE4My05LjM0MjYgMTEuMDU1LTEzLjgzNCAxMy41MmE2Ny43IDY3LjcgMCAwIDEgMi4zMzIgMTcuNjU4IDY3LjcgNjcuNyAwIDAgMS0zLjQ2ODggMjEuMzVjMy43NDE5LTIuNjUzMiA4LjE2NTctNy40MTgzIDEyLjc1LTE1Ljg5MyAxMS44NDctMjEuOSA1Ljk3NjItNTAuODczIDUuNjEzMy01Mi41OTZ6IiBzdHlsZT0iZmlsbDojYTIxZDAwOyIvPjxwYXRoIGQ9Im0xMTUuNzMgMTMuMTkxYy03LjM3ODctMC4xMzM1MS0xMy41MDkgNS43ODg4LTEzLjYzMSAxMy4xNjgtMC4xMDEyOCA1Ljg4MjcgMy40NTA4IDEwLjUxOCA4LjA1NjYgMTIuNTIgMS4wNjEgMC40NjExNSAyLjE4NjkgMC43ODAwOSAzLjM0MTggMC45NTcwM3Y4LjQyOTFjMC42Njc3OC0wLjAyMDM1IDEuMzM1OC0wLjAzMDc3IDIuMDAzOS0wLjAzMTI1IDAuNjY1NDctOWUtNSAxLjMzMDkgMC4wMDk3IDEuOTk2MSAwLjAyOTN2LTguNDExNWMyLjYwMDItMC4zODQwNiA1LjE1ODYtMS41NDg0IDcuMzA4Ni0zLjYyNSA0LjIzMjItNC4wODc4IDQuOTk5MS05Ljg3NTUgMy4xNTgyLTE0LjU0OS0xLjg0MDctNC42NzI2LTYuMzUwMi04LjM4MzQtMTIuMjMyLTguNDg2M3oiIHN0eWxlPSJmaWxsOiNmZmY7Ii8+PHBhdGggZD0ibTE3Mi43IDkwLjc1aC02LjU0Yy0wLjE0LTAuMS0wLjI2LTAuMjItMC40LTAuMy00LjQ4LTIuNzYtMjIuNzUtMi4xMS0zMy43MSAxLjItMSAwLjMtMS45MSAwLjYxLTIuNzUgMC45NC0xLjg5MzcgMC43OTI0NC0zLjg3MzkgMS4zNTk3LTUuOSAxLjY5LTUuNTA1MSAwLjc5MDAyLTEwLjQwMyAwLjc5MDAyLTE1LjkwOCAwLTIuMDI2MS0wLjMzMDM0LTQuMDA2My0wLjg5NzU2LTUuOS0xLjY5LTAuODQtMC4zMy0xLjc2LTAuNjQtMi43NS0wLjk0LTExLTMuMzEtMjkuMjMtNC0zMy43MS0xLjItMC4xMzgzMiAwLjA4ODY5LTAuMjY4OCAwLjE4OTA2LTAuMzkgMC4zaC02LjU1Yy0xLjEwNDYgMC0yIDAuODk1NDMtMiAydjQuNjZjLTAuMDAxMyAwLjk4MTg1IDAuNDkwODggMS44OTg2IDEuMzEgMi40NGwxLjkgMS4yN2MwLjU5MjM4IDAuMzg4ODkgMC45MzQ3NSAxLjA2MjIgMC45IDEuNzctMC4xNDE3NSA1LjQ4NTQgMC44ODA3MiAxMC45MzkgMyAxNiAzLjU4IDguMzggMTYgMTAuOSAyNC45MyAxMC45IDIuNjk3NiAwLjA3NzEgNS4zOTIxLTAuMjM2MSA4LTAuOTMgNC4zNS0xLjQzIDguMjQtNy4zNiAxMC40NS0xMi40MiAxLjc2MDctMy44NTA2IDIuNzQ5My04LjAwOSAyLjkxLTEyLjI0IDcuM2UtNCAtMC43MTM4IDAuMzgxODMtMS4zNzMxIDEtMS43MyAzLjIyODEtMS45NTEgNi41Nzk4LTEuOTUxIDkuODA3OSAwIDAuNjE4MTcgMC4zNTY5IDAuOTk5MjcgMS4wMTYyIDEgMS43MyAwLjE2MDY3IDQuMjMxIDEuMTQ5MyA4LjM4OTQgMi45MSAxMi4yNCAyLjIxIDUuMDYgNi4xIDExIDEwLjQ1IDEyLjQyIDIuNjA3OSAwLjY5MzkgNS4zMDI0IDEuMDA3MSA4IDAuOTMgOC45MiAwIDIxLjM1LTIuNTIgMjQuOTMtMTAuOSAyLjExOTMtNS4wNjE0IDMuMTQxOC0xMC41MTUgMy0xNi0wLjAzNDgtMC43MDc3OCAwLjMwNzYyLTEuMzgxMSAwLjktMS43N2wxLjktMS4yN2MwLjgxOTEzLTAuNTQxMzYgMS4zMTEzLTEuNDU4MiAxLjMxLTIuNDR2LTQuNmMwLjAzMzYtMS4xMDQ4LTAuODM1MjEtMi4wMjc0LTEuOTQtMi4wNnoiIHN0eWxlPSJmaWxsOiMwMDA7c3Ryb2tlLWxpbmVjYXA6cm91bmQ7c3Ryb2tlLWxpbmVqb2luOnJvdW5kO3N0cm9rZS13aWR0aDoyLjU7c3Ryb2tlOm5vbmU7Ii8+PC9zdmc+", "attributes": [{"trait_type":"Environment","value":"Robo"},{"trait_type":"Head","value":"Ava"},{"trait_type":"Clothing","value":"Finn"},{"trait_type":"Mouth","value":"Robo"},{"trait_type":"Eyes","value":"Robo"},{"trait_type":"Top","value":"Aspen"},')

  });

});
