<!-- Top navbar -->
<nav class="navbar navbar-top shadow navbar-expand-md navbar-dark d-lg-flex d-none" id="navbar-main">
    <div class="container-fluid">
        <!-- Brand -->
        <a class="h1 mb-0 d-none d-lg-inline-block"  style="color: #0861F2;" href="{{ route('home') }}">
            <strong>{{ __tr('Dashboard') }}</strong>
        </a>
        @if(session('loggedByVendor'))
        <a data-method="post" href="{{ route('vendor.user.write.logout_as') }}" class="h4 mb-0 d-none d-lg-inline-block lw-ajax-link-action px-5"><i class="fa fa-arrow-left"></i> {{ __tr('You (__userFullName__) are logged to this user account , click here to go back to your account', [
            '__userFullName__' => session('loggedByVendor.name')
        ]) }}</a>
        @elseif(session('loggedBySuperAdmin'))
        <a data-method="post" href="{{ route('central.vendors.user.write.logout_as') }}" class="h4 mb-0 d-none d-lg-inline-block lw-ajax-link-action px-5" ><i class="fa fa-arrow-left"></i> {{ __tr('You (__userFullName__) are logged to this vendor admin account , click here to go back to super admin section', [
            '__userFullName__' => session('loggedBySuperAdmin.name')
        ]) }}</a>
        @endif
        <!-- User -->
        <ul class="navbar-nav align-items-center d-none d-md-flex">
            @if(hasVendorAccess('messaging'))
            <li class="nav-item">
                <a class="nav-link lw-ajax-link-action" href="{{ route('vendor.disable.sound_message_sound_notification.write') }}"><i class="fa " :title="disableSoundForMessageNotification ? '{{ __tr('Sound Notifications are disabled for incoming messages') }}' : '{{ __tr('Sound Notifications are enabled for incoming messages') }}'" :class="disableSoundForMessageNotification ? 'fa-bell-slash' : 'fa-bell'"></i></a>
            </li>
            @endif
            <li class="nav-item">
            @include('layouts.navbars.locale-menu')
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <div class="media align-items-center">
                        <div class="media-body ml-2 d-none d-lg-block" style="color: #0861F2;">
                            <i class="fa fa-user circular-icon"style="font-size: 15px;" ></i> <span><strong>{{ getUserAuthInfo('profile.full_name') }}</strong></span>
                        </div>
                    </div>
                </a>
                <div class="dropdown-menu dropdown-menu-arrow dropdown-menu-right">
                    <div class=" dropdown-header noti-title">
                        <h6 class="text-overflow m-0">{{ __tr('Welcome __firstName__', [
                            '__firstName' => getUserAuthInfo('profile.first_name')
                        ]) }}</h6>
                    </div>
                    <a href="{{ route('user.profile.edit') }}" class="dropdown-item">
                        <i class="fa fa-user mr-1 circular-icon"></i>
                        <span><strong>{{ __tr('My Profile') }}</strong></span>
                    </a>
                    <div class="dropdown-divider"></div>
                    <a data-method="post" href="{{ route('auth.logout') }}" class="dropdown-item lw-ajax-link-action">
                        <i class="fas fa-sign-out-alt mr-1 circular-icon"></i>
                        <span><strong>{{ __tr('Logout') }}</strong></span>
                    </a>
                </div>
            </li>
        </ul>
    </div>
</nav>