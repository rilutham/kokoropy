<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="stylesheet" type="text/css" href="/static_libraries/bootstrap/css/bootstrap.min.css" />
        <style>
            div#content-container {
                margin-top: 60px; /* 60px to make the container go all the way to the bottom of the topbar */
            }
            div#layout-content {
                min-height: 250px;
                background-repeat: no-repeat;
                background-image:url('/example/images/programmer.png');
                background-position: bottom right;
            }
            body{
                color: white;
                background-color:#555;
            }
            div#layout-banner{
                background-color:#222;
                border:none;
            }
            p#content{
                font-size:20px;
            }
            div#note{
                margin-top: 20px;
                display:none;
                background:white;
                color:black;
                max-width: 70%;
                padding: 10px;
                border-radius:10px;
            }
            span.method{
                font-size:16px;
            }
        </style>
        <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
        <!--[if lt IE 9]>
          <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
        <![endif]-->
        <script type="text/javascript" src="/static_libraries/jquery.tools.min.js"></script>
        <script type="text/javascript" src="/static_libraries/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                $('#btn-toggle-note').click(function(){
                    $('div#note').toggle();
                    if($('#btn-toggle-note').val() != 'Hide Note'){
                        $('#btn-toggle-note').val('Hide Note');
                    }else{
                        $('#btn-toggle-note').val('Show Note');
                    }
                });
            });
        </script>
        <title>{{ title or 'Kokoropy' }}</title>
    </head>
    <body>
        <div class="navbar navbar-inverse navbar-fixed-top">
            <div class="navbar-inner">
                <div class="container">
                    <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <span class="icon-bar">&nbsp;</span>
                        <span class="icon-bar">&nbsp;</span>
                        <span class="icon-bar">&nbsp;</span>
                    </button>
                    <a class="brand" href="#">Kokoropy</a>
                    <div class="nav-collapse collapse">
                        <ul class="nav">
                            <li><a href="/example/simple/hello_world">Simple route</a></li>
                            <li><a href="/example/recommended/index">Recommended route</a></li>
                            <li><a href="/example/advance/">Advance route</a> </li>
                        </ul>
                    </div><!--/.nav-collapse -->
                </div>
            </div>
        </div>

        <div id="content-container" class="container">
            <div class="row-fluid">
                <div id="layout-banner" class="well hidden-phone span12">
                    <div class="span2">
                        <img src ="/images/kokoropy.png" />
                    </div>
                    <div class="span10">
                        <h1>Kokoropy</h1>
                        <p>心から Python MVC Web Framework</p>
                    </div>
                </div>
                <div id="layout-content" class="span12">
                    <p id="content"><strong>
                        %include
                    </strong></p>
                    <input id="btn-toggle-note" class="btn btn-primary" type="button" value="First timer, click this button !!!" />
                    <div id="note"><strong>Welcome to kokoropy.</strong><br />
                        This page was generated by <code>application.example.controllers.recommended</code>
                        which is located at <code>application/example/controllers/recommended.py</code>
                        (Have a look at the file, it is well commented)<br />
                        Kokoropy has 3 types of page routing approach:
                        <ul>
                            <li><strong>Simple Procedural with manual routing</strong><br />
                                Use @route decorator as in <code>application/example/controllers/simple.py</code>
                            </li>
                            <li><strong>OOP with default routing</strong> (PS: this is the recommended way)<br />
                                Use <strong>Default_Controller</strong> class as in <code>application/example/controllers/recommended.py</code>.<br />
                                The published function should has <strong>action</strong> prefix
                            </li>
                            <li><strong>OOP with manual routing</strong><br />
                                Use route function as in <code>application/example/controllers/advance.py</code>
                            </li>
                        </ul>
                    </div>
                </div><!--/#layout-content-->
            </div><!--/row-->
            <hr>
            <footer>GoFrendiAsgard &copy; 2013</footer>
        </div><!--/.fluid-container-->

    </body>
</html>