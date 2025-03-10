package load_product.entity;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.Base64;
import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;

public class ImageUtils {
    public static String convertToBase64(BufferedImage image) throws IOException {
        // Chuyển BufferedImage thành byte array
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write(image, "png", baos);  // Đảm bảo định dạng là PNG
        baos.flush();
        byte[] imageBytes = baos.toByteArray();
        baos.close();

        // Mã hóa byte array thành Base64
        return Base64.getEncoder().encodeToString(imageBytes);
    }
}
