const exec = require('child_process').execSync;
const fs = require('fs');

let PROCESS_ID;
try {
  PROCESS_ID = fs.readFileSync('.pid');
} catch (e) {}

if (PROCESS_ID) {
  try {
    exec(`kill -9 ${PROCESS_ID}`);
    console.log(`Process ${PROCESS_ID} stopped`);
  } catch (e) {
    console.log(`Process ${PROCESS_ID} could not be stopped`);
    console.log(e.message);
  }
} else {
  console.log(`Process does not exists`);
}
