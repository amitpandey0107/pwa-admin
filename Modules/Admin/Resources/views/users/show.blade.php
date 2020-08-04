@extends('admin::layouts.master')

@section('admin::title', 'Customer')

@section('admin::pagetitle', 'Customer Details')

@section('admin::content')

<style>
    .statchk .form-check-label {margin-top: 14px;}
    .imgmt{margin-top: 20px;}
</style>

<div class="content">

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
                
                <div class="col-md-12">

                    <div class="card ">
                    <div class="card-header card-header-success card-header-icon">
                            <div class="card-icon">
                                <i class="material-icons">assignment</i>
                            </div>
                            <h4 class="card-title">Customer Details
                                <a href="{{ route('customers') }}">
                                    <button class="btn btn-success" style="float:right">Back</button>
                                </a>
                            </h4>
                        </div>
                        <div class="card-body ">
                        <form method="POST" class="form-horizontal" id="customerForm" enctype="multipart/form-data" action="{{ route('customer-edit') }}">
                                @csrf()
                                <div class="row">
                                    <div class="col-sm-2 col-form-label">
                                        <label for="name" class="bmd-label-floating"> Name *</label>
                                    </div>	
                                    <div class="col-sm-10">
                                        <div class="form-group bmd-form-group">
                                            <input disabled type="text" name="name" id="firstname" class="form-control required" autocomplete="off" value="{{ $user->name }}">
                                            @if ($errors->has('name'))
                                            <span class="error" role="name">
                                                <strong>{{ $errors->first('name') }}</strong>
                                            </span>
                                            @endif
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <label class="col-sm-2 col-form-label">Email *</label>
                                    <div class="col-sm-10">
                                        <div class="form-group bmd-form-group">
                                            <input disabled type="text" name="email" id="email" class="form-control required email" autocomplete="off" value="{{ $user->email }}">
                                            @if ($errors->has('email'))
                                            <span class="error" role="email">
                                                <strong>{{ $errors->first('email') }}</strong>
                                            </span>
                                            @endif
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <label class="col-sm-2 col-form-label">Phone *</label>
                                    <div class="col-sm-10">
                                        <div class="form-group bmd-form-group">
                                            <input disabled type="text" name="mobile_number" id="phone" maxlength="12" class="form-control required number" autocomplete="off" value="{{ $user->mobile_number }}">
                                            @if ($errors->has('mobile_number'))
                                            <span class="error" role="mobile_number">
                                                <strong>{{ $errors->first('mobile_number') }}</strong>
                                            </span>
                                            @endif
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <label class="col-sm-2 col-form-label">Date of Birth *</label>
                                    <div class="col-sm-10">
                                        <div class="form-group bmd-form-group is-filled">
                                            <input disabled type="text" class="form-control datepicker required" autocomplete="off" name="date_of_birth" id="dob" value="{{ $user->date_of_birth }}">
                                            @if ($errors->has('date_of_birth'))
                                            <span class="error" role="date_of_birth">
                                                <strong>{{ $errors->first('date_of_birth') }}</strong>
                                            </span>
                                            @endif
                                        </div>
                                    </div>
                                </div>

                                <div class="row">
                                    <label class="col-sm-2 col-form-label label-checkbox">Gender *</label>
                                    <div class="col-sm-10 checkbox-radios">
                                        <div class="form-check form-check-inline">
                                           {{$user->gender}}
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
        $('#customerForm').validate();
    });
</script>
@endsection