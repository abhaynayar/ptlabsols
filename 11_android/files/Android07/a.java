import java.util.Base64;
import java.security.MessageDigest;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class a {
    public static void main(String args[]) {
        for(int i=0; i<=9999; ++i) {
            String pin = String.format("%04d", i);
            System.out.print(pin + ":");
            System.out.println(a("ED1nf3uLW4Hkwr1aGw+NpN5sgcRMPCFuk0XgtW181m4o6d0Ml3D/j6h1NSyOh4dbcGsbK6rcZOUyzHxWVb4QkA", pin));
        }
    }
    public static String a(String str, String str2) {
        try {
            Base64.Decoder decoder = Base64.getDecoder();
            byte[] decode = decoder.decode(str);
            byte[] bArr = new byte[decode.length];
            byte[] bArr2 = new byte[16];
            System.arraycopy(decode, 0, bArr2, 0, bArr2.length);
            IvParameterSpec ivParameterSpec = new IvParameterSpec(bArr2);
            int length = decode.length - 16;
            byte[] bArr3 = new byte[length];
            System.arraycopy(decode, 16, bArr3, 0, length);
            MessageDigest instance = MessageDigest.getInstance("MD5");
            instance.update(str2.getBytes("UTF-8"));
            byte[] bArr4 = new byte[16];
            System.arraycopy(instance.digest(), 0, bArr4, 0, bArr4.length);
            SecretKeySpec secretKeySpec = new SecretKeySpec(bArr4, "AES");
            Cipher instance2 = Cipher.getInstance("AES/CBC/PKCS5Padding");
            instance2.init(2, secretKeySpec, ivParameterSpec);
            return new String(instance2.doFinal(bArr3));
        } catch (Exception unused) {
            return "";
        }
    }
}

