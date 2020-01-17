pragma solidity ^0.4.22 ;

contract RBF {

    string[] Facilities;
    string[] Services;
    string[] Patients;
    string[] CheckinCheckout;
    string[] UpdateQueue;

    address owner;

    constructor() public {
        owner = msg.sender;
    }

    function addFacility(string memory _blob) public returns(uint) {
        Facilities.push(_blob);
        return Facilities.length;
    }

    function addService(string memory _blob) public returns(uint) {
        Services.push(_blob);
        return Services.length;
    }

    function addPatient(string memory _blob) public returns(uint) {
        Patients.push(_blob);
        return Patients.length;
    }

    function addCheckinCheckout(string memory _blob) public returns(uint) {
        CheckinCheckout.push(_blob);
        return CheckinCheckout.length;
    }
    /*function addFacility(string memory _name, string  memory _code)  public  {
        Facilities.push(
            Facility({
                name:_name,
                fcode:_code})
                );
     }*/
    function addToUpdateList(string memory _blob) public returns(uint) {
        UpdateQueue.push(_blob);
        return UpdateQueue.length;
    }

    function updateFacility(uint _index, string memory _blob) public {
        Facilities[_index] = _blob;
        addToUpdateList(_blob);
    }

    function updateService(uint _index, string memory _blob) public {
        Services[_index] = _blob;
        addToUpdateList(_blob);
    }

    function updatePatient(uint _index, string memory _blob) public {
        Patients[_index] = _blob;
        addToUpdateList(_blob);
    }

    function updateCheckinCheckout(uint _index, string memory _blob) public {
        CheckinCheckout[_index] = _blob;
        addToUpdateList(_blob);
    }

    function getFacilities(uint _startIndex, uint _count) public view returns(string memory) {
        //init
        string memory ret = "";
        
        if (Facilities.length > 0) {
            ret = Facilities[_startIndex];
            uint _itemsNum = 0;
            _startIndex = _startIndex + 1;
            if (_count <= Facilities.length)
                _itemsNum = _count;
            else
                _itemsNum = Facilities.length;
            if (_startIndex < Facilities.length) {
                for (uint i = _startIndex; i < _itemsNum; i++) {
                    ret = strConcat(ret, ",", Facilities[i], "", "");
                }
            }
        }
        return ret;
    }

    function getServices(uint _startIndex, uint _count) public view returns(string memory) {
        string memory ret = "";
        if (Services.length > 0) {
            ret = Services[_startIndex];
            uint _itemsNum = 0;
            _startIndex = _startIndex + 1;
            if (_count <= Services.length)
                _itemsNum = _count;
            else
                _itemsNum = Services.length;
            if (_startIndex < Services.length) {
                for (uint i = _startIndex; i < _itemsNum; i++) {
                    ret = strConcat(ret, ",", Services[i], "", "");
                }
            }
        }
        return ret;
    }

    function getPatients(uint _startIndex, uint _count) public view returns(string memory) {

        string memory ret = "";
        if (Patients.length > 0) {
            ret = Patients[_startIndex];
            uint _itemsNum = 0;
            _startIndex = _startIndex + 1;
            if (_count <= Patients.length)
                _itemsNum = _count;
            else
                _itemsNum = Patients.length;
            if (_startIndex < Patients.length) {
                for (uint i = _startIndex; i < _itemsNum; i++) {
                    ret = strConcat(ret, ",", Patients[i], "", "");
                }
            }
        }
        return ret;
    }


    function getCheckinCheckout(uint _startIndex, uint _count) public view returns(string memory) {

        string memory ret = "";
        if (CheckinCheckout.length > 0) {
            ret = CheckinCheckout[_startIndex];
            uint _itemsNum = 0;
            _startIndex = _startIndex + 1;
            if (_count <= CheckinCheckout.length)
                _itemsNum = _count;
            else
                _itemsNum = CheckinCheckout.length;
            if (_startIndex < CheckinCheckout.length) {
                for (uint i = _startIndex; i < _itemsNum; i++) {
                    ret = strConcat(ret, ",", CheckinCheckout[i], "", "");
                }
            }
        }
        return ret;
    }


    function getUpdated(uint _startIndex, uint _count) public view returns(string memory) {
        string memory ret = "";
        if (UpdateQueue.length > 0) {
            ret = UpdateQueue[_startIndex];
            uint _itemsNum = 0;
            _startIndex = _startIndex + 1;
            if (_count <= UpdateQueue.length)
                _itemsNum = _count;
            else
                _itemsNum = UpdateQueue.length;
            if (_startIndex < UpdateQueue.length) {
                for (uint i = _startIndex; i < _itemsNum; i++) {
                    ret = strConcat(ret, ",", UpdateQueue[i], "", "");
                }
            }
        }
        return ret;
    }

    function getFacilitySize() public view returns(uint) {
        return Facilities.length;
    }

    function getServicesSize() public view returns(uint) {
        return Services.length;
    }

    function getPatientSize() public view returns(uint) {
        return Patients.length;
    }

    function getCheckinCheckoutSize() public view returns(uint) {
        return CheckinCheckout.length;
    }
    
      function getUpdateQueueSize() public view returns(uint) {
        return UpdateQueue.length;
    }

    function strConcat(string _a, string _b, string _c, string _d, string _e) internal returns(string) {
        bytes memory _ba = bytes(_a);
        bytes memory _bb = bytes(_b);
        bytes memory _bc = bytes(_c);
        bytes memory _bd = bytes(_d);
        bytes memory _be = bytes(_e);
        string memory abcde = new string(_ba.length + _bb.length + _bc.length + _bd.length + _be.length);
        bytes memory babcde = bytes(abcde);
        uint k = 0;
        for (uint i = 0; i < _ba.length; i++) babcde[k++] = _ba[i];
        for (i = 0; i < _bb.length; i++) babcde[k++] = _bb[i];
        for (i = 0; i < _bc.length; i++) babcde[k++] = _bc[i];
        for (i = 0; i < _bd.length; i++) babcde[k++] = _bd[i];
        for (i = 0; i < _be.length; i++) babcde[k++] = _be[i];
        return string(babcde);
    }

}