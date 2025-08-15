// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

abstract contract Errors {
    error NotEnoughRights();
    error IdBeenTaken();
    error NoMoney();
    error noProducts();
    error productIsNotExist();
    error productHasBuyers();
    error productIsOut();
}