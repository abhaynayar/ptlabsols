import java.util.*;

public class a {
    public static void main(String args[]) {
        System.out.println(a("i]\rD\u0004\u0015\u0017\u0004_~\u0002\u0006`HZ@UBY\\Ku\u0002O2\u0003_MQB\u0010\u0007G~\u0004Q", "PentesterLab"));
    }
    public static String a(String str, String str2) {
        byte[] bytes = str.getBytes();
        byte[] bytes2 = str2.getBytes();
        byte[] bArr = new byte[bytes.length];
        for (int i = 0; i < bytes.length; i++) {
            bArr[i] = (byte) (bytes[i] ^ bytes2[i % bytes2.length]);
        }
        return new String(bArr);
    }
}
