pragma solidity 0.4.24;

import "./vendor/ChainlinkClient.sol";
import "./vendor/Ownable.sol";

/**
 * @title MyContract is an example contract which requests data from
 * the Chainlink network
 * @dev This contract is designed to work on multiple networks, including
 * local test networks
 */
contract TestClient is ChainlinkClient, Ownable {
    uint256 constant private ORACLE_PAYMENT = 10 * XDC;

    uint256 public currentPrice;
    uint256 public currentEwtPrice;
    int256 public changeDay;
    bytes32 public lastMarket;

    uint256 constant private ARGS_VERSION = 1;

    event RequestEwtPriceFulfilled(
        bytes32 indexed requestId,
        uint256 indexed price
    );

    constructor() public Ownable() {
    }

    function requestEwtPrice(address _oracle, string _jobId)
        public
        onlyOwner
        payable
    {
        ChainlinkRequestInterface oracle = ChainlinkRequestInterface(_oracle);

        Chainlink.Request memory req = buildChainlinkRequest(
                    stringToBytes32(_jobId),
                    this,
                    this.fulfillEwtPrice.selector
                );
        req.add("get", "https://api.liquid.com/products/560");
        req.add("path", "last_traded_price");
        req.addInt("times", 10000);

        oracle.oracleRequest.value(msg.value)(msg.sender, 1, stringToBytes32(_jobId), this, this.fulfillEwtPrice.selector,  req.nonce, ARGS_VERSION,req.buf.buf);
    }


    function fulfillEwtPrice(bytes32 _requestId, uint256 _price)
        public
        recordChainlinkFulfillment(_requestId)
    {
        emit RequestEwtPriceFulfilled(_requestId, _price);
        currentEwtPrice = _price;
    }

    function withdrawXDC()
        public
        onlyOwner
    {
        address(msg.sender).transfer(address(this).balance);
    }

    function cancelRequest(
        bytes32 _requestId,
        uint256 _payment,
        bytes4 _callbackFunctionId,
        uint256 _expiration
    )
        public
        onlyOwner
    {
        cancelChainlinkRequest(
            _requestId,
            _payment,
            _callbackFunctionId,
            _expiration
        );
    }

    function stringToBytes32(string memory source)
        private
        pure
        returns (bytes32 result)
    {
        bytes memory tempEmptyStringTest = bytes(source);

        if (tempEmptyStringTest.length == 0) {
            return 0x0;
        }

        assembly {
            result := mload(add(source, 32))
        }
    }
}
