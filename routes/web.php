<?php

use Illuminate\Support\Facades\Route;
use HeadlessChromium\BrowserFactory;
use HeadlessChromium\Page;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});
Route::get('/api', function () {
   echo "hola mundo";
   $pages = [3,4,5,6];

   foreach ($pages as $k) {
    echo $k;
   $url = "https://www.getfeedback.com/s/T9fXvULb/{$k}";
   $browserFactory = new BrowserFactory('google-chrome');

   // starts headless chrome
    $browser = $browserFactory->createBrowser();

   try {
    // creates a new page and navigate to an URL
    $page = $browser->createPage();
    $page->navigate($url)->waitForNavigation();

    // get page title
    $pageTitle = $page->evaluate('document.title')->getReturnValue();

    $pageTitle2 = $page->evaluate('document.getElementById("ember906")')->getReturnValue();


    $page->addScriptTag([
        'url' => 'https://code.jquery.com/jquery-3.3.1.min.js'
    ])->waitForResponse();
    
    $pageTitle3 = $page->evaluate('$(".SummaryRatingTotal-average").html()')->getReturnValue();
    $title = $page->evaluate('$(".component-title").html()')->getReturnValue();
    $text = $title."<br>".$pageTitle3."<br>";
    print_r($text);
    // screenshot - Say "Cheese"! 😄
    // $page->screenshot()->saveToFile('/foo/bar.png');

    // pdf
    // $page->pdf(['printBackground' => false])->saveToFile('/foo/bar.pdf');
} finally {
    // bye
    $browser->close();
}
   }

});
