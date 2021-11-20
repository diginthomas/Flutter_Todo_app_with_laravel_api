<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Todo;

class Api extends Controller
{
   public  function showAll(){
     $todo= Todo::all();
     return response()->json($todo);
   }
   public function show($id){
   	 $todo=Todo::find($id);
   	   return response()->json($todo);
   	 
   }
   public function insert(Request $req){
   	$todo= new Todo;
   	$todo->title=$req->post('title');
    $todo->message=$req->post('message');
   
    return $todo->save();
   }
   public function delete($id){
   	 $todo =Todo::findorFail($id);
   	$todo->delete();
}
  public function update( $id){
  	 $todo =Todo::findorFail($id);
  	$todo->title=$req->post('title');
    $todo->message=$req->post('message');
     return $todo->save();
  }
}
