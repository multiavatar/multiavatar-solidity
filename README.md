# Multiavatar in Solidity

<img src="https://raw.githubusercontent.com/multiavatar/Multiavatar/main/logo.png?v=001" width="50">

In this repository, you will find the source code of the Multiavatar generator rewritten in Solidity, the Ethereum programming language for writing smart contracts. 

Multiavatar in Solidity is the essential part of the upcoming <a href="https://multiavatar.com/nft" target="_blank">Multiavatar NFT</a> collection, as all NFT images of the collection will be generated by this smart contract entirely on-chain, eliminating the need for a centralized server to host the Multiavatar generator.

When deployed on the mainnet, the Multiavatar in Solidity smart contract will become a part of the Ethereum network, and will empower the Multiavatar NFT collection with the ability to generate 12,230,590,464 cryptographically unique avatars. Due to the on-chain approach, the Multiavatar NFT collection will be reliable and accessible long-term, as it will exist as long as Ethereum exists.

This smart contract is currently deployed on the Ethereum Goerli testnet here: <a href="https://goerli.etherscan.io/address/0x67da528aD7DabF168c6fdD99aFb47028A86317F0" target="_blank">0x67da528aD7DabF168c6fdD99aFb47028A86317F0</a>

You can test the contract by generating on-chain avatars. Simply query the `multiavatar` function on <a href="https://goerli.etherscan.io/address/0x67da528aD7DabF168c6fdD99aFb47028A86317F0#readContract" target="_blank">Etherscan</a>, providing an avatar name as the first parameter, and `0` as the second parameter.


## Development

Solidity programming language and its development environment is very different from JavaScript, PHP, or Python, in which Multiavatar was implemented previously. That is why a lot of Multiavatar methods and logic were rewritten in different ways. While previously rewriting Multiavatar from JavaScript to PHP and Python was straightforward, achieving the same in Solidity was very different and challenging.

While the Multiavatar generator is designed to be lightweight (69 KB) in a web environment, due to the limited space available on the Ethereum blockchain, the resulting smart contract is very large in Ethereum terms. Although the combined size of source materials (SVG image shapes and color themes) is only around 60 KB in plain text, they need to be presented as string arrays in the Solidity code in order to be looped through during an avatar generation. This inclusion of string arrays in the contract makes it expensive to deploy. Additionally, the contract needs to be divided into separate contracts that inject themes and SVG shapes data into the main contract, as the full contract would otherwise exceed the size limits imposed by the Ethereum blockchain.


## Deployment

Because the smart contract is relatively large, the deployment is complex and the cost is high. With gas price at 10 Gwei, the fee for deploying the contract is around 1.5 ETH. There may still be opportunities to further optimize the contract and reduce the deployment cost. Your ideas for contract optimization are welcome.

On a live blockchain, such as the Ethereum Goerli testnet, the contract needs to be divided into separate contracts and deployed in separate transactions because of the contract size and transaction size limits implemented by the blockchain. This is the currently preferred method for deployment, using the `deploy_ALL.js` script and Solidity files located in the `contracts` folder.

On a local Hardhat environment, the contract can also be deployed from a single Solidity file. The whole contract in a single file can be found in `contracts_single` folder. If you want to work with a contract in a single file, rename your `contracts_single` folder to `contracts`, and then use the `deploy.js` script.


## Quickstart

- Clone this repository and run `npm install`

- For local deployment, first start a Hardhad node by running `npx hardhat node`

- To deploy the contract on localhost, open a new terminal window and run the following command:  
`npx hardhat run scripts/deployAll.js --network localhost`

- To deploy on the Ethereum Goerli testnet, first rename `.env.example` file to `.env` and update it with your keys, and then run:  
`npx hardhat run scripts/deployAll.js --network goerli`

If you have deployed the contract on your local Hardhat blockchain, you can interact with the contract through the Hardhat console:

- First open a new terminal window and run the following command to open the console:  
`npx hardhat console --network localhost`

- Now run the following commands in the console to connect to your contract deployed at the default local address:  
`const MNFT = await ethers.getContractFactory('MNFT')`  
`const mnft = await MNFT.attach('0x5FbDB2315678afecb367f032d93F642f64180aa3')`

- To get only the avatar SVG code without traits, run the following command:  
`await mnft.multiavatar("Satoshi", false)`
- To get the Base64 encoded avatar SVG code with traits for the metadata API, run:  
`await mnft.multiavatar("Satoshi", true)`

- Commands for testing the injected SVG code and themes:  
`await mnft.getThemes('00','A','env')`
`await mnft.getParts('00', 'env')`'

- Lock the contract after injecting all SVG code and themes:  
`await mnft.lockGen()`

- To test the 'Satoshi' avatar, in your terminal run: `npx hardhat test`


## Contribution

Code review, feedback, and optimization ideas are welcome.

Report issues in the [issue tracker](https://github.com/multiavatar/multiavatar-solidity/issues). 

Feel free to make a pull request or suggest ideas.


## License

To prevent fake Multiavatar NFTs before the official collection launch, the Multiavatar in Solidity smart contract source code is currently released under a proprietary [license](https://github.com/multiavatar/multiavatar-solidity/blob/master/LICENSE) that permits usage solely for personal and non-commercial purposes.

After the official Multiavatar NFT release, the license of the source code will switch to MIT, and for the Multiavatar graphic assets, the CC0 license will be applied. These licenses will provide the maximum flexibility and freedom for users and developers to build upon and utilize the Multiavatar project. It will allow for the project to spread and be used widely, encouraging creativity and innovation.


## More info

For additional information on how the Multiavatar generator works, please refer to the [Multiavatar in JavaScript](https://github.com/multiavatar/Multiavatar) repository.

To learn more about the NFT collection, visit the [Multiavatar NFT](https://multiavatar.com/nft) website.


## Screenshots

<img src="https://multiavatar.com/press/img/screenshots/screenshot-02.png?v=001">

<img src="https://multiavatar.com/press/img/screenshots/screenshot-10.png?v=001">

<img src="https://multiavatar.com/press/img/screenshots/screenshot-03.png?v=001">

<img src="https://multiavatar.com/img/2023/screenshot-mint-satoshi.png?v=004">

<img src="https://multiavatar.com/img/2023/screenshot-nfts-on-opensea.png?v=001">