// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import "./Entities.sol";
import "./Errors.sol";

abstract contract Modifiers is Entities, Errors {
    uint256 index;

    modifier isTheSeller (uint256 _id, address _address) {
        bool isTheSeller = false; 

        if(productSeller[_id] == msg.sender) {
            isTheSeller = true;
        }
        require(isTheSeller == true, NotEnoughRights());
        _;
    }

    // @notice: getting the product index in an array.
    modifier searchProduct (uint256 _id) {
        require(products.length > 0, noProducts());
        bool searched = false;


        for (uint256 i; i < products.length; i++) {
            if(products[i].id == _id) {
                index = i;
                searched = true;
                break;
            }
        }

        require(searched == true, productIsNotExist());
        _;
    }


    // @notice: checking if the ID is taken by another seller
    modifier idNotBeenTaken (uint256 _id) {
        bool idBeenTaken = false;

        for (uint256 i; i < products.length; i++) {
            if(products[i].id == _id) {
                index = _id;
                idBeenTaken = true;
                break;
            }
        }

        require(idBeenTaken == false, IdBeenTaken());
        _;
    }

    // @notice: checking the buyer's balance before purchase
    modifier buyerHaveMoney (address _buyerAddress, uint256 _id) {
        require(products.length > 0, noProducts());
        bool searched = false;


        for (uint256 i; i < products.length; i++) {
            if(products[i].id == _id) {
                index = i;
                searched = true;
                break;
            }
        }

        require(searched == true, productIsNotExist());
        require(balanceByBuyer[msg.sender] >= products[index].price, NoMoney());
        _;       
    }

    modifier deletionIsPossible(uint256 _id) {
        require(sales[_id] == 0, productHasBuyers());
        _;
    }

    modifier productIsNotOut (uint256 _id) {
        require(products[index].stocks > 0, productIsOut());
        _;
    }
}