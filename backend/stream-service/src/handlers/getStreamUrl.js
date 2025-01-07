// File: backend/stream-service/src/handlers/getStreamUrl.js
// Generates signed URLs for video streaming

const AWS = require('aws-sdk');
const s3 = new AWS.S3();
const dynamodb = new AWS.DynamoDB.DocumentClient();

exports.handler = async (event) => {
  const { id } = event.pathParameters;
  const streamsTable = process.env.STREAMS_TABLE;
  const mediaBucket = process.env.MEDIA_BUCKET;

  try {
    // TODO: Implement stream URL generation
    // TODO: Add authorization check
    // TODO: Handle HLS manifest generation
    // TODO: Implement CloudFront signing

    const params = {
      TableName: streamsTable,
      Key: { id }
    };

    const result = await dynamodb.get(params).promise();
    
    if (!result.Item) {
      return {
        statusCode: 404,
        body: JSON.stringify({ message: 'Stream not found' })
      };
    }

    // Generate signed URL for streaming
    const url = s3.getSignedUrl('getObject', {
      Bucket: mediaBucket,
      Key: `${id}/manifest.m3u8`,
      Expires: 3600 // 1 hour
    });

    return {
      statusCode: 200,
      body: JSON.stringify({ url })
    };
  } catch (error) {
    console.error('Error:', error);
    return {
      statusCode: 500,
      body: JSON.stringify({ message: 'Internal server error' })
    };
  }
};
