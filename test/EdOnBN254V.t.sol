// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/EdOnBN254V.sol";

contract CounterTest is Test {
    using EdOnBN254 for *;

    function test_generatorMulOne() public {
        EdOnBN254.Affine memory g = EdOnBN254.primeSubgroupGenerator();
        EdOnBN254.Affine memory res = EdOnBN254.mul(g, 1);
        assertEq(g.x, res.x);
        assertEq(g.y, res.y);
    }

    function test_generatorMulTwo() public {
        EdOnBN254.Affine memory g = EdOnBN254.primeSubgroupGenerator();
        EdOnBN254.Affine memory res = EdOnBN254.mul(g, 2);
        assertEq(g.x, EdOnBN254.primeSubgroupGenerator().x);
        assertEq(g.y, EdOnBN254.primeSubgroupGenerator().y);
        assertEq(
            res.x,
            0x03b4d18b8801b12c784c95e319fb43588e55207574ab4bb046e484d5dab02db9
        );
        assertEq(
            res.y,
            0x1990f0c54f32b2d188cb36e43d585714b1954cce117adaa425990bcfcf4a055a
        );
    }

    function test_neg() public {
        EdOnBN254.Affine memory three = EdOnBN254.mul(
            EdOnBN254.primeSubgroupGenerator(),
            3
        );
        EdOnBN254.Affine memory negThree = EdOnBN254.neg(three);
        EdOnBN254.Affine memory res = EdOnBN254.add(three, negThree);
        assertEq(res.x, 0);
        assertEq(res.y, 1);
    }

    function test_add() public {
        EdOnBN254.Affine memory three = EdOnBN254.mul(
            EdOnBN254.primeSubgroupGenerator(),
            3
        );
        EdOnBN254.Affine memory four = EdOnBN254.mul(
            EdOnBN254.primeSubgroupGenerator(),
            4
        );
        EdOnBN254.Affine memory res = EdOnBN254.add(three, four);
        assertEq(
            res.x,
            0x0e660075a371cd2853a666aa991acc54a2a550615f5b910de2be7719293df8b5
        );
        assertEq(
            res.y,
            0x03b235debaa8b71c9f6be02e8e88d4a6002da6619abb9734835a57b0eb6c2bc5
        );
    }
}
