<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Discussions extends Model
{
    use HasFactory;

    protected $fillable = [
            'discussion_owner_id',
            'item_id',
            'discussion_text',
            'date',
    ];

    public function author(){
        return $this->belongsTo(User::class,'discussion_owner_id','id');
    }

}
