pragma solidity ^0.4.21;

contract ERC20 {

   event Approval(address indexed _owner, address indexed _spender, uint256 _value);
   event Transfer(address indexed _from, address indexed _to);

   mapping(address => uint256) internal _balanceOf;
   mapping(address => mapping(address => uint256)) internal _allowances;

   function balanceOf(address _addr)
   returns(uint256) {
      return _balanceOf[_addr];
   }

   function transfer(address _to, uint256 _value)
   public returns(bool) {
      if (_value > 0 && _value <= balanceOf(msg.sender)) {
         _balanceOf[msg.sender] -= _value;
         _balanceOf[_to] += _value;
         return true;
      }
      return false;
   }

   function transferFrom(address _from, address _to, uint256 _value)
   public returns (bool) {
      if (_allowances[_from][msg.sender] > 0 &&
          _value > 0 &&
             _allowances[_from][msg.sender] >= _value && 
                _balanceOf[_from] >= _value) {
         _balanceOf[_from] -= _value;
      _balanceOf[_to] += _value;

      _allowances[_from][msg.sender] -= _value;
      return true;
      }
      return false;
   }

   function approve(address _spender, uint256 _value)
   public returns (bool) {
      _allowances[msg.sender][_spender] = _value;
      return true;
   }

   function allowance(address _owner, address _spender)
   public constant returns (uint256) {
      return _allowances[_owner][_spender];
   }

}

