import { fuelRequiredForMass, fuelRequiredForRocketMass } from './day1';

test('Day1 Q1 examples', () => {
  expect(fuelRequiredForMass(12)).toBe(2);
  expect(fuelRequiredForMass(14)).toBe(2);
  expect(fuelRequiredForMass(1969)).toBe(654);
  expect(fuelRequiredForMass(100756)).toBe(33583);
});

test('Day1 Q1 input', () => {
  expect(
    rocketModules
      .split('\n')
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
      .split('\n')
      .map((moduleWeight) => Number(moduleWeight))
      .map(fuelRequiredForRocketMass)
      .reduce((acc, mass) => acc + mass, 0),
  ).toBe(5081802);
});


const rocketModules = `106985
113927
107457
106171
69124
59906
66420
149336
73783
120127
139486
108698
104091
103032
108609
136293
144735
55381
98823
103981
140684
114482
133925
111247
110833
92252
87396
79730
61395
82572
72403
140763
57088
63457
65523
50148
134758
93447
85513
132927
139159
141579
94444
56997
137128
107930
67607
108837
120206
79441
99839
137404
140502
67274
108736
97302
76561
107804
134306
52820
89632
101473
65001
57399
82858
60577
82043
144783
101606
138900
68246
118774
129919
99394
80009
107404
121503
119232
108157
117965
112025
139205
126336
143985
58894
93020
136732
100535
144090
134414
109049
105714
111654
50677
77622
53398
133851
71166
115935
94067`;
