package load_product.Dao;

import java.util.List;

import org.hibernate.Session;

import load_product.entity.Favorite;

public interface FavoriteDao {
	  // Lấy danh sách tất cả các Favorite
    public List<Favorite> getFavorites();

    // Thêm một Favorite mới vào cơ sở dữ liệu
    public boolean insertFavorite(Favorite favorite);

    // Cập nhật một Favorite trong cơ sở dữ liệu
    public boolean updateFavorite(Favorite favorite);

    // Lấy một Favorite dựa trên id
    public Favorite getFavorite(int id);

    // Lấy danh sách Favorites của một User
    public List<Favorite> getFavoritesByUser(Long userId);
    
    public List<Favorite> getFavoritesByUserName(String userName);


    // Xóa một Favorite dựa trên id
    public boolean deleteFavorite(int id);
}

