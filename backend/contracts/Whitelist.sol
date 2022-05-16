//SPDX-License-Identifier: Unlicencse
pragma solidity ^0.8.0;

contract Whitelist {
    
    //Max number of whitelisted address allowed
    uint8 public maxWhitelistedAddresses;

    // Create a mapping of whitelisted address
    // if an address is whitelisted, we would set it true, it is false by default for all other addresses
    mapping(address => bool) public whitelistedAddresses;

    //numAddressesWhitelisted would be used to keep track of how many address have been whitelisted
    uint8 public numAddressesWhitelisted;

    //setting the max number of whitelisted addresses
    // User will put the value at the time of deployment
    constructor(uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    /*
    addAddressToWhitelist - this function adds the address of the sender to
    the whitelist
    */
    function addAddressToWhitelist() public {
        // Check if the user has already been whitelisted
        require(!whitelistedAddresses[msg.sender], "Sender has already been whitelisted");
        // check if the numAddressWhitelisted < maxWhitelistedAddress
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "More address cant be added, limit readhed");
        // add the address to whitelist
        whitelistedAddresses[msg.sender] = true;
        // Increase teh number of whitelisted addresses
        numAddressesWhitelisted += 1;
    }
}