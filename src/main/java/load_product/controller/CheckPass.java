package load_product.controller;

import org.mindrot.jbcrypt.BCrypt;

public class CheckPass {
  public static void main(String[] args) {
	System.out.println(BCrypt.checkpw("123456", "$2a$12$5yH8nHl6WRhKXc27KSFUr..DFXpBMKOCyT4jx4I9pcIvFjPXKZKuq"));
}
}
