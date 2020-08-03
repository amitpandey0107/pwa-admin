<?php

namespace App\Http\Controllers\API;

use App\Exports\FarmerData;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Controllers\BaseAPIController;
use Illuminate\Support\Facades\Input;
use Maatwebsite\Excel\Facades\Excel;
use App\Http\Requests;
use Exception;
use DateTime;
use Mail;
use Auth;
use Config;
use Validator;
use JWTAuth;
use JWTAuthException;
use Hash;
use App\Category;
use App\ExtensionManager;
use App\Farm;
use App\Lead;
use App\Notify;
use App\Page;
use App\Password_reset;
use App\Role;
use App\RoleUser;
use App\Service;
use App\Status;
use App\User;
use App\TaskList;
use App\Comment;
use App\Question;
use App\QuestionsOption;
use App\QuestionResponse;
use App\Exports\PostExport;
use App\CancelBooking;
use App\Faq;
use App\Notification;

class ExportExcelController extends Controller
{

    public function __construct(User $User) {
        $this->User = $User;
    }



      public function exportCSV(Request $request) {
        $data = $request->all();  
        $validator = Validator::make($data, [
            'id' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status_code' => 500,
                'response' => 'error',
                'message' => implode(",",$validator->messages()->all()),
            ]);
        }
        try {
            $farmData = Lead::where('id',$data['id'])->first();
            if ($farmData) {
                $address = $farmData->getFarmName->city.', '.$farmData->getFarmName->district.', '.$farmData->getFarmName->postal_code; 
                $consultant_id = 0;
                $consultant_name = '';
                if ($farmData->consultant_id!=null || $farmData->consultant_id!="") {
                    $consultant_id = $farmData->consultant_id;
                    $consultant_name = $farmData->getConsultantName->name;
                }
                $status_array = array(
                    "0" => 'Pending',
                    "1" => 'In Process',
                    "2" => 'Assigned',
                    "3" => 'Hold',
                    "4" => 'Completed',
                    "5" => 'Cancel',
                );
                $status = '';
                foreach ($status_array as $key => $v) {
                    if ($key == $farmData->status) {
                        $status = $v;
                    }
                }
                $data = [
                    'id' => $farmData->id,
                    'land_size' => $farmData->getFarmName->land_size,
                    'farm_id' => $farmData->getFarmName->id,
                    'farm_name' => $farmData->getFarmName->farm_name,
                    'address' => $address,
                    'problem' => $farmData->information,
                    'category' => $farmData->getCategoryName->category_name,
                    'altNumber' => $farmData->alt_contact_number,
                    'status' => $status,
                    'consultant_id' => $consultant_id,
                    'consultant_name' => $consultant_name,
                    'key' =>$farmData->id,
                ];

                // dd(User::all());
                // dd($data);

                $filename = 'service_data_'.$farmData->id.'_'.date('YmdHis').'.csv';
                Excel::store($data, 'public/csv/'.$filename);
                return response()->json([
                    'status_code' => 200,
                    'response' => 'success',
                    'message'   => 'Data exported successfully!!',
                    'data' => asset('storage/csv/'.$filename)
                ]);
            } else  {
                return response()->json([
                    'status_code' => 500,
                    'response' => 'error',
                    'message'   => 'No record found',
                ]);
            }


        } catch(Exception $e){
            return response()->json([
                'status_code' => 500,
                'response' => 'error',
                'message' => "Technical error, please contact to admin",
            ]); 
        } 

       
        // try {

        //     $filename = 'service_data_'.date('YmdHis').'.csv';
        //     Excel::store(new PostExport, 'public/csv/'.$filename);
        //     return response()->json([
        //         'status_code' => 200,
        //         'response' => 'success',
        //         'message'   => 'CSV generated and saved successfully!',
        //         'data' => asset('storage/csv/'.$filename)
        //     ]);
        // } catch(Exception $e){
        //     return response()->json([
        //         'status_code' => 500,
        //         'response' => 'error',
        //         'message' => "Technical error, please contact to admin",
        //     ]); 
        // } 
    }


   
    public function exportExcel(Request $request){
    	try{
    		 $filename = 'service_data_'.date('YmdHis').'.csv';
      		 \Excel::store(new FarmerData($request->id), 'public/csv/'.$filename);
    		return response()->json([
                'status_code' => 200,
                'response' => 'success',
                'message'   => 'CSV generated and saved successfully!',
                'data' => asset('storage/csv/'.$filename)
            ]);

    	}catch(\Exception $e){
    		dd($e);
    		return response()->json([
                'status_code' => 500,
                'response' => 'error',
                'message' => "Technical error, please contact to admin",
            ]);
    	}
    }




    /*==============================================
    EXPORT REPORT
    ===============================================*/
    public function export_report(Request $request) {
        $data = $request->all();  
        $validator = Validator::make($data, [
            'id' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status_code' => 500,
                'response' => 'error',
                'message' => implode(",",$validator->messages()->all()),
            ]);
        }
        try {

            $lead = Lead::where('id',$data['id'])->first();
            $service_id = (int)1000000000 + (int)$lead->id;
            $filename = 'service_request_'.$service_id.'_'.date('YmdHis').'.csv';
            // Excel::store($lead, 'public/csv/'.$filename);
            // $filename = 'service_data_'.date('YmdHis').'.csv';
            \Excel::store(new FarmerData($request->id), 'public/csv/'.$filename);
            return response()->json([
                'status_code' => 200,
                'response' => 'success',
                'message'   => 'Data exported successfully!!',
                'data' => asset('storage/csv/'.$filename)
            ]);
        } catch(Exception $e){
            dd($e);
            return response()->json([
                'status_code' => 500,
                'response' => 'error',
                'message' => "Technical error, please contact to admin",
            ]); 
        } 
    }



}
