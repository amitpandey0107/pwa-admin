
@extends('admin::layouts.master')
@section('admin::content')
<div class="content">
    <div class="content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card ">
                        <div class="card-header card-header-success card-header-icon">
                            <div class="card-icon">
                                <i class="material-icons">dashboard</i>
                            </div>
                            <h4 class="card-title">Dashboard</h4>
                        </div>
                        <div class="card-body ">
                            <div class="row">

                                <div class="col-lg-3 col-md-6 col-sm-6">
                                    <a href="">
                                    <div class="card card-stats">
                                        <div class="card-header card-header-warning card-header-icon">
                                        <div class="card-icon">
                                            <i class="material-icons">people</i>
                                        </div>
                                        <p class="card-category">User</p>
                                        <h3 class="card-title">{{$user}}</h3>
                                        </div>
                                        <div class="card-footer">
                                        <div class="stats">
                                            <i class="material-icons">people</i>
                                            Total numbers of User
                                        </div>
                                        </div>
                                    </div>
                                    </a>
                                </div>

                                <div class="col-lg-3 col-md-6 col-sm-6">
                                    <a href="">
                                    <div class="card card-stats">
                                        <div class="card-header card-header-rose card-header-icon">
                                        <div class="card-icon">
                                            <i class="material-icons">people</i>
                                        </div>
                                        <p class="card-category">Post</p>
                                        <h3 class="card-title">100</h3>
                                        </div>
                                        <div class="card-footer">
                                        <div class="stats">
                                            <i class="material-icons">people</i>
                                            Total numbers of Post
                                        </div>
                                        </div>
                                    </div>
                                    </a>
                                </div>

                                <div class="col-lg-3 col-md-6 col-sm-6">
                                    <a href="">
                                    <div class="card card-stats">
                                        <div class="card-header card-header-success card-header-icon">
                                        <div class="card-icon">
                                            <i class="material-icons">category</i>
                                        </div>
                                        <p class="card-category">Categories</p>
                                        <h3 class="card-title">658</h3>
                                        </div>
                                        <div class="card-footer">
                                        <div class="stats">
                                            <i class="material-icons">category</i>
                                            Total numbers of Category
                                        </div>
                                        </div>
                                    </div>
                                    </a>
                                </div>

                                <div class="col-lg-3 col-md-6 col-sm-6">
                                    <a href="">
                                    <div class="card card-stats">
                                        <div class="card-header card-header-info card-header-icon">
                                        <div class="card-icon">
                                            <i class="material-icons">build</i>
                                        </div>
                                        <p class="card-category">Services</p>
                                        <h3 class="card-title">555</h3>
                                        </div>
                                        <div class="card-footer">
                                        <div class="stats">
                                            <i class="material-icons">build</i>
                                            Total numbers of Services
                                        </div>
                                        </div>
                                    </div>
                                    </a>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        @endsection
