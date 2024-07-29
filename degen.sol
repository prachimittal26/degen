// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Degen {
    string public assetName;
    string public assetSymbol;
    address public assetOwner;

    mapping(address => uint256[4]) private redeemedItems;
    mapping(address => uint256) private balances;

    constructor() {
        assetName = "GameAsset";
        assetSymbol = "GA";
        assetOwner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == assetOwner, "Only the asset owner can perform this action");
        _;
    }

    function createAsset(address account, uint256 amount) public onlyOwner {
        require(amount > 0, "Amount must be greater than zero");
        balances[account] += amount;
    }

    function transferAsset(address recipient, uint256 amount) public returns (bool) {
        require(amount > 0, "Amount must be greater than zero");
        require(balances[msg.sender] >= amount, "Insufficient balance");

        balances[msg.sender] -= amount;
        balances[recipient] += amount;
        return true;
    }

    function destroyAsset(uint256 amount) public {
        require(amount > 0, "Amount must be greater than zero");
        require(balances[msg.sender] >= amount, "Insufficient balance");

        balances[msg.sender] -= amount;
    }
    
    function showRedeemableItems() public pure returns (string memory) {
        return "1. Item1(100 GA)  2. Item2(100 GA)  3. Item3(30 GA)  4. Item4(50 GA)";
    }

    function redeemAsset(uint256 item, uint256 quantity) public {
        require(quantity > 0, "Quantity must be greater than zero");

        if (item == 1) {
            redeemItem(quantity, 100, 0);
        } else if (item == 2) {
            redeemItem(quantity, 100, 1);
        } else if (item == 3) {
            redeemItem(quantity, 30, 2);
        } else if (item == 4) {
            redeemItem(quantity, 50, 3);
        } else {
            revert("Invalid item");
        }
    }

    function redeemItem(uint256 quantity, uint256 price, uint256 itemIndex) private {
        uint256 requiredBalance = price * quantity;
        require(balances[msg.sender] >= requiredBalance, "Insufficient balance for item redemption");

        balances[msg.sender] -= requiredBalance;
        redeemedItems[msg.sender][itemIndex] += quantity;
    }

    function checkBalance(address account) public view returns (uint256) {
        return balances[account];
    }

    function showRedeemedItems(address account) public view returns (string memory) {
        string[4] memory itemNames = ["Item1", "Item2", "Item3", "Item4"];
        string memory result = "";

        for (uint256 i = 0; i < itemNames.length; i++) {
            if (i > 0) {
                result = string(abi.encodePacked(result, "\n"));
            }
            result = string(
                abi.encodePacked(result, itemNames[i], ": ", toString(redeemedItems[account][i]), " items")
            );
        }

        return result;
    }

    function toString(uint256 value) private pure returns (string memory) {
        if (value == 0) {
            return "0";
        }

        uint256 temp = value;
        uint256 digits;

        while (temp != 0) {
            digits++;
            temp /= 10;
        }

        bytes memory buffer = new bytes(digits);

        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + value % 10));
            value /= 10;
        }

        return string(buffer);
    }
}

