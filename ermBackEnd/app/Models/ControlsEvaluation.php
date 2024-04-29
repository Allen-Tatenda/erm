<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ControlsEvaluation extends Model
{
    use HasFactory;

    protected $fillable = [
        'risk_id',
        'code',
        'name',
        'control_type',
        'design',
        'operation_effectiveness',
        'documentation',
        'monitoring'
    ];

    public function risk()
    {
        return $this->belongsTo(Risks::class,'risk_id','id');
    }
}
