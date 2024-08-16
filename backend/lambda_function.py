import json
import boto3

# Initialize DynamoDB client
dynamodb = boto3.resource('dynamodb')
table_name = 'VisitorCount'
table = dynamodb.Table(table_name)

# Function to increment visitor count
def increment_visitor_count():
    table.update_item(
        Key={'id': 0},
        UpdateExpression='ADD visitor_count :incr',
        ExpressionAttributeValues={':incr': 1}
    )

# Function to get current visitor count
def get_visitor_count():
    response = table.get_item(
        Key={'id': 0},
        AttributesToGet=['visitor_count']
    )
    item = response.get('Item')
    return item.get('visitor_count', 0) if item else 0

def lambda_handler(event, context):
    increment_visitor_count()
    visitorCount = get_visitor_count()
    return {
        'statusCode': 200,
        'headers': {'Content-Type': 'application/json'},
        'body': json.dumps(f'{visitorCount}')
    }