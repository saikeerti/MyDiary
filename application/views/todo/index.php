<div class="container">
	<h3>My To-Do List</h3>
	<div class="alert alert-success" style="display: none;">
		
	</div>
	<button id="btnAdd" class="btn btn-success">Add New To-Do List</button>
	<table class="table table-bordered table-responsive" style="margin-top: 20px;">
		<thead>
			<tr>
				<td>ID</td>
				<td>Todo</td>
				<td>By Date</td>
				<td>Created at</td>
				<td>Action</td>
			</tr>
		</thead>
		<tbody id="showdata">
			
		</tbody>
	</table>
</div>

<div id="myModal" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Modal title</h4>
      </div>
      <div class="modal-body">
        	<form id="myForm" action="" method="post" class="form-horizontal">
        		<input type="hidden" name="txtId" value="0">
        		<div class="form-group">
        			<label for="name" class="label-control col-md-4">Todo</label>
        			<div class="col-md-8">
        				<input type="text" name="txtTodoName" class="form-control">
        			</div>
        		</div>
        		<div class="form-group">
        			<label for="date" class="label-control col-md-4">By date</label>
        			<div class="col-md-8">
        				<input type="date" class="form-control" name="txtBydate">
        			</div>
        		</div>
        	</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" id="btnSave" class="btn btn-primary">Save changes</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div id="deleteModal" class="modal fade" tabindex="-1" role="dialog">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">Confirm Delete</h4>
      </div>
      <div class="modal-body">
        	Do you want to delete this record?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" id="btnDelete" class="btn btn-danger">Delete</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script>
	$(function(){
		showAllTodo();

		//Add New
		$('#btnAdd').click(function(){
			$('#myModal').modal('show');
			$('#myModal').find('.modal-title').text('Add New Todo List');
			$('#myForm').attr('action', '<?php echo base_url() ?>todo/addTodo');
		});


		$('#btnSave').click(function(){
			var url = $('#myForm').attr('action');
			var data = $('#myForm').serialize();
			//validate form
			var todoname = $('input[name=txtTodoName]');
			var bydate = $('input[name=txtBydate]');
			var result = '';
			if(todoname.val()==''){
				todoname.parent().parent().addClass('has-error');
			}else{
				todoname.parent().parent().removeClass('has-error');
				result +='1';
			}
			if(bydate.val()==''){
				bydate.parent().parent().addClass('has-error');
			}else{
				bydate.parent().parent().removeClass('has-error');
				result +='2';
			}

			if(result=='12'){
				$.ajax({
					type: 'ajax',
					method: 'post',
					url: url,
					data: data,
					async: false,
					dataType: 'json',
					success: function(response){
						if(response.success){
							$('#myModal').modal('hide');
							$('#myForm')[0].reset();
							if(response.type=='add'){
								var type = 'added'
							}else if(response.type=='update'){
								var type ="updated"
							}
							$('.alert-success').html('To-Do List '+type+' successfully').fadeIn().delay(1000).fadeOut('slow');
							showAllTodo();
						}else{
							alert('Error');
						}
					},
					error: function(){
						alert('Could not add data');
					}
				});
			}
		});

		//edit
		$('#showdata').on('click', '.item-edit', function(){
			var id = $(this).attr('data');
			$('#myModal').modal('show');
			$('#myModal').find('.modal-title').text('Edit To-Do List');
			$('#myForm').attr('action', '<?php echo base_url() ?>todo/updateTodo');
			$.ajax({
				type: 'ajax',
				method: 'get',
				url: '<?php echo base_url() ?>todo/editTodo',
				data: {id: id},
				async: false,
				dataType: 'json',
				success: function(data){
					$('input[name=txtTodoName]').val(data.todoname);
					$('input[name=txtBydate]').val(data.bydate);
					$('input[name=txtId]').val(data.id);
				},
				error: function(){
					alert('Could not Edit Data');
				}
			});
		});

		//delete- 
		$('#showdata').on('click', '.item-delete', function(){
			var id = $(this).attr('data');
			$('#deleteModal').modal('show');
			//prevent previous handler - unbind()
			$('#btnDelete').unbind().click(function(){
				$.ajax({
					type: 'ajax',
					method: 'get',
					async: false,
					url: '<?php echo base_url() ?>todo/deleteTodo',
					data:{id:id},
					dataType: 'json',
					success: function(response){
						if(response.success){
							$('#deleteModal').modal('hide');
							$('.alert-success').html('To-Do List Deleted successfully').fadeIn().delay(1000).fadeOut('slow');
							showAllNote();
						}else{
							alert('Error');
						}
					},
					error: function(){
						alert('Error deleting');
					}
				});
			});
		});



		//function
		function showAllTodo(){
			$.ajax({
				type: 'ajax',
				url: '<?php echo base_url() ?>todo/showAllTodo',
				async: false,
				dataType: 'json',
				success: function(data){
					var html = '';
					var i;
					for(i=0; i<data.length; i++){
						html +='<tr>'+
									'<td>'+data[i].id+'</td>'+
									'<td>'+data[i].todoname+'</td>'+
									'<td>'+data[i].bydate+'</td>'+
									'<td>'+data[i].created_at+'</td>'+
									'<td>'+
										'<a href="javascript:;" class="btn btn-info item-edit" data="'+data[i].id+'">Edit</a>'+
										'<a href="javascript:;" class="btn btn-danger item-delete" data="'+data[i].id+'">Delete</a>'+
									'</td>'+
							    '</tr>';
					}
					$('#showdata').html(html);
				},
				error: function(){
					alert('Could not get Data from Database');
				}
			});
		}
	});

</script>