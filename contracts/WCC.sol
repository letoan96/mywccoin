pragma solidity ^0.4.21;
import "./ERC20.sol";

contract WCC is ERC20 {

   string public name = "hieuc";
   uint256 public constant totalSupply = 1000; 
   uint256 public constant decimal = 0;
   uint256 public constant unitPrice = 1;
   string public constant symbol = "WCC";
   address public fundWallet;

   function WCC() {
      _balanceOf[msg.sender] = totalSupply;
      fundWallet = msg.sender;
   }

   function approveAndCall(address _spender, uint256 _value)
   returns (bool) {
      _allowances[msg.sender][_spender] = _value;
      if(approve(_spender, _value)){
        emit Approval(msg.sender, _spender, _value);
        return true;
      }

      return false;
   }
}


