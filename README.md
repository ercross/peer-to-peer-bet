# peer-to-peer-bet 
A smart contract written in solidity that implements a peer to peer betting system.
An end user, say Player1, can create a bet (stating the bet statement) under any of the allowed bet categories. 
Player1 set bet terms such as backing a possible outcome, other expected outcomes, minimum amount other bettors can stake.
Other peer-to-peer end users can then accept the bet and joinBet.
If no other user accepts the bet, then the bet can be canceled.
Note that a bet cannot be canceled by the bet creator once one or more other players join the bet.
After the occurence of the bet event, the bet is settled by the overseer and the win is transferred to the winners address.
