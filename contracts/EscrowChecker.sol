//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

abstract contract DVDXEscrow {
    function numVestingEntries(address account) public virtual view returns (uint);
    function getVestingScheduleEntry(address account, uint index) public virtual view returns (uint[2] memory);
}

contract EscrowChecker {
    DVDXEscrow public dvdx_escrow;
    constructor(DVDXEscrow _esc) {
        dvdx_escrow = _esc;
    }

    function checkAccountSchedule(address account)
        public
        view
        returns (uint[16] memory)
    {
        uint[16] memory _result;
        uint schedules = dvdx_escrow.numVestingEntries(account);
        for (uint i = 0; i < schedules; i++) {
            uint[2] memory pair = dvdx_escrow.getVestingScheduleEntry(account, i);
            _result[i*2] = pair[0];
            _result[i*2 + 1] = pair[1];
        }
        return _result;
    }
}