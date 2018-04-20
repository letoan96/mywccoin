pragma solidity ^0.4.21;
import "./ERC20.sol";

contract WCC is ERC20 {

   uint256 private constant totalSupply = 1000; 
   uint256 private constant decimal = 0;
   uint256 private constant unitPrice = 1;
   string private constant symbol = "WCC";
   address public fundWallet;

   function WCC() {
      _balanceOf[msg.sender] = totalSupply;
      fundWallet = msg.sender;
   }

   function approveAndCall(address _spender, uint256 _value)
   returns (bool) {
      _allowances[msg.sender][_spender] = _value;
      if(approve())
      emit Approval(msg.sender, _spender, _value);

      return true;
   }
}


