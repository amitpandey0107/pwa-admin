<?php

namespace App\Exports;

use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;

class ExportExcelController implements FromView
{



      public function view(): View
      {
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
                return view('excel.index',compact('data'));
                // $filename = 'service_data_'.$farmData->id.'_'.date('YmdHis').'.csv';
                // Excel::store($data, 'public/csv/'.$filename);
                // return response()->json([
                //     'status_code' => 200,
                //     'response' => 'success',
                //     'message'   => 'Data exported successfully!!',
                //     'data' => asset('storage/csv/'.$filename)
                // ]);
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

    	
    		return Excel::download(new ExportExcelController, 'invoices.xlsx');

    	}catch(\Exception $e){
    		dd($e);
    	}
    }




}
