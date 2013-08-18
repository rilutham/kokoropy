<strong>{{ message }}</strong>
<p>
    You can also try to access this page with custom parameter, such as:
    <ul>
        <li><a href="{{ BASE_URL }}example/recommended/index/Haruna"><code>{{ BASE_URL }}example/recommended/index/Haruna</code></a> or</li>
        <li><a href="{{ BASE_URL }}example/recommended/index/Mami"><code>{{ BASE_URL }}example/recommended/index/Mami</code></a> or</li> 
        <li><a href="{{ BASE_URL }}example/recommended/Tomomi"><code>{{ BASE_URL }}example/recommended/Tomomi</code></a> or</li>  
        <li><a href="{{ BASE_URL }}example/recommended/Rina"><code>{{ BASE_URL }}example/recommended/Rina</code></a> or</li>
        <li><a href="{{ BASE_URL }}example/recommended/index/your name"><code>{{ BASE_URL }}example/recommended/index/your name</code></a> or</li> 
        <li><a href="{{ BASE_URL }}example/recommended/your name"><code>{{ BASE_URL }}example/recommended/your name</code></a></li>
    </ul>
    The parameter will be shown after "hello", and the number of visit will be increased since it is saved in <code>session</code>
</p>

<div class="note">
    <p>
        This page is generated by using recommended routing mechanism. In most cases, it is recommended to use this kind of routing.<br />
        Recommended routing mechanism works easily with such following code in your controllers:
    </p>
    <pre>
    # file: /application/<b>example</b>/controllers/<b>recommended</b>.py 
    class <b>Default_Controller</b>(object):
        def <b>act_index</b>(self, name=None):
            if name is None:
                name = 'Mami Sasazaki'
            message  = 'Hello '+name
            return message
    </pre>
    <p>
        Notice that the class name should be <code>Default_Controller</code> and case sensitive.<br />
        Every published function in your class should has <code>act_</code> prefix.<br />
        You don't need to define the routing mechanism (i.e: using <code>route</code> function or <code>@route</code> decorator) anymore.<br />
        Everything is done automatically as <code>http://your_domain.com:your_port/your_base_url/<b>APPLICATION_NAME</b>/<b>CONTROLLER_FILE_NAME</b>/<b>UNPREFIXED_FUNCTION_NAME</b></code><br />
        So, the <code>act_index</code> function in the example will be published as <code>http://localhost:8080/kokoropy/<b>example</b>/<b>recommended</b>/<b>index</b></code> 
    </p>
    <p>
        If either APPLICATION_NAME, CONTROLLER_NAME, or UNPREFIXED_FUNCTION_NAME is <code>index</code>, it can also be ommited from url.<br />
        This means that you can also access the above example by using this url: <code>http://localhost:8080/kokoropy/<b>example</b>/<b>recommended</b></code> 
    </p>
    <p>
        However, since you have a parameter (<code>name</code>) in your <code>act_index</code> function, you can also set the parameter by using this url: <code>http://localhost:8080/kokoropy/<b>example</b>/<b>recommended</b>/<b>Your Name</b></code>.
        And your name will replace the default value <code>Mami Sasazaki</code>.
    </p>
    <p>For more information about routing, please visit <a href="https://github.com/goFrendiAsgard/kokoropy">Kokoropy github repository and tutorials</a></p>
</div>

%rebase example/base title='Hello'