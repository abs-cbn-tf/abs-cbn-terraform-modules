exports.handler = async (event, context) => {
    // Extracting information from the event object, if needed
    // For example, event.name
    
    // The response body
    const body = {
      message: 'Hello, World! I am currently learning terraform modules!'
    };
    
    // The response object
    const response = {
      statusCode: 200,
      body: JSON.stringify(body)
    };
    
    return response;
  };