var fs = require('fs');
var archiver = require('archiver');

var output = fs.createWriteStream(__dirname + '/jpbochi.zip');
var archive = archiver('zip');

output.on('close', function() {
  console.log('archiver has been finalized and the output file descriptor has closed.');
});

archive.on('error', function(err) {
  throw err;
});

archive.pipe(output);

var file1 = __dirname + '/jpbochi.html';
var file2 = __dirname + '/jpbochi.pdf';

archive
  .append(fs.createReadStream(file1), { name: 'jpbochi.html' })
  .append(fs.createReadStream(file2), { name: 'jpbochi.pdf' });

archive.finalize(function(err, bytes) {
  if (err) {
    throw err;
  }

  console.log(bytes + ' total bytes');
});
