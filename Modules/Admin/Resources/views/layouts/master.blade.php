<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="content-type" content="text/html;charset=utf-8" />
        @include('admin::pages.head')
        <!-- Styles -->
        @include('admin::pages.style')
        @yield('admin::custom_css')
        <!-- End Styles -->
    </head>
    <body>
        @include('admin::pages.header')
        @include('admin::pages.side_bar')
        @yield('admin::content')
        @include('admin::pages.footer')
        <!-- JavaScript -->
        @include('admin::pages.script')
        @yield('admin::script')
        @yield('admin::custom_js')
        <!-- @include('toast') -->
        @include('success-error-message')
        {!! Toastr::message() !!}

        <!-- End Javascript -->
    </body>
</html>
