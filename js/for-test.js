(() => {
	const arr = Array.from({length: 10000}, () => Math.floor(Math.random() * 1000));
	let res;
	const f = (a) => a & 1 ? a : -a;
	const fx = {
		fa: () => {
			res = 0;
			arr.forEach(el => {
				res += f(el);
			});
		},
		fb: () => {
			res = arr.map(el => f(el)).reduce((t, el) => t + el);
		},
		fc: () => {
			res = 0;
			const len = arr.length;
			for (let i = 0; i < len; i++) {
				res += f(arr[i]);
			}
		},
		fd: () => {
			res = 0;
			for (let i = 0; i < arr.length; i++) {
				res += f(arr[i]);
			}
		},
		fe: () => {
			res = 0;
			for (var el of arr) {
				res += f(el);
			}
		},
		ff: () => {
			res = 0;
			for (let el of arr) {
				res += f(el);
			}
		},
		fg: () => {
			res = 0;
			for (var i in arr) {
				res += f(arr[i]);
			}
		},
		fh: () => {
			res = 0;
			for (let i in arr) {
				res += f(arr[i]);
			}
		}
	};
	const test = (name, fx) => {
		if (!(fx instanceof Function)) {
			return;
		}
		const b = new Date();
		for (let i = 0; i < 1000; i++) {
			fx();
		}
		const t = (new Date() - b);
		console.log(`${name}: ${t}μs`);
	};
	Object.entries(fx).forEach(e => test(e[0], e[1]));
})();
