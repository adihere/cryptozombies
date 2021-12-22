// SPDX-License-Identifier: GPL-3.0

pragma solidity  >=0.5.0 <0.8.12;

contract ZombieFactory {

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    function _createZombie(string memory _name, uint _dna) private {
        zombies.push(Zombie(_name, _dna));
    } 

    function _generateRandomDna(string memory _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus;
    }

    // start here
    function createRandomZombie(string memory _name) public {
        uint randDna = uint(keccak256(abi.encodePacked(_name)));
        _createZombie(_name,randDna);
    }

}
