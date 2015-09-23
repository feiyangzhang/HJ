# HJ
第一题：KVODemo1

第二题：
优点：
       1,对于视图-逻辑的分离便于后期对原有功能扩展和维护，当UI变化时，ViewModel中的逻辑不需要进行变化
       2,可以仅仅通过Blend实现简单的功能，而不需要写任何代码。
缺点：
      1，对枚举类型绑定比较困难，如将枚举类型绑定至RadioButton

      2，Silverlight4中仅仅对继承ButtonBase的控件实现了Command属性，在实际的使用中，对于其它的事件可以使用Blend4中中的InvokeCommandAction
      3，无法在View和ViewModel传递复杂对象，可以破坏View或者ViewModel作为折衷办法，如ChildWindow和父容器的对象传递

第三题：RetainCycleProblem3

