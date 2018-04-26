contract Betting {

    bool isOn;
    string public teamA;
    string public teamB;
    string public description;

    struct Bet {
      address player;
      uint256 amount;
    }

    function Betting(string _teamA, string _teamB, string _description) {
      teamA = _teamA;
      teamB = _teamB;
      description = _description;
    }

}
