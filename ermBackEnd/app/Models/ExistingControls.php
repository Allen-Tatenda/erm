<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ExistingControls extends Model
{
    use HasFactory;

    protected $fillable = [
        'risk_id',
        'control_name',
        'control_description',
        'control_owner',
        'effectiveness',
        'control_type'
    ];
}
