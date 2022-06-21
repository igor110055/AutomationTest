import onetimepass as otp

def Get_Google_Authenticator_Onetime_Otp(secret):
	return otp.get_totp(secret)