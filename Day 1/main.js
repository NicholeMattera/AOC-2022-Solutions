const fs = require('fs/promises');

(async () => {
    const content = (await fs.readFile('./input', { encoding: 'ascii', flag: 'r' })).split('\n');
    const totals = content.reduce((totals, amount, index) => {
        if (index === content.length - 1) return totals;

        if (amount === '') {
            totals.push(0);
        } else {
            totals[totals.length - 1] += parseInt(amount);
        }

        return totals;
    }, [0]).sort((a, b) => b - a);

    console.log('Solution 1: ', totals[0]);
    console.log('Solution 2: ', totals[0] + totals[1] + totals[2]);
})();
