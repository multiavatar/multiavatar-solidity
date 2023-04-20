// SPDX-License-Identifier: Proprietary
// https://github.com/multiavatar/multiavatar-solidity/blob/master/LICENSE

pragma solidity ^0.8.12;

interface Gen {
    function addThemesData(string memory _nr, string memory _theme, string memory _part, string[] memory _data) external;
}

contract ThemesData00 {
    mapping(string=>mapping(string=>mapping(string=>string[]))) maThemes;

    constructor(address _address) {

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
    

        Gen(_address).addThemesData('06', 'A', 'env', maThemes['06']['A']['env']);
        Gen(_address).addThemesData('06', 'A', 'clo', maThemes['06']['A']['clo']);
        Gen(_address).addThemesData('06', 'A', 'head', maThemes['06']['A']['head']);
        Gen(_address).addThemesData('06', 'A', 'mouth', maThemes['06']['A']['mouth']);
        Gen(_address).addThemesData('06', 'A', 'eyes', maThemes['06']['A']['eyes']);
        Gen(_address).addThemesData('06', 'A', 'top', maThemes['06']['A']['top']);

        Gen(_address).addThemesData('06', 'B', 'env', maThemes['06']['B']['env']);
        Gen(_address).addThemesData('06', 'B', 'clo', maThemes['06']['B']['clo']);
        Gen(_address).addThemesData('06', 'B', 'head', maThemes['06']['B']['head']);
        Gen(_address).addThemesData('06', 'B', 'mouth', maThemes['06']['B']['mouth']);
        Gen(_address).addThemesData('06', 'B', 'eyes', maThemes['06']['B']['eyes']);
        Gen(_address).addThemesData('06', 'B', 'top', maThemes['06']['B']['top']);

        Gen(_address).addThemesData('06', 'C', 'env', maThemes['06']['C']['env']);
        Gen(_address).addThemesData('06', 'C', 'clo', maThemes['06']['C']['clo']);
        Gen(_address).addThemesData('06', 'C', 'head', maThemes['06']['C']['head']);
        Gen(_address).addThemesData('06', 'C', 'mouth', maThemes['06']['C']['mouth']);
        Gen(_address).addThemesData('06', 'C', 'eyes', maThemes['06']['C']['eyes']);
        Gen(_address).addThemesData('06', 'C', 'top', maThemes['06']['C']['top']);

        Gen(_address).addThemesData('07', 'A', 'env', maThemes['07']['A']['env']);
        Gen(_address).addThemesData('07', 'A', 'clo', maThemes['07']['A']['clo']);
        Gen(_address).addThemesData('07', 'A', 'head', maThemes['07']['A']['head']);
        Gen(_address).addThemesData('07', 'A', 'mouth', maThemes['07']['A']['mouth']);
        Gen(_address).addThemesData('07', 'A', 'eyes', maThemes['07']['A']['eyes']);
        Gen(_address).addThemesData('07', 'A', 'top', maThemes['07']['A']['top']);

        Gen(_address).addThemesData('07', 'B', 'env', maThemes['07']['B']['env']);
        Gen(_address).addThemesData('07', 'B', 'clo', maThemes['07']['B']['clo']);
        Gen(_address).addThemesData('07', 'B', 'head', maThemes['07']['B']['head']);
        Gen(_address).addThemesData('07', 'B', 'mouth', maThemes['07']['B']['mouth']);
        Gen(_address).addThemesData('07', 'B', 'eyes', maThemes['07']['B']['eyes']);
        Gen(_address).addThemesData('07', 'B', 'top', maThemes['07']['B']['top']);

        Gen(_address).addThemesData('07', 'C', 'env', maThemes['07']['C']['env']);
        Gen(_address).addThemesData('07', 'C', 'clo', maThemes['07']['C']['clo']);
        Gen(_address).addThemesData('07', 'C', 'head', maThemes['07']['C']['head']);
        Gen(_address).addThemesData('07', 'C', 'mouth', maThemes['07']['C']['mouth']);
        Gen(_address).addThemesData('07', 'C', 'eyes', maThemes['07']['C']['eyes']);
        Gen(_address).addThemesData('07', 'C', 'top', maThemes['07']['C']['top']);

        Gen(_address).addThemesData('08', 'A', 'env', maThemes['08']['A']['env']);
        Gen(_address).addThemesData('08', 'A', 'clo', maThemes['08']['A']['clo']);
        Gen(_address).addThemesData('08', 'A', 'head', maThemes['08']['A']['head']);
        Gen(_address).addThemesData('08', 'A', 'mouth', maThemes['08']['A']['mouth']);
        Gen(_address).addThemesData('08', 'A', 'eyes', maThemes['08']['A']['eyes']);
        Gen(_address).addThemesData('08', 'A', 'top', maThemes['08']['A']['top']);

        Gen(_address).addThemesData('08', 'B', 'env', maThemes['08']['B']['env']);
        Gen(_address).addThemesData('08', 'B', 'clo', maThemes['08']['B']['clo']);
        Gen(_address).addThemesData('08', 'B', 'head', maThemes['08']['B']['head']);
        Gen(_address).addThemesData('08', 'B', 'mouth', maThemes['08']['B']['mouth']);
        Gen(_address).addThemesData('08', 'B', 'eyes', maThemes['08']['B']['eyes']);
        Gen(_address).addThemesData('08', 'B', 'top', maThemes['08']['B']['top']);

        Gen(_address).addThemesData('08', 'C', 'env', maThemes['08']['C']['env']);
        Gen(_address).addThemesData('08', 'C', 'clo', maThemes['08']['C']['clo']);
        Gen(_address).addThemesData('08', 'C', 'head', maThemes['08']['C']['head']);
        Gen(_address).addThemesData('08', 'C', 'mouth', maThemes['08']['C']['mouth']);
        Gen(_address).addThemesData('08', 'C', 'eyes', maThemes['08']['C']['eyes']);
        Gen(_address).addThemesData('08', 'C', 'top', maThemes['08']['C']['top']);

        Gen(_address).addThemesData('09', 'A', 'env', maThemes['09']['A']['env']);
        Gen(_address).addThemesData('09', 'A', 'clo', maThemes['09']['A']['clo']);
        Gen(_address).addThemesData('09', 'A', 'head', maThemes['09']['A']['head']);
        Gen(_address).addThemesData('09', 'A', 'mouth', maThemes['09']['A']['mouth']);
        Gen(_address).addThemesData('09', 'A', 'eyes', maThemes['09']['A']['eyes']);
        Gen(_address).addThemesData('09', 'A', 'top', maThemes['09']['A']['top']);

        Gen(_address).addThemesData('09', 'B', 'env', maThemes['09']['B']['env']);
        Gen(_address).addThemesData('09', 'B', 'clo', maThemes['09']['B']['clo']);
        Gen(_address).addThemesData('09', 'B', 'head', maThemes['09']['B']['head']);
        Gen(_address).addThemesData('09', 'B', 'mouth', maThemes['09']['B']['mouth']);
        Gen(_address).addThemesData('09', 'B', 'eyes', maThemes['09']['B']['eyes']);
        Gen(_address).addThemesData('09', 'B', 'top', maThemes['09']['B']['top']);

        Gen(_address).addThemesData('09', 'C', 'env', maThemes['09']['C']['env']);
        Gen(_address).addThemesData('09', 'C', 'clo', maThemes['09']['C']['clo']);
        Gen(_address).addThemesData('09', 'C', 'head', maThemes['09']['C']['head']);
        Gen(_address).addThemesData('09', 'C', 'mouth', maThemes['09']['C']['mouth']);
        Gen(_address).addThemesData('09', 'C', 'eyes', maThemes['09']['C']['eyes']);
        Gen(_address).addThemesData('09', 'C', 'top', maThemes['09']['C']['top']);

    }
}