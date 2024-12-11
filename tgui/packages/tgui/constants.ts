/**
 * @file
 * @copyright 2020 Aleksej Komarov
 * @license MIT
 */

type Gas = {
  id: string;
  path: string;
  name: string;
  label: string;
  color: string;
};

// UI states, which are mirrored from the BYOND code.
export const UI_INTERACTIVE = 2;
export const UI_UPDATE = 1;
export const UI_DISABLED = 0;
export const UI_CLOSE = -1;

// All game related colors are stored here
export const COLORS = {
  // Department colors
  department: {
    captain: '#c06616',
    security: '#e74c3c',
    medbay: '#3498db',
    science: '#9b59b6',
    engineering: '#f1c40f',
    cargo: '#f39c12',
    service: '#7cc46a',
    centcom: '#00c100',
    other: '#c38312',
  },
  // Damage type colors
  damageType: {
    oxy: '#3498db',
    toxin: '#2ecc71',
    burn: '#e67e22',
    brute: '#e74c3c',
  },
  // reagent / chemistry related colours
  reagent: {
    acidicbuffer: '#fbc314',
    basicbuffer: '#3853a4',
  },
} as const;

// Colors defined in CSS
export const CSS_COLORS = [
  'average',
  'bad',
  'black',
  'blue',
  'brown',
  'good',
  'green',
  'grey',
  'label',
  'olive',
  'orange',
  'pink',
  'purple',
  'red',
  'teal',
  'transparent',
  'violet',
  'white',
  'yellow',
] as const;

export type CssColor = (typeof CSS_COLORS)[number];

/* IF YOU CHANGE THIS KEEP IT IN SYNC WITH CHAT CSS */
export const RADIO_CHANNELS = [
  {
    name: 'Syndicate',
    freq: 1213,
    color: '#8f4a4b',
  },
  {
    name: 'Red Team',
    freq: 1215,
    color: '#ff4444',
  },
  {
    name: 'Blue Team',
    freq: 1217,
    color: '#3434fd',
  },
  {
    name: 'Green Team',
    freq: 1219,
    color: '#34fd34',
  },
  {
    name: 'Yellow Team',
    freq: 1221,
    color: '#fdfd34',
  },
  {
    name: 'CentCom',
    freq: 1337,
    color: '#2681a5',
  },
  {
    name: 'Supply',
    freq: 1347,
    color: '#b88646',
  },
  {
    name: 'Service',
    freq: 1349,
    color: '#6ca729',
  },
  {
    name: 'Science',
    freq: 1351,
    color: '#c68cfa',
  },
  {
    name: 'Command',
    freq: 1353,
    color: '#fcdf03',
  },
  {
    name: 'Medical',
    freq: 1355,
    color: '#57b8f0',
  },
  {
    name: 'Engineering',
    freq: 1357,
    color: '#f37746',
  },
  {
    name: 'Security',
    freq: 1359,
    color: '#dd3535',
  },
  {
    name: 'AI Private',
    freq: 1447,
    color: '#d65d95',
  },
  {
    name: 'Common',
    freq: 1459,
    color: '#1ecc43',
  },
  // fallout channels
  {
    name: 'Vault',
    freq: 1361,
    color: '#6eaa2c',
  },
  {
    name: 'NCR',
    freq: 1363,
    color: '#eaaa54',
  },
  {
    name: 'BoS',
    freq: 1365,
    color: '#686868',
  },
  {
    name: 'Enclave',
    freq: 1367,
    color: '#67696b',
  },
  {
    name: 'Legion',
    freq: 1371,
    color: '#c24d44',
  },
  {
    name: 'Den',
    freq: 1375,
    color: '#a8732b',
  },
  {
    name: 'Town',
    freq: 1369,
    color: '#a30000',
  },
  {
    name: 'Ranger',
    freq: 1373,
    color: '#83733c',
  },
  {
    name: 'Khans',
    freq: 1376,
    color: '#f0420d',
  },
  {
    name: 'LDS New Canaanites',
    freq: 1377,
    color: '#D4AF37',
  },
  {
    name: 'Post office',
    freq: 1379,
    color: '#004B87',
  },
  {
    name: 'Eighties',
    freq: 1381,
    color: '#1858D9',
  },
  {
    name: 'Blue',
    freq: 1383,
    color: '#0000FF',
  },
  {
    name: 'Red',
    freq: 1385,
    color: '#FF0000',
  },
  {
    name: 'WND',
    freq: 1387,
    color: '#a280ba',
  },
  {
    name: 'Montego Bay',
    freq: 1389,
    color: '#008000',
  },
  {
    name: 'Salvatores',
    freq: 1391,
    color: '#FF99CC',
  },
  {
    name: 'Mordinos',
    freq: 1395,
    color: '#FF7566',
  },
  {
    name: 'Hotel',
    freq: 1399,
    color: '#F7EFCF',
  },
  {
    name: 'Bishops',
    freq: 1401,
    color: '#8CA2BD',
  },
  {
    name: 'Wrights',
    freq: 1403,
    color: '#B3875E',
  },
  {
    name: 'Vangraffs',
    freq: 1405,
    color: '#4da34e',
  },
  {
    name: 'NCR Patrol',
    freq: 1407,
    color: '#606896',
  },
  {
    name: 'NCR CF',
    freq: 1409,
    color: '#d9b884',
  },
  {
    name: 'Government',
    freq: 1311,
    color: '#7b5fb3',
  },
] as const;

const GASES = [
  {
    id: 'o2',
    name: 'Oxygen',
    label: 'O₂',
    color: 'blue',
  },
  {
    id: 'n2',
    name: 'Nitrogen',
    label: 'N₂',
    color: 'red',
  },
  {
    id: 'co2',
    name: 'Carbon Dioxide',
    label: 'CO₂',
    color: 'grey',
  },
  {
    id: 'plasma',
    name: 'Plasma',
    label: 'Plasma',
    color: 'pink',
  },
  {
    id: 'water_vapor',
    name: 'Water Vapor',
    label: 'H₂O',
    color: 'grey',
  },
  {
    id: 'nob',
    name: 'Hyper-noblium',
    label: 'Hyper-nob',
    color: 'teal',
  },
  {
    id: 'n2o',
    name: 'Nitrous Oxide',
    label: 'N₂O',
    color: 'red',
  },
  {
    id: 'no2',
    name: 'Nitryl',
    label: 'NO₂',
    color: 'brown',
  },
  {
    id: 'tritium',
    name: 'Tritium',
    label: 'Tritium',
    color: 'green',
  },
  {
    id: 'bz',
    name: 'BZ',
    label: 'BZ',
    color: 'purple',
  },
  {
    id: 'stim',
    name: 'Stimulum',
    label: 'Stimulum',
    color: 'purple',
  },
  {
    id: 'pluox',
    name: 'Pluoxium',
    label: 'Pluoxium',
    color: 'blue',
  },
  {
    id: 'miasma',
    name: 'Miasma',
    label: 'Miasma',
    color: 'olive',
  },
  {
    id: 'hydrogen',
    name: 'Hydrogen',
    label: 'H₂',
    color: 'white',
  },
];

export const getGasLabel = (gasId, fallbackValue) => {
  const gasSearchString = String(gasId).toLowerCase();
  const gas = GASES.find(
    (gas) =>
      gas.id === gasSearchString || gas.name.toLowerCase() === gasSearchString,
  );
  return (gas && gas.label) || fallbackValue || gasId;
};

export const getGasColor = (gasId) => {
  const gasSearchString = String(gasId).toLowerCase();
  const gas = GASES.find(
    (gas) =>
      gas.id === gasSearchString || gas.name.toLowerCase() === gasSearchString,
  );
  return gas && gas.color;
};
