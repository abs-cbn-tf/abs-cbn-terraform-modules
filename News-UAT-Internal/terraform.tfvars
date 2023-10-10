aws_region = "ap-southeast-1"
profile    = "News-UAT-Internal"
# FOR LAMBDAS WITH EVENTS TRIGGER
#FOR LAMBDAS WITH APIGW TRIGGER
apigw_function_configurations_1 = {
  # apigw_function 1
  function_name = "imp-news-wb-lite-api"
  iam_role_name = "imp-news-wb-lite-api-role"
  runtime       = "nodejs18.x"
  handler       = "index.handler"
  memory        = 128
  env_var = {
    CMS_BASE_URL                = ""
    CMS_PWD                     = ""
    CMS_USER                    = ""
    DB_MAX_POOL_SIZE            = ""
    DB_SOCKET_TIMEOUT           = ""
    HEADER_TIMEOUT              = ""
    KEEP_ALIVE_TIMEOUT          = ""
    MONGODB_URL                 = ""
    MONGO_GRAPHQL_API_KEY       = ""
    MONGO_GRAPHQL_URL           = ""
    NODE_ENV                    = ""
    WB_ARTICLE_CONTENT_TEMPLATE = ""
    WB_ARTICLE_PROFILE          = ""
    WB_DESK                     = ""
    WB_DRAFT_STAGE              = ""
    WB_FOR_REVISION_STAGE       = ""
    WB_PUSH_DESK                = ""
    WB_READY_FOR_REVIEW_STAGE   = ""
  }
  my_lambda_tags = {
    App         = "News"
    Environment = "UAT"
  }
}

apigw_configurations_1 = {
  # apigw 1
  apigw_name    = "imp-news-wb-lite-api"
  resource_name = "{proxy+}"
  method_name   = "ANY"
  stage_name    = "Prod"
  api_key       = "imp-news-wb-lite-api-key"
  usage_plan    = "imp-news-wb-lite-api-plan"
}

apigw_function_configurations_2 = {
  # apigw_function 1
  function_name = "imp-news-image-upload"
  iam_role_name = "imp-news-image-upload-role"
  runtime       = "nodejs18.x"
  handler       = "index.handler"
  memory        = 128
  env_var = {
    BUCKET_NAME   = ""
    IMAGE_SERVICE = ""
  }
  my_lambda_tags = {
    App         = "News"
    Environment = "UAT"
  }
}

apigw_configurations_2 = {
  # apigw 1
  apigw_name    = "imp-news-image-upload-API"
  resource_name = "imp-news-image-upload"
  method_name   = "ANY"
  stage_name    = "Prod"
  api_key       = "imp-news-image-upload-API-key"
  usage_plan    = "imp-news-image-upload-API-plan"
}

apigw_function_configurations_3 = {
  # apigw_function 1
  function_name = "imp-news-image"
  iam_role_name = "imp-news-image-role"
  runtime       = "nodejs18.x"
  handler       = "index.handler"
  memory        = 128
  env_var = {
    BUCKET     = ""
    BUCKET_ENT = ""
  }
  my_lambda_tags = {
    App         = "News"
    Environment = "UAT"
  }
}

apigw_configurations_3 = {
  # apigw 1
  apigw_name    = "news-image"
  resource_name = "{proxy+}"
  method_name   = "ANY"
  stage_name    = "Prod"
  api_key       = "news-image-key"
  usage_plan    = "news-image-plan"
}

apigw_function_configurations_4 = {
  # apigw_function 1
  function_name = "imp-news-pcm-api"
  iam_role_name = "imp-news-pcm-api-role"
  runtime       = "nodejs18.x"
  handler       = "index.handler"
  memory        = 128
  env_var = {
    CAPI_BASE_URL     = ""
    DB_MAX_POOL_SIZE  = ""
    DB_SOCKET_TIMEOUT = ""
    MONGODB_URL       = ""
    NODE_ENV          = ""
  }
  my_lambda_tags = {
    App         = "News"
    Environment = "UAT"
  }
}

apigw_configurations_4 = {
  # apigw 1
  apigw_name    = "news-pb-api-gateway"
  resource_name = "{proxy+}"
  method_name   = "ANY"
  stage_name    = "Prod"
  api_key       = "news-pb-api-key"
  usage_plan    = "news-pb-api-plan"
}


function_configurations_1 = {
  function_name = "kentico-news-service-lambda"
  iam_role_name = "kentico-news-service-lambda-role"
  runtime       = "nodejs18.x"
  handler       = "index.handler"
  memory        = 128
  env_var = {
    dbName         = ""
    mongoDBConnect = ""
    pushApiURL     = ""
    s3BlobURL      = ""
    tokenSalt      = ""
  }
  my_lambda_tags = {
    App         = "News"
    Environment = "UAT"
  }
}

#cloudfront-s3
bucket_name_1 = "news-cms-store-uat"
tags_1 = {
  key1 = "value1"
  key2 = "value2"
}
bucket_name_2 = "imp-news-wb-lite-ui-uat"
tags_2 = {
  key1 = "value1"
  key2 = "value2"
}
bucket_name_3 = "imp-news-pb-ui-uat"
tags_3 = {
  key1 = "value1"
  key2 = "value2"
}

# GLOBAL TAGGINGS
global_tags = {
  g1 = "Global Tag Value 1"
  g2 = "Global Tag Value 2"
}
