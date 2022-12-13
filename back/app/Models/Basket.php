<?php

namespace App\Models;

use App\Http\Resources\GuitarsResource;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Basket extends Model
{
    use HasFactory;

    public $table = 'basket';

    protected $fillable = [
        'user_id', 'guitar_id'
    ];

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }
    public function guitar()
    {
        return $this->belongsTo(Guitar::class, 'guitar_id');
    }

    public $timestamps = false;
}
