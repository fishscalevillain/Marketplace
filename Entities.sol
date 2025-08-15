// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;


abstract contract Entities {

    struct PRODUCT {
        string name;
        uint256 id;
        uint256 stocks;
        uint256 price;
    }

    mapping(uint256 => uint256) internal sales;

    struct PURCHASE {
        uint256[] productsIds;
    }

    PRODUCT[] public products;

    mapping (uint256 => address) internal productSeller;
    
    mapping (address => uint256) internal balanceByBuyer;
    mapping (address => PURCHASE) internal purchasesByBuyer;

}