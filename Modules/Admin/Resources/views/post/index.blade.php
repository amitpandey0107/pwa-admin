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
                            <a href="{{ route('post-add') }}" class="btn btn-success" style="float:right;">
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
                                        <th>Image</th>                  
                                        <th class="disabled-sorting text-right">Actions</th>
                                    </tr>
                                </thead>
                                <tfoot>                                    
                                    <tr>
                                        <th>Name</th>
                                        <th>Desc</th>
                                        <th>Category</th>
                                        <th>Image</th>                  
                                        <th class="text-right">Actions</th>
                                    </tr>
                                </tfoot>
                                <tbody>
                                    @foreach ($posts as $data)
                                   
                                    <tr>
                                        <td>{{ $data->title }}</td>
                                        <td>{{ $data->description }}</td>
                                        <td>{{ $data->category }}</td>

                                        @if($data->image)
                                        <td><img src="{{ asset('/uploads/posts/'.$data->image)}}" class="imageClass" title="Flag image" height="60"> </td>
                                        @else
                                        <td><img src="https://cdn0.iconfinder.com/data/icons/famous-character-vol-2-colored/48/JD-04-256.png" class="imageClass" title="Flag image" height="60"> </td>
                                        @endif

                                        <!-- <td>
                                            <a href="" class="actions">
                                                <button type="button" title="Edit" rel="tooltip" class="btn btn-success" data-original-title="" title="">
                                                    <i class="material-icons">edit</i>
                                                    <div class="ripple-container"></div>
                                                </button>
                                            </a>
                                        </td> -->
                                    </tr>    
                                     @endforeach                           
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

@endsection