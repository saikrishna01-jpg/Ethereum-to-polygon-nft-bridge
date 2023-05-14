// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "erc721a/contracts/ERC721A.sol";

contract MyNFT is ERC721A {
    uint256 MAX_SUPPLY = 5;

    string public baseURI =
        "https://gateway.pinata.cloud/ipfs/QmbRAQyin9Fz5SewJBxzHXFd2tEzLYLPjfef4ySw5fKQTa/";

    struct NFT {
        string name;
        string description;
        string imageUrl;
    }
    mapping(uint256 => NFT) private _nfts;

    constructor() ERC721A("MyNFT", "MNFT") {
        _nfts[1].description = "A cartoon of a cat catching a mouse";
        _nfts[2]
            .description = "An Andy Warhol style painting of a french bulldog wearing sunglasses";
        _nfts[3].description = "High quality photo of a monkey astronaut";
        _nfts[4]
            .description = "A Shiba Inu dog wearing a beret and black turtleneck";
        _nfts[5]
            .description = "A photo of a teddy bear on a skateboard in Times Square";
    }

    function mint(uint256 quantity) external payable {
        require(
            totalSupply() + quantity <= MAX_SUPPLY,
            "Not enough tokens left"
        );
        _safeMint(msg.sender, quantity);
    }

    function promptDescription(
        uint256 tokenId
    ) public view virtual returns (string memory) {
        require(_exists(tokenId), "NFT does not exist");

        return _nfts[tokenId].description;
    }

    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }
}
