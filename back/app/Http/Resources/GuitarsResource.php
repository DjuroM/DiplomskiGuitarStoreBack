<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class GuitarsResource extends JsonResource
{
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
            'model' => $this->model,
            'price' => $this->price,
            'release_year' => $this->release_year,
            'image' => $this->image,
            'description' =>$this->description,
            'guitar_type' => [

                'id' => $this->guitarType->id,
                'type' => $this->guitarType->type
            ],
            'pickups' => [
                'id' => $this->pickups->id,
                'pickup_combination' => $this->pickups->pickup_combination,
                'pickup_description' => $this->pickups->pickup_description,
            ],
            'brand' => [
                'b_id' => $this->brand->id,
                'name' => $this->brand->name,
                'image' => $this->brand->image
            ]

        ];
    }
}
