// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.5.0;

// Allows anyone to claim a token if they exist in a merkle root.
interface IMerkleDistributor {
    // Returns the address of the token distributed by this contract.
    function token() external view returns (address);
    // Returns the merkle root of the merkle tree containing account balances available to claim.
    function merkleRoot() external view returns (bytes32);
    // Returns true if the index has been marked claimed.
    function isClaimed(uint256 index) external view returns (bool);
    // Claim the given amount of the token to the given address. Reverts if the inputs are invalid.
    function claimShares(uint256 index, address account, uint256 amount, bytes32[] calldata merkleProof) external;
    // Claim the unclaimed vested shares.
    function claim(address account) external;

    // This event is triggered whenever a call to #claimShares succeeds.
    event ClaimedShares(uint256 index, address account, uint256 amount);

    // This event is triggered whenever a called to #claim succeeds.
    event claimed(address account, uint256 claimed);
}