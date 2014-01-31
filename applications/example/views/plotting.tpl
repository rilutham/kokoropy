<link rel="stylesheet" type="text/css" href="{{ BASE_URL }}index/assets/static_libraries/jquery-ui/css/ui-lightness/jquery-ui-1.10.4.custom.min.css" />
<h4>Matplotlib and StringIO should be installed on server</h4>
<div>
    <label>Range : </label>
    <input type="text" name="range" id="range" class="spinner" value="6.3" />    
</div>
<br />
<div id="plot">
    <p>Image will be loaded here ... </p>
</div>
<script type="text/javascript" src="{{ BASE_URL }}index/assets/static_libraries/jquery-ui/js/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
        // mutate normal text into spinner
        var range_spinner = $('.spinner').spinner({
            step: 0.1,
            numberFormat: "n",
            max: (8.0*22.0/7.0).toFixed(1),
            min: (0.5*22.0/7.0).toFixed(1),
        });
        
        // show the image plot for the first time
        show_plot(6.28);
        
        // hack to trigger input keyup whenever spinner button clicked:
        $('.ui-spinner-button').click(function() { $(this).siblings('input').keyup(); });   
        
        // keyup event
        $('#range').keyup(function(){
           range = range_spinner.spinner('value');
           show_plot(range);
        });
    });
    
    function show_plot(range){
        if(range!==null){
            $('#plot').html('<img src="{{ BASE_URL }}example/plotting/plot?range='+range+'" />');
        }
    }    
</script>
%rebase('example/views/base',title='Plot')
