module TestConfig;

import grpc;

import hunt.logging;
import hunt.util.Serialize;
import core.thread;
import core.time;
import neton.client.config.ConfigService;
import neton.client.Listener;
import neton.client.Event;

void testConfig(ConfigService service)
{
    testNormal(service);
    logInfo("test config ok");
}


void testNormal(ConfigService impl)
{
    enum KEY1 = "key1";
    enum VALUE1 = "value1";
    enum KEY2 = "key2";
    enum VALUE2 = "value2";
   

    impl.addListener(KEY1,new class Listener{
        override void onEvent(Event event)
        {
            logInfo("config key1 listen : ",event);
        }
    });

    auto lis1 = new class Listener{
        override void onEvent(Event event)
        {
            logInfo("config key1-1 listen : ",event);
        }
    };

    impl.addListener(KEY1,lis1);

    impl.addListener(KEY2,new class Listener{
        override void onEvent(Event event)
        {
            logInfo("config key2 listen : ",event);
        }
    });

    impl.publishConfig(KEY1,VALUE1);
    impl.publishConfig(KEY2,VALUE2);

    assert(impl.getConfig(KEY1) == VALUE1);
    assert(impl.getConfig(KEY2) == VALUE2);

    impl.removeListener(KEY1,lis1);

    impl.removeConfig(KEY2);
    impl.removeConfig(KEY1);

    Thread.sleep(dur!"seconds"(1));

}