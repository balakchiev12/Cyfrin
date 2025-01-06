// SPDX-License-Identifier: MIT
pragma solidity 0.8.19; //  solidity versions

contract SimpleStorege {
    //favoriteNumber
    uint256 internal myFavoriteNumber;
    // uint256[] listOfFavoriteNumbers;

    struct Person {
        uint256 favoriteNumber;
        string name;
    }
    // dynamic array
    Person[] public listOfPeople; // [] emty list
    //  Person public pat = Person({favoriteNumber: 7, name: "Pat"});

    function store(uint256 _favoriteNumber) public {
        myFavoriteNumber = _favoriteNumber;
    }

    //view , pure
    function retrieve() public view returns (uint256) {
        return myFavoriteNumber;
    }
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        listOfPeople.push(Person(_favoriteNumber, _name));
    }
}
