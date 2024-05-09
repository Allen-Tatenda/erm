<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Risks extends Model
{
    use HasFactory;

    protected $fillable = [
        'risk_id',
        'risk_owner_id',
        'risk_name',
        'priority',
        'risk_description',
        'risk_category',
        'risk_division',
        'strategic_objective'
    ];

    public function riskOwner(){
        return $this->belongsTo(User::class,'risk_owner_id','id');
    }

    public function consequences(){
        return $this->hasMany(RiskConsequence::class,'risk_id','id');
    }
}
