pragma solidity 0.8.4;

/**
 * @title SynthetixEscrow interface
 */
interface ISynthetixEscrow {
    function balanceOf(address account) public view returns (uint);
    function appendVestingEntry(address account, uint quantity) public;
}