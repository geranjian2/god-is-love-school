const defaultTheme = require('tailwindcss/defaultTheme');

/** @type {import('tailwindcss').Config} */
module.exports = {
    content: [
        './vendor/laravel/framework/src/Illuminate/Pagination/resources/views/*.blade.php',
        './storage/framework/views/*.php',
        './resources/views/**/*.blade.php',
        './resources/js/components/**/*.vue',
    ],

    theme: {
        extend: {
            fontFamily: {
                backgroundImage: defaultTheme => ({
                    //'pierres-larimar': "url('/img/pierres-larimar.jpg')",
                    
                }),
                colors: {
                    //'nav': '#2194b0',
                    'lprim': '#ecb48c',
                    'prim': '#dfa984',
                    'dprim': '#c99877',
                    //'lsec': '#e27a5f',
                    //'sec': '#e76f51',
                    //'input-border': '#6b7280',
                },
                sans: ['Nunito', ...defaultTheme.fontFamily.sans],
            },
        },
    },

    plugins: [require('@tailwindcss/forms')],
};