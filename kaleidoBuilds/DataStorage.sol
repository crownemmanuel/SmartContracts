pragma solidity ^0.4.23;


contract DataStorage {
    string[] DataStore;
    string[] UpdateQueue;

    address owner;

    constructor() public {
        owner = msg.sender;
    }

    function addDataStore(string memory _blob) public returns (uint256) {
        DataStore.push(_blob);
        return DataStore.length;
    }

    function addToUpdateList(string memory _blob) public returns (uint256) {
        UpdateQueue.push(_blob);
        return UpdateQueue.length;
    }

    function updateDataStore(uint256 _index, string memory _blob) public {
        DataStore[_index] = _blob;
        addToUpdateList(_blob);
    }

    function getDataStore(uint256 _startIndex, uint256 _count)
        public
        view
        returns (string memory)
    {
        //init
        string memory ret = "";

        if (DataStore.length > 0 && _startIndex <= DataStore.length) {
            ret = DataStore[_startIndex];
            uint256 _itemsNum = 0;
            _startIndex = _startIndex + 1;
            if ((_startIndex + _count) <= DataStore.length)
                _itemsNum = _count + _startIndex;
            else _itemsNum = DataStore.length;
            if (_startIndex <= DataStore.length) {
                for (uint256 i = _startIndex; i < _itemsNum; i++) {
                    ret = strConcat(ret, "|", DataStore[i], "", "");
                }
            }
        }
        return ret;
    }

    function getUpdateQueue(uint256 _startIndex, uint256 _count)
        public
        view
        returns (string memory)
    {
        //init
        string memory ret = "";

        if (UpdateQueue.length > 0 && _startIndex <= UpdateQueue.length) {
            ret = UpdateQueue[_startIndex];
            uint256 _itemsNum = 0;
            _startIndex = _startIndex + 1;
            if ((_startIndex + _count) <= UpdateQueue.length)
                _itemsNum = _count + _startIndex;
            else _itemsNum = UpdateQueue.length;
            if (_startIndex <= UpdateQueue.length) {
                for (uint256 i = _startIndex; i < _itemsNum; i++) {
                    ret = strConcat(ret, "|", UpdateQueue[i], "", "");
                }
            }
        }
        return ret;
    }

    function getDataStoreSize() public view returns (uint256) {
        return DataStore.length;
    }

    function getUpdateQueueSize() public view returns (uint256) {
        return UpdateQueue.length;
    }

    function strConcat(
        string memory _a,
        string memory _b,
        string memory _c,
        string memory _d,
        string memory _e
    ) internal returns (string memory) {
        bytes memory _ba = bytes(_a);
        bytes memory _bb = bytes(_b);
        bytes memory _bc = bytes(_c);
        bytes memory _bd = bytes(_d);
        bytes memory _be = bytes(_e);
        string memory abcde = new string(
            _ba.length + _bb.length + _bc.length + _bd.length + _be.length
        );
        bytes memory babcde = bytes(abcde);

        uint256 k = 0;
        for (uint256 i = 0; i < _ba.length; i++) babcde[k++] = _ba[i];
        for (i = 0; i < _bb.length; i++) babcde[k++] = _bb[i];
        for (i = 0; i < _bc.length; i++) babcde[k++] = _bc[i];
        for (i = 0; i < _bd.length; i++) babcde[k++] = _bd[i];
        for (i = 0; i < _be.length; i++) babcde[k++] = _be[i];
        return string(babcde);
    }
}
