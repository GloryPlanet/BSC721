// SPDX-License-Identifier: MIT
pragma solidity 0.8.6;

import "/tokens/nf-token-metadata.sol";
import "/ownership/ownable.sol";

/**
 * @dev This is an example contract implementation of NFToken with metadata extension.
 */
contract MyArtSale is
  NFTokenMetadata,
  Ownable
{

  /**
   * @dev Contract constructor. Sets metadata extension `name` and `symbol`.
   */
  constructor()
  {
    nftName = "Glory Plant NFT";
    nftSymbol = "GPNFT";
  }

  /**
   * @dev Mints a new NFT.
   * @param _to The address that will own the minted NFT.
   * @param _tokenId of the NFT to be minted by the msg.sender.
   * @param _uri String representing RFC 3986 URI.
   * @param _bool Set whether NFT enables key information
   * @param _ciphertext Set NFT ciphertext information
   */
  function mint(
    address _to,
    uint256 _tokenId,
    string calldata _uri,
    uint8 _bool,
    string memory _ciphertext
  )
    public
  {
    super._mint(_to, _tokenId);
    super._setTokenUri(_tokenId, _uri);
    super._setTokenDisplay(_tokenId,_bool);
    super._setTokenCiphertext(_tokenId,_ciphertext);
  }

  function removeToken(
    address from,
    uint256 tokenId
  )
    external 
  {
    super._removeNFToken(from,tokenId);
  }

}
