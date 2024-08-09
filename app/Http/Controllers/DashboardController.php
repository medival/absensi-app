<?php

namespace App\Http\Controllers;

use App\Models\Position;
use App\Models\User;
use App\Models\Holiday;
use App\Models\Presence;

use Illuminate\Http\Request;

class DashboardController extends Controller
{
    public function index()
    {
        return view('dashboard.index', [
            "title" => "Dashboard",
            "icon" => "home",
            "positionCount" => Position::count(),
            "userCount" => User::count(),
            "holidayCount" => Holiday::count(),
            "presenceCount" => Presence::count(),
        ]);
    }
}