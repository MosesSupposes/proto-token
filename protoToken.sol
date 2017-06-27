contract ProtoToken {
    /* Meta data about the contract. In the near future this can be handled by a token registry, but for now we'll add it directly to the contract */
    string public name;
    string public symbol;
    uint8 public decimals;
    
    /* This creates an array with all balances */
    mapping (address => uint256) public balanceOf;

    /* This generates a public event on the blockchain that will notify clients when a transfer has occurred */
    event Transfer (address indexed from, address indexed  to, uint256 value)

    /* Initializes contract with initial supply tokens to the creator of the contract. 
    This value can be set on the Ethereum Wallet Client, so we'll leave it blank for now. */
    function ProtoToken(uint256 initialSupply, string tokenName, uint8 decimalUnits, string tokenSymbol) {
        balanceOf[msg.sender] = initialSupply;  // Give the creator all initial tokens
        name = tokenName;
        symbol = tokenSymbol;
        decimals = decimalUnits;
    }

    function transfer(address _to, uint _value) {
        if (balanceOf[msg.sender] < _value) throw;            // Check if the sender has enough
        if (balanceOf[_to] + _value < balanceOf[_to]) throw;  // Check for overflows
        balanceOf[msg.sender] -= _value;                      // Subtract from the sender
        balanceOf[_to] += _value;                             // Add the same to the recipient
        Transfer(msg.sender, _to, _value);                    // Notify anyone listening that this transfer took place       
    }
}