// #! /usr/local/bin/node

var markdownpdf = require('markdown-pdf'),
  fs = require('fs'),
  path = require('path'),
  d3 = require('d3'),
  jsdom = require('jsdom'),
  wait = require('wait.for')


var options = {
  preProcessMd: processMarkdown,
  cssPath: 'css/style.css',
}

var input = [
  // 'Shreditor Development.md',
  path.join(__dirname, 'Shreditor Release Notes.md'),
  path.join(__dirname, 'Shreditor User Manual.md')
]

input.forEach(function (file) {
  makePdf(file)
})

function processMarkdown (md) {
  // replace all image links with absolute paths
  md = md.replace(/\]\(/g, '](' + __dirname + '/')
  return md
}

function processHtmlAsync (html, callback) {
  jsdom.env(html, replaceLinks)
  return callback(null, html)
}

function processHtml (html) {
  return wait.for(processHtmlAsync, html)
}

function makePdf (mdfile) {
  var pdffile = path.join('../build/doc', path.basename(mdfile, 'md') + 'pdf')
  console.log('md path', mdfile)
  console.log('pdf path', pdffile)

  markdownpdf(mdfile, options, function (err, pdfPath) {
    if (err) return console.error(err)
    // Move the pdf from the tmp path to where you want it
    fs.rename(pdfPath, path.join(__dirname, pdffile), function () {
      console.log('done')
    })
  })
}
