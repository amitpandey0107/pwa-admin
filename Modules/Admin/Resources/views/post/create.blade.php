@extends('admin::layouts.master')

@section('admin::title', 'Event')

@section('admin::pagetitle', 'Add Event')

@section('admin::content')

<style>
    .statchk .form-check-label {margin-top: 14px;}
    .imgmt{margin-top: 20px;}
</style>

<div class="content">
    <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-12">
                        @if (count($errors) > 0)
                        <div class = "alert alert-danger">
                            <ul>
                                @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                        @endif
        
                        @if(!empty($successMsg))
                        <div class="alert alert-success"> {{ $successMsg }}</div>
                        @endif
                    </div>
                </div>

        <div class="row">
            <div class="col-sm-12">
                @if(session()->has('success'))
                @section('admin::custom_js')
                <script>
                    Swal.fire({
                        position: 'center',
                        type: 'success',
                        title: " {{ session()->get('success') }} ",
                        showConfirmButton: false,
                        timer: 3000
                    })
                </script>
                @endsection
                @endif

                @if(session()->has('error'))
                @section('admin::custom_js')
                <script>
                    Swal.fire({
                        position: 'center',
                        type: 'error',
                        title: " {{ session()->get('error') }} ",
                        showConfirmButton: false,
                        timer: 3000
                    })
                </script>
                @endsection
                @endif
            </div>
        </div>
    </div>

    <div class="content">
        <style>
            .form-group input[type=file] {
                opacity: 1;
                position: relative;
                top: initial;
                right: initial;
                bottom: initial;
                left: initial;
                width: 100%;
                height: 100%;
                z-index: 0;
            }
        </style>
        <div class="container-fluid">
            <div class="row">                
                <div class="col-md-12">

                    <div class="card ">
                        <div class="card-header card-header-success card-header-icon">
                            <div class="card-icon">
                                <i class="material-icons">assignment</i>
                            </div>
                            <h4 class="card-title">Add New Event
                                <a href="{{ route('post') }}">
                                    <button class="btn btn-success" style="float:right">Back</button>
                                </a>
                            </h4>
                        </div>
                        <div class="card-body">				           

                            <form method="POST" class="form-horizontal" id="customerForm" enctype="multipart/form-data" action="{{ route('post-add') }}">
                                @csrf()
                                <div class="row">
                                    <div class="col-sm-2 col-form-label">
                                        <label for="title" class="bmd-label-floating">Title *</label>
                                    </div>	
                                    <div class="col-sm-10">
                                        <div class="form-group bmd-form-group">
                                            <input type="text" name="title" id="title" maxlength="50" class="form-control required" autocomplete="off"  value="{{ old('title') }}">
                                            @if ($errors->has('title'))
                                            <span class="error" role="title">
                                                <strong>{{ $errors->first('title') }}</strong>
                                            </span>
                                            @endif

                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <label class="col-sm-2 col-form-label">Description *</label>
                                    <div class="col-sm-10">
                                        <div class="form-group bmd-form-group">
                                            <input type="text" name="description" id="description" maxlength="500" class="form-control required" autocomplete="off" value="{{ old('description') }}">
                                            @if ($errors->has('description'))
                                            <span class="error" role="description">
                                                <strong>{{ $errors->first('description') }}</strong>
                                            </span>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <label class="col-sm-2 col-form-label">Start Date *</label>
                                    <div class="col-sm-10">
                                        <div class="form-group bmd-form-group">
                                            <input type="text" name="start" id="start"  class="form-control required datepicker" autocomplete="off" value="{{ old('start') }}">
                                            @if ($errors->has('start'))
                                            <span class="error" role="start">
                                                <strong>{{ $errors->first('start') }}</strong>
                                            </span>
                                            @endif
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <label class="col-sm-2 col-form-label">End Date *</label>
                                    <div class="col-sm-10">
                                        <div class="form-group bmd-form-group">
                                            <input type="text" name="end" id="end"  class="form-control required datepicker" autocomplete="off" value="{{ old('end') }}">
                                            @if ($errors->has('end'))
                                            <span class="error" role="end">
                                                <strong>{{ $errors->first('end') }}</strong>
                                            </span>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                               
                                <div class="row">
                                    <div class="col-sm-2 col-form-label">
                                        <div class="card-footer ">
                                            <button type="submit" class="btn btn-fill btn-success">Submit<div class="ripple-container"></div></button>
                                        </div>
                                    </div>				                   
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- /card -->

                </div>
            </div>
            <!-- /row -->
        </div>
        <!-- /container-fluid -->
    </div>
    <!-- /content -->
</div>
<!-- content -->

@endsection

@section('admin::custom_js')
<script type="text/javascript">
    $(document).ready(function () {       
        $('#customerForm').validate({
            rules:{
                title:"required",                
                description:"required",
                start:"required",
                end:"required",
            }, 
            messages:{
                title:"please enter title",                
                description:"please enter description",
                start:"please select start date",
                end:"please select end date",
            },            
        });
       
    });

    $(".datepicker").datepicker({
            dateFormat: "yy-mm-dd",
            minDate: new Date(),
            changeMonth: true,
            changeYear: true,
        });
</script>
@endsection