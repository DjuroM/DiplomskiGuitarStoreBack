<?php

namespace App\Http\Controllers;

use App\Http\Requests\StoreBasketRequest;
use App\Http\Resources\BasketResource;
use App\Models\Basket;
use App\Traits\HttpResponses;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class BasketController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    use HttpResponses;


    public function index()
    {
        return response()->json(BasketResource::collection(
            Basket::where('user_id', Auth::user()->id)->get()
        ));

        return Basket::where('user_id', Auth::user()->id)->with('user', 'guitar')->get();
    }

    public function index1($id)
    {
        $data = Basket::with('user', 'guitar')->where('user_id', $id)->get();
        return $data;
    }



    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreBasketRequest $request)
    {
        $request->validated($request->all());
        $basket = Basket::create([
            'user_id' => Auth::user()->id,
            'guitar_id' => $request->guitar_id,
        ]);
        return new BasketResource($basket);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Basket  $basket
     * @return \Illuminate\Http\Response
     */
    public function show(Basket $basket)
    {
        return $this->isNotAuthorized($basket) ? $this->isNotAuthorized($basket) : new BasketResource($basket);
    }
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Basket  $basket
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $basket)
    {
        if (Auth::user()->id !== $basket->user_id) {
            return $this->error('', 'You are not authorized to make this request', 403);
        }
        $basket->update($request->all());
        return new BasketResource($basket);
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Basket  $basket
     * @return \Illuminate\Http\Response
     */
    public function destroy(Basket $basket)
    {
        return $this->isNotAuthorized($basket) ? $this->isNotAuthorized($basket) : $basket->delete($basket);
    }

    private function isNotAuthorized(Basket $basket)
    {
        if (Auth::user()->id !== $basket->user_id) {
            return $this->error('', 'You are not authorized to make this request', 403);
        }
    }
}
