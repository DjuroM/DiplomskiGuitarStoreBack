<?php

namespace App\Http\Resources;

use App\Http\Controllers\OrderGuitarController;
use App\Models\Guitar;
use App\Models\OrderGuitar;
use Illuminate\Http\Resources\Json\JsonResource;

class OrdersResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        $odg = new OrderGuitarController;

        $guitars = $odg->show($this->id);
        // return $guitars;

        return [
            'id' => $this->id,

            'price' => $this->price,
            'order_date' => $this->order_date,
            'address' => $this->address,


            'user' => [
                'id' => $this->user->id,
                'name' => $this->user->name,
                'surname' => $this->user->surname,
                'username' => $this->user->username,
                'email' => $this->user->email,
            ],
            'country' => [
                'id' => $this->country->id,
                'country' => $this->country->country
            ],
            'guitars' => $guitars

        ];
    }
}
