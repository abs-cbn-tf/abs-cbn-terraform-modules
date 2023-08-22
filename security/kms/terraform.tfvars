kms_keys = [
  {
    name            = "my-key-1"
    description     = "My KMS Key 1"
    deletion_window = 30
  },
  {
    name            = "my-key-2"
    description     = "My KMS Key 2"
    deletion_window = 7
  },
  
  {
    name            = "my-key-3"
    description     = "My KMS Key 3"
    deletion_window = 7
  },
  
  {
    name            = "my-key-4"
    description     = "My KMS Key 4"
    deletion_window = 7
  }
]

env1 = "qa"
project1 = "kms-project1"
