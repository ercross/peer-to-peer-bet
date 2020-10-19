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
        uint predictedOutcome;
    }
    
    enum BetCategory {
        Sports, CurrentAffairs, Politics, Miscellaneous
        
    }
    
    uint public minimumStakeAmount;
    uint public numberOfPlayers;
    uint public totalStakesAmount;
    uint8 public outcomeIndex;
    bool public settled;
    string public betStatement;
    address public overseer;
    address public betWinner;
    address public creator;
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
        string memory _predictedOutcome,
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
                stakeAmount = msg.value;
                predictedOutcome = _predictedOutcome
            })
        }
        
    function joinBet(string memory _predictedOutcome, ) public payable {
        
    }
    
    function settleBet () public {
        
    }
    
    function cancelBet() public {
        
    }
}
