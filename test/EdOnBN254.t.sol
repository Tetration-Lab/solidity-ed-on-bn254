// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/EdOnBN254.sol";

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
            0x1812B84C2101217B0939A2F542535075EEAA81D07DAB701A899A55DB26E85BE4
        );
        assertEq(
            res.y,
            0x0BE80D0F61A801533A94A03B12683474F86CA012941DB1C568C53DC877B16FD6
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
            0x02FADFA939E66A37BF790E3ACCAC910B9C2FDE645F78017CEBB4051B0E203E18
        );
        assertEq(
            res.y,
            0x02291D744B6FD0656083A186955D4494C38AA5E9A261B0A94B1DDA4B7BE79533
        );
    }
}
