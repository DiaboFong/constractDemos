pragma solidity ^0.4.24;

//public 公开  internal 内部  private 私有
/*
1.属性默认类型为internal类型
2.internal和private类型的属性都不能被外部访问
     */

contract Person {
    //internal 是合约属性默认的访问的权限
    uint internal _age;
    uint _weight ;
    uint private _height;
    uint public _money; //设置为public，会自动生成一个get函数
/*
3.当属性类型为Public时，会生成一个和属性名相同并且返回值就是当前属性的get函数，
生成的get函数会覆盖掉Public类型自动生成的属性值 
*/
    function _money() public  pure returns (uint){
        return 120;
    }    
    
}