@extends('admin::layouts.master')
@section('admin::content')
<style>
input[type=number]::-webkit-inner-spin-button, 
input[type=number]::-webkit-outer-spin-button { 
  -webkit-appearance: none; 
  margin: 0; 
}
</style>
<!-- End Navbar -->
<div class="content">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header card-header-success card-header-icon">
                        <div class="card-icon">
                            <i class="material-icons">perm_identity</i>
                        </div>
                        <h4 class="card-title">Edit Profile</h4>
                    </div>
                    <div class="card-body">

                        <form method="POST" id="validate" action="{{ route('admin-edit-profile') }}" enctype="multipart/form-data">
                            @csrf
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="bmd-label-floating">Name</label>
                                        <input type="text" name="name" value="{{ Auth::user()->name }}" class="form-control" maxlength="50">
                                        @if ($errors->has('name'))
                                        <span class="error" role="alert">
                                            <strong>{{ $errors->first('name') }}</strong>
                                        </span>
                                        @endif
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="bmd-label-floating">Email</label>
                                        <input type="email" name="email" value="{{ Auth::user()->email }}" class="form-control" maxlength="50">
                                        @if ($errors->has('email'))
                                        <span class="error" role="alert">
                                            <strong>{{ $errors->first('email') }}</strong>
                                        </span>
                                        @endif
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="bmd-label-floating">Mobile Number Country</label>
                                        <input type="number" name="mobile_code" value="{{ Auth::user()->mobile_code }}" class="form-control" maxlength="6">
                                        @if ($errors->has('mobile_code'))
                                        <span class="error" role="alert">
                                            <strong>{{ $errors->first('mobile_code') }}</strong>
                                        </span>
                                        @endif
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="bmd-label-floating">Mobile Number</label>
                                        <input type="number" name="mobile_number" value="{{ Auth::user()->mobile_number }}" class="form-control" onKeyPress="if(this.value.length==13) return false;">
                                        @if ($errors->has('mobile_number'))
                                        <span class="error" role="alert">
                                            <strong>{{ $errors->first('mobile_number') }}</strong>
                                        </span>
                                        @endif
                                    </div>
                                </div>
                            </div>

                            <button type="submit" class="btn btn-success pull-right">Update Profile</button>
                            <div class="clearfix"></div>
                        </form>
                    </div>

                    <div class="card-body">
                        <h4 class="card-title">Change Password</h4>
                        <form method="POST" id="validate1" action="{{ route('admin-change-password') }}" enctype="multipart/form-data">
                            @csrf
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="bmd-label-floating">Password</label>
                                        <input type="password" id="password" name="password"  class="form-control required">
                                        @if ($errors->has('password'))
                                        <span class="error" role="alert">
                                            <strong>{{ $errors->first('password') }}</strong>
                                        </span>
                                        @endif
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label class="bmd-label-floating">Confirm Password</label>
                                        <input type="password" name="password_confirmation" class="form-control required">
                                        @if ($errors->has('password_confirmation'))
                                        <span class="error" role="alert">
                                            <strong>{{ $errors->first('password_confirmation') }}</strong>
                                        </span>
                                        @endif
                                    </div>
                                </div>
                            </div>
                            <button type="submit" class="btn btn-success pull-right">Change Password</button>
                            <div class="clearfix"></div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@section('admin::custom_js')
<script>
    $(document).ready(function () {
        $('#validate').validate({
            rules: {
                name:"required",
                mobile_code:"required",
                email: {
                    required:true,
                    email:true
                },
                mobile_number: {
                    required: true,
                    minlength:8,
                    maxlength:13,
                    number: true
                },
            },
            messages: {
                name:"please enter your name.",
                mobile_code:"please enter mobile code.",
                email: {
                    required:"please enter your email.",
                    email:"please enter a valid email."
                },
                mobile_number: {
                    required: "please enter your phone number.",
                    minlength:"phone number must be greater then 8 digit.",
                    maxlength:"phone number must be less then 13 digit.",
                    number: "phone must be an number type."
                },
            }
        });

        $('#validate1').validate({
            rules: {
                password: {
                    required:true,
                    minlength: 6
                },
                password_confirmation: {
                    required:true,
                    minlength: 6,
                    equalTo: "#password"
                }
            }, 
            messages: {
                password: {
                    required:"please enter a password.",
                    minlength: "password must of min 6 digit."
                },
                password_confirmation: {
                    required:"please enter confirm password.",
                    minlength: "password must of min 6 digit.",
                    equalTo: "confirm password does not matched."
                }
            }
        });

        var readURL = function (input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#PicturePreview').attr('src', e.target.result);
                }
                reader.readAsDataURL(input.files[0]);
            }
        }


        $("#picture").on('change', function () {
            readURL(this);
        });

        $("#PicturePreview").on('click', function () {
            $('#picture').click();
        });
    });
</script>
@endsection   

