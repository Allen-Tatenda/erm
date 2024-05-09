<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RiskResponse extends Model
{
    use HasFactory;

    protected $fillable = [
        'risk_id',
        'added_by',
        'risk_response'
    ];
}
