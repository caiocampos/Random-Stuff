use std::collections::HashSet;

pub fn find(sum: u32) -> HashSet<[u32; 3]> {
    let max = sum / 3;
    let mut res: HashSet<[u32; 3]> = HashSet::new();
    for a in 1..max {
        let a2 = a.pow(2);
        let sma = sum - a;
        if a2 < sma || a2 % sma != 0 {
            continue;
        }
        let dif = a2 / sma;
        //let b = (sum - dif - a) / 2;
        let b = (sma - dif) / 2;
        if a >= b {
            continue;
        }
        let c = b + dif;
        // a2 + b.pow(2) == c.pow(2)
        // a2 == c.pow(2) - b.pow(2)
        // a2 == dif.pow(2) + 2 * b * dif
        if a2 + b.pow(2) == c.pow(2) {
            res.insert([a, b, c]);
        }
    }
    res
}
