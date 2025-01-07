// File: backend/article-service/src/handlers/getArticle.js
// Retrieves article content from DynamoDB

const AWS = require('aws-sdk');
const dynamodb = new AWS.DynamoDB.DocumentClient();

exports.handler = async (event) => {
  const { id } = event.pathParameters;
  const tableName = process.env.ARTICLES_TABLE;

  try {
    // TODO: Implement article retrieval
    // TODO: Add authorization check
    // TODO: Add caching layer
    const params = {
      TableName: tableName,
      Key: { id }
    };

    const result = await dynamodb.get(params).promise();
    
    if (!result.Item) {
      return {
        statusCode: 404,
        body: JSON.stringify({ message: 'Article not found' })
      };
    }

    return {
      statusCode: 200,
      body: JSON.stringify(result.Item)
    };
  } catch (error) {
    console.error('Error:', error);
    return {
      statusCode: 500,
      body: JSON.stringify({ message: 'Internal server error' })
    };
  }
};
