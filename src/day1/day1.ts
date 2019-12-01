export default (): void => {};

export const fuelRequiredForMass = (mass: number): number => Math.floor(mass / 3) - 2;

export const fuelRequiredForRocketMass = (mass: number): number => {
  let fuelNeeded = fuelRequiredForMass(mass);
  let fuelForFuel = fuelRequiredForMass(fuelNeeded);
  while (fuelForFuel > 0) {
    fuelNeeded += fuelForFuel;
    fuelForFuel = fuelRequiredForMass(fuelForFuel);
  }
  return fuelNeeded;
};
