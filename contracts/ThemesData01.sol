// SPDX-License-Identifier: Proprietary
// https://github.com/multiavatar/multiavatar-solidity/blob/master/LICENSE

pragma solidity ^0.8.12;

interface Gen {
    function addThemesData(string memory _nr, string memory _theme, string memory _part, string[] memory _data) external;
}

contract ThemesData01 {
    mapping(string=>mapping(string=>mapping(string=>string[]))) maThemes;

    constructor(address _address) {

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
    

        Gen(_address).addThemesData('10', 'A', 'env', maThemes['10']['A']['env']);
        Gen(_address).addThemesData('10', 'A', 'clo', maThemes['10']['A']['clo']);
        Gen(_address).addThemesData('10', 'A', 'head', maThemes['10']['A']['head']);
        Gen(_address).addThemesData('10', 'A', 'mouth', maThemes['10']['A']['mouth']);
        Gen(_address).addThemesData('10', 'A', 'eyes', maThemes['10']['A']['eyes']);
        Gen(_address).addThemesData('10', 'A', 'top', maThemes['10']['A']['top']);

        Gen(_address).addThemesData('10', 'B', 'env', maThemes['10']['B']['env']);
        Gen(_address).addThemesData('10', 'B', 'clo', maThemes['10']['B']['clo']);
        Gen(_address).addThemesData('10', 'B', 'head', maThemes['10']['B']['head']);
        Gen(_address).addThemesData('10', 'B', 'mouth', maThemes['10']['B']['mouth']);
        Gen(_address).addThemesData('10', 'B', 'eyes', maThemes['10']['B']['eyes']);
        Gen(_address).addThemesData('10', 'B', 'top', maThemes['10']['B']['top']);

        Gen(_address).addThemesData('10', 'C', 'env', maThemes['10']['C']['env']);
        Gen(_address).addThemesData('10', 'C', 'clo', maThemes['10']['C']['clo']);
        Gen(_address).addThemesData('10', 'C', 'head', maThemes['10']['C']['head']);
        Gen(_address).addThemesData('10', 'C', 'mouth', maThemes['10']['C']['mouth']);
        Gen(_address).addThemesData('10', 'C', 'eyes', maThemes['10']['C']['eyes']);
        Gen(_address).addThemesData('10', 'C', 'top', maThemes['10']['C']['top']);

        Gen(_address).addThemesData('11', 'A', 'env', maThemes['11']['A']['env']);
        Gen(_address).addThemesData('11', 'A', 'clo', maThemes['11']['A']['clo']);
        Gen(_address).addThemesData('11', 'A', 'head', maThemes['11']['A']['head']);
        Gen(_address).addThemesData('11', 'A', 'mouth', maThemes['11']['A']['mouth']);
        Gen(_address).addThemesData('11', 'A', 'eyes', maThemes['11']['A']['eyes']);
        Gen(_address).addThemesData('11', 'A', 'top', maThemes['11']['A']['top']);

        Gen(_address).addThemesData('11', 'B', 'env', maThemes['11']['B']['env']);
        Gen(_address).addThemesData('11', 'B', 'clo', maThemes['11']['B']['clo']);
        Gen(_address).addThemesData('11', 'B', 'head', maThemes['11']['B']['head']);
        Gen(_address).addThemesData('11', 'B', 'mouth', maThemes['11']['B']['mouth']);
        Gen(_address).addThemesData('11', 'B', 'eyes', maThemes['11']['B']['eyes']);
        Gen(_address).addThemesData('11', 'B', 'top', maThemes['11']['B']['top']);

        Gen(_address).addThemesData('11', 'C', 'env', maThemes['11']['C']['env']);
        Gen(_address).addThemesData('11', 'C', 'clo', maThemes['11']['C']['clo']);
        Gen(_address).addThemesData('11', 'C', 'head', maThemes['11']['C']['head']);
        Gen(_address).addThemesData('11', 'C', 'mouth', maThemes['11']['C']['mouth']);
        Gen(_address).addThemesData('11', 'C', 'eyes', maThemes['11']['C']['eyes']);
        Gen(_address).addThemesData('11', 'C', 'top', maThemes['11']['C']['top']);

        Gen(_address).addThemesData('12', 'A', 'env', maThemes['12']['A']['env']);
        Gen(_address).addThemesData('12', 'A', 'clo', maThemes['12']['A']['clo']);
        Gen(_address).addThemesData('12', 'A', 'head', maThemes['12']['A']['head']);
        Gen(_address).addThemesData('12', 'A', 'mouth', maThemes['12']['A']['mouth']);
        Gen(_address).addThemesData('12', 'A', 'eyes', maThemes['12']['A']['eyes']);
        Gen(_address).addThemesData('12', 'A', 'top', maThemes['12']['A']['top']);

        Gen(_address).addThemesData('12', 'B', 'env', maThemes['12']['B']['env']);
        Gen(_address).addThemesData('12', 'B', 'clo', maThemes['12']['B']['clo']);
        Gen(_address).addThemesData('12', 'B', 'head', maThemes['12']['B']['head']);
        Gen(_address).addThemesData('12', 'B', 'mouth', maThemes['12']['B']['mouth']);
        Gen(_address).addThemesData('12', 'B', 'eyes', maThemes['12']['B']['eyes']);
        Gen(_address).addThemesData('12', 'B', 'top', maThemes['12']['B']['top']);

        Gen(_address).addThemesData('12', 'C', 'env', maThemes['12']['C']['env']);
        Gen(_address).addThemesData('12', 'C', 'clo', maThemes['12']['C']['clo']);
        Gen(_address).addThemesData('12', 'C', 'head', maThemes['12']['C']['head']);
        Gen(_address).addThemesData('12', 'C', 'mouth', maThemes['12']['C']['mouth']);
        Gen(_address).addThemesData('12', 'C', 'eyes', maThemes['12']['C']['eyes']);
        Gen(_address).addThemesData('12', 'C', 'top', maThemes['12']['C']['top']);

    }
}