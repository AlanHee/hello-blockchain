#!/bin/bash
message="Hello, this is a message."
echo "msg: $message"

hash=$(echo -n "$message" | sha256sum | awk '{print $1}')
echo "msg's hash: $hash"

signature=$(echo -n "$hash" | openssl dgst -sha256 -sign private_key.pem | openssl base64 -e)
echo "hash Signature: $signature"

# make sure is not verify the $message but $hash!
if echo -n "$hash" | openssl dgst -sha256 -verify public_key.pem -signature <(echo "$signature" | openssl base64 -d) &>/dev/null; then
	echo "vetify..."
	echo "The message was successfully verified with the public key."
else
	echo "The message verification failed."
fi
