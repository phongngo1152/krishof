package load_product.service;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;


@Service
public class VnPayService {
    public static String vnp_PayUrl = "https://sandbox.vnpayment.vn/paymentv2/vpcpay.html";
    public static String vnp_ReturnUrl = "http://localhost:8080/SpringMVC_BTL/user/vnpay_return/"; // Cập nhật lại URL trả về
    public static String vnp_TmnCode = "96N12XDP";
    public static String secretKey = "8NND2TEU8CH3IQHNSK2WIZ0M61573WGV";
    public static String vnp_ApiUrl = "https://sandbox.vnpayment.vn/merchant_webapi/api/transaction";

    public String createVnPayUrl(String orderId, String amount, HttpServletRequest req) {
    	
    	    // Tạo tham số thanh toán VNPay
    	    Map<String, String> vnpParams = new HashMap<>();
    	    vnpParams.put("vnp_Version", "2.1.0");
    	    vnpParams.put("vnp_Command", "pay");
    	    vnpParams.put("vnp_TmnCode", vnp_TmnCode);
    	    vnpParams.put("vnp_Amount", String.valueOf(Integer.parseInt(amount) * 100)); // Chuyển VNĐ thành đồng xu
    	    vnpParams.put("vnp_CurrCode", "VND");
    	    vnpParams.put("vnp_BankCode", "NCB");
    	    vnpParams.put("vnp_OrderInfo", "Thanh Toan don hang:" + orderId);
    	    vnpParams.put("vnp_OrderType", "other");
    	    vnpParams.put("vnp_Locale", "vn");
    	    vnpParams.put("vnp_TxnRef", orderId); // Mã đơn hàng duy nhất
    	    vnpParams.put("vnp_ReturnUrl", vnp_ReturnUrl); // Địa chỉ nhận kết quả trả về

    	     // Thời gian tạo đơn hà
    	    Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
    	    SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
    	    String vnp_CreateDate = formatter.format(cld.getTime());
    	    vnpParams.put("vnp_CreateDate", vnp_CreateDate);

    	    // Thời gian hết hạn (15 phút)
    	    cld.add(Calendar.MINUTE, 15);
    	    String vnp_ExpireDate = formatter.format(cld.getTime());
    	    vnpParams.put("vnp_ExpireDate", vnp_ExpireDate);


    	    // Lấy địa chỉ IP của khách hàng
    	    vnpParams.put("vnp_IpAddr", getIpAddress(req));

    	    // Sắp xếp các tham số theo thứ tự từ điển
    	    List<String> fieldNames = new ArrayList<>(vnpParams.keySet());
    	    Collections.sort(fieldNames);

    	    // Chuẩn bị dữ liệu để ký và query string
    	    StringBuilder hashData = new StringBuilder();
    	    StringBuilder query = new StringBuilder();

    	    for (String fieldName : fieldNames) {
    	        String fieldValue = vnpParams.get(fieldName);
    	        if (fieldValue != null && !fieldValue.isEmpty()) {
    	            // Xây dựng chuỗi hash (dùng cho chữ ký)
    	            hashData.append(fieldName).append('=').append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII)).append('&');

    	            // Xây dựng query string (bao gồm cả các tham số để gửi đi)
    	            query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII))
    	                 .append('=')
    	                 .append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII)).append('&');
    	        }
    	    }

    	    // Xóa ký tự '&' cuối cùng
    	    if (hashData.length() > 0) hashData.setLength(hashData.length() - 1);
    	    if (query.length() > 0) query.setLength(query.length() - 1);

    	    // Tính toán chữ ký HMACSHA512
    	    String vnp_SecureHash = hmacSHA512(secretKey, hashData.toString());

    	    // Thêm chữ ký vào query string
    	    query.append("&vnp_SecureHash=").append(vnp_SecureHash);

    	    // Trả về URL thanh toán đầy đủ
    	    return vnp_PayUrl + "?" + query.toString();
    	}



    public String generateHashData(Map<String, String> data) {
        StringBuilder sb = new StringBuilder();
        for (Map.Entry<String, String> entry : data.entrySet()) {
            sb.append(entry.getKey()).append("=").append(entry.getValue()).append("&");
        }
        sb.deleteCharAt(sb.length() - 1); // Xóa ký tự "&" cuối cùng
        return calculateHmacSHA256(sb.toString(), secretKey);
    }

    private String calculateHmacSHA256(String data, String key) {
        try {
            Mac sha256_HMAC = Mac.getInstance("HmacSHA256");
            SecretKeySpec secret_key = new SecretKeySpec(key.getBytes(StandardCharsets.UTF_8), "HmacSHA256");
            sha256_HMAC.init(secret_key);
            byte[] hash = sha256_HMAC.doFinal(data.getBytes(StandardCharsets.UTF_8));
            return bytesToHex(hash);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    private String bytesToHex(byte[] bytes) {
        StringBuilder hexString = new StringBuilder();
        for (byte b : bytes) {
            String hex = Integer.toHexString(0xff & b);
            if (hex.length() == 1) {
                hexString.append('0');
            }
            hexString.append(hex);
        }
        return hexString.toString();
    }

    public static String getIpAddress(HttpServletRequest request) {
        String ipAddress;
        try {
            ipAddress = request.getHeader("X-FORWARDED-FOR");
            if (ipAddress == null) {
                ipAddress = request.getRemoteAddr();
            }
        } catch (Exception e) {
            ipAddress = "Invalid IP:" + e.getMessage();
        }
        return ipAddress;
    }

    public static String getRandomNumber(int len) {
        Random rnd = new Random();
        String chars = "0123456789";
        StringBuilder sb = new StringBuilder(len);
        for (int i = 0; i < len; i++) {
            sb.append(chars.charAt(rnd.nextInt(chars.length())));
        }
        return sb.toString();
    }
    public static String hmacSHA512(final String key, final String data) {
        try {

            if (key == null || data == null) {
                throw new NullPointerException();
            }
            final Mac hmac512 = Mac.getInstance("HmacSHA512");
            byte[] hmacKeyBytes = key.getBytes();
            final SecretKeySpec secretKey = new SecretKeySpec(hmacKeyBytes, "HmacSHA512");
            hmac512.init(secretKey);
            byte[] dataBytes = data.getBytes(StandardCharsets.UTF_8);
            byte[] result = hmac512.doFinal(dataBytes);
            StringBuilder sb = new StringBuilder(2 * result.length);
            for (byte b : result) {
                sb.append(String.format("%02x", b & 0xff));
            }
            return sb.toString();

        } catch (Exception ex) {
            return "";
        }
    }
}


