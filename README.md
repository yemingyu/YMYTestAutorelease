# YMYTestAutorelease

测试__autoreleasing的效果
发现http://www.cnblogs.com/flyFreeZn/p/4264220.html中说的有问题
最主要是@autoreleasepool{}的释放时间实在}时，而正常的都是在runloop退出时。