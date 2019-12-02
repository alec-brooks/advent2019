
interface Operations { [key: number]: (a: number, b: number) => number }

const operations: Operations = {
  1: (a: number, b: number): number => a + b,
  2: (a: number, b: number): number => a * b,
};

const exitInt = 99;

const operationIndex = 0;
const firstParameterIndex = 1;
const secondParameterIndex = 2;
const outputParameterIndex = 3;
const instructionSize = 4;

export const intCode = (memory: number[], instructionPointer = operationIndex): number[] => {
  const operationValue = memory[instructionPointer + operationIndex];
  if (operationValue === exitInt) {
    return memory;
  }
  const op = operations[operationValue];
  const newMemory = [...memory];
  newMemory[memory[instructionPointer + outputParameterIndex]] = op(
    memory[memory[instructionPointer + firstParameterIndex]],
    memory[memory[instructionPointer + secondParameterIndex]],
  );
  return intCode(newMemory, instructionPointer + instructionSize);
};

export const restoreMemory = (memory: number[], noun: number, verb: number): number[] => {
  const restoredMemory = [...memory];
  restoredMemory[1] = noun;
  restoredMemory[2] = verb;
  return restoredMemory;
};

export const findIntCodeOutput = (output: number, memory: number[]): [number, number] => {
  for (let i = 0; i < 99; i += 1) {
    for (let j = 0; j < 99; j += 1) {
      const result = intCode(restoreMemory(memory, i, j))[0];
      if (result === output) {
        return [i, j];
      }
    }
  }
  return [0, 0];
};
