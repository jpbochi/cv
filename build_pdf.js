var markdownpdf = require('markdown-pdf');

markdownpdf({
  renderDelay: 3000,
  cssPath: 'http://bootswatch.com/journal/bootstrap.min.css'
}).from(
  'README.md'
).to(
  process.argv[2] || 'output.pdf', function () { console.log('pdf created'); }
);
