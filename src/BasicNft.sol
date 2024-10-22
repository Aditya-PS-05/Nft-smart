// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract BasicNft is ERC721{

    uint256 private s_tokenCounter;
    mapping(uint256 => string) private s_tokenIdToUri;

    constructor() ERC721("Basic_NFT", "BNFT") {
        s_tokenCounter = 0;
    }

    function mintToken(string memory newTokenUri) public {
        s_tokenIdToUri[s_tokenCounter] = newTokenUri;
        _safeMint(msg.sender, s_tokenCounter);

        s_tokenCounter++;
    }

    function tokenUri(uint256 tokenId) public view returns (string memory) {
        return s_tokenIdToUri[tokenId];
    }
}