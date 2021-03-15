package sendmessage;

import java.util.HashMap;
import java.util.Random;

import org.json.simple.JSONObject;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class SendMessage {
	private static String verifyNumber;

	public void getVerifyNumber(String phoneNumber) {
		System.out.println("Request Phone Number : " + phoneNumber);
		String api_key = "NCSCEEW6NSW7MCON";
		String api_secret = "IOJSPD6DQZYI219JTMRKAYGLWS9VL8QW";
		Message coolsms = new Message(api_key, api_secret);
		String number = numberGen(6, 1);

		HashMap<String, String> params = new HashMap<String, String>();
		params.put("to", phoneNumber);
		params.put("from", "발송할 번호입력");
		params.put("type", "SMS");
		params.put("text", "fundigo [" + number + "] 인증번호입니다.");
		params.put("app_version", "test app 1.2");

		try {
			JSONObject obj = coolsms.send(params);
			System.out.println(obj.toString());
		} catch (CoolsmsException e) {
			System.out.println(e.getMessage());
			System.out.println(e.getCode());
		}
		verifyNumber = number;
	}

	public boolean confirmNumber(String number) {
		return verifyNumber.equals(number) ? true : false;
	}

	public static String numberGen(int len, int dupCd) {

		Random rand = new Random();
		String numStr = "";

		for (int i = 0; i < len; i++) {

			String ran = Integer.toString(rand.nextInt(10));

			if (dupCd == 1) {
				numStr += ran;
			} else if (dupCd == 2) {
				if (!numStr.contains(ran)) {
					numStr += ran;
				} else {
					i -= 1;
				}
			}
		}
		return numStr;
	}
}
