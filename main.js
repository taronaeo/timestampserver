const DIR_MEDIA = "/media/stanley";

const chokidar = require("chokidar");
const watcher = chokidar.watch(DIR_MEDIA, { ignored: /^\./, persistent: true });

watcher
  .on("add", (path) => console.log(`File ${path} has been added.`))
  .on("change", (path) => console.log(`File ${path} has been changed.`))
  .on("unlink", (path) => console.log(`File ${path} has been removed.`))
  .on("error", (error) => console.error(`An error occurred ${error}`));
