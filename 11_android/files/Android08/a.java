import java.util.Base64;
import java.security.MessageDigest;
import java.util.ArrayList;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class a {
    public static void main(String args[]) {
        for(int i=0; i<=9999; ++i) {
            String pin = String.format("%04d", i);
            String[] strArr = {"G38zckAufW4B9A6sywz28kzgW8CCx1UWugLUTjKlo/kwV1CVesmr0tPX/JZOW0aik0TlkrcAIZZ/G0BigUtmeg==", pin};
            String asdf = a(strArr[0],strArr[1],"<=== P3nt3st3rL4b ===>");
            if (asdf != "") {
                System.out.println(pin + ":" + asdf);
            }
        }
    }

    public static String a(String str, String str2, String str3) {
        try {
/*
            System.out.println("PTLAB" + "pin+" + str2);
            System.out.println("PTLAB" + "key" + str3);
            System.out.println("PTLAB" + "in" + str);
*/
            Base64.Decoder decoder = Base64.getDecoder();
            byte[] decode = decoder.decode(str);
            //byte[] bArr = new byte[decode.length];

            byte[] bArr2 = new byte[16];
            System.arraycopy(decode, 0, bArr2, 0, bArr2.length);
            IvParameterSpec ivParameterSpec = new IvParameterSpec(bArr2);
            int length = decode.length - 16;
            byte[] bArr4 = new byte[length];
            System.arraycopy(decode, 16, bArr4, 0, length);
            MessageDigest instance = MessageDigest.getInstance("MD5");
            instance.update(str3.getBytes("UTF-8"));
            instance.update(str2.getBytes("UTF-8"));

            byte[] bArr3 = new byte[16];
            System.arraycopy(instance.digest(), 0, bArr3, 0, bArr3.length);
            SecretKeySpec secretKeySpec = new SecretKeySpec(bArr3, "AES");
            Cipher instance2 = Cipher.getInstance("AES/CBC/PKCS5Padding");
            instance2.init(2, secretKeySpec, ivParameterSpec);
            return new String(instance2.doFinal(bArr4));
        } catch (Exception e2) {
            //System.out.println("PTLAB" + e2.toString());
            return "";
        }
    }
}

