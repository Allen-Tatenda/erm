<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RiskRating extends Model
{
    use HasFactory;

    protected $fillable = [
        'risk_id',
        'added_by',
        'likelihood',
        'impact',
        'risk_impact',
        'risk_exposure'
    ];

    public function risk(){
        return $this->belongsTo(Risks::class,'risk_id','id');
    }
}
