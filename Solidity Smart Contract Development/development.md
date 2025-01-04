# Advanced Solidity Smart Contract Development
* 🌎 **`public`**: accessible from both inside the contract and from external contracts
* 🏠 **`private`**: accessible only within the _current contract_. It does not hide a value but only restricts its access.
* 🌲 **`external`**: used only for _functions_. Visible only from _outside_ the contract.
* 🏠🏠 **`internal`**: accessible by the current contract and any contracts _derived_ from it.

> 🚧 **WARNING**:
> While calling `view` or `pure` functions doesn’t typically require gas, they do require it when called by another function that modifies the state or storage through a transaction (e.g. calling the function `retrieve` inside the function `storage`). This cost is called **execution cost** and it will add up to the transaction cost.