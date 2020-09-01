# Chainlink Oracle Stub

Basic contracts required to create an oracle for chainlink services. Need to run a chainlink node in order to consume the incoming request & fulfill them.

## Test

Oracle.sol is the primary smart contract. An audit result file has also been added.
In order to test run the following commands:

1. `npm i`
2. `truffle test`

## Deployed At

### Apothem

1. Oracle Address - xdc5ee4ba477eb7a034426de7daea41410880c84d69
2. Link Token Address - xdc8d2e1dff891a93e342de290f0c8196570c3931fd
3. Owner address - xdc7d831bc9b77d1d5f60e68dcc174f313f575ca1c4
4. Node Operator Address ( Simple ) - 0xe98f83692FDbD667c348f17AfBb1357E6D281B17
5. Pointer Address - xdc6ed3cdeea5849c534fda3c7a1dfef817204c11e2
6. TestClient - xdcefd88962be8a0451e07d44b9eb36d6116cc20c2e

### XinFin Mainnet

1. Oracle Address - xdc1cda61c1c068810e981d524f08fc8c2fa0ec13d8
2. Link Token Address - xdc9eea5486b95ef892194cf37bb3c0d0836743e2e8
3. Owner address - xdc7d831bc9b77d1d5f60e68dcc174f313f575ca1c4
4. Node Operator Address - 0xcfFed1fF4AB8423f68820B8E61fc655B230dE467
5. Pointer Address - xdc9e82dad9a71b5efa9d3ed1963b4ad26e2961126d
6. TestClient - xdc9e82dad9a71b5efa9d3ed1963b4ad26e2961126d

## TODO

 - [ ] add more tests