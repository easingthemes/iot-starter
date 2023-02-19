const child_process = require('child_process').fork;
const fs = require('fs');
const path = require('path');
console.log('$CEDALO_MC_BROKER_ID', process.env.CEDALO_MC_BROKER_ID);
let PROCESS;
const command = path.join(__dirname, 'src/backend/start.js');
// 'yarn workspace @cedalo/management-center-backend run start';
try {
  PROCESS = child_process(command, {
    stdio: 'inherit',
    // shell: true,
    // env: { ANSWER: 42 },
  });
} catch (e) {
  console.log(`Process not started`, e.message);
}


if (PROCESS) {
  const PROCESS_ID = PROCESS.pid || '';
  console.log(`Process ${PROCESS_ID} started`);
  fs.writeFileSync('.pid', `${PROCESS_ID}`);
}


