const hre = require('hardhat')
const { FXRootContractAbi } = require('./contractABI')

async function main() {
	const nftAddress = '0xBCEd109607B394605FE4f17aE7c2FB34D56310Fd'
	const nftCollection = await ethers.getContractAt('MyNFT', nftAddress)
	const fxRoot = await ethers.getContractAt(
		FXRootContractAbi,
		'0x794541BBc8Ace5dFbC82faC28B5572eBa4D3bEDD'
	)

	const signer = await ethers.getSigner()
	console.log(nftCollection.address)

	const tokenIds = [1, 2, 3, 4, 5]

	for (const tokenId of tokenIds) {
		let txn = await nftCollection.approve(fxRoot.address, tokenId)
		await txn.wait()

		let txn2 = await fxRoot.deposit(
			nftCollection.address,
			signer.address,
			tokenId,
			'0x794541BBc8Ace5dFbC82faC28B5572eBa4D3bEDD'//polygon
		)
		await txn2.wait()
		console.log('Token #' + tokenId + ' deposited')
	}
}

main().catch((error) => {
	console.error(error)
	process.exitCode = 1
})