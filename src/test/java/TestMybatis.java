import com.facemask.domain.Facemask;
import com.facemask.mapper.FacemaskMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

public class TestMybatis {
    @Test
    public void TestSql() throws IOException {
        InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
        SqlSessionFactory sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
        SqlSession session = sqlSessionFactory.openSession();
        FacemaskMapper facemaskMapper = session.getMapper(FacemaskMapper.class);
        //测试save
//        Facemask facemask=new Facemask();
//        facemask.setF_name("N95口罩");
//        facemask.setF_total(3000);
//        facemask.setF_price(5f);
//        int res=facemaskMapper.save_f(facemask);
//        session.commit();
//        System.out.println(res);
        //测试findall
//        List<Facemask> facemasks=facemaskMapper.findAll();
////        for (Facemask f:facemasks)
////            System.out.println(f);
        //测试findByID
//        Facemask f = facemaskMapper.findByID(1);
        //测试update
//        f.setF_received(f.getF_received()+5);
//        f.setF_inventory(f.getF_inventory()-5);
//        int res = facemaskMapper.update_f(f);
//        session.commit();
//        System.out.println(res);
//        List<Facemask> facemasks = facemaskMapper.findAll();
//        for (Facemask facemask : facemasks)
//            System.out.println(facemask);
        //测试delete
//        int res = facemaskMapper.delete_f(4);
//        session.commit();
//        System.out.println(res);
//        List<Facemask> facemasks = facemaskMapper.findAll();
//        for (Facemask facemask : facemasks)
//            System.out.println(facemask);
        //测试查询口罩库存数量
//        int sum=facemaskMapper.findInventory();
//        System.out.println(sum);
        //测试findByName
        Facemask facemask=facemaskMapper.findByName("儿童");
        System.out.println(facemask);
    }
}
