<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RiskCause extends Model
{
    use HasFactory;

    protected $fillable = [
        'risk_id',
        'added_by',
        'cause',
        'description',
    ];

    public function risk(){
        return $this->belongsTo(Risks::class,'risk_id','id');
    }
}
