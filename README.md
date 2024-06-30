# degen
Degen contract provides functionality for managing and redeeming assets within a game or similar application, including handling balances and item redemptions.
markdown

# Degen Smart Contract
The `Degen` smart contract is a basic implementation for managing and redeeming game assets on the Ethereum blockchain. It allows for the creation, transfer, and destruction of assets, as well as the redemption of specific items.

## Overview

- **Asset Name**: `GameAsset`
- **Asset Symbol**: `GA`
- **Owner**: Address of the contract deployer

## Contract Features

1. **Asset Management**:
   - **Create Asset**: Allocate assets to a specific address.
   - **Transfer Asset**: Transfer assets between addresses.
   - **Destroy Asset**: Burn assets from your own balance.

2. **Item Redemption**:
   - **Redeem Items**: Redeem specific items from the asset balance.
   - **Show Redeemable Items**: Display a list of items available for redemption.

3. **Balance Checking**:
   - **Check Balance**: View the asset balance of a specific address.
   - **Show Redeemed Items**: View the quantity of each item redeemed by an address.

## Contract Functions

### Constructor
- **`constructor()`**: Initializes the contract with a name (`"GameAsset"`), symbol (`"GA"`), and sets the deployer as the owner.

### Modifiers
- **`onlyOwner`**: Restricts function access to only the contract owner.

### Asset Management Functions
- **`createAsset(address account, uint256 amount)`**:
  - **Description**: Allocates a specified amount of assets to a given address.
  - **Parameters**:
    - `account`: Address to receive the assets.
    - `amount`: Amount of assets to allocate.
  - **Restrictions**: Only callable by the owner.

- **`transferAsset(address recipient, uint256 amount)`**:
  - **Description**: Transfers assets from the caller's balance to another address.
  - **Parameters**:
    - `recipient`: Address to receive the assets.
    - `amount`: Amount of assets to transfer.

- **`destroyAsset(uint256 amount)`**:
  - **Description**: Burns a specified amount of assets from the caller's balance.
  - **Parameters**:
    - `amount`: Amount of assets to burn.

### Redemption Functions
- **`showRedeemableItems()`**:
  - **Description**: Returns a string describing items available for redemption and their costs in AVAX.
  - **Returns**: A string with item details.

- **`redeemAsset(uint256 item, uint256 quantity)`**:
  - **Description**: Redeems a specified quantity of an item.
  - **Parameters**:
    - `item`: Item number (1 to 4).
    - `quantity`: Quantity of the item to redeem.

### Balance and Redemption Functions
- **`checkBalance(address account)`**:
  - **Description**: Returns the balance of a specified address.
  - **Parameters**:
    - `account`: Address to check the balance of.
  - **Returns**: Asset balance of the specified address.

- **`showRedeemedItems(address account)`**:
  - **Description**: Returns a string describing the quantity of each item redeemed by the specified address.
  - **Parameters**:
    - `account`: Address to check redeemed items for.
  - **Returns**: A string listing redeemed items and their quantities.

## Example Usage

1. **Deploy the Contract**:
   - Deploy the `Degen` contract to the Ethereum blockchain. The deployer will be set as the owner.

2. **Create Asset**:
   ```solidity
   degenContract.createAsset(address, 1000);
Transfer Asset:

solidity

degenContract.transferAsset(recipientAddress, 500);
Destroy Asset:

solidity

degenContract.destroyAsset(200);
Redeem Items:

solidity

degenContract.redeemAsset(1, 2); // Redeem 2 units of Item1
Check Balance:

solidity

uint256 balance = degenContract.checkBalance(accountAddress);
Show Redeemed Items:


string memory redeemedItems = degenContract.showRedeemedItems(accountAddress);
License
This contract is licensed under the MIT License.


This `README.md` provides a comprehensive overview of the `Degen` contract.
