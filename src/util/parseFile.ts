import fs from 'fs';


export default (day: number): Array<string> => fs.readFileSync(`src/day${day}/data.txt`, 'utf8')
  .split('\n');
