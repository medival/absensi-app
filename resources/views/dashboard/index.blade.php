@extends('layouts.app')

@section('content')
<div>
    <div class="row">
        <div class="col-md-3">
            <div class="card shadow">
                <div class="card-body">
                    <h6 class="fs-3 fw-light">Data Jabatan</h6>
                    <h4 class="fw-bold">{{ $positionCount }}</h4>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card shadow">
                <div class="card-body">
                    <h6 class="fs-3 fw-light">Jumlah Karyawan</h6>
                    <h4 class="fw-bold">{{ $userCount }}</h4>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card shadow">
                <div class="card-body">
                    <h6 class="fs-3 fw-light">Jumlah Hari Libur</h6>
                    <h4 class="fw-bold">{{ $holidayCount }}</h4>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="card shadow">
                <div class="card-body">
                    <h6 class="fs-3 fw-light">Jumlah Kehadiran</h6>
                    <h4 class="fw-bold">{{ $presenceCount }}</h4>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection