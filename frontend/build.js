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
fs.copyFileSync('styles.css', path.join('dist', 'styles.css'));
fs.copyFileSync('app.js', path.join('dist', 'app.js'));

console.log('✅ index.html generated with injected config!');