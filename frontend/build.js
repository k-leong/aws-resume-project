const fs = require('fs');
const path = require('path');

// read config file
const config = JSON.parse(fs.readFileSync('config.json', 'utf-8'));

let html = fs.readFileSync('index.html', 'utf-8');

// replace placeholders in index.html with values from config.json
html = html.replace(/{{(.*?)}}/g, (_, key) => config[key.trim()] || '');

// write html and css into dist folder
fs.mkdirSync('dist', { recursive: true });
fs.writeFileSync('dist/index.html', html);
fs.copyFileSync('style.css', path.join('dist', 'style.css'));

console.log('✅ index.html generated with injected config!');