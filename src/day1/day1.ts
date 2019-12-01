export const fuelRequiredForMass = (mass: number): number => Math.floor(mass / 3) - 2;

export const fuelRequiredForRocketMass = (mass: number): number => {
  const currentMassFuelWeight = fuelRequiredForMass(mass);
  if (currentMassFuelWeight < 0) {
    return 0;
  }
  return currentMassFuelWeight + fuelRequiredForRocketMass(currentMassFuelWeight);
};
