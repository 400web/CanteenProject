
import com.cp.domain.Canteen;
import com.cp.service.CanteenService;
import com.cp.service.impl.CanteenServiceImpl;
import org.junit.jupiter.api.Test;

public class PageTest {
    @Test
    void pageTest(){
        CanteenService canteenService=new CanteenServiceImpl();
        canteenService.getListByPage(5,10);
    }
}
