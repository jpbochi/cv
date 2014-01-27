var markdownpdf = require('markdown-pdf');

markdownpdf({
  renderDelay: 2000,
  cssPath: 'http://bootswatch.com/journal/bootstrap.min.css'
}).from(
  'README.md'
).to(
  'jpbochi.pdf', function () { console.log('pdf created'); }
);
