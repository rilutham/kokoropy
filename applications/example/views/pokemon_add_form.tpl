<form action="{{ BASE_URL }}example/pokemon" method="post" enctype="multipart/form-data" class="form-horizontal" role="form">
  <div class="form-group">
    <label for="pokemon_name" class="col-lg-3 col-md-3 control-label">Pokemon Name</label>
    <div class="col-lg-7 col-md-8">
      <input type="text" class="form-control" id="pokemon_name" name="pokemon_name" placeholder="New Pokemon Name" />
    </div>
  </div>
  <div class="form-group">
    <label for="pokemon_name" class="col-lg-3 col-md-3 control-label">Image</label>
    <div class="col-lg-7 col-md-8">
      <input type="file" class="form-control" id="pokemon_image" name="pokemon_image" placeholder="Image" />
    </div>
  </div>
  <div class="form-group">
    <div class="col-lg-offset-3 col-md-offset-3 col-lg-7 col-md-8">
      <input class="btn btn-primary" name="btn_new" value="Add New Pokemon" type="submit" />
      <input name="__private_code" value="{{ __private_code }}" type="hidden" />
      <input name="action" value="add" type="hidden" />
    </div>
  </div>
</form>
%rebase('index/views/base', title='Pokemon List')