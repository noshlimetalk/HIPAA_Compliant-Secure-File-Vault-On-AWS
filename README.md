### Architecture Overview

## 1 Linux Layer (Red Hat VM)
 - generate_patients.sh # Creates 10 dummy PHI Records
 - encrypt_records.sh # AES-256-CBC encryption via openSSL
 - upload_to_s3.sh # Uploads .enc files to s3 with SSE-KMS
 - logs/vault_audit.log $ Local audit trail

## AWS Layer

- S3 Bucket  # SS3-KMS + Block all public access + versioning
- AWS KMS # Customer managed key (hipaa-vault-key)
- IAM Role # PutObjcet only - least privilege
- CloudTrail # All S3 data events logged
- CloudWatch # Alarm on ErrorCount > 0
- SNS # Email alert on authorized access

  ## Security Control

  ## Control                              Implementation 

  1. Encryption at rest (Linux)  (OpenSSL AES-256-CBC,PBKDF2, 100k iterations)
  2. Encryption at rest (AWS)  (S3 SS3-KMS with customer managed key)
  3. Encryption in transit    (HTTPS enforced on all S3 uploads)
  4. Access Control            (IAM role scoped to PutObject on single bucket prefix)
  5. Audit Logging             (Cloudtrail capturing all S3 read/write/management events)
  6. Alerting                 ( CloudWatch alarm --- SNS Email on any error event)
  7. Public Access            (All 4 S3 public access block settings enabled)
 

 ### Tech Stack

1. OS:Red Hat Enterprise Linux (Humber College VCloud)
2. Encryption:OpenSSL 3.5.1- AES-256-CBC-PBKDF2
3. Cloud: AWS S3-KMS-IAM-CloudTrail-Cloudwatch-SNS
4. CLI: AWS CLI v2.bash
   


### Project Structure

1. Scripts
   - scripts/
          -generate_patients.sh
          -encrypt_records.sh
          -upload_to_s3.sh
  - raw_records/   .gitignore (plaintext PHI never Commited)
  - encrypted_records/   (AES-256 encrypted .enc files)
  - logs
       - vault_audit.log
   

### How to Run

## Prerequisites 

1. Red Hat / Ubuntu Linux
2. OpenSSL 3.x
3. AWS CLI configured with least-privilege IAM profile


### Step 1 Generate dummy patient records

- chmod +x scripts/generate_patients.sh
- bash scripts/generate_patients.sh

  ### Encrypt Records

  - chmod x+ scripts/encrypt_records.sh
  - bash scripts/encrypt_records.sh
 
    ### AWS Setup

    - KMS KEY
      Alis: hipaa-vault-key
      Type: Symmetric
      Usage: Encrypt and Decrypt

      ### Author

      Krisney Manuel
      Computer Systems Technology
      AWS Certified Cloud Practitioner (CLF-C02)
