//                               ...((#                             
//                     .............(((((((((((((                   
//                ,.........#%%%%...   ((    ((((((((*              
//             ...............%%%%%.          (((((((((((           
//          .......*%%%%%%%%%.%%%%%%                (((((((#        
//        .............%%%%%%%%%%%%%                ((((((((((      
//      ,......%%%%%%%%%%%%%%%%%%%%%                     ((((((.    
//     .....%%/.../%%%%%%%*.%%%#,%%%                    (((((((((   
//    ............%%%%%......%%%....  //   /           (((((((((((  
//   .............%%%...............///////////////       ,(((((((( 
//  ..............%%................////////////////     (((((((((((
//  ..............%........@@@......//////@@#////////      (((((((((
// ........................#@@......//////////////////     (((((((((
// ...............******************                  %%%...........
// ...............******************                  &&%           
//  ...............*****************                 &&&&           
//  ................**********/***@% *#             &&&&&&&&        
//   ................********#@@@@@*######         &&&&&&&&&.       
//    .................*************             &&&&&&&&&&,        
//     ...................**********          &&&&&&&&&&&&,         
//      ........................****   ,&&&&&&&&&&&&&&&&&&&&        
//        .......................***   &&&&&&&&&&&&&&&&&&&&&&%      
//          ,...............********        &&&&&&&&&&&&&&&*        
//             ......       ********       *(((((((&&&&&&           
//                             *****     ((((((((((((               
//                     .            ((((((((((((,                       
//
//      \  |         |  |   _)                       |                
//     |\/ |  |   |  |  __|  |   _` | \ \   /  _` |  __|   _` |   __| 
//     |   |  |   |  |  |    |  (   |  \ \ /  (   |  |    (   |  |    
//    _|  _| \__,_| _| \__| _| \__,_|   \_/  \__,_| \__| \__,_| _|                                                                   
//
// --------------- Multiavatar Generator in Solidity ----------------
//

// SPDX-License-Identifier: Proprietary
// https://github.com/multiavatar/multiavatar-solidity/blob/master/LICENSE

pragma solidity ^0.8.12;

contract MNFT {
    
    // **************** //
    // HELPER FUNCTIONS //
    // **************** //

    // Substring function in Solidity
    // https://ethereum.stackexchange.com/questions/31457/substring-in-solidity
    function substring(string memory str, uint startIndex, uint endIndex) internal pure returns (string memory str2) {
        bytes memory strBytes = bytes(str);
        bytes memory result = new bytes(endIndex-startIndex);
        for(uint i = startIndex; i < endIndex; i++) {
            result[i-startIndex] = strBytes[i];
        }
        return string(result);
    }

    // Remove all leters, leave only numbers, 12 chars length
    // https://ethereum.stackexchange.com/a/50375
    function numStr(string memory _shaString) public pure returns (string memory) {
        bytes memory b = bytes(_shaString);
        string memory r;
        for(uint i; bytes(r).length<12; i++){
            bytes1 char = b[i];
            if (char >= 0x30 && char <= 0x39) {
                r = string.concat(r, string(abi.encodePacked(char)));
            }
        }
        return r;
    }

    // https://ethereum.stackexchange.com/a/10934
    function str2uint(string memory _s) public pure returns (uint result) {
        bytes memory b = bytes(_s);
        uint i;
        result = 0;
        for (i = 0; i < b.length; i++) {
            uint c = uint(uint8(b[i]));
            if (c >= 48 && c <= 57) {
                result = result * 10 + (c - 48);
            }
        }
    }

    // Convert a `uint256` to its ASCII `string` decimal representation
    function toString(uint256 value) public pure returns (string memory) {
        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }

    // Convert a `uint256` to its ASCII `string` hexadecimal representation with fixed length
    bytes16 private constant _HEX_SYMBOLS = "0123456789abcdef";
    function toHexString(uint256 value, uint256 length) internal pure returns (string memory) {
        bytes memory buffer = new bytes(2 * length + 2);
        buffer[0] = "0";
        buffer[1] = "x";
        for (uint256 i = 2 * length + 1; i > 1; --i) {
            buffer[i] = _HEX_SYMBOLS[value & 0xf];
            value >>= 4;
        }
        require(value == 0, "Strings: hex length insufficient");
        return string(buffer);
    }

    // Get position
    function getPos(uint _val) public pure returns (uint) {
        uint pos = 0;
        uint num = 100;
        while (_val > num) {
            num += 100;
            pos++;
        }
        if (_val > num-50) {
            pos++;
        }
        return pos;
    }


    // ********************* //
    // MULTIAVATAR GENERATOR //
    // ********************* //

    function multiavatar(string memory _name, bool _withTraits) public view returns (string memory) {

        // p = parts
        // https://docs.soliditylang.org/en/v0.8.12/types.html#allocating-memory-arrays
        uint[] memory p = new uint[](6);

        // Generate SHA-256 hash from string
        // e.g. "Satoshi" = 002688cc350a5333a87fa622eacec626c3d1c0ebf9f3793de3885fa254d7e393
        // https://forum.openzeppelin.com/t/not-able-to-convert-keccak256-hash-into-a-string-type/19404/7
        string memory shaString = substring(toHexString(uint256(sha256(abi.encodePacked(_name))), 32), 2, 66);

        // Remove letters to get 12 chars length string of numbers
        string memory shaNumbers = numStr(shaString);
        // return shaNumbers;

        // Get parts (range 0-47)
        p[0] = (getPos(47 * str2uint(string.concat(substring(shaNumbers, 0, 1), substring(shaNumbers, 1, 2)))));
        // Switch [2] with [1] to bring 'clo' layer above the 'head' layer
        p[2] = (getPos(47 * str2uint(string.concat(substring(shaNumbers, 2, 3), substring(shaNumbers, 3, 4)))));
        p[1] = (getPos(47 * str2uint(string.concat(substring(shaNumbers, 4, 5), substring(shaNumbers, 5, 6)))));
        p[3] = (getPos(47 * str2uint(string.concat(substring(shaNumbers, 6, 7), substring(shaNumbers, 7, 8)))));
        // Switch [5] with [4] to bring 'eyes' layer above the 'top' layer
        p[5] = (getPos(47 * str2uint(string.concat(substring(shaNumbers, 8, 9), substring(shaNumbers, 9, 10)))));
        p[4] = (getPos(47 * str2uint(string.concat(substring(shaNumbers, 10, 11), substring(shaNumbers, 11, 12)))));

        string memory resp;

        // resp = string.concat(toString(p[0]), toString(p[2]), toString(p[1]), toString(p[3]), toString(p[4]), toString(p[5]));
        // return resp;

        // svgStart
        resp = '<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 231 231">';

        string memory traits;

        for (uint i; i < p.length; i++) {
            string memory currentPart;
            string memory currentTheme;
            string memory nrString;
            if (i == 0) {
                currentPart = 'env';
            }
            else if (i == 1) {
                currentPart = 'head';
            }
            else if (i == 2) {
                currentPart = 'clo';
            }
            else if (i == 3) {
                currentPart = 'mouth';
            }
            else if (i == 4) {
                currentPart = 'top';
            }
            else if (i == 5) {
                currentPart = 'eyes';
            }

            if (p[i] > 31) {
                currentTheme = "C";
                
                uint nr = p[i] - 32;
                if (nr < 10) {
                    nrString = string.concat("0", (toString(nr)));
                }
                else {
                    nrString = toString(nr);
                }
            }
            else if (p[i] > 15) {
                currentTheme = "B";
                
                uint nr = p[i] - 16;
                if (nr < 10) {
                    nrString = string.concat("0", (toString(nr)));
                }
                else {
                    nrString = toString(nr);
                }
            }
            else {
                currentTheme = "A";
                
                uint nr = p[i];
                if (nr < 10) {
                    nrString = string.concat("0", (toString(nr)));
                }
                else {
                    nrString = toString(nr);
                }
            }

            if(_withTraits) {
                string memory traitCurrentPart;
                string memory traitCharacter;
                bytes32 nrStringHash = keccak256(abi.encodePacked((nrString)));

                if (i == 0) {
                    traitCurrentPart = 'Environment';
                }
                else if (i == 1) {
                    traitCurrentPart = 'Head';
                }
                else if (i == 2) {
                    traitCurrentPart = 'Clothing';
                }
                else if (i == 3) {
                    traitCurrentPart = 'Mouth';
                }
                else if (i == 4) {
                    traitCurrentPart = 'Eyes';
                }
                else if (i == 5) {
                    traitCurrentPart = 'Top';
                }

                if (nrStringHash == keccak256(abi.encodePacked(('00')))) {
                    traitCharacter = 'Robo';
                }
                else if (nrStringHash == keccak256(abi.encodePacked(('01')))) {
                    traitCharacter = 'Lila';
                }
                else if (nrStringHash == keccak256(abi.encodePacked(('02')))) {
                    traitCharacter = 'Aspen';
                }
                else if (nrStringHash == keccak256(abi.encodePacked(('03')))) {
                    traitCharacter = 'Kane';
                }
                else if (nrStringHash == keccak256(abi.encodePacked(('04')))) {
                    traitCharacter = 'Cass';
                }
                else if (nrStringHash == keccak256(abi.encodePacked(('05')))) {
                    traitCharacter = 'Joni';
                }
                else if (nrStringHash == keccak256(abi.encodePacked(('06')))) {
                    traitCharacter = 'Akira';
                }
                else if (nrStringHash == keccak256(abi.encodePacked(('07')))) {
                    traitCharacter = 'Ryo';
                }
                else if (nrStringHash == keccak256(abi.encodePacked(('08')))) {
                    traitCharacter = 'Avery';
                }
                else if (nrStringHash == keccak256(abi.encodePacked(('09')))) {
                    traitCharacter = 'Ava';
                }
                else if (nrStringHash == keccak256(abi.encodePacked(('10')))) {
                    traitCharacter = 'Drew';
                }
                else if (nrStringHash == keccak256(abi.encodePacked(('11')))) {
                    traitCharacter = 'Blaze';
                }
                else if (nrStringHash == keccak256(abi.encodePacked(('12')))) {
                    traitCharacter = 'Finn';
                }
                else if (nrStringHash == keccak256(abi.encodePacked(('13')))) {
                    traitCharacter = 'Jazzy';
                }
                else if (nrStringHash == keccak256(abi.encodePacked(('14')))) {
                    traitCharacter = 'Rasta';
                }
                else if (nrStringHash == keccak256(abi.encodePacked(('15')))) {
                    traitCharacter = 'Meta';
                }

                traits = string.concat(traits, '{"trait_type":"', traitCurrentPart, '","value":"', traitCharacter, '"},' );
            }

            // Optimization: 'env' part SVG shape is the same for all so no need to have it as array and loop through it
            if (keccak256(abi.encodePacked((currentPart))) == keccak256(abi.encodePacked(('env')))) {
                resp = string.concat(resp, '<path d="M33.83,33.83a115.5,115.5,0,1,1,0,163.34,115.49,115.49,0,0,1,0-163.34Z" style="fill:', maThemes[nrString][currentTheme][currentPart][0], ';"/>');
            }
            else {
                for (uint i2; i2 < maParts[nrString][currentPart].length; i2++) {
                    if (i2 + 1 == maParts[nrString][currentPart].length) {
                        resp = string.concat(resp, maParts[nrString][currentPart][i2]);
                    }
                    else {
                        resp = string.concat(resp, maParts[nrString][currentPart][i2], maThemes[nrString][currentTheme][currentPart][i2]);
                    }
                }
            }
        }

        if(!_withTraits) {
            return string.concat(resp, '</svg>');
        }
        else {
            // return with traits
            return string.concat(Base64.encode(bytes(string.concat(resp, '</svg>'))), '"', ', "attributes": [' , traits);
        }
    }

    // TEST 'Satoshi' avatar:
    // env 00A
    // clo 12A
    // head 09C
    // mouth 00B
    // eyes 02A
    // top 00B

    mapping(string=>mapping(string=>string[])) maParts;
    mapping(string=>mapping(string=>mapping(string=>string[]))) maThemes;

    // bool genLocked = false;
    // address owner;

    // function lockGen() public {
    //     if (msg.sender == owner) {
    //         genLocked = true;
    //     }
    // }

    // function addPartsData(string memory _nr, string memory _part, string[] memory _data) public {   
    //     if(!genLocked) {
    //         maParts[_nr][_part] = _data;
    //     }
    // }

    // function addThemesData(string memory _nr, string memory _theme, string memory _part, string[] memory _data) public {   
    //     if(!genLocked) {
    //         maThemes[_nr][_theme][_part] = _data;
    //     }
    // }

    // function getThemes(string memory _nr, string memory _theme, string memory _part) public view returns (string[] memory) {
    //     return maThemes[_nr][_theme][_part];
    // }

    // function getParts(string memory _nr, string memory _part) public view returns (string[] memory) {
    //     return maParts[_nr][_part];
    // }

    constructor() {

        // owner = msg.sender;

        // ****** //
        // THEMES //
        // ****** //

        // @TODO Optimization: Maybe use structs instead of arrays

        // @TODO (DONE) Optimization: Maybe use mappings instead of arrays
        // https://www.alchemy.com/overviews/solidity-gas-optimization#1-use-mappings-instead-of-arrays-2
        // mapping(string=>mapping(string=>mapping(string=>mapping(uint => string)))) maThemes;

        // OPTIMIZATION TEST RESULTS: 
        // if for all maThemes to use mappings, that would save ~7.14% gas for deployment
        // maybe together with maParts, max savings would be ~15%
        // but not possible to iterate through mappings, which is necessary

        // Robo
        // maThemes['00']['A']['env'][0] = "#ff2f2b";
        // maThemes['00']['A']['clo'][0] = "#fff";
        // maThemes['00']['A']['clo'][1] = "#000";
        // maThemes['00']['A']['head'][0] = "#fff";
        // maThemes['00']['A']['mouth'][0] = "#fff";
        // maThemes['00']['A']['mouth'][1] = "#000";
        // maThemes['00']['A']['mouth'][2] = "#000";
        // maThemes['00']['A']['eyes'][0] = "#000";
        // maThemes['00']['A']['eyes'][1] = "#none";
        // maThemes['00']['A']['eyes'][2] = "#00FFFF";
        // maThemes['00']['A']['top'][0] = "#fff";
        // maThemes['00']['A']['top'][1] = "#fff";

        // maThemes['00']['B']['env'][0] = "#ff1ec1";
        // maThemes['00']['B']['clo'][0] = "#000";
        // maThemes['00']['B']['clo'][1] = "#fff";
        // maThemes['00']['B']['head'][0] = "#ffc1c1";
        // maThemes['00']['B']['mouth'][0] = "#fff";
        // maThemes['00']['B']['mouth'][1] = "#000";
        // maThemes['00']['B']['mouth'][2] = "#000";
        // maThemes['00']['B']['eyes'][0] = "#FF2D00";
        // maThemes['00']['B']['eyes'][1] = "#fff";
        // maThemes['00']['B']['eyes'][2] = "none";
        // maThemes['00']['B']['top'][0] = "#a21d00";
        // maThemes['00']['B']['top'][1] = "#fff";

        // maThemes['00']['C']['env'][0] = "#0079b1";
        // maThemes['00']['C']['clo'][0] = "#0e00b1";
        // maThemes['00']['C']['clo'][1] = "#d1fffe";
        // maThemes['00']['C']['head'][0] = "#f5aa77";
        // maThemes['00']['C']['mouth'][0] = "#fff";
        // maThemes['00']['C']['mouth'][1] = "#000";
        // maThemes['00']['C']['mouth'][2] = "#000";
        // maThemes['00']['C']['eyes'][0] = "#0c00de";
        // maThemes['00']['C']['eyes'][1] = "#fff";
        // maThemes['00']['C']['eyes'][2] = "none";
        // maThemes['00']['C']['top'][0] = "#acfffd";
        // maThemes['00']['C']['top'][1] = "#acfffd";


        // Robo
        maThemes['00']['A']['env'] = [ "#ff2f2b" ];
        maThemes['00']['A']['clo'] = ["#fff", "#000"];
        maThemes['00']['A']['head'] = ["#fff"];
        maThemes['00']['A']['mouth'] = ["#fff", "#000", "#000"];
        maThemes['00']['A']['eyes'] = ["#000", "none", "#00FFFF"];
        maThemes['00']['A']['top'] = ["#fff", "#fff"];
    
        maThemes['00']['B']['env'] = ["#ff1ec1"];
        maThemes['00']['B']['clo'] = ["#000", "#fff" ];
        maThemes['00']['B']['head'] = ["#ffc1c1"];
        maThemes['00']['B']['mouth'] = ["#fff", "#000", "#000"];
        maThemes['00']['B']['eyes'] = ["#FF2D00", "#fff", "none"];
        maThemes['00']['B']['top'] = ["#a21d00", "#fff"];
    
        maThemes['00']['C']['env'] = ["#0079b1"];
        maThemes['00']['C']['clo'] = ["#0e00b1", "#d1fffe"];
        maThemes['00']['C']['head'] = ["#f5aa77"];
        maThemes['00']['C']['mouth'] = ["#fff", "#000", "#000"];
        maThemes['00']['C']['eyes'] = ["#0c00de", "#fff", "none"];
        maThemes['00']['C']['top'] = ["#acfffd", "#acfffd"];

        // Lila
        maThemes['01']['A']['env'] = ["#a50000"];
        maThemes['01']['A']['clo'] = ["#f06", "#8e0039"];
        maThemes['01']['A']['head'] = ["#85492C"];
        maThemes['01']['A']['mouth'] = ["#000"];
        maThemes['01']['A']['eyes'] = ["#000", "#ff9809"];
        maThemes['01']['A']['top'] = ["#ff9809", "#ff9809", "none", "none"];
    
        maThemes['01']['B']['env'] = ["#40E83B"];
        maThemes['01']['B']['clo'] = ["#00650b", "#62ce5a"];
        maThemes['01']['B']['head'] = ["#f7c1a6"];
        maThemes['01']['B']['mouth'] = ["#6e1c1c"];
        maThemes['01']['B']['eyes'] = ["#000", "#ff833b"];
        maThemes['01']['B']['top'] = ["#67FFCC", "none", "none", "#ecff3b"];
    
        maThemes['01']['C']['env'] = ["#ff2c2c"];
        maThemes['01']['C']['clo'] = ["#fff", "#000"];
        maThemes['01']['C']['head'] = ["#ffce8b"];
        maThemes['01']['C']['mouth'] = ["#000"];
        maThemes['01']['C']['eyes'] = ["#000", "#0072ff"];
        maThemes['01']['C']['top'] = ["#ff9809", "none", "#ffc809", "none"];
    
        // Aspen
        maThemes['02']['A']['env'] = ["#ff7520"];
        maThemes['02']['A']['clo'] = ["#d12823"];
        maThemes['02']['A']['head'] = ["#fee3c5"];
        maThemes['02']['A']['mouth'] = ["#d12823"];
        maThemes['02']['A']['eyes'] = ["#000", "none"];
        maThemes['02']['A']['top'] = ["#000", "none", "none",  "#FFCC00", "red"];
    
        maThemes['02']['B']['env'] = ["#ff9700"];
        maThemes['02']['B']['clo'] = ["#000"];
        maThemes['02']['B']['head'] = ["#d2ad6d"];
        maThemes['02']['B']['mouth'] = ["#000"];
        maThemes['02']['B']['eyes'] = ["#000", "#00ffdc"];
        maThemes['02']['B']['top'] = ["#fdff00", "#fdff00", "none", "none", "none"];
    
        maThemes['02']['C']['env'] = ["#26a7ff"];
        maThemes['02']['C']['clo'] = ["#d85cd7"];
        maThemes['02']['C']['head'] = ["#542e02"];
        maThemes['02']['C']['mouth'] = ["#f70014"];
        maThemes['02']['C']['eyes'] = ["#000", "magenta"];
        maThemes['02']['C']['top'] = ["#FFCC00", "#FFCC00", "#FFCC00", "#ff0000", "yellow"];
    
        // Kane
        maThemes['03']['A']['env'] = ["#6FC30E"];
        maThemes['03']['A']['clo'] = ["#b4e1fa", "#5b5d6e", "#515262", "#a0d2f0", "#a0d2f0"];
        maThemes['03']['A']['head'] = ["#fae3b9"];
        maThemes['03']['A']['mouth'] = ["#fff", "#000"];
        maThemes['03']['A']['eyes'] = ["#000"];
        maThemes['03']['A']['top'] = ["#8eff45", "#8eff45", "none", "none"];
    
        maThemes['03']['B']['env'] = ["#00a58c"];
        maThemes['03']['B']['clo'] = ["#000", "none", "none", "none", "none"];
        maThemes['03']['B']['head'] = ["#FAD2B9"];
        maThemes['03']['B']['mouth'] = ["#fff", "#000"];
        maThemes['03']['B']['eyes'] = ["#000"];
        maThemes['03']['B']['top'] = ["#FFC600", "none", "#FFC600", "none"];
    
        maThemes['03']['C']['env'] = ["#ff501f"];
        maThemes['03']['C']['clo'] = ["#000", "#ff0000", "#ff0000", "#7d7d7d", "#7d7d7d"];
        maThemes['03']['C']['head'] = ["#fff3dc"];
        maThemes['03']['C']['mouth'] = ["#d2001b", "none"];
        maThemes['03']['C']['eyes'] = ["#000"];
        maThemes['03']['C']['top'] = ["#D2001B", "none", "none", "#D2001B"];
    
        // Cass
        maThemes['04']['A']['env'] = ["#fc0"];
        maThemes['04']['A']['clo'] = ["#901e0e", "#ffbe1e", "#ffbe1e", "#c55f54"];
        maThemes['04']['A']['head'] = ["#f8d9ad"];
        maThemes['04']['A']['mouth'] = ["#000", "none", "#000", "none"];
        maThemes['04']['A']['eyes'] = ["#000"];
        maThemes['04']['A']['top'] = ["#583D00", "#AF892E", "#462D00", "#a0a0a0"];
    
        maThemes['04']['B']['env'] = ["#386465"];
        maThemes['04']['B']['clo'] = ["#fff", "#333", "#333", "#333"];
        maThemes['04']['B']['head'] = ["#FFD79D"];
        maThemes['04']['B']['mouth'] = ["#000", "#000", "#000", "#000"];
        maThemes['04']['B']['eyes'] = ["#000"];
        maThemes['04']['B']['top'] = ["#27363C", "#5DCAD4", "#314652", "#333"];
    
        maThemes['04']['C']['env'] = ["#DFFF00"];
        maThemes['04']['C']['clo'] = ["#304267", "#aab0b1", "#aab0b1", "#aab0b1"];
        maThemes['04']['C']['head'] = ["#e6b876"];
        maThemes['04']['C']['mouth'] = ["#50230a", "#50230a", "#50230a", "#50230a"];
        maThemes['04']['C']['eyes'] = ["#000"];
        maThemes['04']['C']['top'] = ["#333", "#afafaf", "#222", "#6d3a1d"];
    
        // Joni
        maThemes['05']['A']['env'] = ["#a09300"];
        maThemes['05']['A']['clo'] = ["#c7d4e2", "#435363", "#435363", "#141720", "#141720", "#e7ecf2", "#e7ecf2"];
        maThemes['05']['A']['head'] = ["#f5d4a6"];
        maThemes['05']['A']['mouth'] = ["#000", "#cf9f76"];
        maThemes['05']['A']['eyes'] = ["#000", "#000", "#000", "#000", "#000", "#000", "#000", "#000", "#fff", "#fff", "#fff", "#fff"];
        maThemes['05']['A']['top'] = ["none", "#fdff00"];
    
        maThemes['05']['B']['env'] = ["#b3003e"];
        maThemes['05']['B']['clo'] = ["#000", "#435363", "#435363", "#000", "none", "#e7ecf2", "#e7ecf2"];
        maThemes['05']['B']['head'] = ["#f5d4a6"];
        maThemes['05']['B']['mouth'] = ["#000", "#af9f94"];
        maThemes['05']['B']['eyes'] = ["#9ff3ff;opacity:0.96", "#000", "#9ff3ff;opacity:0.96", "#000", "#2f508a", "#000", "#000", "#000", "none", "none", "none", "none"];
        maThemes['05']['B']['top'] = ["#ff9a00", "#ff9a00"];
    
        maThemes['05']['C']['env'] = ["#884f00"];
        maThemes['05']['C']['clo'] = ["#ff0000", "#fff", "#fff", "#141720", "#141720", "#e7ecf2", "#e7ecf2"];
        maThemes['05']['C']['head'] = ["#c57b14"];
        maThemes['05']['C']['mouth'] = ["#000", "#cf9f76"];
        maThemes['05']['C']['eyes'] = ["none", "#000", "none", "#000", "#5a0000", "#000", "#000", "#000", "none", "none", "none", "none"];
        maThemes['05']['C']['top'] = ["#efefef", "none"];

        // Akira
        maThemes['06']['A']['env'] = ["#8acf00"];
        maThemes['06']['A']['clo'] = ["#ee2829", "#ff0"];
        maThemes['06']['A']['head'] = ["#ffce73"];
        maThemes['06']['A']['mouth'] = ["#fff", "#000"];
        maThemes['06']['A']['eyes'] = ["#000"];
        maThemes['06']['A']['top'] = ["#000","#000","none", "#000", "#ff4e4e", "#000"];
    
        maThemes['06']['B']['env'] = ["#00d2a3"];
        maThemes['06']['B']['clo'] = ["#0D0046", "#ffce73"];
        maThemes['06']['B']['head'] = ["#ffce73"];
        maThemes['06']['B']['mouth'] = ["#000", "none"];
        maThemes['06']['B']['eyes'] = ["#000"];
        maThemes['06']['B']['top'] = ["#000","#000","#000", "none", "#ffb358",  "#000", "none", "none"];
    
        maThemes['06']['C']['env'] = ["#ff184e"];
        maThemes['06']['C']['clo'] = ["#000", "none"];
        maThemes['06']['C']['head'] = ["#ffce73"];
        maThemes['06']['C']['mouth'] = ["#ff0000", "none"];
        maThemes['06']['C']['eyes'] = ["#000"];
        maThemes['06']['C']['top'] = ["none","none","none", "none", "none",  "#ffc107", "none", "none"];
    
        // Ryo
        maThemes['07']['A']['env'] = ["#00deae"];
        maThemes['07']['A']['clo'] = ["#ff0000"];
        maThemes['07']['A']['head'] = ["#ffce94"];
        maThemes['07']['A']['mouth'] = ["#f73b6c", "#000"];
        maThemes['07']['A']['eyes'] = ["#e91e63", "#000", "#e91e63", "#000", "#000", "#000"];
        maThemes['07']['A']['top'] = ["#dd104f", "#dd104f", "#f73b6c", "#dd104f"];
    
        maThemes['07']['B']['env'] = ["#181284"];
        maThemes['07']['B']['clo'] = ["#491f49", "#ff9809", "#491f49"];
        maThemes['07']['B']['head'] = ["#f6ba97"];
        maThemes['07']['B']['mouth'] = ["#ff9809", "#000"];
        maThemes['07']['B']['eyes'] = ["#c4ffe4", "#000", "#c4ffe4", "#000", "#000", "#000"];
        maThemes['07']['B']['top'] = [ "none", "none", "#d6f740", "#516303"];
    
        maThemes['07']['C']['env'] = ["#bcf700"];
        maThemes['07']['C']['clo'] = ["#ff14e4", "#000", "#14fffd"];
        maThemes['07']['C']['head'] = ["#7b401e"];
        maThemes['07']['C']['mouth'] = ["#666", "#000"];
        maThemes['07']['C']['eyes'] = ["#00b5b4", "#000", "#00b5b4", "#000", "#000", "#000"];
        maThemes['07']['C']['top'] = ["#14fffd", "#14fffd", "#14fffd", "#0d3a62"];
    
        // Avery
        maThemes['08']['A']['env'] = ["#0df"];
        maThemes['08']['A']['clo'] = ["#571e57", "#ff0"];
        maThemes['08']['A']['head'] = ["#f2c280"];
        maThemes['08']['A']['mouth'] = ["#ff0000"];
        maThemes['08']['A']['eyes'] = ["#795548", "#000"];
        maThemes['08']['A']['top'] = ["#de3b00", "none"];
    
        maThemes['08']['B']['env'] = ["#B400C2"];
        maThemes['08']['B']['clo'] = ["#0D204A", "#00ffdf"];
        maThemes['08']['B']['head'] = ["#ca8628"];
        maThemes['08']['B']['mouth'] = ["#1a1a1a"];
        maThemes['08']['B']['eyes'] = ["#cbbdaf", "#000"];
        maThemes['08']['B']['top'] = ["#000", "#000"];
    
        maThemes['08']['C']['env'] = ["#ffe926"];
        maThemes['08']['C']['clo'] = ["#00d6af", "#000"];
        maThemes['08']['C']['head'] = ["#8c5100"];
        maThemes['08']['C']['mouth'] = ["#7d0000"];
        maThemes['08']['C']['eyes'] = ["none", "#000"];
        maThemes['08']['C']['top'] = ["#f7f7f7", "none"];
    
        // Ava
        maThemes['09']['A']['env'] = ["#4aff0c"];
        maThemes['09']['A']['clo'] = ["#101010", "#fff", "#fff"];
        maThemes['09']['A']['head'] = ["#dbbc7f"];
        maThemes['09']['A']['mouth'] = ["#000"];
        maThemes['09']['A']['eyes'] = [ "#000", "none", "none"];
        maThemes['09']['A']['top'] = ["#531148", "#531148", "#531148", "none"];
    
        maThemes['09']['B']['env'] = ["#FFC107"];
        maThemes['09']['B']['clo'] = ["#033c58", "#fff", "#fff"];
        maThemes['09']['B']['head'] = ["#dbc97f"];
        maThemes['09']['B']['mouth'] = ["#000"];
        maThemes['09']['B']['eyes'] = ["none", "#fff", "#000"];
        maThemes['09']['B']['top'] = ["#FFEB3B", "#FFEB3B", "none", "#FFEB3B"];
    
        maThemes['09']['C']['env'] = ["#FF9800"];
        maThemes['09']['C']['clo'] = ["#b40000", "#fff", "#fff"];
        maThemes['09']['C']['head'] = ["#E2AF6B"];
        maThemes['09']['C']['mouth'] = ["#000"];
        maThemes['09']['C']['eyes'] = ["none", "#fff", "#000"];
        maThemes['09']['C']['top'] = ["#ec0000", "#ec0000", "none", "none"];
    
        // Drew
        maThemes['10']['A']['env'] = ["#104c8c"];
        maThemes['10']['A']['clo'] = ["#354B65", "#3D8EBB", "#89D0DA", "#00FFFD" ];
        maThemes['10']['A']['head'] = ["#cc9a5c"];
        maThemes['10']['A']['mouth'] = ["#222", "#fff"];
        maThemes['10']['A']['eyes'] = ["#000", "#000"];
        maThemes['10']['A']['top'] = ["#fff", "#fff", "none"];
    
        maThemes['10']['B']['env'] = ["#0DC15C"];
        maThemes['10']['B']['clo'] = ["#212121", "#fff", "#212121", "#fff" ];
        maThemes['10']['B']['head'] = ["#dca45f"];
        maThemes['10']['B']['mouth'] = ["#111", "#633b1d"];
        maThemes['10']['B']['eyes'] = ["#000", "#000"];
        maThemes['10']['B']['top'] = ["none", "#792B74", "#792B74"];
    
        maThemes['10']['C']['env'] = ["#ffe500"];
        maThemes['10']['C']['clo'] = ["#1e5e80", "#fff", "#1e5e80", "#fff"];
        maThemes['10']['C']['head'] = ["#e8bc86"];
        maThemes['10']['C']['mouth'] = ["#111", "none"];
        maThemes['10']['C']['eyes'] = ["#000", "#000"];
        maThemes['10']['C']['top'] = ["none", "none", "#633b1d"];
    
        // Blaze
        maThemes['11']['A']['env'] = ["#4a3f73"];
        maThemes['11']['A']['clo'] = ["#e6e9ee", "#f1543f", "#ff7058", "#fff", "#fff"];
        maThemes['11']['A']['head'] = ["#b27e5b"];
        maThemes['11']['A']['mouth'] = ["#191919", "#191919"];
        maThemes['11']['A']['eyes'] = ["#000", "#000", "#57FFFD"];
        maThemes['11']['A']['top'] = ["#ffc", "#ffc", "#ffc"];
    
        maThemes['11']['B']['env'] = ["#00a08d"];
        maThemes['11']['B']['clo'] = ["#FFBA32", "#484848", "#4e4e4e", "#fff", "#fff"];
        maThemes['11']['B']['head'] = ["#ab5f2c"];
        maThemes['11']['B']['mouth'] = ["#191919", "#191919"];
        maThemes['11']['B']['eyes'] = ["#000", "#ff23fa;opacity:0.39", "#000"];
        maThemes['11']['B']['top'] = ["#ff90f4", "#ff90f4", "#ff90f4"];
    
        maThemes['11']['C']['env'] = ["#22535d"];
        maThemes['11']['C']['clo'] = ["#000", "#ff2500", "#ff2500", "#fff", "#fff"];
        maThemes['11']['C']['head'] = ["#a76c44"];
        maThemes['11']['C']['mouth'] = ["#191919", "#191919"];
        maThemes['11']['C']['eyes'] = ["#000", "none", "#000"];
        maThemes['11']['C']['top'] = ["none", "#00efff", "none"];
    
        // Finn
        maThemes['12']['A']['env'] = ["#2668DC"];
        maThemes['12']['A']['clo'] = ["#2385c6", "#b8d0e0", "#b8d0e0"];
        maThemes['12']['A']['head'] = ["#ad8a60"];
        maThemes['12']['A']['mouth'] = ["#000", "#4d4d4d"];
        maThemes['12']['A']['eyes'] = ["#7fb5a2", "#d1eddf", "#301e19"];
        maThemes['12']['A']['top'] = ["#fff510", "#fff510"];
    
        maThemes['12']['B']['env'] = ["#643869"];
        maThemes['12']['B']['clo'] = ["#D67D1B", "#b8d0e0", "#b8d0e0"];
        maThemes['12']['B']['head'] = ["#CC985A", "none0000"];
        maThemes['12']['B']['mouth'] = ["#000", "#ececec"];
        maThemes['12']['B']['eyes'] = ["#1f2644", "#9b97ce", "#301e19"];
        maThemes['12']['B']['top'] = ["#00eaff", "none"];
    
        maThemes['12']['C']['env'] = ["#F599FF"];
        maThemes['12']['C']['clo'] = ["#2823C6", "#b8d0e0", "#b8d0e0"];
        maThemes['12']['C']['head'] = ["#C7873A"];
        maThemes['12']['C']['mouth'] = ["#000", "#4d4d4d"];
        maThemes['12']['C']['eyes'] = ["#581b1b", "#FF8B8B", "#000"];
        maThemes['12']['C']['top'] = ["none", "#9c0092"];
    
        // Jazzy
        maThemes['13']['A']['env'] = ["#d10084"];
        maThemes['13']['A']['clo'] = ["#efedee", "#00a1e0", "#00a1e0", "#efedee", "#ffce1c"];
        maThemes['13']['A']['head'] = ["#b35f49"];
        maThemes['13']['A']['mouth'] = ["#3a484a", "#000"];
        maThemes['13']['A']['eyes'] = ["#000"];
        maThemes['13']['A']['top'] = ["#000", "none", "#000", "none"];
    
        maThemes['13']['B']['env'] = ["#E6C117"];
        maThemes['13']['B']['clo'] = ["#efedee", "#ec0033", "#ec0033", "#efedee", "#f2ff05"];
        maThemes['13']['B']['head'] = ["#ffc016"];
        maThemes['13']['B']['mouth'] = ["#4a3737", "#000"];
        maThemes['13']['B']['eyes'] = ["#000"];
        maThemes['13']['B']['top'] = ["#ffe900", "#ffe900", "none", "#ffe900"];
    
        maThemes['13']['C']['env'] = ["#1d8c00"];
        maThemes['13']['C']['clo'] = ["#e000cb", "#fff", "#fff", "#e000cb", "#ffce1c"];
        maThemes['13']['C']['head'] = ["#b96438"];
        maThemes['13']['C']['mouth'] = ["#000", "#000"];
        maThemes['13']['C']['eyes'] = ["#000"];
        maThemes['13']['C']['top'] = ["#53ffff", "#53ffff", "none", "none"];
    
        // Rasta
        maThemes['14']['A']['env'] = ["#fc0065"];
        maThemes['14']['A']['clo'] = ["#708913", "#fdea14", "#708913", "#fdea14", "#708913"];
        maThemes['14']['A']['head'] = ["#DEA561"];
        maThemes['14']['A']['mouth'] = ["#444", "#000"];
        maThemes['14']['A']['eyes'] = ["#000"];
        maThemes['14']['A']['top'] = ["#32393f", "#32393f", "#32393f", "#32393f", "#32393f", "#32393f", "#32393f", "#32393f", "#32393f", "#32393f", "#32393f", "#32393f", "#32393f", "#32393f", "#32393f", "#32393f", "#32393f" ];
    
        maThemes['14']['B']['env'] = ["#81f72e"];
        maThemes['14']['B']['clo'] = ["#ff0000", "#ffc107", "#ff0000", "#ffc107", "#ff0000"];
        maThemes['14']['B']['head'] = ["#ef9831"];
        maThemes['14']['B']['mouth'] = ["#6b0000", "#000"];
        maThemes['14']['B']['eyes'] = ["#000"];
        maThemes['14']['B']['top'] = ["#FFFAAD", "#FFFAAD", "#FFFAAD", "#FFFAAD", "#FFFAAD", "#FFFAAD", "#FFFAAD", "#FFFAAD", "#FFFAAD", "#FFFAAD", "#FFFAAD", "#FFFAAD", "#FFFAAD", "none", "none", "none", "none"];
    
        maThemes['14']['C']['env'] = ["#00D872"];
        maThemes['14']['C']['clo'] = ["#590D00", "#FD1336", "#590D00", "#FD1336", "#590D00"];
        maThemes['14']['C']['head'] = ["#c36c00"];
        maThemes['14']['C']['mouth'] = ["#56442b", "#000"];
        maThemes['14']['C']['eyes'] = ["#000"];
        maThemes['14']['C']['top'] = ["#004E4C", "#004E4C", "#004E4C", "#004E4C", "#004E4C", "#004E4C", "#004E4C", "#004E4C", "#004E4C", "none", "none", "none", "none", "none", "none", "none", "none"];
    
        // Meta
        maThemes['15']['A']['env'] = ["#111"];
        maThemes['15']['A']['clo'] = ["#000", "#00FFFF"];
        maThemes['15']['A']['head'] = ["#755227"];
        maThemes['15']['A']['mouth'] = ["#fff", "#000"];
        maThemes['15']['A']['eyes'] = ["black", "#008;opacity:0.67", "aqua"];
        maThemes['15']['A']['top'] = ["#fff", "#fff", "#fff", "#fff", "#fff"];
    
        maThemes['15']['B']['env'] = ["#00D0D4"];
        maThemes['15']['B']['clo'] = ["#000", "#fff"];
        maThemes['15']['B']['head'] = ["#755227"];
        maThemes['15']['B']['mouth'] = ["#fff", "#000"];
        maThemes['15']['B']['eyes'] = ["black", "#1df7ff;opacity:0.64", "#fcff2c"];
        maThemes['15']['B']['top'] = ["#fff539", "none", "#fff539", "none", "#fff539"];
    
        maThemes['15']['C']['env'] = ["#DC75FF"];
        maThemes['15']['C']['clo'] = ["#000", "#FFBDEC"];
        maThemes['15']['C']['head'] = ["#997549"];
        maThemes['15']['C']['mouth'] = ["#fff", "#000"];
        maThemes['15']['C']['eyes'] = ["black", "black", "aqua"];
        maThemes['15']['C']['top'] = ["#00fffd", "none", "none", "none", "none"];


        // ***** //
        // PARTS //
        // ***** //

        maParts['00']['env'] = ['<path d="M33.83,33.83a115.5,115.5,0,1,1,0,163.34,115.49,115.49,0,0,1,0-163.34Z" style="fill:', ';"/>'];
        maParts['00']['clo'] = ['<path d="m141.74 195a114.93 114.93 0 0 1 37.912 16.45l0.07 0.05c-1.17 0.79-2.3601 1.55-3.5601 2.29a115.55 115.55 0 0 1-120.95 0.21q-2.0001-1.23-4.0002-2.54a114.79 114.79 0 0 1 38.002-16.5 116.21 116.21 0 0 1 15.791-2.49v-14.57c1.32 0.22 2.6501 0.39 4.0002 0.51 2.0001 0.19 4.0002 0.28 6.1202 0.29a64.333 64.33 0 0 0 8.8804-0.62c0.67003-0.09 1.3401-0.2 2.0001-0.31v14.69a118 118 0 0 1 15.741 2.54z" style="fill:', ';"/><path d="m79.292 212a3.4601 3.46 0 0 0 3.8902 5.07 3.3801 3.38 0 0 0 2.1001-1.61 3.4701 3.47 0 0 0-1.2801-4.72 3.4201 3.42 0 0 0-2.6201-0.34 3.5101 3.51 0 0 0-2.0901 1.6zm60.122 0.46a3.4901 3.49 0 0 0 1.21 4.7h0.06a3.4601 3.46 0 0 0 4.7202-1.27l0.07-0.13a3.4601 3.46 0 0 0-1.34-4.6 3.4601 3.46 0 0 0-2.5801-0.32 3.5301 3.53 0 0 0-2.1001 1.61zm9.8004 5.7 5.8602 5.87c-1.39 0.5-2.7901 1-4.2102 1.44l-4.4802-4.47a7.5203 7.52 0 0 1-1.9401 0.81 7.8303 7.83 0 0 1-6.0002-0.79 7.8703 7.87 0 0 1-2.9201-10.69v-0.07a7.8903 7.89 0 0 1 10.77-2.88l0.12 0.07a7.8603 7.86 0 0 1 2.7901 10.62v0.07zm-37.701-2.36-9.5004 9.51v4.9c-1.35-0.16-2.6801-0.33-4.0002-0.54v-6l0.58002-0.58 10.1-10.09a7.8703 7.87 0 1 1 2.8401 2.86zm7.3203-5.91a3.4601 3.46 0 1 0-1.6101 2.1 3.3801 3.38 0 0 0 1.6101-2.1zm-29.741 7.82 3.0901 3.1 0.59002 0.59v7.36c-1.3401-0.26-2.6801-0.55-4.0002-0.87v-4.84l-2.5101-2.51a7.5203 7.52 0 0 1-1.9401 0.81 7.8803 7.88 0 1 1 1.9101-14.43 7.8703 7.87 0 0 1 2.8901 10.75z" style="fill:', ';"/>'];
        maParts['00']['head'] = ['<path d="m115.5 51.75a63.75 63.75 0 0 0-10.5 126.63v14.09a115.5 115.5 0 0 0-53.729 19.027 115.5 115.5 0 0 0 128.46 0 115.5 115.5 0 0 0-53.729-19.029v-14.084a63.75 63.75 0 0 0 53.25-62.881 63.75 63.75 0 0 0-63.65-63.75 63.75 63.75 0 0 0-0.09961 0z" style="fill:', ';"/>'];
        maParts['00']['mouth'] = ['<path d="m94.19 136.84h42.632a3.7801 3.78 0 0 1 3.7802 3.78v3.22a15.231 15.23 0 0 1-15.211 15.16h-19.781a15.251 15.25 0 0 1-15.221-15.16v-3.22a3.8002 3.8 0 0 1 3.7802-3.78z" style="fill:', ';stroke-linecap:round;stroke-linejoin:round;stroke-width:3px;stroke:', ';"/><path d="m130.96 136.84v21.16m-30.911-21.16v21.16m10.34-21.16v22.16m10.31-22.2v22.2" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:3px;stroke:', ';"/>'];
        maParts['00']['eyes'] = ['<path d="m83.739 83.92h63.533a19.101 19.1 0 0 1 19.051 19 19.111 19.11 0 0 1-19.051 19h-63.533a19.091 19.09 0 0 1-19.001-19 19.091 19.09 0 0 1 19.001-19z" style="fill:', ';"/><path d="m140.23 93.54a9.3804 9.38 0 1 0 9.3804 9.38 9.3804 9.38 0 0 0-9.3804-9.38zm-49.402 0a9.3804 9.38 0 1 0 9.3804 9.38 9.3904 9.39 0 0 0-9.3804-9.38z" style="fill:', ';"/><rect x="79.795" y="98.627" width="71.471" height="8.5859" ry="4.2929" style="fill:', ';"/>'];
        maParts['00']['top'] = ['<path d="m32.902 67.662c-0.36295 1.7227-6.2342 30.695 5.6133 52.596 4.5843 8.4743 9.0081 13.239 12.75 15.893a67.7 67.7 0 0 1-3.4688-21.35 67.7 67.7 0 0 1 2.332-17.658c-4.4914-2.4646-10.868-6.9012-13.834-13.52-4.1626-9.285-3.6155-14.673-3.3926-15.961zm165.19 0c0.22292 1.2882 0.77005 6.6759-3.3926 15.961-2.9664 6.6183-9.3426 11.055-13.834 13.52a67.7 67.7 0 0 1 2.332 17.658 67.7 67.7 0 0 1-3.4688 21.35c3.7419-2.6532 8.1657-7.4183 12.75-15.893 11.847-21.9 5.9762-50.873 5.6133-52.596z" style="fill:', ';"/><path d="m115.73 13.191c-7.3787-0.13351-13.509 5.7888-13.631 13.168-0.10128 5.8827 3.4508 10.518 8.0566 12.52 1.061 0.46115 2.1869 0.78009 3.3418 0.95703v8.4291c0.66778-0.02035 1.3358-0.03077 2.0039-0.03125 0.66547-9e-5 1.3309 0.0097 1.9961 0.0293v-8.4115c2.6002-0.38406 5.1586-1.5484 7.3086-3.625 4.2322-4.0878 4.9991-9.8755 3.1582-14.549-1.8407-4.6726-6.3502-8.3834-12.232-8.4863z" style="fill:', ';"/>'];

        maParts['01']['env'] = ['<path d="M33.83,33.83a115.5,115.5,0,1,1,0,163.34,115.49,115.49,0,0,1,0-163.34Z" style="fill:', ';"/>'];
        maParts['01']['clo'] = ['<path d="m141.75 195a114.79 114.79 0 0 1 38 16.5 115.53 115.53 0 0 1-128.46 0 114.79 114.79 0 0 1 38-16.5c0 10.76 11.75 19.48 26.25 19.48s26.25-8.72 26.25-19.48z" style="fill:', ';"/><path d="m92.502 194.27v0.70391c0 4.3033 2.4373 8.2583 6.3807 11.183 4.2199 3.1204 10.106 5.0508 16.661 5.0508 6.548 0 12.434-1.9303 16.654-5.0508 3.9434-2.9245 6.388-6.8795 6.388-11.183v-0.67489c1.0768 0.21771 2.1463 0.44994 3.2158 0.69666h-7e-3c1.0695 0.24672 2.1318 0.50798 3.1867 0.791-0.27648 6.103-3.6524 11.553-8.9708 15.493-5.2821 3.9114-12.521 6.328-20.466 6.328-7.9449 0-15.184-2.4165-20.474-6.328-5.333-3.9477-8.7089-9.4194-8.9708-15.544 1.055-0.27577 2.1099-0.53702 3.1722-0.78376 1.0695-0.23947 2.1463-0.46443 3.2304-0.68213z" style="fill:', ';"/>'];
        maParts['01']['head'] = ['<path d="m115.5 51.75a63.75 63.75 0 0 0-10.5 126.63v14.09a115.5 115.5 0 0 0-53.729 19.027 115.5 115.5 0 0 0 128.46 0 115.5 115.5 0 0 0-53.729-19.029v-14.084a63.75 63.75 0 0 0 53.25-62.881 63.75 63.75 0 0 0-63.65-63.75 63.75 63.75 0 0 0-0.09961 0z" style="fill:', ';"/>'];
        maParts['01']['mouth'] = ['<path d="m100.35 143.85a7.67 7.67 0 0 0 7.58 7.7v0a7.66 7.66 0 0 0 7.57-7.7 7.66 7.66 0 0 0 7.57 7.7v0a7.67 7.67 0 0 0 7.58-7.7" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:6.3998px;stroke:', ';"/>'];
        maParts['01']['eyes'] = ['<path d="m78.73 111a10.9 10.9 0 0 1 15.19 0m43.16 0a10.9 10.9 0 0 1 15.19 0" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:6.1999px;stroke:', ';"/><path d="m79.804 123.74h7.07m57.273 0h7.05" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:5.9998px;stroke:', ';"/>'];
        maParts['01']['top'] = ['<path d="m57.534 142.03c-6.9383-31.75-0.57294-52.577 14.174-62.344 22.562-12.283 62.082-12.222 83.484-1.8846 21.348 11.177 22.124 37.396 18.498 63.733 8.1279-14.155 13.164-31.598 14.085-48.902 1.0828-11.795-1.1756-18.866-7.4833-27.972-26.465-37.685-103.45-31.56-129.66-2.8372-7.8504 9.4615-9.6006 17.478-9.275 26.667 1.0024 18.667 6.9688 38.508 16.18 53.54z" style="fill:', ';"/><path d="m111.26 3.0423c-6.013 0.1128-12.629 2.6924-15.291 7.9082-1.1676 3.2383-1.6758 6.2069-1.6758 8.8926 0.89228-0.2661 1.8005-0.5164 2.7266-0.7441 3.7502-1.0672 7.4851-1.7135 11.129-1.9981 1.1007-0.086 2.1953-0.1391 3.2773-0.1601h2e-3c5.6969-0.1133 11.09 0.6603 15.904 2.0527 0.0552-3.042-0.70696-5.9824-2.1738-8.5-1.8411-3.1599-4.7033-5.5568-8.4297-6.8262-1.6883-0.4952-3.5163-0.662-5.4688-0.625zm3.0664 17.449c-0.69317-0.01-1.3919-0.01-2.0938 0h-2e-3c-1.1591 0.019-2.3326 0.064-3.5117 0.1386-3.9035 0.246-7.9025 0.8061-11.92 1.7285-15.159 3.0075-26.469 9.9279-22.068 19.682 22.891-8.7773 52.315-10.403 76.023-2.2129 2.1414-9.5529-14.939-19.081-36.428-19.34z" style="fill:', ';"/><path d="m165.62 16.981c-0.8575 0-1.9406 0.54389-3.3476 1.3574-7.3382 4.7652-13.452 10.867-19.516 18.363 9.2734 2.1825 17.903 5.6706 25.213 10.604 1.1512-9.1263 1.9137-18.503 0.055-26.996-0.57-2.4184-1.3017-3.3267-2.4043-3.3281zm-104.09 1.6934c-1.1026 0-1.8342 0.91165-2.4043 3.3301-1.8794 8.5869-1.0806 18.078 0.092 27.299 7.0559-4.6638 15.687-8.3667 25.111-10.984-6.043-7.4601-12.139-13.537-19.451-18.285-1.407-0.81353-2.4901-1.3605-3.3477-1.3594z" style="fill:', ';"/><path d="m162.45 16.686c-2.3175 2e-3 -4.6276 0.57608-6.8926 1.668-8.4768 6.0155-11.113 13.349-10.133 19.787 10.323 2.7077 19.762 7.0658 27.346 13.279 9.848-4.9363 11.32-17.137 4.6152-25.852-4.7104-6.1222-9.8371-8.8878-14.936-8.8828zm-97.318 4.1387c-2.4569 0.0556-5.1642 0.54474-8.1172 1.5176-13.487 4.4433-19.06 21.215-3.6484 31.84 7.2476-6.0694 16.961-10.896 27.892-14.229 0.2193-3.3241-0.3201-7.0817-1.8691-11.236-2.8049-4.8445-7.2233-7.721-13.221-7.8906-0.3408-0.01-0.6861-0.01-1.0371-2e-3z" style="fill:', ';"/>'];

        maParts['02']['env'] = ['<path d="M33.83,33.83a115.5,115.5,0,1,1,0,163.34,115.49,115.49,0,0,1,0-163.34Z" style="fill:', ';"/>'];
        maParts['02']['clo'] = ['<path d="m141.75 195a114.79 114.79 0 0 1 38 16.5 115.53 115.53 0 0 1-128.46 0 114.79 114.79 0 0 1 38-16.5c0 10.76 11.75 19.48 26.25 19.48s26.25-8.72 26.25-19.48z" style="fill:', ';"/>'];
        maParts['02']['head'] = ['<path d="m115.5 51.75a63.75 63.75 0 0 0-10.5 126.63v14.09a115.5 115.5 0 0 0-53.729 19.027 115.5 115.5 0 0 0 128.46 0 115.5 115.5 0 0 0-53.729-19.029v-14.084a63.75 63.75 0 0 0 53.25-62.881 63.75 63.75 0 0 0-63.65-63.75 63.75 63.75 0 0 0-0.09961 0z" style="fill:', ';"/>'];
        maParts['02']['mouth'] = ['<path d="m115.5 161.71c-8.24 0-14.46-4.15-19.19-11.25 3.37-2.44 6.51-4.57 10-6.79a5.25 5.25 0 0 1 5.48-0.17 28.19 28.19 0 0 1 3.68 2.75 28.19 28.19 0 0 1 3.68-2.75 5.25 5.25 0 0 1 5.48 0.17c3.52 2.22 6.66 4.35 10 6.79-4.74 7.1-11 11.25-19.19 11.25z" style="fill:', ';"/>'];
        maParts['02']['eyes'] = ['<path d="m172.7 90.75h-6.54c-0.14-0.1-0.26-0.22-0.4-0.3-4.48-2.76-22.75-2.11-33.71 1.2-1 0.3-1.91 0.61-2.75 0.94-1.8937 0.79244-3.8739 1.3597-5.9 1.69-5.5051 0.79002-10.403 0.79002-15.908 0-2.0261-0.33034-4.0063-0.89756-5.9-1.69-0.84-0.33-1.76-0.64-2.75-0.94-11-3.31-29.23-4-33.71-1.2-0.13832 0.08869-0.2688 0.18906-0.39 0.3h-6.55c-1.1046 0-2 0.89543-2 2v4.66c-0.0013 0.98185 0.49088 1.8986 1.31 2.44l1.9 1.27c0.59238 0.38889 0.93475 1.0622 0.9 1.77-0.14175 5.4854 0.88072 10.939 3 16 3.58 8.38 16 10.9 24.93 10.9 2.6976 0.0771 5.3921-0.2361 8-0.93 4.35-1.43 8.24-7.36 10.45-12.42 1.7607-3.8506 2.7493-8.009 2.91-12.24 7.3e-4 -0.7138 0.38183-1.3731 1-1.73 3.2281-1.951 6.5798-1.951 9.8079 0 0.61817 0.3569 0.99927 1.0162 1 1.73 0.16067 4.231 1.1493 8.3894 2.91 12.24 2.21 5.06 6.1 11 10.45 12.42 2.6079 0.6939 5.3024 1.0071 8 0.93 8.92 0 21.35-2.52 24.93-10.9 2.1193-5.0614 3.1418-10.515 3-16-0.0348-0.70778 0.30762-1.3811 0.9-1.77l1.9-1.27c0.81913-0.54136 1.3113-1.4582 1.31-2.44v-4.6c0.0336-1.1048-0.83521-2.0274-1.94-2.06z" style="fill:', ';stroke-linecap:round;stroke-linejoin:round;stroke-width:2.5;stroke:', ';"/>'];
        maParts['02']['top'] = ['<path d="m124.22 13.61c-19.783 0-36.945 8.0887-39.695 24.106-15.332 0.23539-31.831 2.7712-41.663 15.782-6.0238 7.9604-7.0402 19.901-6.8476 31.724 0.46007 28.503 10.742 64.228-4.3012 89.714 16.584 5.7777 43.086 10.742 73.59 11.662v-8.6558c-1.851-0.35308-3.6592-0.78105-5.4353-1.2732-30.953-8.4632-50.672-36.635-47.259-68.669 1.5514-10.603 4.6221-19.665 10.025-27.69 5.3818-7.9925 13.267-15.717 23.892-21.41 0.40658 0.72757 1.9901 3.5843 2.4074 4.3012 7.5003 12.775 17.986 23.849 33.157 26.866 12.433 2.4609 23.849 3.4666 36.346 1.1555 4.2584-0.78106 10.667-2.3967 14.851-2.4181 14.861 33.404-1.0806 75.035-40.668 87.457-2.2255 0.70616-4.5258 1.316-6.8904 1.8189 0 2.707-0.0428 5.6493-0.0642 8.5274 23.603-0.72757 48.682-4.0444 72.874-11.234-18.521-32.152 0.81315-89.083-10.036-121.46-9.0731-26.973-38.85-40.315-64.282-40.305z" style="fill:', ';"/><path d="m33.147 172.32c-2.6535 5.1143-6.088 9.9504-10.1 12.411 7.8427 10.453 17.387 19.516 28.257 26.781 16.038-10.731 35.629-17.055 54-18.606v-9.0089c-30.065-0.94155-56.108-5.8847-72.157-11.577zm164.06 0.55637c-23.731 7.0723-48.361 10.325-71.525 11.042-0.0321 3.1242-0.0535 6.2377-0.0107 9.0517 19.227 1.7226 37.908 7.8534 53.989 18.542 0.0107 0 0.0107 0 0.0214 0.0107 10.731-7.1686 20.179-16.081 27.958-26.374-4.2798-2.3967-7.832-6.9653-10.432-12.272z" style="fill:', ';"/><path d="m50.02 46.5c-2.9297 1.9143-6.1313 3.8826-10.154 7.9805-14.091 14.359-16.145 27.701-6.1406 44.018 4.2049 6.8583 6.1414 13.706-0.24609 20.5-7.7143 8.1957-21.559 4.2912-21.537 16.061 0.0214 8.613 15.063 7.9178 22.531 13.984 3.7662 3.0707 5.0836 8.3992 2.0664 12.508-4.2156 5.7456-16.006 7.3715-22.629 8.9336 5.8811 10.843 13.45 20.638 22.355 29.033l0.0039 0.0234 0.0059-0.0137c2e-3 2e-3 0.0038 4e-3 0.0059 6e-3 0.0034-0.0112 0.0063-0.0219 0.0098-0.0332 14.775-12.218 20.268-20.965 49.461-28.434-17.404-10.258-30.68-27.122-24.143-35.34 4.4123-5.5444 5.6612-7.8633 6.4062-12.078 2.3582-13.339-10.208-22.335-9.2363-32.715 1.9432-8.2346 11.379-11.173 16.947-15.115 5.4577-3.9082 9.8014-8.7695 10.799-16.918-13.558-4.8896-17.609-5.8617-36.506-12.4zm140.87 19.357c-3.4404-0.91243-23.311 122.43 4.4121 133.14 8.9661-8.5809 16.552-18.584 22.404-29.658 0-0.31029-25.133-3.9922-25.979-14.018-0.10699-1.1769 0.11822-1.4855 0.86718-2.502 6.6764-9.2122 30.716-11.416 29.646-23.496-0.27818-3.1563-4.1617-5.2334-6.7402-6.4531-12.155-5.767-32.942-9.6494-15.031-24.543 9.2122-7.3505 10.43-8.4323 0.59766-14.691-9.4583-6.0238-9.394-11.993-9.7578-16.326-0.0767-0.93035-0.22089-1.4003-0.41992-1.4531z" style="fill:', ';"/><path d="m133.83 39.909c-11.33 1.393-9.5492 16.204-2e-3 16.643-4.5102 10.717 9.0165 16.181 14.441 8.3125 6.562 8.6765 18.596 0.94751 14.457-8.3125 11.718-1.5381 9.2769-16.099 0-16.643 4.503-10.867-9.4883-16.101-14.457-8.3301-6.8832-9.0411-18.509-0.47321-14.439 8.3301z" style="fill:', ';"/><path d="m153.86 48.222c0-3.0528-2.5184-5.5648-5.5791-5.5648-3.0783 0-5.5793 2.512-5.5793 5.5648 0 3.0703 2.501 5.5648 5.5793 5.5648 3.0606 0 5.5791-2.4946 5.5791-5.5648z" style="fill:', ';"/>'];

        maParts['03']['env'] = ['<path d="M33.83,33.83a115.5,115.5,0,1,1,0,163.34,115.49,115.49,0,0,1,0-163.34Z" style="fill:', ';"/>'];
        maParts['03']['clo'] = ['<path d="m141.75 195c13.563 3.1499 26.439 8.7409 38 16.5-38.873 26.001-89.587 26.001-128.46 0 11.561-7.7591 24.437-13.35 38-16.5 8.4869 8.8011 26.21 25.619 26.21 25.619s17.603-16.972 26.25-25.619z" style="fill:', ';"/><path d="m109 230.81 1.6836-14.33h9.6328l1.6836 14.33c-2.16 0.12-4.33 0.19-6.51 0.19s-4.35-0.07-6.51-0.19z" style="fill:', ';"/><path d="m124.17 210.6h-17.349v5.53a3.8828 3.29 0 0 0 3.8828 3.29h9.583a3.8828 3.29 0 0 0 3.8828-3.29z" style="fill:', ';"/><path d="m140.57 190.36-25.066 20.245c5.9686 3.2455 11.597 7.0814 16.8 11.45 1.5989 1.3338 3.9762 1.1189 5.31-0.48 0.21005-0.25749 0.38802-0.53956 0.52999-0.84l10.826-23.805-4-6c-0.90256-1.351-2.7298-1.7137-4.08-0.81-0.11612 0.0786-0.22641 0.16549-0.33 0.26z" style="fill:', ';"/><path d="m90.434 190.36 25.066 20.245c-5.9686 3.2455-11.597 7.0814-16.8 11.45-1.5989 1.3338-3.9762 1.1189-5.31-0.48-0.21005-0.25749-0.38802-0.53956-0.52999-0.84l-10.826-23.805 4-6c0.90256-1.351 2.7298-1.7137 4.08-0.81 0.11612 0.0786 0.22641 0.16549 0.33 0.26z" style="fill:', ';"/>'];
        maParts['03']['head'] = ['<path d="m115.5 51.75a63.75 63.75 0 0 0-10.5 126.63v14.09a115.5 115.5 0 0 0-53.729 19.027 115.5 115.5 0 0 0 128.46 0 115.5 115.5 0 0 0-53.729-19.029v-14.084a63.75 63.75 0 0 0 53.25-62.881 63.75 63.75 0 0 0-63.65-63.75 63.75 63.75 0 0 0-0.09961 0z" style="fill:', ';"/>'];
        maParts['03']['mouth'] = ['<path d="m136.21 147.09a21.77 21.77 0 0 1-40.13 0z" style="fill:', ';stroke-linecap:round;stroke-linejoin:round;stroke-width:3.4999px;stroke:', ';"/>'];
        maParts['03']['eyes'] = ['<path d="m145.39 104.7-11.52 11.2h17.26m-65.52-11.2 11.52 11.2h-17.26" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:5.4998px;stroke:', ';"/>'];
        maParts['03']['top'] = ['<path d="m43.891 77.836c-5.1124 28.237 2.1347 61.004 24.792 81.332-6.2362-12.503-9.5362-33.948-9.4887-45.458-0.50203-37.473 41.439-46.335 56.149-17.614 18.8-31.2 52.825-16.872 54.062 13.714 0.56018 13.844-0.43568 25.598-7.0962 48.966 18.372-12.47 28.012-53.959 23.545-80.941-47.486-2.2552-94.831-2.5724-141.96 0z" style="fill:', ';"/><path d="m111.26 12.782c-18.508 0.0791-32.594 3.6163-32.594 3.6163 24.513 5.6002 32.807 10.504 31.743 19.835-0.87227 9.702-11.092 10.875-20.811 11.554-5.2548 0.36414-10.949 0.71523-16.391 1.7525-11.862 2.2818-19.946 4.3736-24.447 11.956-1.7012 2.8662-3.7945 10.428-4.8689 16.34h141.96c-5.7242-38.563-32.557-65.073-74.595-65.054z" style="fill:', ';"/><path d="m73.292 44.77c-11.788 2.2816-18.923 5.5444-23.394 13.126-2.8484 6.7586-4.8454 13.238-6.0072 19.939h141.96c-1.9772-14.576-6.8677-28.248-19.277-32.098-28.834-6.3308-63.774-6.3553-93.285-0.96761z" style="fill:', ';"/><path d="m165.95 35.642c-11.178 21.829-91.89 19.36-103.98 2.3011-9.703 12.267-15.605 25.883-18.079 39.892h141.96c-3.0096-17.158-9.7424-32.688-19.902-42.193z" style="fill:', ';"/>'];

        maParts['04']['env'] = ['<path d="M33.83,33.83a115.5,115.5,0,1,1,0,163.34,115.49,115.49,0,0,1,0-163.34Z" style="fill:', ';"/>'];
        maParts['04']['clo'] = ['<path d="m141.75 195a114.79 114.79 0 0 1 38 16.5 115.53 115.53 0 0 1-128.46 0 114.79 114.79 0 0 1 38-16.5l15.71 15.75h21z" style="fill:', ';"/><path d="m115.45 211.34-10.55 10.54a2.51 2.51 0 0 1-3.5599 0 2 2 0 0 1-0.26999-0.30994l-18.48-25.4 5.8901-5.8899a2.52 2.52 0 0 1 3.5199-0.0791l23.49 21.14z" style="fill:', ';"/><path d="m115.45 211.34 10.55 10.54a2.51 2.51 0 0 0 3.5599 0 2 2 0 0 0 0.26999-0.30994l18.48-25.4-5.8901-5.8899a2.52 2.52 0 0 0-3.4699-0.089l-23.49 21.14z" style="fill:', ';"/><path d="m158.41 199.58-10.11-3.2401v29.93q5.1601-1.5299 10.11-3.51zm-75.82 26.66v-29.9l-10.1 3.2401v23.14c3.2901 1.3199 6.67 2.4999 10.1 3.5199z" style="fill:', ';"/>'];
        maParts['04']['head'] = ['<path d="m115.5 51.75a63.75 63.75 0 0 0-10.5 126.63v14.09a115.5 115.5 0 0 0-53.729 19.027 115.5 115.5 0 0 0 128.46 0 115.5 115.5 0 0 0-53.729-19.029v-14.084a63.75 63.75 0 0 0 53.25-62.881 63.75 63.75 0 0 0-63.65-63.75 63.75 63.75 0 0 0-0.09961 0z" style="fill:', ';"/>'];
        maParts['04']['mouth'] = ['<path d="m118.05 148.38c-1.5064 0.59192-2.595 2.0264-2.6191 3.9863-0.0574 1.3977 0.53421 3.5611 3.6758 5.7949 8.0544 4.9446 21.507 3.6862 21.255-7.1658-4.664 4.8219-10.021 5.6377-14.773 0.73907-1.2328-1.1599-2.3694-2.4032-3.9294-3.1408-1.0946-0.50424-2.2257-0.61071-3.6096-0.21337z" style="fill:', ';"/><path d="m133.61 154.93c3.0731-0.48816 5.5702-2.8457 5.4438-4.5059-0.47801-4.8311-5.7317-3.0917-4.3369-0.31405-2.8103-1.4445-1.8343-3.8862 0.50427-4.7324 2.0509-0.79942 5.0937 0.34314 6.2002 2.6376 2.2229 7.3422-3.4376 11.68-10.384 12.561z" style="fill:', ';"/><path d="m112.81 148.38c1.5064 0.59192 2.595 2.0264 2.6191 3.9863 0.0574 1.3977-0.53421 3.5611-3.6758 5.7949-8.0544 4.9446-21.507 3.6862-21.255-7.1658 4.664 4.8219 10.021 5.6377 14.773 0.73907 1.2328-1.1599 2.3694-2.4032 3.9294-3.1408 1.0946-0.50424 2.2257-0.61071 3.6096-0.21337z" style="fill:', ';"/><path d="m97.252 154.93c-3.0731-0.48816-5.5702-2.8457-5.4438-4.5059 0.47801-4.8311 5.7317-3.0917 4.3369-0.31405 2.8103-1.4445 1.8343-3.8862-0.50427-4.7324-2.0509-0.79942-5.0937 0.34314-6.2002 2.6376-2.2229 7.3422 3.4376 11.68 10.384 12.561z" style="fill:', ';"/>'];
        maParts['04']['eyes'] = ['<path d="m131.64 114.09 7.5801-7.5801 7.5801 7.5801m-62.6 0 7.5801-7.5801 7.5799 7.5801" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:6.4998px;stroke:', ';"/>'];
        maParts['04']['top'] = ['<path d="m137.38 11.148c-12.23 1.9593-18.511 14.606-43.436 9.4915-11.285-3.2054-16.406-3.573-20.389 0.58594-4.1548 4.3384-7.033 12.435-9.8184 21.706-2.1354 7.4136-3.7187 14.381-4.7461 21.646h112.7c-3.4878-24.293-10.822-43.281-25.182-51.061-3.5314-1.623-6.5274-2.2959-9.1289-2.3613z" style="fill:', ';"/><path d="m114.37 43.383c-19.445 0.088-38.524 2.0724-52.379 5.6992-1.2766 4.5795-2.4317 10.169-3.2285 16.807h113.11c-0.83731-6.0107-1.9164-11.674-3.3184-16.924-15.229-3.8842-34.873-5.6693-54.18-5.582z" style="fill:', ';"/><path d="m115.5 55.773c-58.39 0-105.73 15.476-105.73 34.57h0.0312c0 11.295 16.496 21.319 42.126 27.627-0.10331-7.7704 2.788-21.904 5.2734-31.031 6.0935-1.7168 6.9294-1.8971 13.167-2.9919 14.874-2.8256 29.99-4.2037 45.133-4.1153 15.143-0.0884 30.259 1.2897 45.133 4.1153 6.2372 1.0947 7.2065 1.2751 13.3 2.9919 2.4854 9.1267 5.3768 23.26 5.2734 31.031 25.63-6.3082 41.993-16.332 41.993-27.627h0.0312c0-19.093-47.34-34.57-105.73-34.57z" style="fill:', ';"/><path d="m72.088 83.533c-6.9765 1.1147-13.357 2.856-18.439 4.3477-1.1861 7.415-2.0038 18.858-1.8926 26.293 4.3278-0.62795 10.155-1.3644 13.295-1.6465-0.40554 0.30198 2.7344-17.827 7.0371-28.994zm86.824 0c4.3028 11.167 7.4426 29.296 7.0371 28.994 3.1396 0.28213 8.9671 1.0185 13.295 1.6465 0.11119-7.4351-0.70652-18.878-1.8926-26.293-5.0822-1.4916-11.463-3.2329-18.439-4.3477z" style="fill:', ';"/>'];

        maParts['05']['env'] = ['<path d="M33.83,33.83a115.5,115.5,0,1,1,0,163.34,115.49,115.49,0,0,1,0-163.34Z" style="fill:', ';"/>'];
        maParts['05']['clo'] = ['<path d="m141.75 194.98a114.79 114.78 0 0 1 38 16.498 115.53 115.52 0 0 1-128.46 0 114.79 114.78 0 0 1 38-16.498l15.71 15.748h21z" style="fill:', ';"/><path d="m70 200.88v20.77c-2.22-0.95325-4.3999-1.9698-6.5399-3.0496h-0.10088v-14.621c2.17-1.1 4.39-2.1399 6.64-3.0996z" style="fill:', ';"/><path d="m161 200.88v20.77c1.9-0.80986 3.7702-1.6798 5.6201-2.5898l0.0989-0.0494 0.82005-0.40997h0.10088v-14.621c-2.17-1.1-4.39-2.1399-6.6402-3.0996z" style="fill:', ';"/><polygon transform="matrix(1 0 0 .99987 4e-5 -3e-5)" points="97.32 201.93 115.5 223.72 133.68 201.93" style="fill:', ';"/><path d="m111.2 230.88 1.31-16.908c0.32992 1.2798 5.6399 1.2798 5.9999 0l1.3201 16.938c-1.4301 0.0494-2.8601 0.089-4.3 0.089s-2.87 0-4.3-0.089z" style="fill:', ';"/><path d="m115.49 201.79v0.0692l-7.55 12.678-7.0001 11.809-19.19-26.487c0.60999-0.42995 1.22-0.89985 1.8001-1.3899a52 51.993 0 0 0 10.07-10.619l21.79 13.878z" style="fill:', ';"/><path d="m149.24 199.86-19.08 26.517-7.0001-11.809-7.57-12.678-0.0593-0.10086 21.94-13.998a52.21 52.203 0 0 0 10.08 10.699c0.58013 0.47009 1.1502 0.92002 1.7301 1.3399z" style="fill:', ';"/>'];
        maParts['05']['head'] = ['<path d="m115.5 51.75a63.75 63.75 0 0 0-10.5 126.63v14.09a115.5 115.5 0 0 0-53.729 19.027 115.5 115.5 0 0 0 128.46 0 115.5 115.5 0 0 0-53.729-19.029v-14.084a63.75 63.75 0 0 0 53.25-62.881 63.75 63.75 0 0 0-63.65-63.75 63.75 63.75 0 0 0-0.09961 0z" style="fill:', ';"/>'];
        maParts['05']['mouth'] = ['<path d="m122.83 151.88a10.49 10.489 0 0 1-14.66 0" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:6.1996px;stroke:', ';"/>'];
        maParts['05']['eyes'] = ['<path d="m70.959 94.985h35.031c2.4086 1e-5 4.3612 1.9523 4.3612 4.3606l-2.5864 17.511c-0.3515 2.3799-1.7218 4.3606-3.8457 4.3606h-30.9c-2.1239-1e-5 -3.8457-1.9523-3.8457-4.3606l-2.5864-17.511c1e-5 -2.4082 1.9526-4.3606 4.3612-4.3606z" style="fill:', ';stroke-linecap:round;stroke-linejoin:round;stroke-width:3.0045px;stroke:', ';"/><path d="m160.05 94.985h-35.031c-2.4086 1e-5 -4.3612 1.9523-4.3612 4.3606l2.5864 17.511c0.35149 2.3799 1.7218 4.3606 3.8457 4.3606h30.9c2.1239-1e-5 3.8457-1.9523 3.8457-4.3606l2.5864-17.511c-1e-5 -2.4082-1.9526-4.3606-4.3612-4.3606z" style="fill:', ';stroke-linecap:round;stroke-linejoin:round;stroke-width:3.0045px;stroke:', ';"/><path d="m90.607 102.35a4.6337 4.6332 0 1 0 4.6892 4.6337 4.6337 4.6332 0 0 0-4.6892-4.6337zm49.72 0a4.6337 4.6332 0 1 0 4.6444 4.6337 4.6337 4.6332 0 0 0-4.6444-4.6337z" style="fill:', ';"/><path d="m70.66 94.985h-11.775" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:3.0045px;stroke:', ';"/><path d="m172.13 94.985h-19.484" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:3.0045px;stroke:', ';"/><path d="m109.32 106.2c4.2045-2.427 9.3036-1.913 12.353-0.0258" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:3.0045px;stroke:', ';"/><path d="m148.33 109.79-5.7626-8.2324" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:4;stroke:', ';"/><path d="m156.27 105-2.403-3.4328" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:4;stroke:', ';"/><path d="m82.748 114.34-8.9489-12.784" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:4;stroke:', ';"/><path d="m91.408 109.79-5.7626-8.2324" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:4;stroke:', ';"/>'];
        maParts['05']['top'] = ['<path d="m41.835 75.131c-2.8674 12.582 1.2304 27.241 6.0238 39.031 0.25861 0.63658 0.51208 1.3075 0.79989 1.9683 0.71726 1.658 2.1184 3.9751 3.0038 3.9266 0.56895-0.0312 0.71637-1.5512 1.0228-3.1562 2.1988-19.097 8.8981-27.915 15.636-38.107 2.8783-4.0645 3.8616-7.2293 1.0644-9.9325-6.3236-3.5596-14.924-2.8574-21.367-0.67406-3.2312 1.4765-5.2427 3.4773-6.1842 6.9439zm125.65-8.5679c7.65-0.70616 19.714-0.1307 21.694 8.5679 1.455 6.4083 0.26915 17.747-1.0542 24.579-1.1961 5.3203-3.8066 14.231-7.8782 19.75-0.5565 0.44544-0.96888 0.13656-1.4159-1.1606-0.90692-3.0353-1.4298-7.8372-2.2556-10.727-3.4822-12.79-8.2195-21.875-14.429-29.94-5.5782-6.8415-4.2152-9.7207 5.3393-11.069z" style="fill:', ';"/><path d="m112.27 73.826c-18.585-7.5217-34.987-14.797-48.939 5.018-4.9752 7.083-3.7876 8.8056-4.9217 0.0749-1.637-12.476-4.7505-34.174 1.9259-45.194 7.6822-12.7 19.323-13.128 31.039-5.3818 10.796 7.7784 24.277 14.647 38.015 12.219 12.732-2.2576 15.835-7.7464 15.707-19.912-0.0215-2.6-0.0963-5.2106-0.2033-7.7999 13.631 3.9267 24.609 14.776 26.513 29.049 0.88804 6.6336 0.26749 12.722-1.9259 19.013-5.9702 17.108-30.119 20.896-45.74 16.841-3.9588-1.0378-7.6822-2.4181-11.47-3.9267z" style="fill:', ';"/>'];

        maParts['06']['env'] = ['<path d="M33.83,33.83a115.5,115.5,0,1,1,0,163.34,115.49,115.49,0,0,1,0-163.34Z" style="fill:', ';"/>'];
        maParts['06']['clo'] = ['<path d="m115.5 231a115 115 0 0 0 64.23-19.5 114.79 114.79 0 0 0-38-16.5l-2.41-9a125.19 125.19 0 0 0-13.32-2.28v8.75q3.52 0.32 7 0.84l-17.5 17.48-17.5-17.48q3.45-0.52 7-0.84v-8.75a125.55 125.55 0 0 0-13.34 2.28l-2.41 9a114.79 114.79 0 0 0-38 16.5 114.94 114.94 0 0 0 64.25 19.5z" style="fill:', ';"/><path d="m132.98 193.33-36.185 36.155-2.4-0.42 36.108-36.081z" style="fill:', ';"/>'];
        maParts['06']['head'] = ['<path d="m115.5 51.75a63.75 63.75 0 0 0-10.5 126.63v14.09a115.5 115.5 0 0 0-53.729 19.027 115.5 115.5 0 0 0 128.46 0 115.5 115.5 0 0 0-53.729-19.029v-14.084a63.75 63.75 0 0 0 53.25-62.881 63.75 63.75 0 0 0-63.65-63.75 63.75 63.75 0 0 0-0.09961 0z" style="fill:', ';"/>'];
        maParts['06']['mouth'] = ['<path d="m127.84 146.73c-2.24 8.93-6.92 15.08-12.34 15.08s-10.1-6.15-12.34-15.08z" style="fill:', ';stroke-linecap:round;stroke-linejoin:round;stroke-width:2.9999px;stroke:', ';"/>'];
        maParts['06']['eyes'] = ['<path d="m129.31 114.14 20-5.37m-47.66 5.37-20-5.37" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:4.9998px;stroke:', ';"/>'];
        maParts['06']['top'] = ['<path d="m169.65 90.998c3.137 11.94 4.9371 36.484-3.4118 58.213l5.129 3.1164c10.044-15.199 14.959-39.163 13.943-61.33z" style="fill:', ';"/><path d="m45.081 90.989c-0.88085 4.9304-0.87534 14.953-0.15027 21.75 2.1318 19.98 16.671 42.505 16.671 42.505l5.7352-4.4331s-13.244-31.348-6.0571-52.751c0.52108-1.5517 0.95592-2.916 1.3462-4.1835z" style="fill:', ';"/><path d="m117 3.4883c-8.2136-0.19887-19.13 7.933-18.494 9.3516 1.6214 3.6186 11.176 22.55 11.889 23.963h10.148c2.6022-6.3102 11.32-26.531 11.32-26.531s-4.1382-4.138-12.416-6.4375c-0.77605-0.21556-1.5976-0.32513-2.4473-0.3457z" style="fill:', ';"/><path d="m115.95 4.5428c-3.1563 0-6.3123 0.57462-9.2165 1.715-5.8084 2.2817-10.532 6.808-12.779 12.245v-5e-3c-1.8166 4.397-2.0233 9.3441-0.58058 13.857 0.69352 2.1687 1.7693 4.2296 3.1533 6.0968h38.893c0.71032-0.95769 1.3441-1.9641 1.8787-3.0144 2.6811-5.2673 2.9296-11.542 0.67253-16.975-2.257-5.4337-6.9893-9.9522-12.802-12.224-2.9064-1.1335-6.0633-1.6987-9.2196-1.6956z" style="fill:', ';"/><path d="m92.512 28.125c0.13387 1.4318 0.41877 2.8511 0.85962 4.2306 1.4429 4.5127 4.5278 8.5654 8.6411 11.353 4.1135 2.7873 9.2311 4.2913 14.336 4.2165 5.1052-0.0764 10.168-1.7333 14.181-4.6419 2.8754-2.0834 5.2132-4.7932 6.7665-7.8447 1.2005-2.3586 1.9085-4.9188 2.127-7.5156-15.037-2.6407-31.421-3.4671-46.912 0.20253z" style="fill:', ';"/><path d="m34.426 90.63c14.714 4.0779 22.683 6.4085 45.254 7.4257 2.5318-18.185 4.6689-28.672 10.023-38.352 3.2025 13.403 3.8346 25.22 2.9106 42.253l11.172-0.23161c1.4706-11.886 3.8989-29.213 2.1636-42.021 10.416 12.631 11.373 23.624 13.077 39.726 30.174-0.76004 59.808-4.5121 77.845-10.128-10.76-38.608-41.475-55.66-80.38-56.104-38.182-0.45134-74.543 22.405-82.065 57.432z" style="fill:', ';"/>'];

        maParts['07']['env'] = ['<path d="M33.83,33.83a115.5,115.5,0,1,1,0,163.34,115.49,115.49,0,0,1,0-163.34Z" style="fill:', ';"/>'];
        maParts['07']['clo'] = ['<path d="m88.18 194.11c-4.2079 1.021-8.3545 2.2792-12.42 3.7695v26.072a115.5 115.5 0 0 0 79.48 0v-26.072c-4.0858-1.4904-8.2529-2.7486-12.48-3.7695v8.7051c0 9.3888-7.6112 17-17 17h-20.58c-9.3888 0-17-7.6112-17-17v-8.7051z" style="fill:', ';"/>'];
        maParts['07']['head'] = ['<path d="m115.5 51.75a63.75 63.75 0 0 0-10.5 126.63v14.09a115.5 115.5 0 0 0-53.729 19.027 115.5 115.5 0 0 0 128.46 0 115.5 115.5 0 0 0-53.729-19.029v-14.084a63.75 63.75 0 0 0 53.25-62.881 63.75 63.75 0 0 0-63.65-63.75 63.75 63.75 0 0 0-0.09961 0z" style="fill:', ';"/>'];
        maParts['07']['mouth'] = ['<polygon points="121.61 160.74 109.39 160.74 115.5 171.31" style="fill:', ';"/><path d="m132.64 144.06a34.42 34.42 0 0 1-34.24 0" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:5.9998px;stroke:', ';"/>'];
        maParts['07']['eyes'] = ['<path d="m170.25 100c1.69 9.62-4.79 29.23-22.4 29.23-6.81 0-15-3.66-20.23-10-4.34-5.33-7.56-12.87-6.2-19.45 1.63-7.89 7.07-11.45 14.67-12.92a68.16 68.16 0 0 1 12.52-1c10.77 0 19.78 3.61 21.64 14.22z" style="fill:', ';stroke-width:3.99px;stroke:', ';"/><path d="m60.75 100c-1.69 9.62 4.79 29.23 22.4 29.23 6.81 0 15-3.66 20.23-10 4.34-5.33 7.56-12.87 6.2-19.45-1.63-7.89-7.07-11.45-14.67-12.92a68.16 68.16 0 0 0-12.52-1c-10.77 0-19.78 3.61-21.64 14.22z" style="fill:', ';stroke-width:3.99px;stroke:', ';"/><line x1="100.2" x2="130.8" y1="87.92" y2="87.92" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:3.99px;stroke:', ';"/><path d="m109.87 101.73c0-2.59 2.52-4.69 5.63-4.69s5.63 2.1 5.63 4.69" style="fill:none;stroke-width:3.99px;stroke:', ';"/>'];
        maParts['07']['top'] = ['<path d="m30.622 70.381c2.0971-3.9374 4.6649-7.9604 7.6822-12.037 3.0172-4.0765 6.0987-7.6929 9.2229-10.817l22.897 22.897c-4.4402 4.4403-8.2278 9.5439-11.213 15.14z" style="fill:', ';"/><path d="m160.58 70.423 22.907-22.897c3.1242 3.1242 6.2056 6.7406 9.2229 10.817 3.0065 4.0765 5.5744 8.0994 7.6715 12.037l-28.578 15.182c-2.9851-5.5958-6.7727-10.689-11.224-15.14z" style="fill:', ';"/><path d="m92.411 15.247c3.8197-0.87736 7.6715-1.5407 11.534-1.9794 4.0765-0.46007 7.9282-0.69546 11.555-0.69546 1.53 0 3.1563 0.0428 4.8682 0.1391l1.851 22.255 5.767-21.57c3.1028 0.37449 6.0666 0.86666 8.8912 1.4658l-10.55 49.763c-1.9259-0.41729-3.702-0.70617-5.3176-0.87736-1.423-0.14979-3.2633-0.22468-5.5102-0.22468-2.2362 0-4.237 0.10699-5.981 0.29958-1.9473 0.22469-3.8732 0.55636-5.767 0.99504z" style="fill:', ';"/><path d="m92.411 15.247c1.9152-0.43869 4.023-0.84526 6.3233-1.2304 2.065-0.34238 4.1514-0.62057 6.2698-0.84525l5.1785 50.565c-1.0913 0.10699-2.1827 0.25679-3.2954 0.43868-0.86665 0.14979-1.9152 0.36378-3.1349 0.64196z" style="fill:', ';"/>'];

        maParts['08']['env'] = ['<path d="M33.83,33.83a115.5,115.5,0,1,1,0,163.34,115.49,115.49,0,0,1,0-163.34Z" style="fill:', ';"/>'];
        maParts['08']['clo'] = ['<path d="m141.89 195a114.79 114.79 0 0 1 38 16.5 115.55 115.55 0 0 1-128.47 0 114.79 114.79 0 0 1 38-16.5l15.75 15.75h21z" style="fill:', ';"/><path d="m146.4 196.14-17.4 17.44-1.17 1.17h-24.34l-1.18-1.17-17.43-17.44c1.49-0.41 3-0.79 4.51-1.14l4.67-1 12.74 12.74h17.69l12.73-12.74 4.67 1c1.52 0.35 3 0.73 4.51 1.14z" style="fill:', ';"/>'];
        maParts['08']['head'] = ['<path d="m115.5 51.75a63.75 63.75 0 0 0-10.5 126.63v14.09a115.5 115.5 0 0 0-53.729 19.027 115.5 115.5 0 0 0 128.46 0 115.5 115.5 0 0 0-53.729-19.029v-14.084a63.75 63.75 0 0 0 53.25-62.881 63.75 63.75 0 0 0-63.65-63.75 63.75 63.75 0 0 0-0.09961 0z" style="fill:', ';"/>'];
        maParts['08']['mouth'] = ['<path d="m115.68 160.64c7.08 0 13.11-4.93 15.46-11.84a2.14 2.14 0 0 0-1.51-2.6101 2.3 2.3 0 0 0-0.73995-0.0593h-26.42a2.12 2.12 0 0 0-2.31 1.9099 1.85 1.85 0 0 0 0.0593 0.73995c2.3401 6.9301 8.3802 11.86 15.46 11.86z" style="fill:', ';"/>'];
        maParts['08']['eyes'] = ['<path d="m145.38 95.628c-5.1601 2.2597-11.03 2.2597-16.19 0m-47.29 1.75c5.1755-2.2694 11.065-2.2694 16.24 0" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:5.9998px;stroke:', ';"/><path d="m90.016 106.28c-4.4506-0.0105-6.6902 5.3657-3.5508 8.5195 3.1394 3.1539 8.5252 0.93887 8.5352-3.5117 0.0063-2.7522-2.2204-4.9898-4.9727-4.9961l-0.011719-0.01172zm47.281 0c-4.4506-0.0105-6.6902 5.3657-3.5508 8.5195 3.1394 3.1539 8.5252 0.93887 8.5352-3.5117 6e-3 -2.7522-2.2204-4.9898-4.9727-4.9961l-0.01171-0.01172z" style="fill:', ';"/>'];
        maParts['08']['top'] = ['<path d="m108.37 22.019c-6.2698-12.829-17.151-13.396-18.949 1.1769-11.448-9.4583-26.021-4.483-20.361 12.422-12.251-7.9282-24.919 1.7761-17.076 20.853-27.08 2.3646-22.715 24.726-10.111 31.435-9.9002 3.3566-10.701 9.4006-8.464 14.497 2.6574 4.7842 9.0126 6.4737 11.545 9.6519-6.624 0.59419-8.4112 5.6011-5.7404 9.5192 1.6896 2.4787 5.2756 4.2218 8.5971 5.5455 1.0485 0.40658 3.702 1.2732 3.9053 2.4181 0.18744 1.2156-6.7884 3.0055-5.7281 5.2612 0.60648 1.4227 1.7764 2.7151 2.6466 3.7156 1.2807 1.6595 10.755 8.0351 9.4583 4.2049-1.0271-3.7234-2.2148-7.4682-3.1456-11.192-1.1662-5.3069-1.7868-10.721-1.102-16.156 1.4223-5.455 5.069-4.4265 7.7837-8.3588 3.5264-5.7505 2.0296-11.614 2.124-13.575 0.107-1.7868 1.5407-1.1876 3.1884-1.4337 4.3868-0.64196 7.0081-2.1185 8.8377-6.2698 0.77035-1.9259 0.62057-9.7578 0.52426-11.78 0.36378-4.6328 4.1835 0 6.548 0.64196 3.2633 0.88805 6.8797 0.21399 9.0731-2.5037 1.7547-2.3753 2.0864-2.8888 4.6114-0.80245 2.6856 2.2148 4.0979 3.1349 7.6929 3.274 5.5637 0.20329 8.7735-6.2698 11.32-5.6386 3.5201 0.87735 3.6057 5.4567 10.261 4.8682 2.386-0.20329 3.8304-0.86665 5.4032-2.6428 0.88805-0.99505 1.958-2.5037 3.4345-2.6214 1.4658-0.1177 2.3218 2.3646 3.0065 3.4452 1.1926 2.6755 4.0295 3.6513 6.2377 3.3168 1.958-0.17119 3.854-1.4115 5.4268-2.4707 0.99679-0.66102 1.8284-0.81128 1.9256 0.2071 0.29592 2.2271 0.0862 7.7025 0.1596 8.4821 0.10556 8.4609 5.37 10.569 13.223 10.333-0.31871 3.7464 0.0583 11.28 5.4353 14.562 3.9481 2.7604 6.6657 1.2732 6.7299 7.8534 7e-3 6.1914-0.43693 13.061-1.2946 18.189-0.69547 4.0444-1.2412 6.4838-2.5251 10.378-0.64196 1.9152-0.81315 1.9687 1.4123 1.0699 7.1472-3.1456 10.539-11.48 8.3562-18.842-0.43869-2.0436 0.84525-1.7226 2.8781-2.6106 9.5248-4.2363 8.1264-11.335-0.75967-14.273 11.988-3.0926 13.886-8.9002 6.6871-15.375 7.3077-5.9168 3.6378-16.177-2.8032-16.991 12.422-7.0937 5.7349-22.062-5.1036-18.499 4.1728-12.037-5.5637-26.203-21.121-16.894 6.9653-11.373 2.065-22.661-12.101-10.785-3.4559-18.382-15.14-16.584-23.902-5.018 0.09435-20.075-16.001-17.42-18.146-2.5892z" style="fill:', ';"/><path d="m5.4353 80.502c7.4468 9.1373 15.632 8.8912 15.632 8.8912s-6.0772 3.7983-6.8369 9.8755c-0.75966 6.088 4.5579 9.6295 8.0994 10.646 3.5522 1.0058 7.0937-2.7925 7.0937-2.7925s-5.8312 10.646-1.5193 15.964c4.3012 5.3176 11.908 3.0386 11.908 3.0386s-5.3283 10.132 1.0057 14.187c5.8312 3.7234 18.542 7.6715 20.511 8.2706-6.0666-9.7472-9.576-21.249-9.576-33.575v-0.0428c0-35.201 28.546-63.747 63.747-63.747 35.212 0 63.758 28.546 63.758 63.747 0 12.476-3.5843 24.116-9.7899 33.949h0.53496s13.931-1.0057 16.21-9.3727c2.279-8.3562 0.75967-9.8756 0.75967-9.8756s10.635 2.0329 13.417-7.5966l2.7926-9.6295s10.132 0 10.892-7.083c0.75963-7.0937-7.0295-12.411-7.0295-12.411s11.459 0.82385 14.498-10.453c1.0164-3.7555 0.83456-8.2171 0.1391-12.497-17.665-41.161-58.569-69.995-106.18-69.995-30.632 0-60.034 12.187-81.679 33.831v0.0107c-13.171 13.171-22.833 29.22-28.386 46.66z" style="fill:', ';"/>'];

        maParts['09']['env'] = ['<path d="M33.83,33.83a115.5,115.5,0,1,1,0,163.34,115.49,115.49,0,0,1,0-163.34Z" style="fill:', ';"/>'];
        maParts['09']['clo'] = ['<path d="m141.75 195a114.79 114.79 0 0 1 38 16.5 115.53 115.53 0 0 1-128.46 0 114.79 114.79 0 0 1 38-16.5l13.85 13.85v-1.2h17.86v3.1h5z" style="fill:', ';"/><polygon points="115.36 207.65 123.37 224.2 148.3 196.86 143.08 189.95" style="fill:', ';"/><polygon points="115.36 207.65 107.35 224.2 82.42 196.86 87.63 189.95" style="fill:', ';"/>'];
        maParts['09']['head'] = ['<path d="m115.5 51.75a63.75 63.75 0 0 0-10.5 126.63v14.09a115.5 115.5 0 0 0-53.729 19.027 115.5 115.5 0 0 0 128.46 0 115.5 115.5 0 0 0-53.729-19.029v-14.084a63.75 63.75 0 0 0 53.25-62.881 63.75 63.75 0 0 0-63.65-63.75 63.75 63.75 0 0 0-0.09961 0z" style="fill:', ';"/>'];
        maParts['09']['mouth'] = ['<path d="m126.28 149.82c-6.16 2.43-15.52 2.42-21.56 0" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:5.9998px;stroke:', ';"/>'];
        maParts['09']['eyes'] = ['<path d="m83.527 103.98v10h10v-10h-10zm53.945 0v10h10v-10h-10z" style="fill:', ';"/><path d="m56.621 94.906v11.688h5.3418v6.4922h5.3418v6.1055h5.3223v6.2324h26.846v-6.2324h5.3047v-6.1055h5.1445v-6.0039h11.154v6.0039h5.1446v6.1055h5.3066v6.2324h26.846v-6.2324h5.3203v-6.1055h5.3438v-6.4922h5.3418v-11.688z" style="fill:', ';"/><path d="m67.387 100.65v5.9394h5.1992v-5.9394zm5.1992 5.9394v6.4922h5.4238v-6.4922zm5.4238 0h5.1992v-5.9394h-5.1992zm5.1992 0v6.4922h5.4258v-6.4922zm5.4258 6.4922v6.1055h5.1426v-6.1055zm-10.625 0v6.1055h5.1445v-6.1055zm48.281-12.432v5.9394h5.1992v-5.9394zm5.1992 5.9394v6.4922h5.4238v-6.4922zm5.4238 0h5.1992v-5.9394h-5.1992zm5.1992 0v6.4922h5.4258v-6.4922zm5.4258 6.4922v6.1055h5.1426v-6.1055zm-10.625 0v6.1055h5.1445v-6.1055z" style="fill:', ';"/>'];
        maParts['09']['top'] = ['<path d="m157.79 67.5a61.31 61.31 0 0 1-42.79 17.43h-55.7c18.16-37.74 68.27-46.85 98.49-17.43z" style="fill:', ';"/><path d="m122.93 7.0078c-10.503-0.15729-21.09 1.6448-29.545 5.4316-17.141 7.8999-32.169 23.297-43.973 38.779-5.1703 6.8631-8.7779 13.46-8.1855 18.395 0.93114 12.312 10.372 26.483 11.068 36.9 15.663-72.081 105.99-70.452 124.91-7.0525l4e-3 0.0156c5.616-10.926 8.0682-20.188 8.352-27.653 0.43654-15.607-7.8088-21.149-21.735-28.249 1.7934-3.7704 1.7273-7.5023 2.0625-10.154-0.79964-7.8568-3.6796-13.51-10.43-17.758-5.9434-3.7404-13.06-6.0867-18.463-7.2266-4.5319-0.87895-9.2901-1.3562-14.064-1.4277z" style="fill:', ';"/><path d="m42.426 75.338c0.52158 18.689 10.557 74.338-18.115 101.25 12.38 10.603 28.352 19.061 46.025 24.594 11.032-4.6874 22.88-7.4147 34.817-8.5046l0.0633-14.477c-22.49-4.3813-40.766-18.898-48.862-39.967-8.096-21.07-4.7931-44.72 9.2478-62.393zm124.67 2.7207c7.8997 10.886 11.743 24.64 11.787 37.441-0.36632 30.178-22.389 57.576-53.12 62.708l0.0238 14.471c12.282 1.1216 24.518 3.9888 35.825 8.9128 15.488-5.1448 30.007-13.325 42.396-25.043-13.136-22.051-23.282-63.045-18.694-101.55z" style="fill:', ';"/><path d="m143.61 46.383c-11.639 0.12482-20.998 1.8906-20.998 1.8906l-9 3.5059c0.63003-0.0191 1.2603-0.0289 1.8906-0.0293h0.0996c35.169 0.055 60.959 27.235 63.283 63.383 7.4e-4 31.157-22.742 57.213-53.106 63.079l-0.0216 14.498c11.567 1.0563 23.154 3.6067 33.887 8.0463 35.952-15.315 55.082-52.303 36.709-68.279-5.018-7.9035-10.44-15.409-9.5544-23.03 5.0545-50.452 0.39626-63.561-43.189-63.064zm-69.966 21.09c-15.286 3.244-17.096 3.73-31.734 6.6953 3.0304 13.081 3.0583 22.274 1.2085 30.012-3.8004 11.361-8.9712 19.787-12.286 28.764-6.8823 22.459-2.9157 31.982 12.093 46.165 8.6595 8.0693 19.861 16.209 30.939 20.647 2.669-1.0316 5.3729-1.9628 8.106-2.792 7.4979-2.275 15.388-3.6535 23.206-4.3673l0.0433-14.393c-23.933-4.5937-44.283-21.98-50.77-45.817-6.3319-23.265 0.51104-48.752 19.195-64.914z" style="fill:', ';"/>'];

        maParts['10']['env'] = ['<path d="M33.83,33.83a115.5,115.5,0,1,1,0,163.34,115.49,115.49,0,0,1,0-163.34Z" style="fill:', ';"/>'];
        maParts['10']['clo'] = ['<path d="m141.75 195a114.79 114.79 0 0 1 38 16.5 115.53 115.53 0 0 1-128.46 0 114.79 114.79 0 0 1 38-16.5l15.71 15.75h21z" style="fill:', ';"/><path d="m89.291 195a114.79 114.79 0 0 0-38.002 16.5 115.53 115.53 0 0 0 38.002 16.482zm52.434 0v32.982a115.53 115.53 0 0 0 38-16.482 114.79 114.79 0 0 0-38-16.5z" style="fill:', ';"/><path d="m157.15 199.75c0.2548 7.4501 1.54 14.855 4.9512 21.432a115.53 115.53 0 0 0 17.619-9.6797 114.79 114.79 0 0 0-22.57-11.752zm-83.295 2e-3a114.79 114.79 0 0 0-22.57 11.75 115.53 115.53 0 0 0 17.621 9.6797c3.411-6.5765 4.6944-13.98 4.9492-21.43z" style="fill:', ';"/><path d="m99.197 204.97v2e-3l16.302 16.301 16.301-16.301v-2e-3z" style="fill:', ';"/>'];
        maParts['10']['head'] = ['<path d="m115.5 51.75a63.75 63.75 0 0 0-10.5 126.63v14.09a115.5 115.5 0 0 0-53.729 19.027 115.5 115.5 0 0 0 128.46 0 115.5 115.5 0 0 0-53.729-19.029v-14.084a63.75 63.75 0 0 0 53.25-62.881 63.75 63.75 0 0 0-63.65-63.75 63.75 63.75 0 0 0-0.09961 0z" style="fill:', ';"/>'];
        maParts['10']['mouth'] = ['<path d="m100.19 152.09c2.8726 4.0616 9.8095 4.7232 15.119-0.45432 5.0656 4.5134 11.167 5.6898 15.495 0.31458" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:5.8949;stroke:', ';"/><path d="m109.67 135.53c-0.9758 0.0743-2.05 0.45327-3.1485 0.99414-4.3235 2.1399-7.3862 4.2557-10.639 7.1406-0.6251 0.5715 0.1168 0.77785 1.4238 0.87304 5.6967 0.0536 14.384 0.41404 15.098-0.875 1.9251-2.0788 1.7969-5.3303-0.1816-7.3008-0.701-0.67533-1.5769-0.90632-2.5527-0.83203zm11.656 0c-0.9758-0.0743-1.8517 0.1567-2.5527 0.83203-1.9785 1.9705-2.1067 5.222-0.1817 7.3008 0.7142 1.289 9.401 0.9286 15.098 0.875 1.307-0.0952 2.0489-0.30154 1.4238-0.87304-3.2524-2.8849-6.3151-5.0007-10.639-7.1406-1.0985-0.54087-2.1727-0.91985-3.1485-0.99414z" style="fill:', ';"/>'];
        maParts['10']['eyes'] = ['<path d="m97.56 107.84a10.63 10.63 0 0 1-15 0.13l-0.13-0.13" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:6.3px;stroke:', ';"/><path d="m148.59 107.84a10.63 10.63 0 0 1-15 0.13l-0.13-0.13" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:6.3px;stroke:', ';"/>'];
        maParts['10']['top'] = ['<path d="m41.668 87.073c-9.2319-0.0231-11.63 6.5104 2.2676 17.66-14.015 1.1231-4.3662 16.457 4.875 24.66 4.0686 3.0199 6.4647 5.4657 5.5078 1.1348-1.2079-4.9178-1.8184-9.9634-1.8184-15.027 3.26e-4 -7.5692 1.2547-15.016 3.7883-22.183 0.57048-1.7876 1.0689-2.0306-0.37721-2.6839-5.5405-2.4478-10.375-3.5511-14.243-3.5608z" style="fill:', ';"/><path d="m185.48 89.513c-2.4418-0.11189-5.4618 0.81187-9.5148 3.2121-1.314 0.81729-0.70075 1.995-0.32301 3.2653 3.194 10.982 3.8215 22.462 1.2538 33.628-0.31613 1.688-0.47649 3.569 2.6953 1.3516 7.7016-5.371 19.17-18.734 16.918-26.105-1.4251-3.9177-11.4-0.35546-11.4-0.35546s4.987-4.2755 5.3437-9.6191c0.20048-3.0057-1.5237-5.2189-4.9726-5.377z" style="fill:', ';"/><path d="m91.689 36.108c-3.7298-7.3864-9.5859-10.504-17.578-6.7891-9.5194 4.5907-15.629 18.444-13.416 29.232 0 0-8.5511-4.9878-18.17-3.5625-19.623 8.094-1.4102 29.869 10.817 37.342 2.075 1.297 2.5792 1.7432 3.4291-0.37685 2.6746-6.5374 6.1886-12.722 11.297-17.709 4.1039 8.7427 14.629 4.1809 20.006-0.14062 4.4873 9.6838 10.377 6.3535 15.377 3.4785 4.0764 7.8829 10.756 7.25 17.631 0.0625 4.875 4.5625 14.713 4.1867 15.555-3.426 8.4753 2.6244 14.012 10.437 22.962-1.4764 8.8552 6.8221 14.407 16.853 17.122 27.51 0.34 1.554 1.175 0.85565 2.2212 0.44315 10.255-4.286 22.842-15.749 15.705-23.975-3.5623-3.5623-13.539-2.1387-13.539-2.1387s6.77-7.1233 9.2637-18.168c2.4936-11.043-23.514-4.9883-23.514-4.9883s7.4818-5.6993 12.113-13.537c4.6314-7.8378-2.4943-11.756-11.045-11.043-8.5496 0.71204-17.1 7.4805-17.1 7.4805s3.3946-7.8055-3.5625-12.826c-9.5935-6.9234-23.869 6.4121-23.869 6.4121-4.2562-26.835-24.872-6.386-31.707 8.1953z" style="fill:', ';"/>'];

        maParts['11']['env'] = ['<path d="M33.83,33.83a115.5,115.5,0,1,1,0,163.34,115.49,115.49,0,0,1,0-163.34Z" style="fill:', ';"/>'];
        maParts['11']['clo'] = ['<path d="m116 203.13c-0.12 0-0.25 0.12-0.49 0.12s-0.25-0.12-0.49-0.12zm-27.29-8c0.87-0.25 1.72-0.47 2.56-0.69a32.37 32.37 0 0 0 0.3 8.57 21.5 21.5 0 0 0 7 6.88c6.41-6 16.8-6.64 16.8-6.64s10.5 0.58 17 6.69a21.61 21.61 0 0 0 6.93-6.66 32.34 32.34 0 0 0 0.35-8.84l2.13 0.56a114.79 114.79 0 0 1 38 16.5 115.53 115.53 0 0 1-128.46 0 114.64 114.64 0 0 1 37.38-16.37z" style="fill:', ';"/><path d="m126.15 206-3.92 7.83h-13.46l-3.92-7.83a36.59 36.59 0 0 1 10.65-2.7 35.66 35.66 0 0 1 10.65 2.7z" style="fill:', ';"/><path d="m124.54 230.65-2.18-16.74h-13.47l-2.19 16.76c2.9 0.22 5.84 0.33 8.8 0.33s6.06-0.12 9-0.35z" style="fill:', ';"/><path d="m134.84 186s0.86 9.8-19.34 17.26c0 0 15.79 0.86 20.57 11.76 0.12 0.49 9.3-23.26-1.23-29z" style="fill:', ';"/><path d="m96.16 186c-10.41 5.76-1.35 29.39-1.1 29 4.65-10.78 20.56-11.76 20.56-11.76-20.32-7.45-19.46-17.24-19.46-17.24z" style="fill:', ';"/>'];
        maParts['11']['head'] = ['<path d="m115.5 51.75a63.75 63.75 0 0 0-10.5 126.63v14.09a115.5 115.5 0 0 0-53.729 19.027 115.5 115.5 0 0 0 128.46 0 115.5 115.5 0 0 0-53.729-19.029v-14.084a63.75 63.75 0 0 0 53.25-62.881 63.75 63.75 0 0 0-63.65-63.75 63.75 63.75 0 0 0-0.09961 0z" style="fill:', ';"/>'];
        maParts['11']['mouth'] = ['<path d="m118.57 165.14a8.66 8.66 0 0 0-2.76-4.23h-0.62a8 8 0 0 0-2.76 4.22c-0.52 1.89 2.07 10.61 2.76 12.53h0.62c0.64-1.76 3.19-10.82 2.76-12.52z" style="fill:', ';"/><path d="m102.81 152.24a2.4921 2.4921 0 1 1 1.19-4.84l0.21 0.06a37.1 37.1 0 0 0 5.43 1.12 44.52 44.52 0 0 0 11.76 0 37.1 37.1 0 0 0 5.43-1.12 2.4903 2.4903 0 0 1 1.59 4.72l-0.21 0.06a43.08 43.08 0 0 1-6.15 1.29 48.55 48.55 0 0 1-13.08 0 42.79 42.79 0 0 1-6.17-1.29z" style="fill:', ';"/>'];
        maParts['11']['eyes'] = ['<path d="m86.851 100.39a4.94 4.94 0 1 0 4.9297 5 5 5 0 0 0-4.9297-5zm57.221 0a4.94 4.94 0 1 0 4.9394 4.9394 4.94 4.94 0 0 0-4.9394-4.9394z" style="fill:', ';"/><path d="m86.207 89.365c-25.504 0-21.503 6.8561-21.035 19.596 0.80177 18.121 17.763 16.514 21.201 16.639 14.758-0.041 20.518-8.227 22.951-22.932 1.8166-10.731-9.251-13.174-23.117-13.303zm58.598 0c-13.866 0.1284-24.936 2.5717-23.119 13.303 2.4332 14.705 8.1936 22.891 22.951 22.932 3.4383-0.125 20.399 1.4828 21.201-16.639 0-18.965-0.47958-19.596-21.033-19.596z" style="fill:', ';"/><path d="m169.87 90.255a0.51 0.51 0 0 0-0.43991-0.52 167.64 167.64 0 0 0-22.6-1.6801c-12 0-27.47 3.7601-30.17 3.7601h-2.4c-1.2499 0-5.29-0.80996-10.45-1.6801a124.35 124.35 0 0 0-19.72-2.08 166.18 166.18 0 0 0-19.31 1.24c-1.56 0.17999-2.69 0.35009-3.2899 0.44009a0.51 0.51 0 0 0-0.44007 0.52l-0.091 6.4501a0.57 0.57 0 0 0 0.33012 0.52l0.73994 0.23992c1.08 0.41992 1.0001 19.85 6.78 24.71 3.4401 2.8599 6.51 4.4899 19.42 4.4899 7.4699 0 12.17-1.9999 16.63-8 3.21-4.32 6.0999-14.55 6.0999-14.55 0.82006-4.07 3.7702-4.52 4.43-4.5801h0.12068c0.11078 0 3.66 0.0593 4.57 4.5801 0 0 2.8599 10.22 6.0699 14.54 4.4601 5.9999 9.1601 8 16.63 8 12.91 0 16-1.63 19.42-4.4901 5.7898-4.86 5.6998-24.29 6.78-24.71l0.73994-0.23993a0.57 0.57 0 0 0 0.32996-0.52l-0.12068-6.4501zm-65 23c-1.9101 4.5-6.8 10.29-13.7 10.64-20.7 0.99985-21.65-4.7401-23-9.3201a31.45 31.45 0 0 1-1.2099-13.18c0.53997-4.5799 1.7-7.2699 3.7801-8.6201a9.3 9.3 0 0 1 4.3499-1.51 85.07 85.07 0 0 1 11.4-0.52 59.23 59.23 0 0 1 9.2099 0.69999c7.37 1.2 12.35 3.7001 12.35 6.1601a46.12 46.12 0 0 1-3.23 15.64zm58 1.3201c-1.34 4.5799-2.29 10.36-23 9.3201-6.91-0.3501-11.81-6.1401-13.71-10.64a46.35 46.35 0 0 1-3.22-15.64c0-3.39 9.43-6.8599 21.56-6.8599 12.13 0 14 0.89996 15.75 1.9999 2.08 1.3502 3.2398 4 3.77 8.6201a31.23 31.23 0 0 1-1.1601 13.17z" style="fill:', ';"/>'];
        maParts['11']['top'] = ['<path d="m156.1 15.879c-0.38556 5.3015-1.7049 9.4762-3.6602 12.76-0.41226 23.773-9.2343 35.229-15.154 42.797l15.062-4.6641c-0.66253 2.8135-2.4628 7.156-0.34766 12.137 1.6334-2.3144 7.9395-5.807 13-3.3477-0.43442 3.5532-0.95271 7.094-1.4512 10.639l8.9648 0.85937c0.83453 3.8792 0.51719 9.3449-0.59961 11.736l5.5508 2.0098c0.20764 2.7646 0.10001 5.4906-0.74609 8.875 8.4545-1.7225 14.213-4.3896 19.641-13.188 2.8639-4.7524 4.9018-10.483 4.7305-17.242-4.1612 4.916-9.6484 7.2485-15.26 10.109 6.507-11.065 8.8648-22.768 8.1367-30.58-7.3456 10.251-11.649 13.06-19.918 16.9 1.2386-11.4 5.5249-18.582 12.461-27.27-11.392-1.3025-16.301 1.4749-24.891 6.4395 4.5466-14.036 2.2208-26.679-5.5195-38.971zm-117.76 28.682c9.3378 3.6366 19.581 9.0234 21.129 18.549-7.6182 0.0414-14.897-3.5072-20.242-7.1894-0.15967 8.2309 2.8451 12.252 6.7734 19.08-7.2127 1.6129-12.084 4.8315-17.471 9.4805 7.2948-0.15715 12.299-1.0502 16.891 4.2793-6.0512 5.0164-11.99 10.79-11.99 19.24 9.257-6.1688 12.495-5.9486 21.137-2.2012 1.2906-8.0996 2.3978-14.872 2.7869-16.435 2.4719-0.73247 3.5247-0.94807 5.9221-1.2938-2.1556-7.4281 1.0996-9.5176 2.4141-11.6l7.543 1.5059c-3.9093-6.1699 2.6565-12.483 7.1445-15.51-4.4474-7.2082-5.6649-11.558-7.377-16.797-11.198-8.2947-23.895-6.2742-34.66-1.1094z" style="fill:', ';"/><path d="m101.9 7.6408c-10.047 6.2416-12.441 28.646-12.131 33.289-6.9249-5.8258-7.8992-13.75-7.7695-19.203-9.6235 6.0158-10.666 14.421-9 23.943 1.1061 5.1411 2.3972 10.461 7.377 16.797 2e-3 -1e-3 4e-3 -3e-3 6e-3 -4e-3 2.7742 2.8742 5.4644 5.5941 8.3477 8.3574 0.41187-6.971 0.45449-13.622 7.1856-15.824 3.9532 2.8169 7.4123 5.9388 11.084 9.1035l10.559-10.25c5.6447 3.961 5.4531 6.5652 6.5215 14.104 2.153-1.7546 8.719-9.0037 15.844-10.139 0.98706 4.1261-0.99388 10.308-2.6387 13.621 0 0 14.32-11.846 15.195-27.971 0.33968-6.2599 0.2237-11.146-0.041-14.826-3.2125 5.5652-8.7118 8.7799-13.789 10.15-4.2715-9.2486-2.4785-21.435-0.48047-29.309-12.21 3.0195-20.932 18.337-22.172 25.07-9.2678-7.397-13.605-16.146-14.098-26.91z" style="fill:', ';"/>'];

        maParts['12']['env'] = ['<path d="M33.83,33.83a115.5,115.5,0,1,1,0,163.34,115.49,115.49,0,0,1,0-163.34Z" style="fill:', ';"/>'];
        maParts['12']['clo'] = ['<path d="m141.75 195a114.79 114.79 0 0 1 38 16.5 115.53 115.53 0 0 1-128.46 0 114.79 114.79 0 0 1 38-16.5l26.23 13 26.27-13z" style="fill:', ';"/><polygon points="115.5 208.03 115.5 207.74 82.72 188.91 80.45 198.86 101.46 222.72" style="fill:', ';"/><polygon points="115.5 208.03 115.5 207.74 148.28 188.91 150.55 198.86 129.54 222.72" style="fill:', ';"/>'];
        maParts['12']['head'] = ['<path d="m115.5 51.75a63.75 63.75 0 0 0-10.5 126.63v14.09a115.5 115.5 0 0 0-53.729 19.027 115.5 115.5 0 0 0 128.46 0 115.5 115.5 0 0 0-53.729-19.029v-14.084a63.75 63.75 0 0 0 53.25-62.881 63.75 63.75 0 0 0-63.65-63.75 63.75 63.75 0 0 0-0.09961 0z" style="fill:', ';"/>'];
        maParts['12']['mouth'] = ['<path d="m123.07 154.05a10.61 10.61 0 0 1-15 0.14l-0.14-0.14" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:6.3px;stroke:', ';"/><path d="m120.1 142.22 0.19-0.11c3-1.87 5.45-2.4 7.3-1.46 2.15 1.1 3.12 3.84 4.84 5.5a5.18 5.18 0 0 0 6.68 0.73m-28.21-4.66-0.19-0.11c-3-1.87-5.45-2.4-7.3-1.46-2.15 1.1-3.12 3.84-4.84 5.5a5.18 5.18 0 0 1-6.68 0.73" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:5.9998px;stroke:', ';"/>'];
        maParts['12']['eyes'] = ['<path d="m161.73 86.016h-92.51c-3.37 0-6.0001 2.3998-6.0001 5.2999v28.45c0 3.0002 2.74 5.3001 6.0001 5.3001h32.36c7.0901 0 7.44-19.43 13.82-19.43s6.8801 19.44 13.83 19.44h32.36c3.37 0 5.9999-2.4 5.9999-5.3001v-28.46c0.14043-2.9001-2.6-5.2999-5.9-5.2999z" style="fill:', ';"/><path d="m161.73 86.016h-92.51c-3.37 0-6.0001 2.3998-6.0001 5.2999v28.45l104.55-28.45c0-2.9001-2.74-5.2999-5.9999-5.2999z" style="fill:', ';"/><path d="m161.73 86.016h-92.51c-3.37 0-6.0001 2.3998-6.0001 5.2999v28.45c0 3.0002 2.74 5.3001 6.0001 5.3001h32.36c7.0901 0 7.44-19.43 13.82-19.43s6.8801 19.44 13.83 19.44h32.36c3.37 0 5.9999-2.4 5.9999-5.3001v-28.46c0.14043-2.9001-2.6-5.2999-5.9-5.2999z" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:4.0026px;stroke:', ';"/>'];
        maParts['12']['top'] = ['<path d="m69.834 33.826c-8.2001-0.0626-16.444 2.6753-23.152 7.7038-8.5298 6.9899-12.159 19.61-12.329 32.68-0.2041 15.476 1.6092 34.752 1.7464 51.915 0.10414 13.047 0.53485 25.984-2.9197 33.995-2.4994 5.81-9.0955 9.6006-16.196 12.311 7.9599 2.8301 25.009 2.8094 33.58 1.5393 10.8-1.59 17.238-6.5294 17.159-22.699-0.0911-15.93-1.3894-29.23-1.559-45.83-0.3208-11.983-1.569-24.291 4.9774-33.987 4.2139-6.1265 10.452-10.521 17.116-13.588 3.9292-1.8575 8.0384-3.3083 12.263-4.3297-6.8718-13.574-18.732-19.618-30.687-19.709z" style="fill:', ';"/><path d="m90.8 76.246c11.918-17.125 31.996-23.218 49.743-17.488 11.81 3.9496 20.692 13.389 22.313 28.237 0.51051 6.2098 0.63413 12.445 0.37007 18.67-0.23973 11.2-0.72946 23.82-1.0995 34.08-0.82005 22.43 0.0593 35.1 24.589 36.3 8.5635 0.32122 17.137-0.22845 25.59-1.6405h-0.0198c-10.74-3.3799-17.98-15.609-19.3-26.289-1.29-10.41-0.6098-23.43-0.7898-38.091-0.1701-14.96 1.0398-29.819 0.28008-42.089-1.414-22.777-14.947-38.505-34.126-45.152-27.813-7.35-51.083 0.091-61.672 17.343-5.4698 8.9112-7.7413 20.07-5.8788 36.121z" style="fill:', ';"/>'];

        maParts['13']['env'] = ['<path d="M33.83,33.83a115.5,115.5,0,1,1,0,163.34,115.49,115.49,0,0,1,0-163.34Z" style="fill:', ';"/>'];
        maParts['13']['clo'] = ['<path d="M61.11,205.59l3.49,3.69-6.26,6.6A115.45,115.45,0,0,0,72,222.51v-22a115.19,115.19,0,0,0-10.85,5.1Z" style="fill:', ';"/><path d="M93.24,228.85V199l-4-4A114.43,114.43,0,0,0,72,200.49v22a114.43,114.43,0,0,0,21.28,6.34Z" style="fill:', ';"/><path d="m159 222.51v-22a114.63 114.63 0 0 0-17.25-5.51l-4 4v29.86a114.16 114.16 0 0 0 21.25-6.35z" style="fill:', ';"/><path d="m169.89 205.59-3.49 3.69 6.26 6.6a115.45 115.45 0 0 1-13.66 6.63v-22a115.19 115.19 0 0 1 10.85 5.1z" style="fill:', ';"/><path d="M115.5,219.62A28.5,28.5,0,0,1,87.25,195c2.93-.74,5.92-1.36,8.94-1.87a19.41,19.41,0,0,0,38.62,0c3,.51,6,1.13,8.94,1.87a28.49,28.49,0,0,1-28.25,24.63Z" style="fill:', ';"/>'];
        maParts['13']['head'] = ['<path d="m115.5 51.75a63.75 63.75 0 0 0-10.5 126.63v14.09a115.5 115.5 0 0 0-53.729 19.027 115.5 115.5 0 0 0 128.46 0 115.5 115.5 0 0 0-53.729-19.029v-14.084a63.75 63.75 0 0 0 53.25-62.881 63.75 63.75 0 0 0-63.65-63.75 63.75 63.75 0 0 0-0.09961 0z" style="fill:', ';"/>'];
        maParts['13']['mouth'] = ['<path d="m115.5 153.93a14 14 0 0 1-10.5-4.69 3.4209 3.4209 0 0 1 5-4.67l0.08 0.08 0.08 0.09a7.35 7.35 0 0 0 10.39 0.37l0.37-0.37a3.4206 3.4206 0 1 1 5.23 4.41l-0.08 0.09a14 14 0 0 1-10.53 4.69z" /><path d="m115.27 127.32c-7.6627-0.03-15.251 1.4419-20.646 5.1465-7.62 5.33-9.9053 11.512-14.127 18.109-3.4379 5.2447-9.326 10.024-13.467 6.334 25.425 29.755 71.409 29.786 96.875 0.0664-6.8104 3.9305-11.545-2.47-13.508-6.4004-10.697-17.605-14.115-22.656-35.127-23.256zm-0.26758 8.3984c7.457 0.0802 14.986 1.2966 17.146 5.9522 2.5765 11.319-7.5878 17.454-16.681 17.515-6.09-0.05-12.2-2.3802-15.26-7.7402-6.36-11.16 3.6349-15.607 14.795-15.727z" style="fill:', ';"/>'];
        maParts['13']['eyes'] = ['<path d="m91.72 97.36v11.4m47.56-11.4v11.4" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:7.9999px;stroke:', ';"/>'];
        maParts['13']['top'] = ['<path d="m52.107 57.293c-1.3411 14.839-3.8707 52.771 1.3145 72.715-0.67572-43.829 12.389-70.177 62.078-70.187 49.689 0.010061 62.754 26.359 62.078 70.187 5.1852-19.944 2.6556-57.876 1.3145-72.715h-63.393-63.393z" style="fill:', ';"/><path d="m52.339 30.629c-1.3825 24.448-2.1216 45.905-1.4497 66.517 9.4643-48.304 112.77-54.916 129.22 0 0.67191-20.612-0.3798-47.256-1.4928-66.517-32.241 14.296-91.346 18.861-126.28 0z" style="fill:', ';"/><path d="m115.5 24.92c-22.25 0-44.5 4.2296-56.72 12.69-3.32 2.3-5.0602 6.4392-5.5903 10.269-0.45275 3.23-0.84043 6.7561-1.1785 10.461h126.98c-0.33704-3.7047-0.72492-7.2306-1.1775-10.461-0.53009-3.8301-2.2697-7.9992-5.5897-10.269-12.22-8.4601-34.47-12.69-56.72-12.69z" style="fill:', ';"/><path d="m76.521 39.139c21.233 3.3965 33.116-13.392 37.59-31.72 4.3614 17.158 14.175 34.968 36.577 31.584-33.921 20.594-57.646 11.594-74.167 0.1345z" style="fill:', ';"/>'];

        maParts['14']['env'] = ['<path d="M33.83,33.83a115.5,115.5,0,1,1,0,163.34,115.49,115.49,0,0,1,0-163.34Z" style="fill:', ';"/>'];
        maParts['14']['clo'] = ['<path d="m91.92 194.41a101.47 101.47 0 0 1 23.58 17.09 101.47 101.47 0 0 1 23.58-17.09c0.89 0.19 1.78 0.38 2.67 0.59a114.79 114.79 0 0 1 38 16.5 115.53 115.53 0 0 1-128.46 0 114.79 114.79 0 0 1 38-16.5c0.88-0.21 1.78-0.4 2.67-0.59z" style="fill:', ';"/><path d="m73.65 199.82c16.59 8.23 28.72 18.91 34.27 30.93a114.86 114.86 0 0 1-56.65-19.25 115.06 115.06 0 0 1 22.38-11.68z" style="fill:', ';"/><path d="m60.63 205.85c12.35 5.94 21.93 13.44 27.59 21.91a114.7 114.7 0 0 1-36.95-16.26q4.53-3 9.36-5.65z" style="fill:', ';"/><path d="m157.35 199.82c-16.6 8.23-28.72 18.91-34.27 30.93a114.86 114.86 0 0 0 56.65-19.25 115.06 115.06 0 0 0-22.38-11.68z" style="fill:', ';"/><path d="m170.37 205.85c-12.35 5.94-21.93 13.44-27.59 21.91a114.7 114.7 0 0 0 36.95-16.26q-4.53-3-9.36-5.65z" style="fill:', ';"/>'];
        maParts['14']['head'] = ['<path d="m115.5 51.75a63.75 63.75 0 0 0-10.5 126.63v14.09a115.5 115.5 0 0 0-53.729 19.027 115.5 115.5 0 0 0 128.46 0 115.5 115.5 0 0 0-53.729-19.029v-14.084a63.75 63.75 0 0 0 53.25-62.881 63.75 63.75 0 0 0-63.65-63.75 63.75 63.75 0 0 0-0.09961 0z" style="fill:', ';"/>'];
        maParts['14']['mouth'] = ['<path d="m115.5 131c-17.71 0.65-27 9.41-29.61 23.69-1 5.62-0.43 7.06 2.76 7.17 22.76 0.76 22.23 18.21 26.85 18.89 4.62-0.68 4.09-18.13 26.85-18.89 3.19-0.11 3.79-1.55 2.76-7.17-2.62-14.28-11.9-23-29.61-23.69zm0 29.31c-10 0-18-5-18-11.17s8.08-11.17 18-11.17 18 5 18 11.17-8.08 11.17-18 11.17z" style="fill:', ';"/><path d="m123.54 148.46a11.53 11.53 0 0 1-16.09 0" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:6.7998px;stroke:', ';"/>'];
        maParts['14']['eyes'] = ['<path d="m133 108.17h14.17m-63.26 0h14.09m-20.69-8.93a21.31 21.31 0 0 1 27.29 0m21.8 0a21.31 21.31 0 0 1 27.29 0" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:4.8243px;stroke:', ';"/>'];
        maParts['14']['top'] = ['<path d="m115.5 51.75c-38.702 5.3101-54.215 18.038-59.863 35.101" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:12;stroke:', ';"/><path d="m115.5 51.75c-7.8393 3.6337-5.5974 16.583-14.341 23.452" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:12;stroke:', ';"/><path d="m111.35 48.614c-22.634-6.9181-42.457-3.1988-55.733 2.5105" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:12;stroke:', ';"/><path d="m115.47 54.008c0.1965-6.7774-0.1436-26.309 0.05-38.184" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:12;stroke:', ';"/><path d="m68.874 28.177c34.115-3.382 41.987 13.321 45.17 19.602" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:12;stroke:', ';"/><path d="m116.49 48.69c2.8876-6.3019 10.358-21.518 43.469-22.326" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:12;stroke:', ';"/><path d="m116.92 51.766c1.5094 6.3991 3.4988 15.595 10.088 23.058" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:12;stroke:', ';"/><path d="m113.81 51.532c22.03-7.8674 46.709-7.3614 59.444-2.0465" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:12;stroke:', ';"/><path d="m114.53 52.278c36.226 4.8583 52.414 17.092 59.373 33.347" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:12;stroke:', ';"/><path d="m55.637 86.851c-4.1213 12.452-2.9877 27.213-1.777 43.084" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:12;stroke:', ';"/><path d="m55.614 51.124c-13.422 5.5019-21.908 16.409-24.712 28.774-1.8322 8.4632-1.9809 18.156-1.6096 28.486" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:12;stroke:', ';"/><path d="m173.26 49.486c24.917 10.399 26.707 36.537 27.209 59.62" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:12;stroke:', ';"/><path d="m173.9 85.625c5.4042 12.625 5.2413 27.675 4.5745 43.58" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:12;stroke:', ';"/><path d="m53.86 129.93c1.293 16.951 2.6738 35.169-2.1664 53.193" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:12;stroke:', ';"/><path d="m29.292 108.38c0.6173 17.177 2.6722 36.119 0.8158 54.108" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:12;stroke:', ';"/><path d="m200.47 109.11c0.3586 18.529-1.2751 36.94 1.9231 48.985" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:12;stroke:', ';"/><path d="m178.48 129.2c-0.7279 17.362-2.0563 35.743 2.6011 53.099" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:12;stroke:', ';"/>'];

        maParts['15']['env'] = ['<path d="M33.83,33.83a115.5,115.5,0,1,1,0,163.34,115.49,115.49,0,0,1,0-163.34Z" style="fill:', ';"/>'];
        maParts['15']['clo'] = ['<path d="m141.75 195a114.79 114.79 0 0 1 38 16.5 115.53 115.53 0 0 1-128.46 0 114.79 114.79 0 0 1 38-16.5 115.77 115.77 0 0 1 15.71-2.53v-14.09a63.8 63.8 0 0 0 21 0v14.09a116.6 116.6 0 0 1 15.75 2.53z" style="fill:', ';"/><path d="m60.984 205.66 6.2675 2.2051 3.4074-6.819 2.8018-1.1353-3.9911 7.9907 27.222-3.0857 3.2541-11.739 2.1451-0.2692-3.2833 11.819 20.393-1.6011-14.191-15.945v-2.4379l17.606-5.7274 3.3855-0.473v1.47l-19.167 6.2295 14.731 16.542 19.839-7.7432 3.3636 0.8223-21.371 8.34 20.532 13.842 2.6777-21.687 1.9481 0.5604-2.7726 22.378 0.0584 0.0364 8.5075 4.9923-2.4807 0.85145-6.4718-3.7916-1.2987 6.0622-2.1524 0.53125 1.3425-6.2804-17.037 8.8348-5.0271 0.35661 21.59-11.193-20.962-14.133-7.5006 25.457-2.0721-0.0364 7.6392-25.915-21.05 1.652 9.0109 24.052-1.4155-0.0946-0.49615-0.0437-0.073-7e-3 -0.2043-0.0145-8.3688-22.342-10.127 19.242-1.9846-0.52399 10.514-19.962-26.04 2.9547 13.425 16.418-3.4438-1.0625-12.083-14.781-8.1645 5.9675-1.9043-1.077 8.128-5.9385-6.9898-2.4598 2.3348-1.2881zm92.509-7.2556 14.228 20.093-1.8095 0.89514-15.614-22.043z" style="fill:', ';"/>'];
        maParts['15']['head'] = ['<path d="m115.5 51.75a63.75 63.75 0 0 0-10.5 126.63v14.09a115.5 115.5 0 0 0-53.729 19.027 115.5 115.5 0 0 0 128.46 0 115.5 115.5 0 0 0-53.729-19.029v-14.084a63.75 63.75 0 0 0 53.25-62.881 63.75 63.75 0 0 0-63.65-63.75 63.75 63.75 0 0 0-0.09961 0z" style="fill:', ';"/>'];
        maParts['15']['mouth'] = ['<path d="m97.06 144.59a20.15 20.15 0 0 0 36.88 4.53z" style="fill:', ';stroke-linecap:round;stroke-linejoin:round;stroke-width:2.9999px;stroke:', ';"/>'];
        maParts['15']['eyes'] = ['<line x1="85.29" x2="85.29" y1="98.73" y2="109.79" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:8.7999px;stroke:', ';"/><path d="m108.28 72.16h62.18c9.19 0 13.32 1.21 14.71 8.52 3.61 18.95 2.2 33.49-0.44 43.75a65.07 65.07 0 0 1-5.89 14.78 73.52 73.52 0 0 1-7.06 10.26c-1.8 2.27-5.17 1.21-4.19-1.09 0.14-0.47 0.27-1 0.4-1.48a14.29 14.29 0 0 0 0.52-6.62 12.52 12.52 0 0 0-3.88-6.3c-4.17-3.9-12.81-8.71-32.53-13.66-6.4-1.6-10.69-2.24-11.76-2.79a7.08 7.08 0 0 1-3.85-6.31v-9c0-2.39 0.18-4.55-1.56-6.57s-4.16-2.13-6.65-2.14a6 6 0 0 1-6-6v-9.35a6 6 0 0 1 6-6z" style="fill:', ';"/><path d="m135.9 98.73v9.27m15.22-9.29v9.29" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:7.7998px;stroke:', ';"/>'];
        maParts['15']['top'] = ['<path d="m109.99 15.57c-13.46 3.6301-19.789 11.95-24.069 24.08-6.9996-7-8.7307-10.82-7.5606-21.43a41 41 0 0 0-9.2698 24.988c0.0366 7.6776 5.6462 13.939 12.697 15.297-13.315 5.8106-15.258 22.033-14.045 33.524 5.7687-11.861 14.254-20.981 27.258-22.951-0.43017 6.6-2.5099 10.22-7.29 17.66 18.29-2.8601 25.119-7.8199 37.15-18.24 0.46001 0 1.0001 0.089 1.4606 0.12058-0.33023 3.5601-1.0906 6.5598-5.0004 12.46 9.5298-1.32 14.721-5.8006 17.539-11.671 8.8862 0.95314 15.836 6.785 21.26 14.818 1.928-15.211-4.4766-26.6-19.807-34.036 1.4167-2.6974 8.0143-11.925 17.661-15.721-1.424-0.28569-2.8883-0.49486-4.4033-0.61125-5.71-0.41992-13.62-0.99982-24.89 4.1703 2.8501-8.5101 10.21-11 18.05-13.12-15.131-1.2501-28.61-2.5898-40.53 8.1801-1.8997-6.21-0.18055-12.54 3.7889-17.52z" style="fill:', ';"/><path d="m172.63 69.954c1.2292 14.064 0.93841 29.96 0.34635 45.169 1.7887 6.796 3.0379 13.235 3.8842 18.388l0.13973-0.011c1.0001 6.56 2.3597 13.18 3.2698 19.73 2.0002-6.5699 2.5303-18.25 3.2405-25.43 1.2597-13 1.8296-29.311-0.43017-41.931-0.85041-4.72-2.0007-7.6896-2.0007-8.4796 4.6205 3.5601 8.6606 9.2204 13.001 14.15-0.6751-3.4318-1.347-6.6004-2.0567-9.5273-4.047-5.7183-13.726-12.154-19.393-12.06z" style="fill:', ';"/><path d="m157.97 34.471c-10.339 2.7579-17.715 13.543-19.132 16.24 15.33 7.4361 20.783 17.96 21.278 33.517 5.9534 8.8179 10.066 20.289 12.857 30.895 0.87636-13.178 1.8186-27.726 0.26566-44.28 2.5698 0.44857 9.1372 1.3934 18.781 11.17-2.1158-8.7321-4.5671-15.31-8.4539-20.283-4.5598-5.8401-10.999-10.431-23.809-13 9.6502-3.34 16.27-0.76993 25.5 2.1301-8.1388-7.4315-16.474-14.219-27.287-16.389z" style="fill:', ';"/><path d="m61.473 73.354c-7.256-0.77501-13.024 2.3746-16.262 5.3879 0.73789-0.45409 1.3868-0.74208 1.8489-0.74208 0 0-1.5198 10.359-1.6197 11.519-1.56 19.73 0.99957 43.401 6.37 62.471 1.3099 4.6899 1.1895 3.0893 1.8898-0.9107 1.7526-10.061 3.3891-24.703 6.9739-38.864-5.068-17.627-4.2508-32.403 0.79937-38.861z" style="fill:', ';"/><path d="m69.09 43.21c-0.0253 1.0803-8e-3 2.1612 0.0523 3.2402-3.8402 0-12.46 0.71984-16 2.1598-4.4504 1.8001-8.48 5.4801-11.67 11.83 7.2999-3.94 11.899-3.8502 16.66-1.8102-10.39 3.45-19.52 11.37-20.32 26.9 1.1456-1.5053 4.6079-4.9789 7.1393-6.6285 0.09-0.0587 0.17427-0.10556 0.26167-0.15946 3.7141-2.3211 9.0494-5.1247 15.181-4.9553-5.0501 6.4577-6.6824 20.434 0.28207 38.428 1.7866-7.0567 4.0574-13.994 7.0681-20.184-1e-3 -11.664 2.0764-27.774 15.391-33.585-7.0508-2.1538-12.709-7.991-14.043-15.236z" style="fill:', ';"/>'];

    }

}


library Base64 {
    bytes internal constant TABLE = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";

    function encode(bytes memory data) internal pure returns (string memory) {
        uint256 len = data.length;
        if (len == 0) return "";

        uint256 encodedLen = 4 * ((len + 2) / 3);

        bytes memory result = new bytes(encodedLen + 32);

        bytes memory table = TABLE;

        assembly {
            let tablePtr := add(table, 1)
            let resultPtr := add(result, 32)

            for {
                let i := 0
            } lt(i, len) {

            } {
                i := add(i, 3)
                let input := and(mload(add(data, i)), 0xffffff)

                let out := mload(add(tablePtr, and(shr(18, input), 0x3F)))
                out := shl(8, out)
                out := add(out, and(mload(add(tablePtr, and(shr(12, input), 0x3F))), 0xFF))
                out := shl(8, out)
                out := add(out, and(mload(add(tablePtr, and(shr(6, input), 0x3F))), 0xFF))
                out := shl(8, out)
                out := add(out, and(mload(add(tablePtr, and(input, 0x3F))), 0xFF))
                out := shl(224, out)

                mstore(resultPtr, out)

                resultPtr := add(resultPtr, 4)
            }

            switch mod(len, 3)
            case 1 {
                mstore(sub(resultPtr, 2), shl(240, 0x3d3d))
            }
            case 2 {
                mstore(sub(resultPtr, 1), shl(248, 0x3d))
            }

            mstore(result, encodedLen)
        }

        return string(result);
    }
}