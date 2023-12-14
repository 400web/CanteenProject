package com.cp;

import com.cp.domain.Canteen;
import com.cp.service.CanteenService;

import java.util.List;

public class GetCanteen  implements CanteenService {
    String name1="第一食堂";
    String introduction1="学校第一食堂位于校园中心，提供丰富多样的菜系，包括中西式美食。新鲜食材，舒适用餐环境，是同学们放松身心、享受美味的理想场所。";
    String businessTime1="7:00-22:00";
    String activity1="所有菜品全部八折";
    String name2="第二食堂";
    String introduction2="学校第一食堂位于校园中心，提供丰富多样的菜系，包括中西式美食。新鲜食材，舒适用餐环境，是同学们放松身心、享受美味的理想场所。";
    String businessTime2="7:00-22:00";
    String activity2="所有菜品全部八折";
    String name3="第三食堂";
    String introduction3="学校第一食堂位于校园中心，提供丰富多样的菜系，包括中西式美食。新鲜食材，舒适用餐环境，是同学们放松身心、享受美味的理想场所。";
    String businessTime3="7:00-22:00";
    String activity3="所有菜品全部八折";
    @Override
    public Canteen getCanteenById(String canteenId) {
        return null;
    }

    @Override
    public Canteen getCanteenByName(String name) {
        Canteen canteen=null;
        if (name.equals(name1)){
             canteen = new Canteen(name1, introduction1, businessTime1, activity1);
        }
        if (name.equals(name2)){
            canteen = new Canteen(name2, introduction2, businessTime2, activity2);
        }
        if (name.equals(name3)){
            canteen = new Canteen(name3, introduction3, businessTime3, activity3);
        }

        return canteen;
    }

    @Override
    public boolean addCanteen(Canteen canteen) {
        return false;
    }

    @Override
    public boolean updateCanteen(Canteen canteen) {
        return false;
    }

    @Override
    public boolean deleteCanteen(String canteenId) {
        return false;
    }

    @Override
    public List<Canteen> getListByPage(int currPage, int pageSize) {
        return null;
    }
}
