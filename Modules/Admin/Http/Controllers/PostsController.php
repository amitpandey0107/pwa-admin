<?php

namespace Modules\Admin\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Auth;
use Validator;
use Toastr;
use Exception;
use App\User;
use App\RoleUser;
use App\Post;

class PostsController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return Response
     */
    public function index()
    {
        $posts = Post::get();
        return view('admin::post/index', compact('posts'));
    }

    /**
     * Show the form for creating a new resource.
     * @return Response
     */
    public function create()
    {

        return view('admin::post/create');
    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'title' => 'required|string|max:100',
            'description' => 'required|string|max:1000',
            'category' => 'required|string',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:5120',
            
            ], [
            'title.required' => 'Please enter title',  
            'description.required' => 'Please enter description',
            'category.required' => 'Please enter main category',
            'image' => 'please enter image in jpeg,png,jpg,gif,svg format',
            
        ]);
        if ($validator->fails()) {
            return redirect()->back()->withInput($request->all())->withErrors($validator->errors());
        } else {
            try{
                $data = $request->all();
                $fileName = null;
                if (request()->hasFile('image')) {
                    $file = request()->file('image');
                    $fileName = md5($file->getClientOriginalName() . time()) . "." . $file->getClientOriginalExtension();
                    $file->move('./uploads/posts/', $fileName);  
                    $data['image'] = $fileName;  
                }
                $data['user_id'] = $id = auth()->user()->id;                   
                Post::create($data);                
                return redirect()->back()->with('success',"Post Added Successfully!.");
            } catch (\Exception $e) {
                dd($e);
                return false;
            } 
        }
    }

    /**
     * Show the specified resource.
     * @param int $id
     * @return Response
     */
    public function show($id)
    {
        return view('admin::show');
    }

    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Response
     */
    public function edit($id)
    {
        return view('admin::edit');
    }

    /**
     * Update the specified resource in storage.
     * @param Request $request
     * @param int $id
     * @return Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     * @param int $id
     * @return Response
     */
    public function destroy($id)
    {
        //
    }
}
