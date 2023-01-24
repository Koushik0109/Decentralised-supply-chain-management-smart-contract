SupplyChain Contract
This is a smart contract for a simple supply chain management system on the Ethereum blockchain. It allows for the tracking of items as they move through the supply chain, from manufacturer to end consumer.

Features
Add items to the supply chain with a unique ID, name, and manufacturer address.
Transfer ownership of items to new parties.
View information about an item, including its name, current owner, and previous owners.
Utilizes a mapping and an array to store and retrieve item information.
Emits an event when an item is added to the supply chain.
Functions
addItem(string memory name, address manufacturer) public
This function is used to add an item to the supply chain. It takes in the name of the item and the address of the manufacturer. It creates a unique ID for the item using the keccak256 hash function and the current timestamp. It then adds the item to a mapping and an array for storage and retrieval. It also emits an event indicating that an item has been added to the supply chain.

transferOwnership(bytes32 id, address newOwner) public
This function is used to transfer ownership of an item to a new party. It takes in the unique ID of the item and the address of the new owner. It retrieves the item from the mapping and adds the current owner to the previous owners array. It then updates the item's current owner.

viewItem(bytes32 id) public view returns (string memory name, address manufacturer, address[] previousOwners)
This function is used to view information about an item. It takes in the unique ID of the item and returns the item's name, current owner, and previous owners.

constructor() public
The constructor function is called when the contract is deployed. It sets the address of the contract owner to the address that deployed the contract.

Usage
To use this contract, first deploy it to the Ethereum blockchain. Then, call the addItem() function to add items to the supply chain. Use the transferOwnership() function to transfer ownership of an item to a new party. Use the viewItem() function to view information about an item.
