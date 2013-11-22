// #! /usr/local/bin/node

// preProcessHtml



var markdownpdf = require("markdown-pdf")
  , fs = require("fs")
  , path = require('path')
  , d3 = require('d3')
  , jsdom = require('jsdom')
  , wait = require('wait.for')
  ;


var options = {
	preProcessMd : processMarkdown,
	// preProcessHtml : processHtml
    cssPath: 'css/style.css',
//    paperBorder: '0px'
};

var input = [
	// 'Shreditor Development.md',
	path.join(__dirname, 'Shreditor Release Notes.md'),
    path.join(__dirname, 'Shreditor User Manual.md')
];


input.forEach(function(file){
	makePdf(file);
});

function processMarkdown(md){
    // replace all image links with absolute paths
	md = md.replace(/\]\(/g, ']('+__dirname+'/');
//	console.log("____MARKDOWN___\n", md);
	return md;
}

function processHtmlAsync(html, callback){
	jsdom.env(html, replaceLinks);

	function replaceLinks(){

	}

	return callback(null, html);
}

function processHtml(html){

	// step(
	// 	function(){
			// pass the html stub to jsDom
	var result = wait.for(processHtmlAsync, html);

	// function dostuff(err, data){
	// 	if(err) console.error(err.message);

	// 	console.log("dostuff data", data);
	// }
	// console.log(html);
	return result;
}


function makePdf(mdfile){
    var pdffile = path.join('../build/doc', path.basename(mdfile, 'md')+'pdf');
	console.log("md path", mdfile);
    console.log("pdf path", pdffile);
    
	markdownpdf(mdfile, options, function (err, pdfPath) {
	  if (err) return console.error(err);
	  // Move the pdf from the tmp path to where you want it
	  fs.rename(pdfPath, path.join(__dirname, pdffile), function() {
	    console.log("done");
	  });
	});
}