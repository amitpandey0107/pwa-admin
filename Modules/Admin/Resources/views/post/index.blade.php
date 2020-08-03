@extends('admin::layouts.master')

@section('admin::title', 'Post')

@section('admin::content')

<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-12 text-right">
            </div>
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header card-header-success card-header-icon">
                        <div class="card-icon">
                            <i class="material-icons">assignment</i>
                        </div>
                        <h4 class="card-title">
                            Post List
                            <a href="" class="btn btn-success" style="float:right;">
                                <i class="material-icons">add</i> Add Post
                            </a>
                        </h4>
                    </div>
                    <div class="card-body">
                        <div class="toolbar"></div>
                        <div class="material-datatables">
                            <table id="datatables" class="table table-striped table-no-bordered table-hover" cellspacing="0" width="100%" style="width:100%">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Desc</th>
                                        <th>Category</th>
                                        <th>Status</th>                  
                                        <th class="disabled-sorting text-right">Actions</th>
                                    </tr>
                                </thead>
                                <tfoot>                                    
                                    <tr>
                                        <th>Name</th>
                                        <th>Desc</th>
                                        <th>Category</th>
                                        <th>Status</th>                  
                                        <th class="text-right">Actions</th>
                                    </tr>
                                </tfoot>
                                <tbody>
                                    <tr>
                                        <td>Post Name</td>
                                        <td>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Autem aliquid maxime, eos illo.</td>
                                        <td>Avengers</td>
                                        <td>
                                            @if($data->status == 1) 
                                            <a onclick="updateStatus('{{route('user-status', $data->slug.'_0')}}')" class="btn btn-success statusBtn">Active</a> 
                                            @else 
                                            <a  onclick="updateStatus('{{route('user-status', $data->slug.'_1')}}')" class="btn btn-danger statusBtn">Deactive</a> 
                                            @endif 
                                        </td> 
                                        <td>
                                            <a href="" class="actions">
                                                <button type="button" title="Edit" rel="tooltip" class="btn btn-success" data-original-title="" title="">
                                                    <i class="material-icons">edit</i>
                                                    <div class="ripple-container"></div>
                                                </button>
                                            </a>
                                        </td>
                                    </tr>                              
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!-- end content-->
                </div>
                <!--  end card  -->
            </div>
            <!-- end col-md-12 -->
        </div>
        <!-- end row -->
    </div>
</div>

@endsection
@section('admin::custom_js')
<script type="text/javascript">
    function UserDelete(dataID) {
    Swal.fire({
    title: 'Are you sure?',
            text: "You won't be able to revert this!",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, delete it!'
    }).then((result) => {
    if (result.value) {
    var token = $("input[name=_token]").val();
    $.ajax({
    type:"POST",
            dataType: "JSON",
            url: "{{route('customer-delete')}}",
            data: { "id": dataID, "_token": "{{ csrf_token() }}" },
            success: function (data) {
            // console.log(data.status);    
            if (data.status == 200){
            Swal.fire(
                    'Deleted!',
                    'User deleted successfully!',
                    'success'
                    )
                    setTimeout(function(){ location.reload(true); }, 2000);
            } else{
            Swal.fire(
                    'Error!',
                    'Something went wrong!',
                    'error'
                    )
            }
            }
    });
    }

    })
    }

    function updateStatus(param) {
    Swal.fire({
    title: 'Are you sure?',
            text: "You won't be able to perform this action.",
            type: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Yes, Update it!'
    }).then((result) => {
    if (result.value) {
    Swal.fire(
            'Updated!',
            'User status updated.',
            'success'
            )
            window.location = param
    }
    })
    }
    
    $('#datatables').DataTable({
        "pagingType": "full_numbers",
        "lengthMenu": [
        [10, 25, 50, -1],
                [10, 25, 50, "All"]
        ],
        responsive: true,
                language: {
                search: "_INPUT_",
                        searchPlaceholder: "Search records",
                }
    }
    );
</script>

@endsection