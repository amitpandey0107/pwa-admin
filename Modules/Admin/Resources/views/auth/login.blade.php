<!DOCTYPE html>
<html lang="en">
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <head>
        <meta charset="utf-8" />
        <link rel="apple-touch-icon" href="{{ asset('images/favicon-32x32.png') }}" sizes="32x32"/>
        <link rel="icon" type="image/png" href="{{ asset('images/favicon-16x16.png')}}"  sizes="16x16" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
        <title>
            Farmer Admin login
        </title>
        <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
        <!-- Extra details for Live View on GitHub Pages -->
        
        <!--     Fonts and icons     -->
        <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700|Roboto+Slab:400,700|Material+Icons" />
        <link rel="stylesheet" href="{{ asset('css/font-awesome.min.css') }}">
        <!-- CSS Files -->
        <link href="{{ asset('css/material-dashboard.minf066.css?v=2.1.0') }}" rel="stylesheet" />

        <style>
        label.error {width: 100%; text-align: left; margin-top: 10px; color: red !important; padding-left:55px; }
        </style>
    </head>
    <body class="off-canvas-sidebar">
        <div class="container">
            <div class="row">

                <div class="col-lg-4 col-md-6 col-sm-8 ml-auto mr-auto" style="padding-top: 10%;">
                    <h1 style="text-align: center;"> </h1>
                    <form method="POST" id="loginform" action="{{ route('login') }}">
                        @csrf
                        @if ($message = Session::get('error'))
                        <div class="alert alert-danger alert-block">
                            <button type="button" class="close" data-dismiss="alert">×</button>	
                            <strong>{{ $message }}</strong>
                        </div>
                        @endif
                        <div class="card card-login card-hidden">
                            <div class="card-header card-header-rose text-center" style="background: linear-gradient(60deg,#7dbb57,#368bbe);">
                                <h4 class="card-title">
                                    Farmer
                                    <!--<img src="{{ asset('images/logo.png')}}"/>-->
                                </h4>
                            </div>
                            <div class="card-body ">
                                <p class="card-description text-center"></p>
                                <span class="bmd-form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class="material-icons">email</i>
                                            </span>
                                        </div>
                                        <input id="email" type="email" placeholder="Email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ old('email') }}"  autofocus style="width:80%; text-align:left;">

                                        @if ($errors->has('email'))
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $errors->first('email') }}</strong>
                                        </span>
                                        @endif
                                    </div>
                                </span><br/>
                                <span class="bmd-form-group">
                                    <div class="input-group">
                                        <div class="input-group-prepend">
                                            <span class="input-group-text">
                                                <i class="material-icons">lock_outline</i>
                                            </span>
                                        </div>
                                        <input id="password" type="password" placeholder="Password" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" style="width:80%; text-align:left;">

                                        @if ($errors->has('password'))
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $errors->first('password') }}</strong>
                                        </span>
                                        @endif
                                    </div>
                                </span>
<!--                                <span class="bmd-form-group">
                                    <div class="input-group">
                                        <input class="form-check-input" type="checkbox" name="remember" id="remember" {{ old('remember') ? 'checked' : '' }}>

                                               <label class="form-check-label form-control" for="remember">
                                            {{ __('Remember Me') }}
                                        </label>
                                    </div>
                                </span>-->
                            </div>
                            <div class="card-footer justify-content-center">
                                <a href="javascript:void()" class="btn btn-rose btn-link btn-lg">
                                    <button type="submit" class="btn btn-primary" style="background-color: #7dbb57;">
                                        {{ __('Login') }}
                                    </button>
                                </a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
    
</html>
<!--   Core JS Files   -->
<script src="{{ asset('js/core/jquery.min.js') }}"></script>
<script src="{{ asset('js/core/popper.min.js') }}"></script>
<script src="{{ asset('js/core/bootstrap-material-design.min.js') }}"></script>
<script src="{{ asset('js/plugins/perfect-scrollbar.jquery.min.js') }}"></script>
<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="{{ asset('js/buttons.js') }}"></script>
<!--  Notifications Plugin    -->
<script src="{{ asset('js/plugins/bootstrap-notify.js') }}"></script>
<script src="{{ asset('js/jquery.validate.min.js') }}"></script>


<script type="text/javascript">
$(document).ready(function () {
	$('#loginform').validate({
        rules:{
            email: {
                required:true,
                emai:true
            }, 
            password:"required"
        }, 
        messages:{
            email: {
                required:"Please enter email address",
                emai:"Please enter valid email address"
            }, 
            password:"Please enter login password"
        }
	});
});
</script>

