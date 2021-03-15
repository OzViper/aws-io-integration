from __future__ import print_function
from boto3.session import Session

import json
import os
import boto3
import traceback

code_pipeline = boto3.client('codepipeline')
ssm = boto3.client('ssm')

def lambda_handler(event, context):
    
    try: 
        # Extract the Job ID
        job_id = event['CodePipeline.job']['id']
            
        # Extract the Job Data 
        job_data = event['CodePipeline.job']['data']
        
        os.system("echo Run Polaris Static Application Security Testing")
        
        parameter = ssm.get_parameter(Name='IO_IS_SAST_ENABLED')
        print(parameter['Parameter']['Value'])
        
        print("Success")
        code_pipeline.put_job_success_result(jobId=job_id)
        
    except Exception as e:
        # If any other exceptions which we didn't expect are raised
        # then fail the job and log the exception message.
        print('Function failed due to exception.') 
        print(e)
        traceback.print_exc()
        put_job_failure(job_id, 'Function exception: ' + str(e))
      
    print('Function complete.')   
    
    return {
        'statusCode': 200,
        'body': json.dumps('Success')
    }
