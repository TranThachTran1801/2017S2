<%-- 
    Document   : header
    Created on : Nov 16, 2015, 1:03:05 PM
    Author     : Tuan Anh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="vi" xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <title>Online Movie Streaming</title>
        <link href="/OnlineMovieStreaming/giao-dien/style.css" type="text/css" rel="stylesheet" />

        <link rel= "shortcut icon" href="/OnlineMovieStreaming/giao-dien/favicon.png"/>
        <link rel= "icon" href="/OnlineMovieStreaming/giao-dien/favicon.png"/>

        <script src="/OnlineMovieStreaming/js/jquery-1.10.2.js" type="text/javascript"></script>
        <script src="/OnlineMovieStreaming/js/jquery-ui.js" type="text/javascript"></script>
        <link href="/OnlineMovieStreaming/css/jquery-ui.css" type="text/css" rel="stylesheet" />

        <!--        <link rel="stylesheet" href="https://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
                <script src="https://code.jquery.com/jquery-1.10.2.js" type="text/javascript"></script>
                <script src="https://code.jquery.com/ui/1.11.4/jquery-ui.js" type="text/javascript"></script>-->

        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    </head>
    <body>
        <div id="fb-root"></div>
        <script>(function (d, s, id) {
                    var js, fjs = d.getElementsByTagName(s)[0];
                            if (d.getElementById(id))
                            return;
                            js = d.createElement(s);
                            js.id = id;
                            js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.5&appId=463974190461658";
                            fjs.parentNode.insertBefore(js, fjs);
                    }(document, 'script', 'facebook-jssdk'));
                                </script>
        


        <div id="wrapper">
            <div id="header">
                <div class="headcontainer">
                    <div class="logo">
                        <a href="/OnlineMovieStreaming"><img src="/OnlineMovieStreaming/logo.png" alt="Online Movie Streaming" title="Online Movie Streaming" /></a>
                    </div>
                </div>  
                <div id="menu" class="default">    
                    <ul class="container menu" id="nav">            
                       
                        <li>
                            <div class="widget_search">
                                <form method="GET" id="form-search" action="controller">
                                    <div>
                                        <input type="text" id="autocomplete" name="keyword" placeholder="Search: Movie name, Director, Actor"/>
                                        <input type="hidden" name="action" value="search"/>
                                        <input type="submit" id="searchsubmit" value=" " name="Search"/>
                                    </div>
                                </form>
                            </div>
                        </li>             
                    </ul>    
                </div>      `
            </div>        

            <script>
                        $('#autocomplete').autocomplete({
                source: ["Dragon Blade", "Cinderella", "Divergent 2: Insurgent", "I Fine Thank You Love You", "Superman and the  Elite", "PURE LOVE", "BELIEVE ME AGAIN", "Do not Be swayed ", "Fast & Furious 7", "Dai Gia Chan Dat 2015", "Once in a Summer", "VIY", "SAVIOR TRAVELING THROUGH TIME", "EARTH'S FINAL HOURS", "DOOMSDAY PROPHECY", "SNOWMAGEDDON", "THE LIGHTNING THIEF", "INSIDE OUT", "Ricki and the Flash", "Absolutely Anything", "Are We There Yet", "Zhenitba Balzaminova", "MY TEACHER, MR. KIM", "Kill Zone", "KILL BILL: VOL 1", "Bloody Destiny", "THE KARATE KID", "ZU WARRIORS", "BUBBLEGUM", "The Blacklist Season 3", "LIMITLESS", "SUPERGIRL SEASON 1", "Running Man (2010)", "The Flash Season 2", "THE WALKING DEAD SEASON 6", "Fantastic Four: Rise of the Silver Surfer (2007)", "Scarlet Heart (2011)", "Violet & Daisy (2011)", "My Beautiful Bride (2015)", "My Tutor Friend 2", "Oh My Ghost (2015)", "Jacky Chan", "Adrien Brody", "John Cusack", "Helena Bonham", "Carter Helena", "Bonham Carter", "Stellan Skarsgart", "Cate Blanchett", "Derek Jacobi", "Nonso Anozie", "Hayley Atwell", "Yoon Hyun ,Soo Ae", "Joe Pantoliano,", "Uma Thurman", "Melina Kanakaredes", "Julian Richings", "Bonita Friedericy", "Rosario Dawson", "Catherine Keener", "Kevin McKidd", "Jung Kyung Ho", "Kim So Yeon", "Yoon Hyun ", "Kathryn Bernardo", "Daniel Padilla", "Carmina ", "Hong Eun hee", "Kim Da in", "Sunwoo Eun ", "Vin Diesel", "Paul Walker", "Dwayne Johnson", "Michelle Rodriguez", "Jordana Brewster", "Tyrese Gibson", "Chris Bridges", "Lucas Black", "Jason Statham", "Bình Trọng", "Quang Tèo", "Chiến Thắng", "Thu Huyền", "Kim Xuyến", "Byung-hun Lee", "Soo Ae", "Choi Deok Mun,", "Hoắc Kiến Hoa", "Cảnh Điềm", "Quách Phẩm Siêu", "Andrew Lincoln", "Kerry Washington", "Alicia Masters", "Dang Vi An", "Ngo Cam Nguyen", " Lam Ngoc Phan", "Ly Quoc Lap", "School Boy", "Barbie Sunday", "Park Hyeong-Sik", "Seo Jin-Gi", "Sun Poong-Gi", "Jong-Man", "Lee So-Hyeong", "Shin Soon-Ae", "Daniel Lee", "Kenneth Branagh", "Soo Ae", "John Cusack", "Daniel Padilla", "Ji Young Soo", "Cathy Garcia-Molina", "Lee Hong Goo", "James Wan", "Trần Bình Trọng", "Katherine Crockett", "Aleksandr Karpov", "Quách Phẩm Siêu", "Douglas Chapman", "Hal Myshrall", "Joe Pantoliano", "Taraji P. Henson", "Emma Pierson", "J.B. McEown", "Inna Makarova", " Jae-eung Lee", "Liêu Khải Trí", "Daryl Hannah", "Yun-su Choi", "Park Won Sang", "David Platt", "Hill Harper", "Laura Benanti", "Song Ji-hyo", "Demore Barnes", "Lennie James", "Tim Story, ", "Lưu Tùng Nhân\r\nDận Tường", "Geoffrey Fletcher ", "Kim Cheol-Kyu ", "Kim Ho-Jung ", "Yoon Je-Won"]
                });
            </script>
            <jsp:include page="/slide/demo.html" flush="true" />

            <div id="body-wrap" class="container">