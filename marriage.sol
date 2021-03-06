pragma solidity >=0.4.0 <0.7.0;

contract Marriage {
	enum State{Continues, Divorced}
	State public state;
  uint proposaled_at;
	uint divorced_at;
  string giving_the_ring;
  string taking_the_ring;
  string witness1;
  string witness2;
    
  constructor(string _giving_the_ring, string _taking_the_ring, string _witness1, string _witness2) public{
    state = State.Continues;
    giving_the_ring = _giving_the_ring;
    taking_the_ring = _taking_the_ring;
    witness1 = _witness1;
    witness2 = _witness2;
    proposaled_at = now;
   }

  function divorce() public {
    state = State.Divorced;
    divorced_at = now; 
  }

  function marriage_summary() public view returns (string) {
    if (state == State.Continues){
      return string(abi.encodePacked("!!CONTINUES!! ", giving_the_ring, " -> ", taking_the_ring," time: ",  uint2str(proposaled_at)));
    }
    
    return string(abi.encodePacked("!!DIVORCED!! ", giving_the_ring, " -> ", taking_the_ring, " time: ",  uint2str(proposaled_at), " divorced at: ",  uint2str(divorced_at)));
  }

	function uint2str(uint _i) internal pure returns (string memory _uintAsString) {
        if (_i == 0) {
            return "0";
        }
        uint j = _i;
        uint len;
        while (j != 0) {
            len++;
            j /= 10;
        }
        bytes memory bstr = new bytes(len);
        uint k = len;
        while (_i != 0) {
            k = k-1;
            uint8 temp = (48 + uint8(_i - _i / 10 * 10));
            bytes1 b1 = bytes1(temp);
            bstr[k] = b1;
            _i /= 10;
        }
        
        return string(bstr);
    }
}
