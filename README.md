# Solidity EdOnBN254 (Baby JubJub)

Solidity implementation of a twisted Edwards curve on scalar field of BN254, also known as [Baby-Jubjub](https://github.com/barryWhiteHat/baby_jubjub).

This repo was modified from:

- Another Solidity implementation: <https://github.com/yondonfu/sol-baby-jubjub/blob/master/contracts/CurveBabyJubJub.sol>
- Arkwork Rust implementation: <https://github.com/arkworks-rs/curves/tree/master/ed_on_bn254>

## Curve Information

Base Field

$$
q = 21888242871839275222246405745257275088548364400416034343698204186575808495617
$$

Twisted edwards curve

$$
ax^2+y^2=1+dx^2y^2
$$

Where

$$
a=1, d=168696/168700\;mod\;q=9706598848417545097372247223557719406784115219466060233080913168975159366771
$$

## Usage

First, install this package as dependency.

```bash
forge install https://github.com/Tetration-Lab/solidity-ed-on-bn254
forge remappings
```

Then use it in library or smart contract.

```solidity
import {EdOnBN254} from "solidity-ed-on-bn254/EdOnBN254.sol";

contract X {
 function x() public {
  EdOnBN254.Affine g = EdOnBN254.primeSubgroupGenerator(); // Prime subgroup generator
  EdOnBN254.Affine x = EdOnBN254.mul(g, 3); // Scalar multiplication
  EdOnBN254.Affine y = EdOnBN254.add(g, x); // Affine addition
  EdOnBN254.Affine z = EdOnBN254.neg(y); // Affine negation
 }
}
```
