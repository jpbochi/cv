var markdownpdf = require('markdown-pdf');

markdownpdf({
  renderDelay: 3000
}).from(
  'README.md'
).to(
  process.argv[2] || 'output.pdf', function () { console.log('pdf created'); }
);
