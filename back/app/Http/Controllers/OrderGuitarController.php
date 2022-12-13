<?php

namespace App\Http\Controllers;

use App\Http\Resources\GuitarsResource;
use App\Http\Resources\OrderGuitarResource;
use App\Models\Basket;
use App\Models\Guitar;
use App\Models\Order;
use App\Models\OrderGuitar;
use App\Traits\HttpResponses;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class OrderGuitarController extends Controller
{

    use HttpResponses;


    public function index()
    {

        // $data = OrderGuitar::with('guitar')->get();
        // return $data;

        return OrderGuitarResource::collection(
            OrderGuitar::all()
        );
    }

    public function getAllGuitars($orderId)
    {
        return OrderGuitarResource::collection(
            OrderGuitar::where('order_id', $orderId)::all()
        );
    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try {
            $data = OrderGuitar::insert($request->all());
            Basket::where('user_id', Auth::user()->id)->delete();
        } catch (Exception $e) {
            return '{"error" : "Taj brend vec postoji"}';
        }
        return $data;
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Brand  $brand
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $orderGuitarDetail = DB::select(DB::raw(
            "SELECT g.id, g.release_year, g.model,g.guitar_type_id,g.pickups_id,g.price,g.image,g.description, g.brand_id 
            FROM guitar_store.order_guitar og 
            inner join guitar_store.guitar g on g.id = og.guitar_id  
            where og.order_id = "  . $id . " ;"
        ));

        $guitars = array();
        foreach ($orderGuitarDetail as $guitar) {

            $guitarM = new Guitar;
            $guitarM->fill([
                'id' => $guitar->id,
                'guitar_type_id' => $guitar->guitar_type_id,
                'release_year' => $guitar->release_year,
                'model' => $guitar->model,
                'pickups_id' => $guitar->pickups_id,
                'price' => $guitar->price,
                'description' => $guitar->description,
                'brand_id' => $guitar->brand_id,
                'image' => $guitar->image
            ]);
            array_push($guitars, $guitarM);
        }

        return GuitarsResource::collection(
            $guitars
        );
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Brand  $brand
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Brand  $brand
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
    }
}
