const { homedir } = require("os");
const {
  readFile,
  existsSync,
  readFileSync,
  writeFile,
  mkdirSync,
  readdir,
  copyFileSync,
} = require("fs");

const HOME = homedir();

function copyFunctions() {
  if (!existsSync(`${HOME}/.config/fish/functions`)) {
    mkdirSync(`${HOME}/.config/fish/functions`);
  }

  readdir("./artifacts/functions", (err, files) => {
    files.forEach((file) => {
      if (!existsSync(`${HOME}/.config/fish/functions/${file}`)) {
        console.log(`${file} copied successfully`);
        copyFileSync(
          `./artifacts/functions/${file}`,
          `${HOME}/.config/fish/functions/${file}`
        );
      }
    });
  });
}

function writeConfigFish() {
  const START_KEY = "# fresh-os-helpers START";
  const END_KEY = "# fresh-os-helpers END";
  if (existsSync(`${HOME}/.config/fish/config.fish`)) {
    const configFish = readFileSync("./artifacts/config.fish");
    readFile(`${HOME}/.config/fish/config.fish`, (err, data) => {
      if (data.includes(START_KEY) && data.includes(END_KEY)) {
        // Compare and overwrite if necessary
        const startIndex = data.indexOf(START_KEY);
        const endIndex = data.indexOf(END_KEY) + END_KEY.length;
        const compare = data.subarray(startIndex, endIndex).compare(configFish);
        if (compare !== 0) {
          const output =
            data.subarray(0, startIndex) + configFish + data.subarray(endIndex);
          writeFile(`${HOME}/.config/fish/config.fish`, output, (err) => {
            if (err) {
              console.error(err);
            } else {
              console.log("SUCCESS! OVERWRITE");
            }
          });
        } else {
          console.log("NO WRITE NECESSARY");
        }
      } else {
        data += configFish;
        writeFile(`${HOME}/.config/fish/config.fish`, data, (err) => {
          if (err) {
            console.error(err);
          } else {
            console.log("SUCCESS!");
          }
        });
      }
    });
  }
}

copyFunctions();
writeConfigFish();
