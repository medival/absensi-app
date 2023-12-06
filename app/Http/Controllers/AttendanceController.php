<?php

namespace App\Http\Controllers;

use App\Models\Attendance;
use Illuminate\Http\Request;

class AttendanceController extends Controller
{
    public function index()
    {
        return view('attendances.index', [
            "title" => "Absensi",
            "icon" => "file-text"
        ]);
    }

    public function create()
    {
        return view('attendances.create', [
            "title" => "Tambah Data Absensi",
            "icon" => "file-text"
        ]);
    }

    public function edit()
    {
        return view('attendances.edit', [
            "title" => "Edit Data Absensi",
            "icon" => "file-text",
            "attendance" => Attendance::findOrFail(request('id'))
        ]);
    }
}
