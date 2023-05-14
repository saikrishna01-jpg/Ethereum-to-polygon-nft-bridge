# Ethereum-to-polygon-nft-bridge
First nft assets are created and provided with metadata then deployed on the pinata cloud

Smart contract is created which implements the ERC721A which features batch mint so multiple nfts can be minted at a time with low costs. 

contract is deployed on the goerli testnet. 

hardhat script to batchmint nfts is created and run by giving the number of nfts to mint as parameter. Here the abi of contract is required. Nfts are now minted. 

a hardhat script is created to transfer the nfts on goerli chain the the polygon chain. Once the script is run nfts are transfered. The balance of the polygon network is checked to see if all the nfts are transfered or not. 
