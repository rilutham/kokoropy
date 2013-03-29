from kokoropy import template, request

class Default_Controller(object):
    """
     RECOMMENDED APPROACH (Automagically route) 
    
     An OOP Style with automatic routing example (just like CodeIgniter or FuelPHP)
     The routing will be done automatically.
     To use this feature:
        * The controller file name can be anything, and will be used for routing
        * Your controller class name should be "Default_Controller"
        * Your published method should have "action" prefix
        * The published URL would be 
          http://localhost:8080/app_dir/controller_file/published_method/params
        * If your app_dir, controller_file or published_method named "index", it can be
          omitted
        * For convention, this is the recommended way to do it    
    """
    
    def __init__(self):
        # import models
        from application.example.models.simple_model import Simple_Model
        from application.example.models.db_model import DB_Model
        # make instance of models      
        self.simple_model = Simple_Model()
        self.db_model = DB_Model()
    
    # automatically routed to: http://localhost:8080/example/recommended/index/parameter
    def action_index(self, name=None):
        # get counter from SESSION, or set it
        if 'counter' in request.SESSION:
            request.SESSION['counter'] += 1
        else:
            request.SESSION['counter'] = 1        
        # get say_hello
        say_hello = self.simple_model.say_hello(name)
        message = say_hello+', you have visit this page '+str(request.SESSION['counter'])+' times'
        return template('example/hello', message=message)
    
    # automatically routed to: http://localhost:8080/example/recommended/pokemon/parameter
    def action_pokemon(self, keyword=None):
        # if name is None, get from GET
        if (keyword is None) and ('keyword' in request.GET):
            keyword = request.GET['keyword']
        # if name is still None, get from POST
        if (keyword is None) and ('keyword' in request.POST):
            keyword = request.POST['keyword']
        # if keyword is still None, make it ''
        if keyword is None:
            keyword = ''       
        pokemons = self.db_model.get_pokemon(keyword)
        return template('example/pokemon', pokemons=pokemons)
    
    # not routed
    def unpublished_function(self):
        return 'this is not published'