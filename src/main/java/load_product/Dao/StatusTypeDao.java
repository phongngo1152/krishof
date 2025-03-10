package load_product.Dao;

import java.util.List;

import load_product.entity.StatusType;

public interface StatusTypeDao {
	// Lấy danh sách tất cả các StatusType
    public List<StatusType> getStatusTypes();

    // Thêm một StatusType mới vào cơ sở dữ liệu
    public boolean insertStatusType(StatusType statusType);

    // Cập nhật một StatusType trong cơ sở dữ liệu
    public boolean updateStatusType(StatusType statusType);

    // Lấy một StatusType dựa trên id
    public StatusType getStatusType(int id);

}
