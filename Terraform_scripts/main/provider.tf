provider "aws"{
    region = "ap-south-1"
    access_key = "xxxxxxxxxxxxxx" 
    secret_key =  "xxxxxxxxxxxxxxx"
}

provider "aws"{
    alias = "acceptor"
    region = "ap-south-1"
    access_key = "xxxxxxxxxxxxxxxx" 
    secret_key =  "xxxxxxxxxxxxxxxxxx"
}


