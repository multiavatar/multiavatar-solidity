// SPDX-License-Identifier: Proprietary
// https://github.com/multiavatar/multiavatar-solidity/blob/master/LICENSE

pragma solidity ^0.8.12;

interface Gen {
    function addPartsData(string memory _nr, string memory _part, string[] memory _data) external;
}

contract PartsData0304 {
    mapping(string=>mapping(string=>string[])) maParts;
    
    constructor(address _address) {
        
        // maParts['03']['env'] = ['<path d="M33.83,33.83a115.5,115.5,0,1,1,0,163.34,115.49,115.49,0,0,1,0-163.34Z" style="fill:', ';"/>'];
        maParts['03']['clo'] = ['<path d="m141.75 195c13.563 3.1499 26.439 8.7409 38 16.5-38.873 26.001-89.587 26.001-128.46 0 11.561-7.7591 24.437-13.35 38-16.5 8.4869 8.8011 26.21 25.619 26.21 25.619s17.603-16.972 26.25-25.619z" style="fill:', ';"/><path d="m109 230.81 1.6836-14.33h9.6328l1.6836 14.33c-2.16 0.12-4.33 0.19-6.51 0.19s-4.35-0.07-6.51-0.19z" style="fill:', ';"/><path d="m124.17 210.6h-17.349v5.53a3.8828 3.29 0 0 0 3.8828 3.29h9.583a3.8828 3.29 0 0 0 3.8828-3.29z" style="fill:', ';"/><path d="m140.57 190.36-25.066 20.245c5.9686 3.2455 11.597 7.0814 16.8 11.45 1.5989 1.3338 3.9762 1.1189 5.31-0.48 0.21005-0.25749 0.38802-0.53956 0.52999-0.84l10.826-23.805-4-6c-0.90256-1.351-2.7298-1.7137-4.08-0.81-0.11612 0.0786-0.22641 0.16549-0.33 0.26z" style="fill:', ';"/><path d="m90.434 190.36 25.066 20.245c-5.9686 3.2455-11.597 7.0814-16.8 11.45-1.5989 1.3338-3.9762 1.1189-5.31-0.48-0.21005-0.25749-0.38802-0.53956-0.52999-0.84l-10.826-23.805 4-6c0.90256-1.351 2.7298-1.7137 4.08-0.81 0.11612 0.0786 0.22641 0.16549 0.33 0.26z" style="fill:', ';"/>'];
        maParts['03']['head'] = ['<path d="m115.5 51.75a63.75 63.75 0 0 0-10.5 126.63v14.09a115.5 115.5 0 0 0-53.729 19.027 115.5 115.5 0 0 0 128.46 0 115.5 115.5 0 0 0-53.729-19.029v-14.084a63.75 63.75 0 0 0 53.25-62.881 63.75 63.75 0 0 0-63.65-63.75 63.75 63.75 0 0 0-0.09961 0z" style="fill:', ';"/>'];
        maParts['03']['mouth'] = ['<path d="m136.21 147.09a21.77 21.77 0 0 1-40.13 0z" style="fill:', ';stroke-linecap:round;stroke-linejoin:round;stroke-width:3.4999px;stroke:', ';"/>'];
        maParts['03']['eyes'] = ['<path d="m145.39 104.7-11.52 11.2h17.26m-65.52-11.2 11.52 11.2h-17.26" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:5.4998px;stroke:', ';"/>'];
        maParts['03']['top'] = ['<path d="m43.891 77.836c-5.1124 28.237 2.1347 61.004 24.792 81.332-6.2362-12.503-9.5362-33.948-9.4887-45.458-0.50203-37.473 41.439-46.335 56.149-17.614 18.8-31.2 52.825-16.872 54.062 13.714 0.56018 13.844-0.43568 25.598-7.0962 48.966 18.372-12.47 28.012-53.959 23.545-80.941-47.486-2.2552-94.831-2.5724-141.96 0z" style="fill:', ';"/><path d="m111.26 12.782c-18.508 0.0791-32.594 3.6163-32.594 3.6163 24.513 5.6002 32.807 10.504 31.743 19.835-0.87227 9.702-11.092 10.875-20.811 11.554-5.2548 0.36414-10.949 0.71523-16.391 1.7525-11.862 2.2818-19.946 4.3736-24.447 11.956-1.7012 2.8662-3.7945 10.428-4.8689 16.34h141.96c-5.7242-38.563-32.557-65.073-74.595-65.054z" style="fill:', ';"/><path d="m73.292 44.77c-11.788 2.2816-18.923 5.5444-23.394 13.126-2.8484 6.7586-4.8454 13.238-6.0072 19.939h141.96c-1.9772-14.576-6.8677-28.248-19.277-32.098-28.834-6.3308-63.774-6.3553-93.285-0.96761z" style="fill:', ';"/><path d="m165.95 35.642c-11.178 21.829-91.89 19.36-103.98 2.3011-9.703 12.267-15.605 25.883-18.079 39.892h141.96c-3.0096-17.158-9.7424-32.688-19.902-42.193z" style="fill:', ';"/>'];

        // maParts['04']['env'] = ['<path d="M33.83,33.83a115.5,115.5,0,1,1,0,163.34,115.49,115.49,0,0,1,0-163.34Z" style="fill:', ';"/>'];
        maParts['04']['clo'] = ['<path d="m141.75 195a114.79 114.79 0 0 1 38 16.5 115.53 115.53 0 0 1-128.46 0 114.79 114.79 0 0 1 38-16.5l15.71 15.75h21z" style="fill:', ';"/><path d="m115.45 211.34-10.55 10.54a2.51 2.51 0 0 1-3.5599 0 2 2 0 0 1-0.26999-0.30994l-18.48-25.4 5.8901-5.8899a2.52 2.52 0 0 1 3.5199-0.0791l23.49 21.14z" style="fill:', ';"/><path d="m115.45 211.34 10.55 10.54a2.51 2.51 0 0 0 3.5599 0 2 2 0 0 0 0.26999-0.30994l18.48-25.4-5.8901-5.8899a2.52 2.52 0 0 0-3.4699-0.089l-23.49 21.14z" style="fill:', ';"/><path d="m158.41 199.58-10.11-3.2401v29.93q5.1601-1.5299 10.11-3.51zm-75.82 26.66v-29.9l-10.1 3.2401v23.14c3.2901 1.3199 6.67 2.4999 10.1 3.5199z" style="fill:', ';"/>'];
        maParts['04']['head'] = ['<path d="m115.5 51.75a63.75 63.75 0 0 0-10.5 126.63v14.09a115.5 115.5 0 0 0-53.729 19.027 115.5 115.5 0 0 0 128.46 0 115.5 115.5 0 0 0-53.729-19.029v-14.084a63.75 63.75 0 0 0 53.25-62.881 63.75 63.75 0 0 0-63.65-63.75 63.75 63.75 0 0 0-0.09961 0z" style="fill:', ';"/>'];
        maParts['04']['mouth'] = ['<path d="m118.05 148.38c-1.5064 0.59192-2.595 2.0264-2.6191 3.9863-0.0574 1.3977 0.53421 3.5611 3.6758 5.7949 8.0544 4.9446 21.507 3.6862 21.255-7.1658-4.664 4.8219-10.021 5.6377-14.773 0.73907-1.2328-1.1599-2.3694-2.4032-3.9294-3.1408-1.0946-0.50424-2.2257-0.61071-3.6096-0.21337z" style="fill:', ';"/><path d="m133.61 154.93c3.0731-0.48816 5.5702-2.8457 5.4438-4.5059-0.47801-4.8311-5.7317-3.0917-4.3369-0.31405-2.8103-1.4445-1.8343-3.8862 0.50427-4.7324 2.0509-0.79942 5.0937 0.34314 6.2002 2.6376 2.2229 7.3422-3.4376 11.68-10.384 12.561z" style="fill:', ';"/><path d="m112.81 148.38c1.5064 0.59192 2.595 2.0264 2.6191 3.9863 0.0574 1.3977-0.53421 3.5611-3.6758 5.7949-8.0544 4.9446-21.507 3.6862-21.255-7.1658 4.664 4.8219 10.021 5.6377 14.773 0.73907 1.2328-1.1599 2.3694-2.4032 3.9294-3.1408 1.0946-0.50424 2.2257-0.61071 3.6096-0.21337z" style="fill:', ';"/><path d="m97.252 154.93c-3.0731-0.48816-5.5702-2.8457-5.4438-4.5059 0.47801-4.8311 5.7317-3.0917 4.3369-0.31405 2.8103-1.4445 1.8343-3.8862-0.50427-4.7324-2.0509-0.79942-5.0937 0.34314-6.2002 2.6376-2.2229 7.3422 3.4376 11.68 10.384 12.561z" style="fill:', ';"/>'];
        maParts['04']['eyes'] = ['<path d="m131.64 114.09 7.5801-7.5801 7.5801 7.5801m-62.6 0 7.5801-7.5801 7.5799 7.5801" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:6.4998px;stroke:', ';"/>'];
        maParts['04']['top'] = ['<path d="m137.38 11.148c-12.23 1.9593-18.511 14.606-43.436 9.4915-11.285-3.2054-16.406-3.573-20.389 0.58594-4.1548 4.3384-7.033 12.435-9.8184 21.706-2.1354 7.4136-3.7187 14.381-4.7461 21.646h112.7c-3.4878-24.293-10.822-43.281-25.182-51.061-3.5314-1.623-6.5274-2.2959-9.1289-2.3613z" style="fill:', ';"/><path d="m114.37 43.383c-19.445 0.088-38.524 2.0724-52.379 5.6992-1.2766 4.5795-2.4317 10.169-3.2285 16.807h113.11c-0.83731-6.0107-1.9164-11.674-3.3184-16.924-15.229-3.8842-34.873-5.6693-54.18-5.582z" style="fill:', ';"/><path d="m115.5 55.773c-58.39 0-105.73 15.476-105.73 34.57h0.0312c0 11.295 16.496 21.319 42.126 27.627-0.10331-7.7704 2.788-21.904 5.2734-31.031 6.0935-1.7168 6.9294-1.8971 13.167-2.9919 14.874-2.8256 29.99-4.2037 45.133-4.1153 15.143-0.0884 30.259 1.2897 45.133 4.1153 6.2372 1.0947 7.2065 1.2751 13.3 2.9919 2.4854 9.1267 5.3768 23.26 5.2734 31.031 25.63-6.3082 41.993-16.332 41.993-27.627h0.0312c0-19.093-47.34-34.57-105.73-34.57z" style="fill:', ';"/><path d="m72.088 83.533c-6.9765 1.1147-13.357 2.856-18.439 4.3477-1.1861 7.415-2.0038 18.858-1.8926 26.293 4.3278-0.62795 10.155-1.3644 13.295-1.6465-0.40554 0.30198 2.7344-17.827 7.0371-28.994zm86.824 0c4.3028 11.167 7.4426 29.296 7.0371 28.994 3.1396 0.28213 8.9671 1.0185 13.295 1.6465 0.11119-7.4351-0.70652-18.878-1.8926-26.293-5.0822-1.4916-11.463-3.2329-18.439-4.3477z" style="fill:', ';"/>'];

        // Gen(_address).addPartsData('03', 'env', maParts['03']['env']);
        Gen(_address).addPartsData('03', 'clo', maParts['03']['clo']);
        Gen(_address).addPartsData('03', 'head', maParts['03']['head']);
        Gen(_address).addPartsData('03', 'mouth', maParts['03']['mouth']);
        Gen(_address).addPartsData('03', 'eyes', maParts['03']['eyes']);
        Gen(_address).addPartsData('03', 'top', maParts['03']['top']);
        
        // Gen(_address).addPartsData('04', 'env', maParts['04']['env']);
        Gen(_address).addPartsData('04', 'clo', maParts['04']['clo']);
        Gen(_address).addPartsData('04', 'head', maParts['04']['head']);
        Gen(_address).addPartsData('04', 'mouth', maParts['04']['mouth']);
        Gen(_address).addPartsData('04', 'eyes', maParts['04']['eyes']);
        Gen(_address).addPartsData('04', 'top', maParts['04']['top']);

    }
}