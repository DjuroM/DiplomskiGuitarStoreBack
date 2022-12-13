<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreOrderRequest;
use App\Http\Resources\OrdersResource;
use App\Models\Order;
use App\Models\OrderGuitar;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Traits\HttpResponses;

class OrderController extends Controller
{
    use HttpResponses;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index()
    {
        return response()->json(OrdersResource::collection(
            Order::where('user_id', Auth::user()->id)->get()
        ));
    }




    public function store(StoreOrderRequest $request)
    {
        if (Auth::user()->id !== $request->user_id) {
            return $this->error('', 'You are not authorized to make this request', 403);
        }

        $request->validated($request->all());



        $order = Order::create([
            'user_id' => Auth::user()->id,
            'address' => $request->address,
            'country_id' => $request->country_id,
            'order_date' => $request->order_date,
            'price' => $request->price
        ]);



        $data = array();

        foreach ($request->guitars as $guitar) {
            $guitarID = $guitar['id'];
            $data[] = [
                'order_id' => $order->id,
                'guitar_id' => $guitarID
            ];
        }


        $odg = new OrderGuitarController;

        $req = new Request($data);

        $odg->store($req);

        return new OrdersResource($order);
    }


    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function show(Order $order)
    {

        return $this->isNotAuthorized($order) ? $this->isNotAuthorized($order) : new OrdersResource($order);
    }



    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Order $order)
    {
        if (Auth::user()->id !== $order->user_id) {
            return $this->error('', 'You are not authorized to make this request', 403);
        }
        $order->update($request->all());

        return new OrdersResource($order);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Order  $order
     * @return \Illuminate\Http\Response
     */
    public function destroy(Order $order)
    {
        return $this->isNotAuthorized($order) ? $this->isNotAuthorized($order) : $order->delete($order);
    }


    private function isNotAuthorized(Order $order)
    {
        if (Auth::user()->id !== $order->user_id) {
            return $this->error('', 'You are not authorized to make this request', 403);
        }
    }
}
