pragma solidity ^0.8.0;

contract SupplyChain {
    // Define variables
    address public owner;
    mapping(bytes32 => Item) public items;
    bytes32[] public itemIds;

    // Event to trigger when item is added to the supply chain
    event ItemAdded(bytes32 indexed id, string name, address manufacturer);

    // Struct to hold information about an item
    struct Item {
        string name;
        address manufacturer;
        address[] previousOwners;
    }

    // Function to add an item to the supply chain
    function addItem(string memory name, address manufacturer) public {
        // Create a unique ID for the item
        bytes32 id = keccak256(abi.encodePacked(name, manufacturer, now));

        // Create a new item and add it to the mapping
        Item storage newItem = items[id];
        newItem.name = name;
        newItem.manufacturer = manufacturer;

        // Add the item ID to the list of all item IDs
        itemIds.push(id);

        // Trigger the ItemAdded event
        emit ItemAdded(id, name, manufacturer);
    }

    // Function to transfer ownership of an item
    function transferOwnership(bytes32 id, address newOwner) public {
        // Retrieve the item from the mapping
        Item storage item = items[id];

        // Add the current owner to the previous owners array
        item.previousOwners.push(msg.sender);

        // Update the item's current owner
        item.manufacturer = newOwner;
    }

    // Function to view an item's information
    function viewItem(bytes32 id) public view returns (string memory name, address manufacturer, address[] previousOwners) {
        // Retrieve the item from the mapping
        Item storage item = items[id];

        // Return the item's information
        return (item.name, item.manufacturer, item.previousOwners);
    }

    constructor() public {
        owner = msg.sender;
    }
}
