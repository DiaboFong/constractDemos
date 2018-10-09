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

    function test() public  view returns (uint){
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

//内部调用的时候，可以通过this.xx对public进行访问
//对internal和private方法进行访问的时候，不加this
    function testPublic() public constant returns (uint){

        return this.test1();
    }

    function testInternal() public constant returns (uint){

        return test2();
    }

    function testPrivate() public constant returns (uint){

        return test3();
    }    

}          
/*
总结:
1. 属性默认权限为internal，只有Public类型的属性才可供外部访问
2. internal和private的属性只能在合约内部使用
3. 函数的权限默认是public类型，public类型的函数可以供外部访问，在内部可以通过this.直接访问，
   而internal和private在合约内部也无法通过this.进行访问，所以在合约内部，直接访问即可。
4. 不管是属性还是方法，只有是public类型时才可以通过合约地址进行访问，合约内部的this就是当前合约的地址，
   在合约内部如果要访问internal和private类型的属性，直接访问即可，不用通过this去访问。
*/