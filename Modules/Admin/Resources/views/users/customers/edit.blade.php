@extends('admin::layouts.master')

@section('admin::title', 'Customers')

@section('admin::pagetitle', 'Edit Customer')

@section('admin::content')

<style>
    .statchk .form-check-label {margin-top: 14px;}
    .imgmt{margin-top: 20px;}
</style>

<div class="content">
    <div class="container-fluid">
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
                            <h4 class="card-title">Customer Edit
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
                                            <input type="text" name="name" id="firstname" class="form-control required" autocomplete="off" value="{{ $user->name }}">
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
                                            <input type="text" name="email" id="email" class="form-control required email" autocomplete="off" value="{{ $user->email }}">
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
                                            <input type="text" name="mobile_number" id="phone" maxlength="12" class="form-control required number" autocomplete="off" value="{{ $user->mobile_number }}">
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
                                            <input type="text" class="form-control datepicker required" autocomplete="off" name="date_of_birth" id="dob" value="{{ $user->date_of_birth }}">
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
                                            <label class="form-check-label">
                                                <input type="hidden" name="slug" value="{{$user->slug}}">
                                                <input class="form-check-input" type="radio" value="Male" name="gender" <?php
                                                if ($user->gender == 'Male') {
                                                    echo 'checked="checked"';
                                                }
                                                ?> id="gendermale"> Male
                                                <span class="form-check-sign">
                                                    <span class="check"></span>
                                                </span>
                                            </label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <label class="form-check-label">
                                                <input class="form-check-input" type="radio" value="Female" name="gender" id="genderfemale" <?php
                                                if ($user->gender == 'Female') {
                                                    echo 'checked="checked"';
                                                }
                                                ?> > Female
                                                <span class="form-check-sign">
                                                    <span class="check"></span>
                                                </span>
                                            </label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <label class="form-check-label">
                                                <input class="form-check-input" type="radio" value="Other" name="gender" <?php
                                                if ($user->gender == 'Other') {
                                                    echo 'checked="checked"';
                                                }
                                                ?> id="genderother"> Other
                                                <span class="form-check-sign">
                                                    <span class="check"></span>
                                                </span>
                                            </label>
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
                name:"required",
                email: {
                    required: true,
                    email:true
                },
                mobile_number: {
                    required: true,
                    minlength:9,
                    maxlength:12,
                    number: true
                },
                date_of_birth:"required",
                gender:"required",
            }, 
            messages:{
                name:"Please enter your name",
                email: {
                    required: "please enter email address",
                    email:"please enter a valid email address"
                },
                mobile_number: {
                    required: "please enter mobile number",
                    minlength: "mobile number must be greater then 9 digit",
                    maxlength:"mobile number must be less then 12 digit",
                    number: "mobile number must be a number"
                },
                date_of_birth:"please enter your date of birth",
                gender:"please choose a gender",
            },
            errorPlacement: function(error, element) {
                if ( element.is(":radio") ) {
                    error.appendTo( element.parents('.checkbox-radios') );
                } else { 
                    error.insertAfter( element );
                }
            }
        });

        
        $(".datepicker").datepicker({
            dateFormat: "yy-mm-dd",
            maxDate: new Date()
        });
        
    });
</script>
@endsection