const mix = require("laravel-mix");
const path = require('path');

mix.ts("resources/js/app.ts", "public/js")
.vue({ version: 3 })
.postCss("resources/css/app.css", "public/css", [
    require("tailwindcss"),
   ])


// module.exports = {
//     resolve: {
//         alias: {
//             '@': path.resolve('resources/js'),
//         },
//     },
// };