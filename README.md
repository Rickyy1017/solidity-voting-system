# Solidity Voting Contract

A decentralized voting system built with Solidity and Foundry, allowing users to vote on candidates within a specified time period.

## Features

- **Time-Bound Voting**: Voting is only allowed within a defined start and end time
- **Single Vote Per Address**: Each address can vote only once to prevent double voting
- **Candidate Management**: Add multiple candidates before voting begins
- **Vote Counting**: Real-time vote tallying for each candidate
- **Secure**: Built with Solidity best practices and comprehensive testing

## Contract Overview

The `Voting` contract includes the following functionality:

- `constructor(uint256 _start, uint256 _end)`: Initialize voting with start and end timestamps
- `addCandidate(string memory _name)`: Add a candidate to the election
- `vote(uint256 _index)`: Cast a vote for a candidate by index
- `candidates(uint256)`: View candidate information (name and vote count)
- `hasVoted(address)`: Check if an address has already voted

## Prerequisites

- [Foundry](https://book.getfoundry.sh/getting-started/installation) installed
- Solidity ^0.8.20

## Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd solidity-voting-contract
```

2. Install dependencies:
```bash
forge install
```

## Usage

### Build the Contract

```shell
forge build
```

### Run Tests

```shell
forge test
```

Run specific test:
```shell
forge test --match-test testVoteOnce
```

### Deploy the Contract

1. Set up your environment variables:
```bash
export PRIVATE_KEY=your_private_key
export RPC_URL=your_rpc_url
```

2. Deploy using the script:
```shell
forge script script/Deploy.sol --rpc-url $RPC_URL --private-key $PRIVATE_KEY --broadcast
```

### Interact with Deployed Contract

Use Cast to interact with the deployed contract:

```shell
# Add a candidate
cast send <contract_address> "addCandidate(string)" "Candidate Name" --rpc-url $RPC_URL --private-key $PRIVATE_KEY

# Vote for candidate (index 0)
cast send <contract_address> "vote(uint256)" 0 --rpc-url $RPC_URL --private-key $PRIVATE_KEY

# Check vote count
cast call <contract_address> "candidates(uint256)" 0 --rpc-url $RPC_URL
```

## Testing

The project includes comprehensive tests covering:

- Single vote enforcement
- Vote count incrementing
- Voting period validation
- Double voting prevention

Run tests with verbose output:
```shell
forge test -v
```

## Project Structure

```
├── src/
│   └── Voting.sol          # Main voting contract
├── test/
│   └── Voting.t.sol        # Contract tests
├── script/
│   └── Deploy.sol          # Deployment script
├── foundry.toml            # Foundry configuration
└── README.md               # This file
```

## Security Considerations

- Voting is time-bound to prevent indefinite voting periods
- One vote per address prevents manipulation
- Input validation for candidate indices
- Uses Solidity ^0.8.20 for enhanced security features

## Contributing

1. Fork the repository
2. Create a feature branch
3. Add tests for new functionality
4. Ensure all tests pass
5. Submit a pull request

## License

This project is licensed under the MIT License.
