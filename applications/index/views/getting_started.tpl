%rebase('index/views/base.tpl', title='kokoropy | getting started')
<style type="text/css">
    .language-python, .language-html{
        width:100%;
    }
    .ace_editor{
        font-size: 14px;
        margin-top: 10px;
        margin-bottom: 10px;
    }
    #layout-content h1{
        margin-top:60px;
        padding-bottom: 20px;
        border-bottom: 1px solid #e5e5e5;
    }
    #layout-content h2{
        margin-top:40px;
    }
    .affix{
        top:20px;
    }
    .bs-sidenav li.active>a, .bs-sidenav li.active:hover>a, .bs-sidenav li.active:focus>a {
        padding-left: 18px;
        font-weight: 700;
        color: #563d7c;
        background-color: transparent;
        border-right: 2px solid #563d7c;
    }
    .bs-sidenav ul{
        padding-left:10px;
        font-size:small;
    }

    /* toggle sub-child based on active status */
    .bs-sidenav li>ul{
        display:none;
    }
    .bs-sidenav li.active>ul{
        display:block;
    }

    /* adjust navbar size */
    @media (min-width: 1200px){
        div.affix {
            width: 263px;
        }
    }
    @media (min-width: 992px){
        div.affix {
            width: 213px;
        }
    }

</style>
<script type="text/javascript" src="{{ BASE_URL }}index/assets/static_libraries/jquery-ace/ace/ace.js"></script>
<script type="text/javascript" src="{{ BASE_URL }}index/assets/static_libraries/jquery-ace/ace/theme-twilight.js"></script>
<script type="text/javascript" src="{{ BASE_URL }}index/assets/static_libraries/jquery-ace/ace/mode-python.js"></script>
<script type="text/javascript" src="{{ BASE_URL }}index/assets/static_libraries/jquery-ace/ace/mode-html.js"></script>
<script type="text/javascript" src="{{ BASE_URL }}index/assets/static_libraries/jquery-ace/jquery-ace.min.js"></script>
<script type="text/javascript" src="{{ BASE_URL }}index/assets/static_libraries/autosize/jquery.autosize.min.js"></script>
<script type="text/javascript">
    ! function ($) {
        $(function () {
            var $window = $(window);
            var $body = $(document.body);
            var $sideBar = $('.bs-sidebar');
            var navHeight = $('.navbar').outerHeight(true) + 10;

            $body.scrollspy({
                target: '.bs-sidebar',
                offset: navHeight
            });

            $('.bs-docs-container [href=#]').click(function (e) {
                e.preventDefault();
            });

            $window.on('resize', function () {
                $body.scrollspy('refresh');
                // We were resized. Check the position of the nav box
                $sideBar.affix('checkPosition');
            });

            $window.on('load', function () {
                $body.scrollspy('refresh');
                $('.bs-top').affix();
                $sideBar.affix({
                    offset: {
                        top: function () {
                            var offsetTop = $sideBar.offset().top;
                            var sideBarMargin = parseInt($sideBar.children(0).css('margin-top'), 10);
                            var navOuterHeight = $('.bs-docs-nav').height();

                            // We can cache the height of the header (hence the this.top=)
                            // This function will never be called again.
                            return (this.top = offsetTop - navOuterHeight - sideBarMargin);
                        },
                        bottom: function () {
                            // We can't cache the height of the footer, since it could change
                            // when the window is resized. This function will be called every
                            // time the window is scrolled or resized
                            return $('.bs-footer').outerHeight(true);
                        }
                    }
                });
                setTimeout(function () {
                    // Check the position of the nav box ASAP
                    $sideBar.affix('checkPosition');
                }, 10);
                setTimeout(function () {
                    // Check it again after a while (required for IE)
                    $sideBar.affix('checkPosition');
                }, 100);
            });

            // tooltip demo
            $('.tooltip-demo').tooltip({
                selector: "[data-toggle=tooltip]",
                container: "body"
            });

            $('.tooltip-test').tooltip();
            $('.popover-test').popover();

            $('.bs-docs-navbar').tooltip({
                selector: "a[data-toggle=tooltip]",
                container: ".bs-docs-navbar .nav"
            });
        });
    }(window.jQuery);

    $(document).ready(function(){
        $('textarea, pre').each(function(){
            var html = $(this).html();
            // ommit the first line's preceeding spaces
            html = html.replace('        ','');
            // ommit every other line's preceeding spaces
            html = html.replace(/\n        /gi, '\n');
            $(this).html(html);
        });
        // make textarea autosize
        $('textarea').autosize();
        // change into ace
        $('.language-python').ace({
            theme: 'twilight',
            lang: 'python',
        });
        $('.language-html').ace({
            theme: 'twilight',
            lang: 'html',
        });
        // make them readOnly
        $('.language-python, .language-html').each(function(){
            $(this).data('ace').editor.ace.setReadOnly(true);
        });
    });
</script>
<div class="col-md-3">
    <div class="bs-sidebar hidden-print affix-top" role="complementary">
        <ul class="nav bs-sidenav">
            <li><a href="#setting">Setting</a>
                <ul class="nav">
                    <li><a href="#installation">Installation</a>
                        <ul class="nav">
                            <li><a href="#optional_steps">Optional Steps</a></li>
                            <li><a href="#mandatory_steps">Mandatory Steps</a></li>
                        </ul>
                    </li>
                    <li><a href="#kokoropy_directory_structure">Directory Structure</a></li>
                    <li><a href="#configuration">Configuration</a></li>
                </ul>
            </li>
            <li><a href="#coding">Coding</a>
                <ul class="nav">
                    <li><a href="#simple_hello_world">Simple Hello World</a></li>
                    <li><a href="#mvc_and_automatic_routing">MVC &amp; Automatic Routing</a>
                        <ul class="nav">
                            <li><a href="#model">Model</a></li>
                            <li><a href="#controller">Controller</a></li>
                            <li><a href="#view">View</a></li>
                        </ul>
                    </li>
                    <li><a href="#manual_routing">Manual Routing</a></li>
                    <li><a href="#more">More ...</a>
                        <ul class="nav">
                            <li><a href="#request">Post, Get, Cookie, and Session</a></li>
                            <li><a href="#custom_hook_and_error">Custom Hook and Error</a></li>
                            <li><a href="#use_matplotlib">Use Matplotlib</a></li>
                        </ul>
                    </li>
                </ul>
            </li>
            <li><a href="#deployment">Deployment</a>
                <ul class="nav">
                    <li><a href="#apache">Apache</a></li>
                    <li><a href="#heroku">Heroku</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <!-- end bs-sidebar -->
</div>
<div class="col-md-9">
    <h1 id="setting">Setting</h1>
    <h2 id="installation">Installation</h2>

    <p>
        Kokoropy is a python web framework.
        Therefore you need to have python (recommended python 2.7) installed in your computer.
    </p>

    <p>
        Linux &amp; MacOS user does not need to worry anything since those OS have python pre-installed by default.
        Windows user should download and install python. Personally, I suggest you to use <a href="https://www.enthought.com/products/canopy/">Enthought Canopy Distribution</a>
        since it already has some libraries such as numpy &amp; matplotlib.<br />
        If you are using debian-based linux (such as ubuntu)
    </p>
    <h3 id="optional_steps">Optional steps</h3>
    <p>
        Kokoropy built with scientific purpose on mind. Some examples are depended on already famous libraries, such as numpy, scikit-learn, and matplotlib. To install those libraries, you can do:
    </p>
    <pre>
        pip install numpy
        pip install matplotlib
        pip install sklearn
    </pre>
    <p>
        If you are using python 3, you will need to install `python3-beaker` package
    </p>
    <pre>
        pip install beaker
    </pre>
    <h3 id="mandatory_steps">Mandatory steps</h3>
    <p>
        Download kokoropy from github repository <a href="https://github.com/goFrendiAsgard/kokoropy">here</a>, or clone it by using git
    </p>
    <pre>
        git clone git@github.com:goFrendiAsgard/kokoropy.git
    </pre>

    <p>
        After All prerequisites met, you can just start kokoropy by using this command:
    </p>
    <pre>
        cd path/to/kokoropy
        python start.py
    </pre>

    <p>
        Now, open up your browser, and type
    </p>
    <pre>http://localhost:8080</pre>
    <p>
        in the address bar
    </p>

    <h2 id="kokoropy_directory_structure">Kokoropy's Directory Structure</h2>
    <p class="alert alert-info"><b>Don't worry</b> This is just informational, you don't have to do anything</p>
    <p>
        Just like every MVC framework, kokoropy has a typical directory structure.
        At the development stage, you only need to pay attention to <strong>/applications</strong> directory (this is where your applications laid)
        and <strong>start.py</strong> file (this is where you put your configuration)
    </p>
    <pre>
        kokoropy
            |--- /applications                THIS IS WHERE YOUR APPLICATIONS LAID
            |       |--- __init__.py          * application's bootstrap
            |       |
            |       |--- /example             * example application
            |       |       |--- __init__.py  * application's __init__.py
            |       |       |--- /assets      * application's static files
            |       |       |--- /models      * application's models
            |       |       |--- /controllers * application's controllers
            |       |       |--- /views       * application's views
            |       |       |--- routes.py    * application's routes
            |       |
            |       |--- /index               * index application
            |       |       |--- __init__.py  * application's __init__.py
            |       |       |--- /assets      * application's static files
            |       |       |--- /models      * application's models
            |       |       |--- /controllers * application's controllers
            |       |       |--- /views       * application's views
            |       |       |--- routes.py    * application's routes
            |       |
            |       |--- /[your_application]  * your application
            |       |       |--- __init__.py  * application's __init__.py
            |       |       |--- /assets      * application's static files
            |       |       |--- /models      * application's models
            |       |       |--- /controllers * application's controllers
            |       |       |--- /views       * application's views
            |       |       |--- routes.py    * application's routes
            |
            |--- /kokoropy                    THIS IS WHERE KOKOROPY'S CORE LAID
            |       |--- __init__.py          * __init__.py
            |       |--- /beaker              * beaker package
            |       |--- /sqlalchemy          * sqlalchemy package
            |       |--- bottle.py            * bottle module
            |       |--- kokoro.py            * kokoropy's main program
            |
            |--- /db                          DATABASE EXAMPLE
            |
            |--- README.md                    DOCUMENTATION & TUTORIAL
            |
            |                                 DEVELOPMENT & DEBUGGING
            |--- start.py                     * script to run bootstrapper.py
            |--- bootstrapper.py              * bootstrapper
            |
            |                                 APACHE DEPLOYMENT FILES
            |--- kokoro.wsgi                  * bootstrapper for apache
            |--- kokoro.apache_conf           * configuration example
            |
            |                                 HEROKU DEPLOYMENT FILES
            |--- heroku.sh                    * heroku command example
            |--- heroku_app.py                * bootstrapper for heroku
            |--- Procfile                     * heroku specific file
            |--- runtime.txt                  * heroku specific file
            |--- requirements.txt             * heroku specific file
    </pre>
    <p>
        In kokoropy, every application should contains <strong>__init__.py</strong> file.
    </p>
    <p>
        The same rule is also applied to application's <b>models</b> and <b>controllers</b> directory.
        You should also put an <b>__init__.py</b> inside each of them.
    </p>

    <h2 id="configuration">Configuration</h2>
    <p class="alert alert-info"><b>Don't worry</b> You will only need to fiddle up with configuration if port 8080 is already used by other application. Otherwise, you can skip this part safely</p>
    <p>
        If you don't find anything wrong on the installation step, you can just ignore this part and go directly to installation.
        Otherwise, if you find port 8080 already used another program (let's say django or web2py), you can change the port to 8081, 8082, or any different number.
        To modify the configuration, open up start.py and look for these lines:
    </p>
    <pre>
        HOST                = 'localhost'               # the server name
        PORT                = 8080                      # http port
        DEBUG               = True                      # True or False
        RELOADER            = False                     # True or False
        SERVER              = 'kokoro'                  # or wsgiref or whatever
        APP_DIRECTORY       = 'applications'            # applications package
        RUNTIME_PATH        = '.development_runtime'    # runtime path
        BASE_URL            = '/kokoropy'               # base url, start with '/'
    </pre>

    <h1 id="coding">Coding</h1>

    <h2 id="simple_hello_world">Simple Hello world</h2>
    <p>Okay, let's try your first hello world program</p>
    <p>first, make directory inside <b>/applications</b>, name it as <b>demo</b>. Create <b>__init__.py</b> and <b>routes.py</b>
    </p>
    <pre>
        kokoropy
            |--- /applications
            |       |--- __init__.py
            |       |
            |       |--- /demo                * (1. Make demo directory)
            |       |       |--- __init__.py  * (2. Make __init__.py)
            |       |       |--- routes.py    * (3. Make routes.py)
          (...)   (...)
    </pre>
    <p>
        Now, edit your routes.py and put this:
    </p>
    <textarea class="language-python" readonly="readonly">
        from kokoropy import base_url

        def say_something(name = ''):
            if name == '':
                return '<h1>Hello</h1><p>How do you do?</p>'
            else:
                return '<h1>Hello ' + name + '</h1><p>How are you?</p>'

        urls = (
            (base_url('hello'), say_something),
            (base_url('hello/&lt;name&gt;'), say_something),
            ('hello', say_something),
            ('hello/&lt;name&gt;', say_something)
        )
    </textarea>
    <p>We hope the code is already self-explanatory, but if you still need some explanation, here is:</p>
    <ul>
        <li>
            <b>Line 1 :</b> Import <b>route</b> decorator and <b>base_url</b> function which will be used later.<br />
            base_url is used to get absolute url. For example <b>base_url('hello')</b> will return <b>http://localhost:8080/kokoropy/hello</b>
        </li>
        <li>
            <b>Line 3 - 7 :</b> Declare <b>say_something</b> function. This function return string, depends on <b>name</b> parameter.<br />
            If name is empty, the function will return a warm <i>How do you do</i> message, otherwise, it will return a welcome <i>How are you</i> message, along with the name
        </li>
        <li>
            <b>Line 9 - 14 :</b> Declare <b>urls</b> tupple. The tupple contains several elements. Each element contains of a pair or url and function associated with the url<br />
        </li>
    </ul>
    <p>
        <b>Important :</b> The tupple should be named <b>urls</b>. This tupple is used to wrap bottle route decorator.
        To get more comprehensive documentation about <b>route</b> decorator, please visit <a target="blank" href="http://bottlepy.org/docs/dev/tutorial.html#request-routing">Bottle's documentation about request routing</a>
    </p>

    <h2 id="mvc_and_automatic_routing">MVC and Automatic Routing</h2>
    <p>
        You might need something more complex than just a typical "hello world" program.<br />
        It's not good to put everything in <b>routes.py</b>, since it will be to complicated to be maintained.<br />
        Here is where MVC rocks. MVC stands for <b>M</b>odel, <b>V</b>iew, <b>C</b>ontroller.<br />
    </p>
    <ul>
        <li><b>Model</b> is the heart of your application. It define what an application can do. Imagine it as a bunch of functions which are ready to be used anytime.
        Model is usually, but not neccesaryly associated to database. People tend to write their database scripts (either using ORM or raw SQL) in model.
        </li>
        <li><b>Controller</b> is a gateway of your application. It define how user can interact with your application. A request from client wil be delivered to your controller.
        The controller then do some action, and call some routines defined in the model. And as visual feedback, controller will load a view and return it as response.
        </li>
        <li><b>View (or Template)</b> is a visual matter. You should put your HTML, javascript, and css here.</li>
    </ul>
    <p>
        Let's make your first MVC in kokoropy. At the end of this section, you will be able to access these url:
    </p>
    <ul>
        <li><b>http://localhost:8080/kokoropy/demo/pokemon</b> and get all pokemon</li>
        <li><b>http://localhost:8080/kokoropy/demo/pokemon/pi</b> and get pokemon which it's name contains 'pi'</li>
    </ul>
    <pre>
        kokoropy
            |--- /applications
            |       |--- __init__.py
            |       |
            |       |--- /demo                              * ( 1. Make demo directory)
            |       |       |--- __init__.py                * ( 2. Make __init__.py)
            |       |       |--- routes.py                  * ( 3. Make routes.py)
            |       |       |--- /models                    * ( 4. Make models directory)
            |       |       |       |--- __init__.py        * ( 5. Make __init__.py)
            |       |       |       |--- my_model.py        * ( 6. Make my_model.py)
            |       |       |--- /controllers               * ( 7. Make controllers directory)
            |       |       |       |--- __init__.py        * ( 8. Make __init__.py)
            |       |       |       |--- my_controller.py   * ( 9. Make my_controller.py)
            |       |       |--- /views                     * (10. Make views directory)
            |       |       |       |--- my_view.tpl        * (11. Make my_view.py)
            |       |       |--- /assets                    * (10. Make assets directory)
            |       |       |       |--- uploads            * (11. Make uploads directory)
          (...)   (...)
    </pre>
    <h3 id="model">Model</h3>
    <p>
        Put this in <b>my_model.py</b>:
    </p>
    <textarea class="language-python" readonly="readonly">
        from sqlalchemy import Column, Integer, String, create_engine
        from sqlalchemy.orm import scoped_session, sessionmaker
        from sqlalchemy.ext.declarative import declarative_base

        ########################### SQL ALCHEMY SCRIPT ################################

        # create Base
        Base = declarative_base()

        # create Pokemon class
        class Pokemon(Base):
            __tablename__ = 'pokemon'
            id = Column(Integer, primary_key=True)
            name = Column(String)
            image = Column(String)

            def __init__(self, name, image):
                self.name = name
                self.image = image

        # create engine
        engine = create_engine('sqlite:///db/demo.db', echo=True)

        # create db session
        db_session = scoped_session(sessionmaker(bind=engine))

        ################################ OUR MODEL ####################################

        class My_Model(object):
            '''
            Get the pokemon
            '''
            def __init__(self):
                Base.metadata.create_all(bind=engine)

            def get_pokemon(self, keyword=''):
                return db_session.query(Pokemon).all()
    </textarea>
    <p>
        You might think the code is longer than it should be. It is because we are using SQLALchemy's ORM (which is alreay bundled in kokoropy).<br />
        If you don't like (or not ready to use) ORM, you can also use classical SQL approach. SQL Alchemy supporting both ORM &amp; classical SQL approach. Please check <a target="blank" href="http://docs.sqlalchemy.org/">SQL Alchemy documentation</a> for more information.
        Now, here is some explanation of the code:
    </p>
    <ul>
        <li>
            <b>Line 1 - 3 :</b> Import some SQL-Alchemy's functions and classes.
        </li>
        <li>
            <b>Line 8 :</b> Make a Base class.
        </li>
        <li>
            <b>Line 11 - 19 :</b> Make a Pokemon class. This class is mapped to the <b>pokemon</b> table, and have 3 attributes (<b>id</b>, <b>name</b>, and <b>image</b>) which are mapped to the pokemon's table field.
        </li>
        <li>
            <b>Line 17 :</b> Pokemon Class's constructor. Whenever you call <b>Pokemon()</b> function, the constructor will be called, and a new Pokemon object will be created.
        </li>
        <li>
            <b>Line 22 :</b> Create engine to connect to the physical database. We use sqlite this time. The file is located at <b>/db/demo.db</b>
        </li>
        <li>
            <b>Line 25 :</b> Make a session and bind it to the engine created on line 22
        </li>
        <li>
            <b>Line 29 - 37 :</b> Declare a class named My_Model. Notice that this class has the same name as the file name with first letter character of each words capitalized.
        </li>
        <li>
            <b>Line 33 - 34 :</b> Whenever this class initialized, the database will be created if not exists
        </li>
        <li>
            <b>Line 36 - 37 :</b> get all pokemon from the database. This is why ORM useful, you do not need to write any SQL syntax, plus the syntax is now much more shorter.
        </li>
    </ul>

    <h3 id="controller">Controller</h3>
    <p>
        Put this in <b>my_controller.py</b>:
    </p>
    <textarea class="language-python" readonly="readonly">
        from kokoropy import Autoroute_Controller, load_view
        class My_Controller(Autoroute_Controller):

            def __init__(self):
                # import models
                from ..models.my_model import My_Model
                self.model = My_Model()

            def action_pokemon(self, keyword=None):
                # get pokemons
                pokemon_list = self.model.get_pokemon(keyword)
                return load_view('demo', 'my_view', pokemon_list = pokemon_list)
    </textarea>
    <p>Here is the explanation</p>
    <ul>
        <li>
            <b>Line 1 : </b> Import things we will need later.
        </li>
        <li>
            <b>Line 2 - 12 : </b> Make an autoruted controller. Every autorouted controller should extend <b>Autoroute_Controller</b>.
        </li>
        <li>
            <b>Line 4 - 7 : </b> The constructor. By using <b>from ..models.my_model import My_Model</b> , we load <b>My_Model</b> class.
        </li>
        <li>
            <b>Line 9 - 12 : </b> Get <b>pokemon_list</b>, pass it to <b>my_view</b> view, and give the response whenever user accessing <b>http://localhost:8080/kokoropy/my_controller/pokemon</b>.
        </li>
    </ul>
    <p>
        Every function in autorouted controller with <b>action_</b>, prefix will be published, and accessible with this url format:
    </p>
    <pre>
        BASE_URL/application_name/controller_name/function_without_prefix
    </pre>
    <p>
        You can also use <b>post_</b>, <b>get_</b>, <b>put_</b>, and <b>delete_</b> prefix. These prefixes are work with REST request.
    </p>
    <p class="alert alert-warning">
        <b>Beware :</b> Autoroute controller might looks to be fun, and it is recommended when you are on development stage. Also, it will feels familiar, if you came from CodeIgniter. However, for real-world usage, we suggest to use manual routing via <i>routes.py</i>.
        Manual routing allow you to change the url freely without touching your controller logic (and code) at all.
    </p>

    <h3 id="view">View</h3>
    <p>
        Put this in <b>my_view.tpl</b>:
    </p>
    <textarea class="language-html" readonly="readonly">
        <h3>Pokemon List</h3>
        <table class="table table-striped table-condensed">
            <thead>
                <tr>
                    <th>Pokemon Name</th>
                    <th>Image</th>
                </tr>
            </thead>
            <tbody>
                &#37;for pokemon in pokemons:
                <tr>
                    <td>&#123;&#123; pokemon.name &#125;&#125;</td>
                    <td>
                        &#37;if pokemon.image == '':
                        No image available
                        &#37;else:
                        <img src="&#123;&#123; BASE_URL &#125;&#125;demo/assets/uploads/&#123;&#123; pokemon.image &#125;&#125;" style="height:65px;" />
                        &#37;end
                    </td>
                </tr>
                &#37;end
            </tbody>
        </table>
        &#37;rebase('index/views/base', title='Pokemon List')
    </textarea>
    <p>
       Here we get our <b>pokemon_list</b> from the controller, and present it to our visitor in table.
       In kokoropy, <a target="blank" href="http://bottlepy.org/docs/dev/stpl.html">Simple Template Engine</a> is used to render the view.
    </p>
    <ul>
        <li><b>Line 10 - 21 :</b> Show Pokemon list.<br />
            You can add Python script by using <b>&#37;</b> symbol as the first non-whitespace character of the line.
            Beware, that you must put "end", as indentation would not work.<br />
            To add multiple python script you can use <b>&lt;&#37; &#37;&gt;</b><br />
            You can show Python variable by using <b>&#123;&#123; variable_name &#125;&#125</b>
        </li>
        <li><b>Line 24 :</b> Use <b>index/views/base.tpl</b> as parent template</li>
    </ul>
    <p class="alert alert-info">
        Since the database is empty, you won't be able to see anything. when running this demo.<br />
        In this case, open up <b>db/demo.db</b>, add some data, put some images on <b>applications/demo/assets/uploads</b>.
    </p>

    <h2 id="manual_routing">Manual Routing</h2>
    <p>
        As we say, put autoroute controller is great for development, however sometime you need more "expressive" routing. Here is where you need manual routing.
        To enable manual routing, first open up your previously created controller, and remove this part:
    </p>
    <pre>
        class My_Controller(Autoroute_Controller):
    </pre>
    <p>with this:</p>
    <pre>
        class My_Controller(obj):
    </pre>
    <p>and put this in your routes.py</p>
    <textarea class="language-python" readonly="readonly">
        # create instance of My_Controller
        from ..controllers.my_controller import My_Controller
        my_controller = My_Controller()
        # define routes
        urls = (
           (base_url('pokemon_list/&lt;keyword&gt;'), my_controller.action_pokemon),
           (base_url('pokemon_list'), my_controller.action_pokemon),
           (base_url('p/&lt;keyword&gt;'), my_controller.action_pokemon),
           (base_url('p'), my_controller.action_pokemon)
        )
    </textarea>
    <ul>
        <li>
            <b>Line 2 - 3 :</b> import My_Controller and make an instance of it
        </li>
        <li>
            <b>Line 5 - 10 :</b> define several request routing that should be handled by my_controller.action_pokemon
        </li>
    </ul>
    <h2 id="more">More ...</h2>
    <h3 id="request">Post, Get, Cookie, and Session</h3>
    <textarea class="language-python">
        from kokoropy import template, request, response, Autoroute_Controller

        class Default_Controller(Autoroute_Controller):

            # POST example
            def action_post(self):
                if 'name' in request.POST:
                    return request.POST['name']

            # GET example
            def action_get(self):
                if 'name' in request.GET:
                    return request.GET['name']

            # SESSION example
            def action_session(self):
                if 'name' in request.SESSION:
                    return reqeust.SESSION['name']

            # COOKIE example
            def action_cookie(self):
                # Set cookie value
                # Cookie name : address
                # Cookie value : Mars
                # Cookie secret (for encryption) : poweroverwhelming
                response.set_cookie('address', 'Mars', 'poweroverwhelming')
                # Get cookie
                # Cookie name : address
                # Default value (if cookie is not defined): default_address
                # Cookie secret (for decryption) : poweroverwhelming
                return request.get_cookie('address', 'default_address', 'poweroverwhelming')

            # UPLOAD example
            def upload_image(self):
                upload =  request.files.get('image')
                ext = os.path.splitext(upload.filename)[-1]
                uploaded_image = 'no image'
                if ext in ('.png','.jpg','.jpeg'):
                    if save_uploaded_asset('image', path='uploads', application_name='example'):
                        uploaded_image = '<img src="example/assets/uploads/"'+ upload.filename + '/>'
                return uploaded_image
    </textarea>
    <h3 id="custom_hook_and_error">Custom Hook and Error</h3>
    <p>
        Sometime people want to define their own hook and error message. Do this is very easy, as easy as define manual routing.
    </p>
    <textarea class="language-python" readonly="readonly">
        def before_request():
            print 'Start of request'

        def after_request():
            print 'End of request'

        def error_404(error):
            return 'No such a page yet, hire me !!!'

        def error_403(error):
            return 'Inaccessible page...'

        def error_500(error):
            return 'Our server blown up,... please contact us by phone'

        hooks = (
           ('before_request', before_request),
           ('after_request', after_request)
        )

        errors = (
           ('404', error_404),
           ('403', error_403),
           ('500', error_500)
        )
    </textarea>
    <ul>
        <li>
            <b>Line 1 - 14 :</b> Define several functions for hook and error
        </li>
        <li>
            <b>Line 16 - 25 :</b> Define <b>hooks</b> and <b>erros</b> tupples. These tupples are used to define hook and error message redirection
        </li>
    </ul>
    <h3 id="use_matplotlib">Use matplotlib</h3>
    <textarea class="language-python" readonly="readonly">
        from kokoropy import draw_matplotlib_figure, Autoroute_Controller

        class My_Controller(Autoroute_Controller):
            '''
            Plotting example
            '''

            def action_plot(self):
                max_range = 6.28
                # import things
                import numpy as np
                import matplotlib.pyplot as plt
                # determine x, sin(x) and cos(x)
                x = np.arange(0, max_range, 0.1)
                y1 = np.sin(x)
                y2 = np.cos(x)
                # make figure
                fig = plt.figure()
                fig.subplots_adjust(hspace = 0.5, wspace = 0.5)
                fig.suptitle('The legendary sine and cosine curves')
                # first subplot
                ax = fig.add_subplot(2, 1, 1)
                ax.plot(x, y1, 'b')
                ax.plot(x, y1, 'ro')
                ax.set_title ('y = sin(x)')
                ax.set_xlabel('x')
                ax.set_ylabel('y')
                # second subplot
                ax = fig.add_subplot(2, 1, 2)
                ax.plot(x, y2, 'b')
                ax.plot(x, y2, 'ro')
                ax.set_title ('y = cos(x)')
                ax.set_xlabel('x')
                ax.set_ylabel('y')
                # make canvas
                return draw_matplotlib_figure(fig)
    </textarea>
    <h1 id="deployment">Deployment</h1>
    <h2 id="apache">Apache</h2>
    <p>
        This is how to deploy kokoropy on apache web server (assuming you use ubuntu or debian):
    </p>
    <ul>
        <li>
            You need to have mod-wsgi enabled.
        </li>
        <li>
            If you do not have mod-wsgi installed, please do: sudo apt-get install libapache2-mod-wsgi.
        </li>
        <li>
            If you do not have mod-wsgi enabled, please do: sudo a2enmod wsgi.
        </li>
        <li>
            Copy kokoro.apache_conf, put it on /etc/apache2/sites-available/kokoro.apache_conf (For other OS, please append this file contents to httpd.conf).
        </li>
        <li>
            Enable this configuration by doing: sudo a2ensite kokoro.apache_conf.
        </li>
        <li>
            Modify /etc/apache2/sites-available/kokoro.apache_conf as follows:
            <ul>
                <li>
                    Replace every /home/gofrendi/workspace/kokoropy with your kokoropy directory location.
                </li>
                <li>
                    In case of you already have php installed, please don't use localhost as ServerName. Use another valid ServerName instead.
                </li>
                <li>
                    You can add valid ServerName by add a line at /etc/hosts (e.g: 127.0.1.1 arcaneSanctum will add arcaneSanctum as valid ServerName).
                </li>
                <li>
                    Note, that by default apache will greedily take over every request and left nothing to be handled by your application. If you are using ubuntu/debian, modify /etc/apache2/sites-enabled/000-default. <br />
                    Change this part &lt;VirtualHost *:80&gt; into &lt;VirtualHost localhost:80&gt;
                </li>
            </ul>
        </li>
        <li>
            Reload your apache by using sudo service apache2 reload. If it does not work, restart your apache by using sudo service apache2 restart
        </li>
    </ul>
    <h2 id="heroku">Heroku</h2>
    <p>
        This is how to deploy kokoropy on heroku (assuming you use ubuntu):
    </p>
    <ul>
        <li>
            Make heroku account, and visit https://devcenter.heroku.com/articles/python for more detail instruction
        </li>
        <li>
            get and install heroku toolbelt by using this command: wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh. For other OS, please visit the heroku website for more information.
        </li>
        <li>
            init a git repo by using this command: git init
        </li>
        <li>
            login to heroku (make sure you already have an account on heroku.com) by using this command: heroku login
        </li>
        <li>
            Set up heroku with a special buildpack (needed for matplotlib demo) by using this command heroku create --buildpack https://github.com/dbrgn/heroku-buildpack-python-sklearn/
        </li>
        <li>
            If you do not need matplotlib at all, just do heroku create
        </li>
        <li>
            If you have already do heroku create but change your mind later, and think that you need matplotlib, do this: heroku config:set BUILDPACK_URL=https://github.com/dbrgn/heroku-buildpack-python-sklearn/
        </li>
        <li>
            make heroku_app.py installable by using this command chmod a+x heroku_app.py
        </li>
        <li>
            detect all changes and deploy by using commit &amp; push
        </li>
    </ul>

    <pre>
        git add . -A
        git commit -m "Initial commit for heroku deployment"
        git push heroku master
    </pre>

</div>