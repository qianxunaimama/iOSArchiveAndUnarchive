# iOSArchiveAndUnarchive

*###ModelPerson 

*###ModelRunTimeBaseZero 

*###ModelRunTimeBaseOne  

| ModelPerson| ModelRunTimeBaseZero | ModelRunTimeBaseOne |
| ------------ | ------------- | ------------ |
| 基础的归解档写法 |全程是runtime的方法  | runtime获取属性方法和KVC相结合，加入了忽略某个属性归解档的写法，重写了description方法。 |
|  | 基础数据类型要换成（@property (nonatomic,strong) NSNumber *userAge;）  |  |