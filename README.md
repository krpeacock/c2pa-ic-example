# c2pa

Example of a C2PA implementation on the Internet Computer. Currently not working.

## Prerequisites

Install dfx https://internetcomputer.org/docs/current/developer-docs/setup/install/#installing-the-ic-sdk-1

## Getting started

If you want to start working on your project right away, you might want to try the following commands:

```bash
cd c2pa/
dfx help
dfx canister --help
```

## Running the project locally

If you want to test your project locally, you can use the following commands:

```bash
# Starts the replica, running in the background
dfx start --background

# Deploys your canisters to the replica and generates your candid interface
./build.sh
```
