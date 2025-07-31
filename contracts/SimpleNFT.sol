// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SimpleNFT is ERC721, Ownable {
    uint256 public tokenCounter;

    constructor() ERC721("LabubuNFT", "LBBNFT") Ownable(msg.sender) {
        tokenCounter = 0;
    }

    function mint() public onlyOwner {
        _safeMint(msg.sender, tokenCounter);
        emit TokenMinted(msg.sender, tokenCounter);
        tokenCounter++;
    }

    event TokenMinted(address indexed to, uint256 indexed tokenId);
}
