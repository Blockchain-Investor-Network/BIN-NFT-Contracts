// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "@openzeppelin/contracts@4.4.2/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts@4.4.2/access/Ownable.sol";
import "@openzeppelin/contracts@4.4.2/utils/Counters.sol";

/// @custom:security-contact BlockchainInvestorNetwork@gmail.com
contract BlockchainInvestorNetwork is ERC721, Ownable {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIdCounter;

    constructor() ERC721("Blockchain Investor Network", "BSI") {}

    function _baseURI() internal pure override returns (string memory) {
        return "https://www.nftjpg.com";
    }

    function safeMint(address to) public onlyOwner {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }

    //Non-Transferable
    function _beforeTokenTransfer(address from, address to, uint256 tokenId)
        internal
        onlyOwner // only allows minting by contract owner
        override
    {
        super._beforeTokenTransfer(from, to, tokenId);
        
    }
}
