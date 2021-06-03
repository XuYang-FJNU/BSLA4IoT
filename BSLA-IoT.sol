pragma solidity ^0.4.23;

contract RegInfo {
     
	address public DM;
    
	struct PKI {
        uint256[2] n;
        uint32 ET; 
	}
	
	mapping(uint256 => PKI) public PKIT;

	event _update(address indexed requester);
	event _query(address indexed requester);
    event _revoke(address indexed requester);
	    
    function RegInfo() public {
		DM = msg.sender;
    }
	
	function update(uint256[2] n, uint32 ET, uint256 id) public returns (address addr){
		require(msg.sender == DM);
        int i; 
	
		PKIT[id].n = n;
		PKIT[id].ET = ET;
		_update(msg.sender);
        return msg.sender;
    }	

    function query(uint256 N) public view returns (uint256[2] n, uint32 ET) {
		_query(msg.sender);		
        return (PKIT[N].n, PKIT[N].ET);
    }
	
	function revoke(uint256 N) public{
		require(msg.sender == DM);		
        delete PKIT[N]; 
		_revoke(msg.sender);
    }
    
}



["12345","342"]