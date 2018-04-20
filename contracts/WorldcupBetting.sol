pragma solidity ^0.4.21;

contract WorldcupBetting {

    struct Bet {
        uint256 amount;
        address player;
    }

    address public owner;

    mapping(uint8 => Bet[]) public all;

    uint256 public total = 0;
    mapping(uint8 => uint256) public totals;

    uint8 count = 0;
    mapping(uint8 => uint256) public counts;

    uint8 public winning = 0;
    mapping(address => uint256) public withdrawals;

    function WorldcupBetting() public {
        owner = msg.sender;
    }

    function setWinning(uint8 _team) public {
        require(msg.sender == owner);

        winning = _team;

        for (uint256 i = 0; i < all[winning].length; i += 1) {
            Bet storage bet_ = all[winning][i];
            withdrawals[bet_.player] += (bet_.amount / totals[winning]) * total;
        }
    }

    function bet(uint8 _team) public payable returns (uint256) {
        require(winning == 0);
        require(msg.value > 0);

        Bet memory bet_ = Bet(msg.value, msg.sender);

        all[_team].push(bet_);

        count += 1;
        counts[_team] += 1;

        total += bet_.amount;
        totals[_team] += bet_.amount;

        return total;
    }

    function withdraw() public {
        require(winning != 0);
        require(withdrawals[msg.sender] > 0);

        uint256 value = withdrawals[msg.sender];
        withdrawals[msg.sender] = 0;
        msg.sender.transfer(value);
    }
}
