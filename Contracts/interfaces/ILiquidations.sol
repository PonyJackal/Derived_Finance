pragma solidity ^0.8.4;

interface ILiquidations {
    // Views
    function isOpenForLiquidation(address account) external view returns (bool);

    function getLiquidationDeadlineForAccount(address account)
        external
        view
        returns (uint256);

    function isLiquidationDeadlinePassed(address account)
        external
        view
        returns (bool);

    function liquidationDelay() external view returns (uint256);

    function liquidationRatio() external view returns (uint256);

    function liquidationPenalty() external view returns (uint256);

    function calculateAmountToFixCollateral(
        uint256 debtBalance,
        uint256 collateral
    ) external view returns (uint256);

    // Mutative Functions
    function flagAccountForLiquidation(address account) external;

    // Restricted: used internally to Derived
    function removeAccountInLiquidation(address account) external;

    function checkAndRemoveAccountInLiquidation(address account) external;
}
