use rayon::prelude::*;
use std::collections::HashSet;

pub fn find(sum: u32) -> HashSet<[u32; 3]> {
    let max = sum / 3;
    (1..max)
        .into_par_iter()
        .map(|a| {
            let a2 = a.pow(2);
            // a2 + b.pow(2) == c.pow(2)
            // a2 == c.pow(2) - b.pow(2)
            // a2 == (c - b) * (c + b)
            // ...
            // a + b + c == sum
            // b + c == sum - a
            // ...
            // a2 == (c - b) * (sum - a)
            let sma = sum - a;
            // a2 == (c - b) * sma
            // c - b == a2 / sma
            if a2 < sma || a2 % sma != 0 {
                return [0, 0, 0];
            }
            // dif == c - b
            let dif = a2 / sma;
            // a + b + c == sum
            // ...
            // c == b + dif
            // ...
            // a + b + b + dif == sum
            // 2 * b == sum - a - dif
            // b == (sum - a - dif) / 2;
            let b = (sma - dif) / 2;
            // a < b < c
            if a >= b {
                return [0, 0, 0];
            }
            let c = b + dif;
            if sum == a + b + c {
                return [a, b, c];
            }
            [0, 0, 0]
        })
        .filter(|el| el[0] != 0)
        .collect::<HashSet<[u32; 3]>>()
}
