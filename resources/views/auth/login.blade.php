@extends('layouts.auth')

@push('style')
<link rel="stylesheet" href="{{ asset('css/auth/login.css') }}">
@endpush

@section('content')

<div class="w-100">

    <main class="form-signin w-100 m-auto">
        <form method="POST" action="{{ route('auth.login') }}" id="login-form" class="w-60 m-auto">
            <div class="form-sign-title text-center">
                <h3>Silahkan masuk untuk absensi</h1>
                <h2>PT Bejana Cita Settara</h2>
            </div>

            <div class="form-floating">
                <input type="email" class="form-control" id="floatingInputEmail" name="email"
                    placeholder="name@example.com">
                <label for="floatingInputEmail">Email address</label>
            </div>
            <div class="form-floating">
                <input type="password" class="form-control" id="floatingPassword" name="password"
                    placeholder="Password">
                <label for="floatingPassword">Password</label>
            </div>

            <div class="empty-div mt-3 mb-3"></div>

            <button class="w-100 btn btn-primary" type="submit" id="login-form-button">Masuk</button>
            <!-- <p class="mt-5 mb-3 text-muted">&copy; 2022 Absensi App</p> -->
        </form>
    </main>

</div>
@endsection

@push('script')
<script type="module" src="{{ asset('js/auth/login.js') }}"></script>
@endpush