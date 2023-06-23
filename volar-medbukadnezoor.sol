// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts@4.9.2/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.9.2/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts@4.9.2/security/Pausable.sol";
import "@openzeppelin/contracts@4.9.2/access/Ownable.sol";
import "@openzeppelin/contracts@4.9.2/token/ERC20/extensions/draft-ERC20Permit.sol";

contract VolarMedbukadnezoor is ERC20, ERC20Burnable, Pausable, Ownable, ERC20Permit {
    string public github;
    
    struct Referral {
        address referralAddress;
        string referralString;
    }
    
    Referral[] public referrals;

    constructor()
        ERC20("volar-medbukadnezoor", "VMK")
        ERC20Permit("volar-medbukadnezoor")
    {
        _mint(msg.sender, 1000 * 10 ** decimals());
        github = "medbukadnezoor";
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function addReferral(address _referralAddress, string memory _referralString) external onlyOwner {
        referrals.push(Referral(_referralAddress, _referralString));
    }
    
    function totalReferrals() public view returns (uint256) {
        return referrals.length;
    }

    function _beforeTokenTransfer(address from, address to, uint256 amount)
        internal
        whenNotPaused
        override
    {
        super._beforeTokenTransfer(from, to, amount);
    }
}

