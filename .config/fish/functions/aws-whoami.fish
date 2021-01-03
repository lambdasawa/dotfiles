function aws-whoami
    aws iam get-user || aws sts get-caller-identity
end
