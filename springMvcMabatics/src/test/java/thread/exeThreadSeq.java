package thread;

/**
 * 顺序执行线程的方法
 * 1.用Thread.join() 方法 确定该线程执行完毕
 * 2.指定下次要执行的线程,只有当num等于当前值的才获得锁否则进入等待状态
 * Created by love137 on 2018/6/27.
 */
public class exeThreadSeq {


    /**
     * 方法1
     */
    final static  Thread thread1=new Thread(new Runnable() {
        @Override
        public void run() {
            System.out.println("执行线程1了");
        }
    });

    final static Thread thread2=new Thread(new Runnable() {
        @Override
        public void run() {
            try {
                thread1.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.println("执行线程2了");
        }
    });

    final static Thread thread3=new Thread(new Runnable() {
        @Override
        public void run() {
            try {
                thread2.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
            System.out.println("执行线程3了");
        }
    });


    /**
     * 方法2
     * @param args
     */

    static volatile int count=4;
    final static Thread thread4=new Thread(new Runnable() {
        @Override
        public void run() {
            synchronized (this){
                if(count==4){
                    try {
                        thread4.sleep(1000);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    System.out.println("执行线程"+count+"了");
                    count++;
                    notifyAll();

                }
                else{
                    try {
                        wait();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    });

    final static Thread thread5=new Thread(new Runnable() {
        @Override
        public void run() {
            synchronized (this){
                if(count==5){
                    try {
                        thread5.sleep(1000);
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                    System.out.println("执行线程"+count+"了");
                    count++;
                    notifyAll();

                }
                else{
                    try {
                        wait();
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    });

    public static void main(String[] args) {
        thread2.start();
        thread1.start();
        thread3.start();
        thread5.start();
        thread4.start();

    }

}
