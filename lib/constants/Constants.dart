import 'package:event_bus/event_bus.dart';

class Constants {
 static final int compress_station_type = 1; //压缩站
 static final int car_num_type = 2; //车牌
 static final int driver_type = 3; //驾驶员
 static final int burn_station_type = 4; //焚烧厂

 /// 创建EventBus
 static EventBus eventBus = EventBus();

 static final String PAGE_SIZE="30";
}