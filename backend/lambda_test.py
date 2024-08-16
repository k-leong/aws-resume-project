import unittest
import boto3
from moto import mock_aws
import json
from lambda_function import lambda_handler, increment_visitor_count, get_visitor_count

@mock_aws
class TestLambdaFunction(unittest.TestCase):

    def setUp(self):
        # Set up the mocked DynamoDB table
        self.table_name = 'VisitorCount'
        self.dynamodb = boto3.resource('dynamodb', region_name='us-west-1')
        self.table = self.dynamodb.create_table(
            TableName=self.table_name,
            KeySchema=[
                {
                    'AttributeName': 'id',
                    'KeyType': 'HASH'
                }
            ],
            AttributeDefinitions=[
                {
                    'AttributeName': 'id',
                    'AttributeType': 'N'
                }
            ],
            ProvisionedThroughput={
                'ReadCapacityUnits': 5,
                'WriteCapacityUnits': 5
            }
        )
        # Put an initial item in the table
        self.table.put_item(Item={'id': 0, 'visitor_count': 0})

    def tearDown(self):
        self.table.delete()

    def test_increment_visitor_count(self):
        # Test the increment function
        increment_visitor_count()
        response = self.table.get_item(Key={'id': 0})
        item = response.get('Item')
        self.assertEqual(item['visitor_count'], 1)

    def test_get_visitor_count(self):
        # Test the get function
        visitor_count = get_visitor_count()
        self.assertEqual(visitor_count, 0)

        # Increment and then test
        increment_visitor_count()
        visitor_count = get_visitor_count()
        self.assertEqual(visitor_count, 1)

    def test_lambda_handler(self):
        # Test the lambda handler function
        event = {}
        context = {}
        response = lambda_handler(event, context)
        body = json.loads(response['body'])

        self.assertEqual(response['statusCode'], 200)
        self.assertEqual(body, '1')

if __name__ == '__main__':
    unittest.main()
