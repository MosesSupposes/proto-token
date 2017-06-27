contract ProtoToken {
    // This creates an array with all balances
    mapping (address => uint256) public balanceOf;

    // Initializes contract with initial supply tokens to the creator of the contract
    function ProtoToken(
        uint256 initialSupply = 21000000;
    ) {
        balanceOf[msg.sender] = initialSupply;      // Give the creator all initial tokens
    }

    // Send coins
    function transfer(address _to, uint _value) {
        if (blanceOf[msg.sender] < _value) throw;               // Check if the sender has enough     
        if (balanceOf[_to] + _value < balanceOf[_to]) throw;    // Check for overflows
        balanceOf[msg.sender] -= _value;                        // Subract from the sender
        balanceOf[_to] += _value;                               // Add the same to the recipient
    }

}