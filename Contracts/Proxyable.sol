pragma solidity ^0.8.4;

// Inheritance
import "./Owned.sol";

// Internal references
import "./Proxy.sol";

// This contract should be treated like an abstract contract
abstract contract Proxyable is Owned {
    /* The proxy this contract exists behind. */
    Proxy public proxy;
    Proxy public integrationProxy;

    /* The caller of the proxy, passed through to this contract.
     * Note that every function using this member must apply the onlyProxy or
     * optionalProxy modifiers, otherwise their invocations can use stale values. */
    address public messageSender;

    constructor(address payable _proxy) internal {
        // This contract is abstract, and thus cannot be instantiated directly
        require(owner != address(0), "Owner must be set");

        proxy = Proxy(_proxy);
        emit ProxyUpdated(_proxy);
    }

    function setProxy(address payable _proxy) external onlyOwner {
        proxy = Proxy(_proxy);
        emit ProxyUpdated(_proxy);
    }

    function setIntegrationProxy(address payable _integrationProxy)
        external
        onlyOwner
    {
        integrationProxy = Proxy(_integrationProxy);
    }

    function setMessageSender(address sender) external onlyProxy {
        messageSender = sender;
    }

    modifier onlyProxy {
        _onlyProxy();
        _;
    }

    function _onlyProxy() private view {
        require(
            Proxy(payable(msg.sender)) == proxy ||
                Proxy(payable(msg.sender)) == integrationProxy,
            "Only the proxy can call"
        );
    }

    modifier optionalProxy {
        _optionalProxy();
        _;
    }

    function _optionalProxy() private {
        if (
            Proxy(payable(msg.sender)) != proxy &&
            Proxy(payable(msg.sender)) != integrationProxy &&
            messageSender != msg.sender
        ) {
            messageSender = msg.sender;
        }
    }

    modifier optionalProxy_onlyOwner {
        _optionalProxy_onlyOwner();
        _;
    }

    // solhint-disable-next-line func-name-mixedcase
    function _optionalProxy_onlyOwner() private {
        if (
            Proxy(payable(msg.sender)) != proxy &&
            Proxy(payable(msg.sender)) != integrationProxy &&
            messageSender != msg.sender
        ) {
            messageSender = msg.sender;
        }
        require(messageSender == owner, "Owner only function");
    }

    event ProxyUpdated(address proxyAddress);
}
