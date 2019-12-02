import fs from 'fs';

export default (day: number): string[] => fs.readFileSync(`src/day${day}/data.txt`, 'utf8')
  .split('\n')
  .filter((line) => line !== '');
