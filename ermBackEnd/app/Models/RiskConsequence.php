<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RiskConsequence extends Model
{
    use HasFactory;

    protected $fillable = [
        'risk_id',
        'added_by',
        'consequence',
        'description',
    ];

    public function risk(){
        return $this->belongsTo(Risks::class,'risk_id','id');
    }
}
