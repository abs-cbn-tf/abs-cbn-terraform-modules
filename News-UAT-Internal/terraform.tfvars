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
  lambda_tags = {
    "abs::cost-center"      = "50016043"
    "abs::criticality"      = "Silver"
    "abs::environment"      = "UAT"
    "abs::product"          = "NewsWeb"
    "abs::tech-owner"       = "DCT"
    "abs::tech-owner-email" = "mardelacruz@abs-cbn.com"
    "abs::url"              = "uat-news.abs-cbn.com"
    "abs:backup"            = "No"
    "abs::lob"              = "News"
    "abs:shared"            = "No"
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
  apigw_tags = {
    "abs::cost-center"      = "50016043"
    "abs::criticality"      = "Silver"
    "abs::environment"      = "UAT"
    "abs::product"          = "NewsWeb"
    "abs::tech-owner"       = "DCT"
    "abs::tech-owner-email" = "mardelacruz@abs-cbn.com"
    "abs::url"              = "uat-news.abs-cbn.com"
    "abs:backup"            = "No"
    "abs::lob"              = "News"
    "abs:shared"            = "No"
  }
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
  lambda_tags = {
    "abs::cost-center"      = "50016043"
    "abs::criticality"      = "Silver"
    "abs::environment"      = "UAT"
    "abs::product"          = "NewsWeb"
    "abs::tech-owner"       = "DCT"
    "abs::tech-owner-email" = "mardelacruz@abs-cbn.com"
    "abs::url"              = "uat-news.abs-cbn.com"
    "abs:backup"            = "No"
    "abs::lob"              = "News"
    "abs:shared"            = "No"
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

  apigw_tags = {
    "abs::cost-center"      = "50016043"
    "abs::criticality"      = "Silver"
    "abs::environment"      = "UAT"
    "abs::product"          = "NewsWeb"
    "abs::tech-owner"       = "DCT"
    "abs::tech-owner-email" = "mardelacruz@abs-cbn.com"
    "abs::url"              = "uat-news.abs-cbn.com"
    "abs:backup"            = "No"
    "abs::lob"              = "News"
    "abs:shared"            = "No"
  }
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
  lambda_tags = {
    "abs::cost-center"      = "50016043"
    "abs::criticality"      = "Silver"
    "abs::environment"      = "UAT"
    "abs::product"          = "NewsWeb"
    "abs::tech-owner"       = "DCT"
    "abs::tech-owner-email" = "mardelacruz@abs-cbn.com"
    "abs::url"              = "uat-news.abs-cbn.com"
    "abs:backup"            = "No"
    "abs::lob"              = "News"
    "abs:shared"            = "No"
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

  apigw_tags = {
    "abs::cost-center"      = "50016043"
    "abs::criticality"      = "Silver"
    "abs::environment"      = "UAT"
    "abs::product"          = "NewsWeb"
    "abs::tech-owner"       = "DCT"
    "abs::tech-owner-email" = "mardelacruz@abs-cbn.com"
    "abs::url"              = "uat-news.abs-cbn.com"
    "abs:backup"            = "No"
    "abs::lob"              = "News"
    "abs:shared"            = "No"
  }
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
  lambda_tags = {
    "abs::cost-center"      = "50016043"
    "abs::criticality"      = "Silver"
    "abs::environment"      = "UAT"
    "abs::product"          = "NewsWeb"
    "abs::tech-owner"       = "DCT"
    "abs::tech-owner-email" = "mardelacruz@abs-cbn.com"
    "abs::url"              = "uat-news.abs-cbn.com"
    "abs:backup"            = "No"
    "abs::lob"              = "News"
    "abs:shared"            = "No"
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

  apigw_tags = {
    "abs::cost-center"      = "50016043"
    "abs::criticality"      = "Silver"
    "abs::environment"      = "UAT"
    "abs::product"          = "NewsWeb"
    "abs::tech-owner"       = "DCT"
    "abs::tech-owner-email" = "mardelacruz@abs-cbn.com"
    "abs::url"              = "uat-news.abs-cbn.com"
    "abs:backup"            = "No"
    "abs::lob"              = "News"
    "abs:shared"            = "No"
  }
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
  lambda_tags = {
    "abs::cost-center"      = "50016043"
    "abs::criticality"      = "Silver"
    "abs::environment"      = "UAT"
    "abs::product"          = "NewsWeb"
    "abs::tech-owner"       = "DCT"
    "abs::tech-owner-email" = "mardelacruz@abs-cbn.com"
    "abs::url"              = "uat-news.abs-cbn.com"
    "abs:backup"            = "No"
    "abs::lob"              = "News"
    "abs:shared"            = "No"
  }
}

#cloudfront-s3
s3_configurations_1 = {
  # bucket
  bucket_name = "news-cms-store-uat"
  # block public access
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
  # s3 encryption
  sse_algorithm = "AES256"
  # bucket versioning
  bucket_versioning = "Enabled"
  #s3 object
  key                    = "index.html"
  source                 = "./index.html"
  server_side_encryption = "AES256"
  content_type           = "text/html"
  # taggings
  bucket_tags = {
    "abs::cost-center"      = "50016043"
    "abs::criticality"      = "Silver"
    "abs::environment"      = "UAT"
    "abs::product"          = "NewsWeb"
    "abs::tech-owner"       = "DCT"
    "abs::tech-owner-email" = "mardelacruz@abs-cbn.com"
    "abs::url"              = "uat-news.abs-cbn.com"
    "abs:backup"            = "No"
    "abs::lob"              = "News"
    "abs:shared"            = "No"
  }
}
cloudfront_configurations_1 = {
  # random ID
  byte_length = 8
  # origin access
  origin_access_description = "News Origin Access"
  origin_access_type        = "s3"
  origin_signing_behavior   = "always"
  origin_signing_protocol   = "sigv4"
  # distribution 
  distribution_enabled   = true
  default_root_object    = "index.html"
  allowed_methods        = ["GET", "HEAD"]
  cached_methods         = ["GET", "HEAD"]
  viewer_protocol_policy = "allow-all"
  distribution_tags = {
    "abs::cost-center"      = "50016043"
    "abs::criticality"      = "Silver"
    "abs::environment"      = "UAT"
    "abs::product"          = "NewsWeb"
    "abs::tech-owner"       = "DCT"
    "abs::tech-owner-email" = "mardelacruz@abs-cbn.com"
    "abs::url"              = "uat-news.abs-cbn.com"
    "abs:backup"            = "No"
    "abs::lob"              = "News"
    "abs:shared"            = "No"
  }
}

s3_configurations_2 = {
  # bucket
  bucket_name = "imp-news-wb-lite-ui-uat"
  # block public access
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
  # s3 encryption
  sse_algorithm = "AES256"
  # bucket versioning
  bucket_versioning = "Enabled"
  #s3 object
  key                    = "index.html"
  source                 = "./index.html"
  server_side_encryption = "AES256"
  content_type           = "text/html"
  # taggings
  bucket_tags = {
    "abs::cost-center"      = "50016043"
    "abs::criticality"      = "Silver"
    "abs::environment"      = "UAT"
    "abs::product"          = "NewsWeb"
    "abs::tech-owner"       = "DCT"
    "abs::tech-owner-email" = "mardelacruz@abs-cbn.com"
    "abs::url"              = "uat-news.abs-cbn.com"
    "abs:backup"            = "No"
    "abs::lob"              = "News"
    "abs:shared"            = "No"
  }
}
cloudfront_configurations_2 = {
  # random ID
  byte_length = 8
  # origin access
  origin_access_description = "News Origin Access"
  origin_access_type        = "s3"
  origin_signing_behavior   = "always"
  origin_signing_protocol   = "sigv4"
  # distribution 
  distribution_enabled   = true
  default_root_object    = "index.html"
  allowed_methods        = ["GET", "HEAD"]
  cached_methods         = ["GET", "HEAD"]
  viewer_protocol_policy = "allow-all"
  distribution_tags = {
    "abs::cost-center"      = "50016043"
    "abs::criticality"      = "Silver"
    "abs::environment"      = "UAT"
    "abs::product"          = "NewsWeb"
    "abs::tech-owner"       = "DCT"
    "abs::tech-owner-email" = "mardelacruz@abs-cbn.com"
    "abs::url"              = "uat-news.abs-cbn.com"
    "abs:backup"            = "No"
    "abs::lob"              = "News"
    "abs:shared"            = "No"
  }
}

s3_configurations_3 = {
  # bucket
  bucket_name = "imp-news-pb-ui-uat"
  # block public access
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
  # s3 encryption
  sse_algorithm = "AES256"
  # bucket versioning
  bucket_versioning = "Enabled"
  #s3 object
  key                    = "index.html"
  source                 = "./index.html"
  server_side_encryption = "AES256"
  content_type           = "text/html"
  # taggings
  bucket_tags = {
    "abs::cost-center"      = "50016043"
    "abs::criticality"      = "Silver"
    "abs::environment"      = "UAT"
    "abs::product"          = "NewsWeb"
    "abs::tech-owner"       = "DCT"
    "abs::tech-owner-email" = "mardelacruz@abs-cbn.com"
    "abs::url"              = "uat-news.abs-cbn.com"
    "abs:backup"            = "No"
    "abs::lob"              = "News"
    "abs:shared"            = "No"
  }
}
cloudfront_configurations_3 = {
  # random ID
  byte_length = 8
  # origin access
  origin_access_description = "News Origin Access"
  origin_access_type        = "s3"
  origin_signing_behavior   = "always"
  origin_signing_protocol   = "sigv4"
  # distribution 
  distribution_enabled   = true
  default_root_object    = "index.html"
  allowed_methods        = ["GET", "HEAD"]
  cached_methods         = ["GET", "HEAD"]
  viewer_protocol_policy = "allow-all"
  distribution_tags = {
    "abs::cost-center"      = "50016043"
    "abs::criticality"      = "Silver"
    "abs::environment"      = "UAT"
    "abs::product"          = "NewsWeb"
    "abs::tech-owner"       = "DCT"
    "abs::tech-owner-email" = "mardelacruz@abs-cbn.com"
    "abs::url"              = "uat-news.abs-cbn.com"
    "abs:backup"            = "No"
    "abs::lob"              = "News"
    "abs:shared"            = "No"
  }
}
# GLOBAL TAGGINGS
global_tags = {
  global_tag = "global_tag_value"
}
