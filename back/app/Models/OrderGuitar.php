<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderGuitar extends Model
{
    use HasFactory;

    public $table = 'order_guitar';

    protected $fillable = [
        'guitar_id', 'order_id'
    ];


    public function guitar()
    {

        return $this->belongsTo(Guitar::class, 'guitar_id');
    }

    public function order()
    {
        return $this->belongsTo(Order::class, 'order_id');
    }

    public $timestamps = false;
}
