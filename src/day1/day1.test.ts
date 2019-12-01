import { fuelRequiredForMass, fuelRequiredForRocketMass } from './day1';
import parseDaysData from '../util/parseFile';

const rocketModules = parseDaysData(1);

test('Day1 Q1 examples', () => {
  expect(fuelRequiredForMass(12)).toBe(2);
  expect(fuelRequiredForMass(14)).toBe(2);
  expect(fuelRequiredForMass(1969)).toBe(654);
  expect(fuelRequiredForMass(100756)).toBe(33583);
});

test('Day1 Q1 input', () => {
  expect(
    rocketModules
      .map((moduleWeight) => Number(moduleWeight))
      .map(fuelRequiredForMass)
      .reduce((acc, mass) => acc + mass, 0),
  ).toBe(3389778);
});

test('Day1 Q2 examples', () => {
  expect(fuelRequiredForRocketMass(12)).toBe(2);
  expect(fuelRequiredForRocketMass(14)).toBe(2);
  expect(fuelRequiredForRocketMass(1969)).toBe(966);
  expect(fuelRequiredForRocketMass(100756)).toBe(50346);
});

test('Day1 Q2 input', () => {
  expect(
    rocketModules
      .map((moduleWeight) => Number(moduleWeight))
      .map(fuelRequiredForRocketMass)
      .reduce((acc, mass) => acc + mass, 0),
  ).toBe(5081802);
});
