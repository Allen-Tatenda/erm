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
        'residual_impact',
        'residual_likelihood',
        'risk_exposure',
        'relevance_to_objectives',
        'risk_management_capacity',
    ];

    public function riskOwner(){
        return $this->belongsTo(User::class,'risk_owner_id','id');
    }

    public function controlsEvaluation()
    {
        return $this->hasMany(ControlsEvaluation::class);
    }
    public function criticalAssets()
    {
        return $this->hasMany(CriticalAssets::class);
    }
}
