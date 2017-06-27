contract ProtoToken {
    /* Meta data about the contract. In the near future this can be handled by a token registry, but for now we'll add it directly to the contract */
    string public name;
    string public symbol;
    uint8 public decimals;
    
    /* This creates an array with all balances */
    mapping (address => uint256) public balanceOf;


    /* Initializes contract with initial supply tokens to the creator of the contract. 
    This value can be set on the Ethereum Wallet Client, so we'll leave it blank for now. */
    function ProtoToken(uint256 initialSupply, string tokenName, uint8 decimalUnits, string tokenSymbol) {
        balanceOf[msg.sender] = initialSupply;  // Give the creator all initial tokens
        name = tokenName;
        symbol = tokenSymbol;
        decimals = decimalUnits;
    }

    function transfer(address _to, uint _value) {
        /* Check if sender has balance and for overflows */
        if (balanceOf[msg.sender] < _value) || balanceOf[_to] + _value < balanceOf[_to] 
            throw;               
         
        /* Add and subtract new balances */
        balanceOf[msg.sender] -= _value;    
        balanceOf[_to] += _value;           
    }
}