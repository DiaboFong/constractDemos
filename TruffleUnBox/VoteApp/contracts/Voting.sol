pragma solidity ^0.4.24;
pragma experimental ABIEncoderV2;
contract Voting{
    //定义候选人存储数组，长度为5
    string[]  condidates  = new string[](5) ;
   
    mapping(string => uint) condidatesVotingCount;
    constructor (string[] _candidates) public {
        for (uint i = 0 ; i < _candidates.length ; i++){
            condidates[i] = _candidates[i];
        }
    }
    //投票
    function votingToperson(string  person) public {
     //   assert(isVaildToPerson(person));
        condidatesVotingCount[person] += 1 ;
    }
    //查询票数
    function votingTotalToPerson(string person)public view returns (uint){
     //   assert(isVaildToPerson(person));
        return condidatesVotingCount[person];
    }
    // //判断是否在候选人列表中
    // function isVaildToPerson(string  person) internal view returns (bool){

    //     bytes  storage _person = bytes(person);

    //     for (uint i = 0 ; i < condidates.length ;  i++){
    //         if (bytes(condidates[i]) == _person ){
    //             return true;
    //         }else {
    //             return false;
    //         }
    //     }
    // } 


}  
