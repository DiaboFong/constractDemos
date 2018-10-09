pragma solidity ^0.4.24;

//public 公开  internal 内部  private 私有
/*
1.属性默认类型为internal类型
2.internal和private类型的属性都不能被外部访问
     */

contract Animal {
    //internal 是合约属性默认的访问的权限
    uint          _weight;
    uint private  _height;
    uint internal _age;
    uint public   _money; //设置为public，会自动生成一个get函数，可以直接通过this._money或者this._money()进行访问
/*
3.当属性类型为Public时，会生成一个和属性名相同并且返回值就是当前属性的get函数，
生成的get函数会覆盖掉Public类型自动生成的属性值 
*/

//方法默认为Public

    function test()   view returns (uint){
        return _weight;
    }    
/*
public可以被外部调用，而internal和private不能被外部调用
*/
    function test1() public constant returns (uint) {
        return _height;
    }
    function test2() internal constant returns (uint) {
        return _age;
    }
    function test3() private constant returns (uint) {
        return _money;
    }
}


contract Animal1 {
    string  _color ;

    constructor  () public {
        _color = "blue";
    }
    function getColor() public view returns (string){
        return _color;
    }
}



//只有public类型的方法才能被继承到子合约中
//只有public以及internal类型的属性才能被继承到子合约中,private类型的属性无法被继承

contract Dog is Animal,Animal1{
    function testWeight() public view returns (uint){
        return _weight;
    }
/*     function testHeight() public view returns (uint){
        return _height;
    }   */  
    function testAge() public view returns (uint) {
        return _money;
    }


    function getColor() public view returns (string){
        return "black";
    }

}

