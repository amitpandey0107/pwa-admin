<?php $urlName = Request::segment(2); ?>
<div class="sidebar" data-color="rose" data-background-color="black" data-image="{{asset('img/sidebar-1.jpg') }}">
    <div class="logo">       
        <a href="{{ route('dashboard')  }}" class="simple-text logo-normal">
            PWA
        </a>
    </div>
    <div class="sidebar-wrapper">
        <ul class="nav">
            <li class="nav-item <?php if($urlName == '/' || $urlName == 'dashboard'){ echo "active"; }       ?>">
                <a class="nav-link" href="{{ route('dashboard')  }}">
                    <i class="material-icons">dashboard</i>
                    <p> Dashboard </p>
                </a>
            </li>          
            <li class="nav-item">
                <a class="nav-link" href="{{ route('users')}}">
                    <i class="material-icons">people_alt</i>
                    <p> Manage Users </p>
                </a>
            </li> 
            <li class="nav-item">
                <a class="nav-link" href="{{ route('post')}}">
                    <i class="material-icons">event</i>
                    <p> Manage Events </p>
                </a>
            </li>           
        </ul>
    </div>
</div>
