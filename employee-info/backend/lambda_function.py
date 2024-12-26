import json
import boto3

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('EmployeeInfo')

def lambda_handler(event, context):
    data = json.loads(event['body'])
    table.put_item(Item={
        'EmployeeID': data['employeeId'],
        'Name': data['name'],
        'Department': data['department'],
        'Email': data['email'],
    })
    return {
        'statusCode': 200,
        'body': json.dumps({'message': 'Employee added successfully'})
    }
