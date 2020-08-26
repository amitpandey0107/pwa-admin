@extends('admin::layouts.master')

@section('admin::title', 'Events')

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
                            Events List
                            <a href="{{ route('post-add') }}" class="btn btn-success" style="float:right;">
                                <i class="material-icons">add</i> Add Events
                            </a>
                        </h4>
                    </div>
                    <div class="card-body">
                        <div class="toolbar"></div>
                        <div class="material-datatables">
                            <table id="datatables" class="table table-striped table-no-bordered table-hover" cellspacing="0" width="100%" style="width:100%">
                                <thead>
                                    <tr>
                                        <th>S.No</th>
                                        <th>Title</th>
                                        <th>Description</th>
                                        <th>Start Date</th>                  
                                        <th>End Date</th> 
                                    </tr>
                                </thead>
                                <tfoot>                                    
                                    <tr>
                                        <th>S.No</th>
                                        <th>Title</th>
                                        <th>Description</th>
                                        <th>Start Date</th>                  
                                        <th>End Date</th> 
                                    </tr>
                                </tfoot>
                                <tbody>

                                    @foreach ($posts as $data)
                                   
                                    <tr>
                                        <td>{{ $data->id }}</td>
                                        <td>{{ $data->title }}</td>
                                        <td>{{ $data->description }}</td>
                                        <td>{{ $data->start }}</td>
                                        <td>{{ $data->end }}</td> 
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