import time
import urllib.parse
import hashlib
import hmac
import base64

class EncodeLibrary:
    def Encode_Base64_String(self, encodeString):
        return base64.b64encode(bytes(encodeString, 'utf-8'))

    def Encode_SHA384(self, secret, payload):
        sign = hmac.new(secret.encode(), payload, hashlib.sha384).hexdigest()
        return sign
        
    def Generate_Authorisation_Header(self, API_KEY, API_SECRET, path, body):
    	nonce = str(int(round(time.time() * 1000000)))
    	signature = "/api/v2/{}{}{}".format(path, nonce, body)
    	h = hmac.new(API_SECRET.encode('utf-8'), signature.encode('utf-8'), hashlib.sha384)
    	signature = str(h.hexdigest())
    	return { "bfx-nonce": nonce, "bfx-apikey": API_KEY, "bfx-signature": signature }