pragma solidity ^0.8.4;

interface IFlexibleStorage {
    // Views
    function getUIntValue(bytes32 contractName, bytes32 record)
        external
        view
        returns (uint256);

    function getUIntValues(bytes32 contractName, bytes32[] calldata records)
        external
        view
        returns (uint256[] memory);

    function getIntValue(bytes32 contractName, bytes32 record)
        external
        view
        returns (int256);

    function getIntValues(bytes32 contractName, bytes32[] calldata records)
        external
        view
        returns (int256[] memory);

    function getAddressValue(bytes32 contractName, bytes32 record)
        external
        view
        returns (address);

    function getAddressValues(bytes32 contractName, bytes32[] calldata records)
        external
        view
        returns (address[] memory);

    function getBoolValue(bytes32 contractName, bytes32 record)
        external
        view
        returns (bool);

    function getBoolValues(bytes32 contractName, bytes32[] calldata records)
        external
        view
        returns (bool[] memory);

    function getBytes32Value(bytes32 contractName, bytes32 record)
        external
        view
        returns (bytes32);

    function getBytes32Values(bytes32 contractName, bytes32[] calldata records)
        external
        view
        returns (bytes32[] memory);

    // Mutative functions
    function deleteUIntValue(bytes32 contractName, bytes32 record) external;

    function deleteIntValue(bytes32 contractName, bytes32 record) external;

    function deleteAddressValue(bytes32 contractName, bytes32 record) external;

    function deleteBoolValue(bytes32 contractName, bytes32 record) external;

    function deleteBytes32Value(bytes32 contractName, bytes32 record) external;

    function setUIntValue(
        bytes32 contractName,
        bytes32 record,
        uint256 value
    ) external;

    function setUIntValues(
        bytes32 contractName,
        bytes32[] calldata records,
        uint256[] calldata values
    ) external;

    function setIntValue(
        bytes32 contractName,
        bytes32 record,
        int256 value
    ) external;

    function setIntValues(
        bytes32 contractName,
        bytes32[] calldata records,
        int256[] calldata values
    ) external;

    function setAddressValue(
        bytes32 contractName,
        bytes32 record,
        address value
    ) external;

    function setAddressValues(
        bytes32 contractName,
        bytes32[] calldata records,
        address[] calldata values
    ) external;

    function setBoolValue(
        bytes32 contractName,
        bytes32 record,
        bool value
    ) external;

    function setBoolValues(
        bytes32 contractName,
        bytes32[] calldata records,
        bool[] calldata values
    ) external;

    function setBytes32Value(
        bytes32 contractName,
        bytes32 record,
        bytes32 value
    ) external;

    function setBytes32Values(
        bytes32 contractName,
        bytes32[] calldata records,
        bytes32[] calldata values
    ) external;
}
