pragma solidity >=0.4.24 <0.6.0;
    /**
     * @title RBF
     * @dev Read and write values to the chain
     */
    contract soltest {
        uint public storedData;
        string[] DataStore;
        string[] UpdateQueue;
        /**
         * @dev Constructor sets the default value
         */
        constructor() public {
           
        }
        /**
         * @dev Set the value
         * @param _blob The new value
         */
        function storeData(string memory  _blob) public returns(uint) {
              DataStore.push(_blob);
              return DataStore.length;
        }
        /**
         * @dev Get the value
         */
        function getstoreData(uint _startIndex, uint _count) public view  returns(string memory) {
        //init
        string memory ret = "";
        
        if (DataStore.length > 0) {
            ret = DataStore[_startIndex];
            uint _itemsNum = 0;
            _startIndex = _startIndex + 1;
            if (_count <= DataStore.length)
                _itemsNum = _count;
            else
                _itemsNum = DataStore.length;
            if (_startIndex < DataStore.length) {
                for (uint i = _startIndex; i < _itemsNum; i++) {
                    ret = strConcat(ret, ",", DataStore[i], "", "");
                }
            }
        }
        return ret;
    }
     function strConcat(string memory _a, string memory _b, string  memory _c, string memory  _d, string memory _e) internal returns(string memory) {
        bytes memory _ba = bytes(_a);
        bytes memory _bb = bytes(_b);
        bytes memory _bc = bytes(_c);
        bytes memory _bd = bytes(_d);
        bytes memory _be = bytes(_e);
        string memory abcde = new string(_ba.length + _bb.length + _bc.length + _bd.length + _be.length);
        bytes memory babcde = bytes(abcde);
        
        uint k = 0;
        for (uint i = 0; i < _ba.length; i++) babcde[k++] = _ba[i];
        for ( i = 0; i < _bb.length; i++) babcde[k++] = _bb[i];
        for ( i = 0; i < _bc.length; i++) babcde[k++] = _bc[i];
        for ( i = 0; i < _bd.length; i++) babcde[k++] = _bd[i];
        for ( i = 0; i < _be.length; i++) babcde[k++] = _be[i];
        return string(babcde);
    }
    }