// SPDX-License-Identifier: Proprietary
// https://github.com/multiavatar/multiavatar-solidity/blob/master/LICENSE

pragma solidity ^0.8.12;

interface Gen {
    function addThemesData(string memory _nr, string memory _theme, string memory _part, string[] memory _data) external;
}

contract ThemesData02 {
    mapping(string=>mapping(string=>mapping(string=>string[]))) maThemes;

    constructor(address _address) {

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


        Gen(_address).addThemesData('13', 'A', 'env', maThemes['13']['A']['env']);
        Gen(_address).addThemesData('13', 'A', 'clo', maThemes['13']['A']['clo']);
        Gen(_address).addThemesData('13', 'A', 'head', maThemes['13']['A']['head']);
        Gen(_address).addThemesData('13', 'A', 'mouth', maThemes['13']['A']['mouth']);
        Gen(_address).addThemesData('13', 'A', 'eyes', maThemes['13']['A']['eyes']);
        Gen(_address).addThemesData('13', 'A', 'top', maThemes['13']['A']['top']);

        Gen(_address).addThemesData('13', 'B', 'env', maThemes['13']['B']['env']);
        Gen(_address).addThemesData('13', 'B', 'clo', maThemes['13']['B']['clo']);
        Gen(_address).addThemesData('13', 'B', 'head', maThemes['13']['B']['head']);
        Gen(_address).addThemesData('13', 'B', 'mouth', maThemes['13']['B']['mouth']);
        Gen(_address).addThemesData('13', 'B', 'eyes', maThemes['13']['B']['eyes']);
        Gen(_address).addThemesData('13', 'B', 'top', maThemes['13']['B']['top']);

        Gen(_address).addThemesData('13', 'C', 'env', maThemes['13']['C']['env']);
        Gen(_address).addThemesData('13', 'C', 'clo', maThemes['13']['C']['clo']);
        Gen(_address).addThemesData('13', 'C', 'head', maThemes['13']['C']['head']);
        Gen(_address).addThemesData('13', 'C', 'mouth', maThemes['13']['C']['mouth']);
        Gen(_address).addThemesData('13', 'C', 'eyes', maThemes['13']['C']['eyes']);
        Gen(_address).addThemesData('13', 'C', 'top', maThemes['13']['C']['top']);

        Gen(_address).addThemesData('14', 'A', 'env', maThemes['14']['A']['env']);
        Gen(_address).addThemesData('14', 'A', 'clo', maThemes['14']['A']['clo']);
        Gen(_address).addThemesData('14', 'A', 'head', maThemes['14']['A']['head']);
        Gen(_address).addThemesData('14', 'A', 'mouth', maThemes['14']['A']['mouth']);
        Gen(_address).addThemesData('14', 'A', 'eyes', maThemes['14']['A']['eyes']);
        Gen(_address).addThemesData('14', 'A', 'top', maThemes['14']['A']['top']);

        Gen(_address).addThemesData('14', 'B', 'env', maThemes['14']['B']['env']);
        Gen(_address).addThemesData('14', 'B', 'clo', maThemes['14']['B']['clo']);
        Gen(_address).addThemesData('14', 'B', 'head', maThemes['14']['B']['head']);
        Gen(_address).addThemesData('14', 'B', 'mouth', maThemes['14']['B']['mouth']);
        Gen(_address).addThemesData('14', 'B', 'eyes', maThemes['14']['B']['eyes']);
        Gen(_address).addThemesData('14', 'B', 'top', maThemes['14']['B']['top']);

        Gen(_address).addThemesData('14', 'C', 'env', maThemes['14']['C']['env']);
        Gen(_address).addThemesData('14', 'C', 'clo', maThemes['14']['C']['clo']);
        Gen(_address).addThemesData('14', 'C', 'head', maThemes['14']['C']['head']);
        Gen(_address).addThemesData('14', 'C', 'mouth', maThemes['14']['C']['mouth']);
        Gen(_address).addThemesData('14', 'C', 'eyes', maThemes['14']['C']['eyes']);
        Gen(_address).addThemesData('14', 'C', 'top', maThemes['14']['C']['top']);

        Gen(_address).addThemesData('15', 'A', 'env', maThemes['15']['A']['env']);
        Gen(_address).addThemesData('15', 'A', 'clo', maThemes['15']['A']['clo']);
        Gen(_address).addThemesData('15', 'A', 'head', maThemes['15']['A']['head']);
        Gen(_address).addThemesData('15', 'A', 'mouth', maThemes['15']['A']['mouth']);
        Gen(_address).addThemesData('15', 'A', 'eyes', maThemes['15']['A']['eyes']);
        Gen(_address).addThemesData('15', 'A', 'top', maThemes['15']['A']['top']);

        Gen(_address).addThemesData('15', 'B', 'env', maThemes['15']['B']['env']);
        Gen(_address).addThemesData('15', 'B', 'clo', maThemes['15']['B']['clo']);
        Gen(_address).addThemesData('15', 'B', 'head', maThemes['15']['B']['head']);
        Gen(_address).addThemesData('15', 'B', 'mouth', maThemes['15']['B']['mouth']);
        Gen(_address).addThemesData('15', 'B', 'eyes', maThemes['15']['B']['eyes']);
        Gen(_address).addThemesData('15', 'B', 'top', maThemes['15']['B']['top']);

        Gen(_address).addThemesData('15', 'C', 'env', maThemes['15']['C']['env']);
        Gen(_address).addThemesData('15', 'C', 'clo', maThemes['15']['C']['clo']);
        Gen(_address).addThemesData('15', 'C', 'head', maThemes['15']['C']['head']);
        Gen(_address).addThemesData('15', 'C', 'mouth', maThemes['15']['C']['mouth']);
        Gen(_address).addThemesData('15', 'C', 'eyes', maThemes['15']['C']['eyes']);
        Gen(_address).addThemesData('15', 'C', 'top', maThemes['15']['C']['top']);

    }
}