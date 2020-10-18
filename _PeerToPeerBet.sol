pragma solidity 0.6.0;

/**
* @title PeerToPeerBet
* @notice implements a peer to peer betting system
*/

contract PeerToPeerBets {
    
}

contract PeerToPeerBet {
    
    struct public storage PlayerBetData {
        uint stakeAmount;
        uint predictedOutcome;
    }
    
    enum BetCategory {
        Sports, CurrentAffairs, Politics, Miscellaneous
        
    }
    
    uint public storage totalStakesAmount;
    uint public storage numberOfPredictedOutcomes;
    uint public numberOfPlayers;
    bool public storage settled;
    string public storage betStatement;
    address public storage overseer;
    address public storage creator;
    string public storage eventDate; //just for record purpose. No actual impact on contract
    BetCategory public storage betCategory;
    string[numberOfPredictedOutcomes] storage predictedOutcomes;
    mapping (address => PlayerBetData) public storage players;
    
    constructor PeerToPeerBet (
        BetCategory memory _betCategory, uint memory _numberOfPredictedOutcomes, 
        ) public {
            creator = msg.sender;
        }
}
