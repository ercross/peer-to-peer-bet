pragma solidity 0.6.0;
pragma experimental ABIEncoderV2;

/**
* @title PeerToPeerBet
* @dev implements a peer to peer betting system
*/

contract PeerToPeerBets {
    
}

contract PeerToPeerBet {
    
    struct PlayerBetData {
        uint stakeAmount;
        string predictedOutcome;
    }
    
    enum BetCategory {
        Sports, CurrentAffairs, Politics, Miscellaneous
        
    }
    
    uint public minimumStakeAmount;
    uint public numberOfPlayers;
    uint public totalStakesAmount;
    string public actualOutcome;
    bool public settled;
    string public betStatement;
    address public overseer;
    address public betWinner;
    address payable public creator;
    uint256 public betCreationTime; //now cannot be used due to highly inconsistent wait period associated with mining 
    uint256 public eventStartsIn; //epoch time formatted through the frontend
    BetCategory public betCategory;
    string[] predictedOutcomes;
    mapping (address => PlayerBetData) public players;
    
    constructor (
        uint _minimumStakeAmount,
        string memory _betStatement,
        uint _eventStartsIn,
        BetCategory _betCategory, 
        string[] memory _predictedOutcomes,
        string memory _predictedOutcome
        ) 
        public {
            creator = msg.sender;
            numberOfPlayers++;
            betCategory = _betCategory;
            minimumStakeAmount = _minimumStakeAmount;
            betStatement = _betStatement;
            eventStartsIn = _eventStartsIn;
            predictedOutcomes = _predictedOutcomes;
            PlayerBetData creatorBetData = PlayerBetData ({
                stakeAmount: msg.value,
                predictedOutcome: _predictedOutcome
            });
        }
        
    /**
     * @notice joinBet allows other players to join in to this bet contract
    */
    function joinBet(string memory _predictedOutcome) public payable {
      require (msg.value > minimumStakeAmount);  
      require (players[msg.sender] == "");
      PlayerBetData memory playerBetData = playerBetData({
          predictedOutcome: _predictedOutcome,
          stakeAmount: msg.value
      });
      players[msg.sender] = playerBetData;
      numberOfPlayers++;
    }
    
    /**
     * @param _actualOutcome to be set by address overseer
    */
    function settleBet (string memory _actualOutcome) public {
        require (msg.sender == overseer);
        actualOutcome = _actualOutcome;
        []address winningPlayers = fetchAllWinners(calldata _actualOutcome);
        payWinners(calldata winningPlayers);
    }
    
    /**
     * @notice cancelBet cancels this bet provided no other player has joined
    */
    function cancelBet() public {
        require (msg.sender == creator);
        require (numberOfPlayers == 1); 
        creator.transfer(players[creator].stakeAmount);
    }
    
    function fetchAllWinners (string memory _actualOutcome) internal returns (address[] winners) {
        playerBetData memory sender = playerBetData[msg.sender];
        for(uint i=0; i<players; i++) {
            if (players.address.predictedOutcome = _actualOutcome) {
                winners.push[players.address];
            }
        }
        return winners;
    }
    
    function payWinners (string[] memory _winningplayers ) internal payable {
        require(getProt(msg.sender) > propThres());
        uint winPerPerson = totalStakesAmount / _winningplayers.length
        for (uint i=0; i<_winningplayers.length; i++) {
            _winningplayers[i].transfer(winPerPerson);
        }
    }
}
