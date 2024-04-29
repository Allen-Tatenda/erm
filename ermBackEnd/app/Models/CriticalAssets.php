<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CriticalAssets extends Model
{
    use HasFactory;

    protected $fillable = [
        'asset_id',
        'asset_type',
        'asset',
        'location',
        'purchase_date',
        'purchase_price',
        'current_value',
        'depreciation',
        'expected_lifespan',
        'category',
        'owner_id',
        'risk_id',
        'status',
    ];

    public function user(){
        return $this->belongsTo(User::class,'owner_id','id');
    }

    public function risks(){
        return $this->belongsTo(Risks::class,'risk_id','id');
    }
}
