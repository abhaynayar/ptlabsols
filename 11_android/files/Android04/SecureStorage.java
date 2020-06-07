import java.util.*;

public class SecureStorage {
    public static void main(String args[]) {
        System.out.println(decrypt("\u0005\u0006\u0006\u0003U\u0001UU\u0019WQ\f\u0006\u0019\u0000PU\f\u0019\rVU\u0002\u0019W\u0000\rQ\f\u0004\rVU\u0003\u0006\u0004", (byte) 52));
    }
    public static String decrypt(String str, byte b) {
        byte[] bytes = str.getBytes();
        byte[] bArr = new byte[bytes.length];
        for (int i = 0; i < bytes.length; i++) {
            bArr[i] = (byte) (bytes[i] ^ b);
        }
        return new String(bArr);
    }
}

