import parseDaysData from '../util/parseFile';
import { intCode, findIntCodeOutput, restoreMemory } from './day2';

const memory = parseDaysData(2)[0].split(',').map((x) => Number(x));

test('Day2 Q1 examples', () => {
  expect(intCode([1, 0, 0, 0, 99])).toStrictEqual([2, 0, 0, 0, 99]);
  expect(intCode([2, 3, 0, 3, 99])).toStrictEqual([2, 3, 0, 6, 99]);
  expect(intCode([2, 4, 4, 5, 99, 0])).toStrictEqual([2, 4, 4, 5, 99, 9801]);
  expect(intCode([1, 1, 1, 4, 99, 5, 6, 0, 99])).toStrictEqual([30, 1, 1, 4, 2, 5, 6, 0, 99]);
});

test('Day2 Q1 input', () => {
  const restoredMemory = restoreMemory(memory, 12, 2);
  expect(intCode(restoredMemory)[0]).toStrictEqual(4484226);
});

test('Day2 Q2 input', () => {
  expect(findIntCodeOutput(19690720, memory)).toStrictEqual([56, 96]);
});
