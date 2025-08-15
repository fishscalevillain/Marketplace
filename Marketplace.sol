// SPDX-License-Identifier: MIT
pragma solidity ^0.8.30;

import "./Entities.sol";
import "./Modifiers.sol";

contract Marketplace is Entities, Modifiers {
    // @title: function for buyer

    // @notice: top up balance
    function topUpBalance() public payable {
        balanceByBuyer[msg.sender] = msg.value;
    }

    // @notice: buy product by id
    function buyProduct(uint256 _id) public buyerHaveMoney(msg.sender, _id) productIsNotOut(_id) {
        balanceByBuyer[msg.sender] -= products[index].price;
        products[index].stocks -= 1;

        purchasesByBuyer[msg.sender].productsIds.push(_id);

        sales[_id] += 1;
        address payable _toSeller = payable(productSeller[_id]);
        _toSeller.transfer(products[index].price - (products[index].price / 20));
    }

    // @notice: getting buyer's products
    function getProduct() public view returns(uint256[] memory) {
        return purchasesByBuyer[msg.sender].productsIds;
    }

    // @title: function for seller

    // @notice: upload product on service
    function uploadProduct(string calldata _name, uint256 _id, uint256 _stocks, uint256 _price) public payable idNotBeenTaken(_id) {
        require(msg.value == 1 ether);
        products.push(PRODUCT(_name, _id, _stocks, _price));

        productSeller[_id] = msg.sender;
    }

    // @notice: editing the card by its id
    function editCard(string calldata _name, uint256 _id, uint256 _stocks, uint256 _price) public isTheSeller(_id, msg.sender) searchProduct(_id) {
        products[index] = products[products.length - 1];
        products.pop();

        products.push(PRODUCT(_name, _id, _stocks, _price));
    }

    function deletingCard(uint256 _id) isTheSeller(_id, msg.sender) public searchProduct(_id) deletionIsPossible(_id) {
        products[index] = products[products.length - 1];
        products.pop();

        sales[_id] = 0;
    }

}