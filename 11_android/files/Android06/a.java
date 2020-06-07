import java.util.Base64;
import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class a {
    public static void main(String args[]) {
        System.out.println(a("ygiG2VpgnW6z2ocCPEVaYhDwBs3UxZENbgh1iQJ6NhpBqHsczQsDh1rD3WjejQ7JH1o+lvBdtxhG64qyLQyHSg", "__pentesterlab__".getBytes()));
    }
    public static String a(String str, byte[] bArr) {
        try {
            Base64.Decoder decoder = Base64.getDecoder();
            byte[] decode = decoder.decode(str);
            byte[] bArr2 = new byte[decode.length];
            byte[] bArr3 = new byte[16];
            System.arraycopy(decode, 0, bArr3, 0, bArr3.length);
            IvParameterSpec ivParameterSpec = new IvParameterSpec(bArr3);
            int length = decode.length - 16;
            byte[] bArr4 = new byte[length];
            System.arraycopy(decode, 16, bArr4, 0, length);
            SecretKeySpec secretKeySpec = new SecretKeySpec(bArr, "AES");
            Cipher instance = Cipher.getInstance("AES/CBC/PKCS5Padding");
            instance.init(2, secretKeySpec, ivParameterSpec);
            return new String(instance.doFinal(bArr4));
        } catch (Exception unused) {
            return "";
        }
    }
}

