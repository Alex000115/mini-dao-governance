# Mini DAO Governance

A simplified on-chain governance protocol demonstrating how DAOs function.

This project walks through:

Token → Voting Power → Proposal → Vote → Execution

Flat structure ensures beginner accessibility.

---

## Features

• Governance token voting power  
• Proposal creation  
• Vote for/against  
• Proposal deadline  
• Execution logic  
• On-chain decision making  

---

## Tech Stack

- Solidity
- Hardhat
- Ethers.js
- HTML + JavaScript

---

## Governance Flow

1. User holds tokens
2. Creates proposal
3. Token holders vote
4. Deadline passes
5. Proposal can be executed if approved

---

## Voting Power

Voting weight = token balance

This simulates real DAO governance models.

---

## Setup

Install:

npm install

Compile:

npx hardhat compile

Run node:

npx hardhat node

Deploy:

npx hardhat run deploy.js --network localhost

---

## Frontend

Open:

index.html

Paste deployed DAO + Token addresses in app.js

---

## Learning Goals

Understand:

- Governance systems
- Voting mechanics
- Proposal lifecycle
- Snapshot voting
- Execution logic

---

## Security Warning

This DAO is simplified for learning.

Production DAOs require:

- quorum rules
- proposal thresholds
- signature voting
- timelocks
- upgradeability

---

## License
MIT
