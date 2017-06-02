<%-- 
    Document   : newjsp1
    Created on : May 28, 2017, 7:24:41 PM
    Author     : trung
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>Star rating widget example</title>
    <link rel="stylesheet" href="stylesheet.css">
  </head>
  <body>
    <p>
      See <a href="http://code.stephenmorley.org/html-and-css/star-rating-widget/">http://code.stephenmorley.org/html-and-css/star-rating-widget/</a> for more information.
    </p>
    <p>
      Rating:
      <span class="starRating">
        <input id="rating5" type="radio" name="rating" value="5">
        <label for="rating5">5</label>
        <input id="rating4" type="radio" name="rating" value="4">
        <label for="rating4">4</label>
        <input id="rating3" type="radio" name="rating" value="3" checked>
        <label for="rating3">3</label>
        <input id="rating2" type="radio" name="rating" value="2">
        <label for="rating2">2</label>
        <input id="rating1" type="radio" name="rating" value="1">
        <label for="rating1">1</label>
      </span>
    </p>
  </body>
</html>