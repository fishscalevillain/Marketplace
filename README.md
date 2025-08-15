# Marketplace

## 🇷🇺 Русский

### Описание проекта
Этот репозиторий содержит смарт-контракты для простого маркетплейса на блокчейне Ethereum. Контракты написаны на языке Solidity и включают в себя основные функции для покупателей и продавцов.

### Структура проекта
- **Marketplace.sol**: Основной контракт, реализующий логику маркетплейса.
- **Entities.sol**: Абстрактный контракт с описанием структур данных.
- **Modifiers.sol**: Абстрактный контракт с модификаторами для проверки условий.
- **Errors.sol**: Абстрактный контракт с описанием ошибок.

### Основные функции
- **Для покупателей**:
  - Пополнение баланса (`topUpBalance`).
  - Покупка товара по ID (`buyProduct`).
  - Получение списка купленных товаров (`getProduct`).

- **Для продавцов**:
  - Загрузка товара на платформу (`uploadProduct`).
  - Редактирование информации о товаре (`editCard`).
  - Удаление товара (`deletingCard`).

-------------------------------------------------------------------------------------------------------------------------------------------------------------

## 🇬🇧 English

### Project Description
This repository contains smart contracts for a simple Ethereum-based marketplace. The contracts are written in Solidity and include core functionalities for both buyers and sellers.

### Project Structure
- **Marketplace.sol**: Main contract implementing marketplace logic.
- **Entities.sol**: Abstract contract with data structures.
- **Modifiers.sol**: Abstract contract with modifiers for condition checks.
- **Errors.sol**: Abstract contract with error definitions.

### Key Features
- **For Buyers**:
  - Top up balance (`topUpBalance`).
  - Buy a product by ID (`buyProduct`).
  - Get a list of purchased products (`getProduct`).

- **For Sellers**:
  - Upload a product to the platform (`uploadProduct`).
  - Edit product information (`editCard`).
  - Delete a product (`deletingCard`).
