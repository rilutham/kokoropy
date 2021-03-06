% setdefault('active_page', 'example')
<!DOCTYPE html>
<html>
    <head>
        <link rel="icon" href="{{BASE_URL}}index/assets/index/favicon.ico" />
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        <link rel="stylesheet" type="text/css" href="{{ BASE_URL }}index/assets/static_libraries/bootstrap/css/bootstrap.min.css" />
        <link rel="stylesheet" type="text/css" href="{{ BASE_URL }}index/assets/static_libraries/bootstrap/css/bootstrap-theme.min.css" />
        <link rel="stylesheet" type="text/css" href="{{ BASE_URL }}example/assets/css/style.css" /> 
        <title>{{ title or 'Kokoropy' }}</title>
        <style type="text/css">
            /* Space out content a bit */
            body {
                padding-top: 20px;
                padding-bottom: 20px;
            }
            
            .jumbotron{
                padding-top: 5px;
                padding-bottom: 5px;
            }
            
            /* Everything but the jumbotron gets side spacing for mobile first views */
            .header,
            .marketing,
            .footer {
                padding-left: 15px;
                padding-right: 15px;
            }
            
            /* Custom page header */
            .header {
                border-bottom: 1px solid #e5e5e5;
            }
            /* Make the masthead heading the same height as the navigation */
            .header h3 {
                margin-top: 0;
                margin-bottom: 0;
                line-height: 40px;
                padding-bottom: 19px;
            }
            
            /* Custom page footer */
            .footer {
                padding-top: 19px;
                color: #777;
                border-top: 1px solid #e5e5e5;
            }
            
            /* Main marketing message and sign up button */
            .jumbotron {
                text-align: center;
                border-bottom: 1px solid #e5e5e5;
            }
            .jumbotron .btn {
                font-size: 21px;
                padding: 14px 24px;
            }
            
            /* Responsive: Portrait tablets and up */
            @media screen and (min-width: 768px) {
                /* Remove the padding we set earlier */
                .header,
                .footer {
                    padding-left: 0;
                    padding-right: 0;
                }
                /* Space out the masthead */
                .header {
                    margin-bottom: 30px;
                }
                /* Remove the bottom border on the jumbotron for visual effect */
                .jumbotron {
                    border-bottom: 0;
                }
            }
        </style>
    </head>
    <body>
        <div class="container" role="main">
            <div class="header">
                <ul class="nav nav-pills pull-right">
                    <li class="{{ 'active' if active_page == 'home' else '' }}"><a href="{{ BASE_URL }}"><i class="glyphicon glyphicon-home"></i> Home</a></li>
                    <li class="{{ 'active' if active_page == 'getting_started' else '' }}"><a href="{{ BASE_URL }}getting_started"><i class="glyphicon glyphicon-book"></i> Getting Started (And Master it)</a></li>
                    <li class="{{ 'active' if active_page == 'example' else '' }}"><a href="{{ BASE_URL }}example"><i class="glyphicon glyphicon-th"></i> Examples</a></li>
                </ul>
                <h3 class="text-muted">Kokoropy</h3>
            </div>
            
            <div class="jumbotron">
                <img src ="{{ BASE_URL }}index/assets/images/kokoropy.png" />
                <p class="lead">心から MVC Web Framework in Python</p>
            </div>
            
            <!-- content -->
            <div  id="layout-content">
                <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
                <!--[if lt IE 9]>
                        <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
                  <![endif]-->
                <script type="text/javascript" src="{{ BASE_URL }}index/assets/static_libraries/jquery.min.js"></script>
                <script type="text/javascript" src="{{ BASE_URL }}index/assets/static_libraries/bootstrap/js/bootstrap.min.js"></script>
                <script type="text/javascript" src="{{ BASE_URL }}example/assets/js/script.js"></script>
                % setdefault('base', 'nothing')
                {{!base}}
            </div>
            
            <!-- footer -->
            <div class="footer">
              <p>&copy; Go Frendi Gunawan 2014</p>
            </div>
        </div>
    </body>
</html>
