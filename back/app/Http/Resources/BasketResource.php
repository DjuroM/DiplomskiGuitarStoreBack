<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class BasketResource extends JsonResource
{
    public static $wrap = null;
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'id' => $this->id,
            'user' => [
                'id' => $this->user->id,
                'name' => $this->user->name,
                'surname' => $this->user->surname,
                'username' => $this->user->username,
                'email' => $this->user->email,
            ],
            'guitar' => [
                'id' => $this->guitar->id,
                'model' => $this->guitar->model,
                'price' => $this->guitar->price,
                'release_year' => $this->guitar->release_year,
                'image' => $this->guitar->image,
                'description' => $this->guitar->description,
                'guitar_type' => [
                    'id' => $this->guitar->guitarType->id,
                    'type' => $this->guitar->guitarType->type
                ],
                'pickups' => [
                    'id' => $this->guitar->pickups->id,
                    'pickup_combination' => $this->guitar->pickups->pickup_combination,
                    'pickup_description' => $this->guitar->pickups->pickup_description,
                ],
                'brand' => [
                    'b_id' => $this->guitar->brand->id,
                    'name' => $this->guitar->brand->name,
                    'image' => $this->guitar->brand->image
                ]


            ]
        ];
    }
}
