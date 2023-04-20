// SPDX-License-Identifier: Proprietary
// https://github.com/multiavatar/multiavatar-solidity/blob/master/LICENSE

pragma solidity ^0.8.12;

interface Gen {
    function addPartsData(string memory _nr, string memory _part, string[] memory _data) external;
}

contract PartsData0708 {
    mapping(string=>mapping(string=>string[])) maParts;
    
    constructor(address _address) {
        
        // maParts['07']['env'] = ['<path d="M33.83,33.83a115.5,115.5,0,1,1,0,163.34,115.49,115.49,0,0,1,0-163.34Z" style="fill:', ';"/>'];
        maParts['07']['clo'] = ['<path d="m88.18 194.11c-4.2079 1.021-8.3545 2.2792-12.42 3.7695v26.072a115.5 115.5 0 0 0 79.48 0v-26.072c-4.0858-1.4904-8.2529-2.7486-12.48-3.7695v8.7051c0 9.3888-7.6112 17-17 17h-20.58c-9.3888 0-17-7.6112-17-17v-8.7051z" style="fill:', ';"/>'];
        maParts['07']['head'] = ['<path d="m115.5 51.75a63.75 63.75 0 0 0-10.5 126.63v14.09a115.5 115.5 0 0 0-53.729 19.027 115.5 115.5 0 0 0 128.46 0 115.5 115.5 0 0 0-53.729-19.029v-14.084a63.75 63.75 0 0 0 53.25-62.881 63.75 63.75 0 0 0-63.65-63.75 63.75 63.75 0 0 0-0.09961 0z" style="fill:', ';"/>'];
        maParts['07']['mouth'] = ['<polygon points="121.61 160.74 109.39 160.74 115.5 171.31" style="fill:', ';"/><path d="m132.64 144.06a34.42 34.42 0 0 1-34.24 0" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:5.9998px;stroke:', ';"/>'];
        maParts['07']['eyes'] = ['<path d="m170.25 100c1.69 9.62-4.79 29.23-22.4 29.23-6.81 0-15-3.66-20.23-10-4.34-5.33-7.56-12.87-6.2-19.45 1.63-7.89 7.07-11.45 14.67-12.92a68.16 68.16 0 0 1 12.52-1c10.77 0 19.78 3.61 21.64 14.22z" style="fill:', ';stroke-width:3.99px;stroke:', ';"/><path d="m60.75 100c-1.69 9.62 4.79 29.23 22.4 29.23 6.81 0 15-3.66 20.23-10 4.34-5.33 7.56-12.87 6.2-19.45-1.63-7.89-7.07-11.45-14.67-12.92a68.16 68.16 0 0 0-12.52-1c-10.77 0-19.78 3.61-21.64 14.22z" style="fill:', ';stroke-width:3.99px;stroke:', ';"/><line x1="100.2" x2="130.8" y1="87.92" y2="87.92" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:3.99px;stroke:', ';"/><path d="m109.87 101.73c0-2.59 2.52-4.69 5.63-4.69s5.63 2.1 5.63 4.69" style="fill:none;stroke-width:3.99px;stroke:', ';"/>'];
        maParts['07']['top'] = ['<path d="m30.622 70.381c2.0971-3.9374 4.6649-7.9604 7.6822-12.037 3.0172-4.0765 6.0987-7.6929 9.2229-10.817l22.897 22.897c-4.4402 4.4403-8.2278 9.5439-11.213 15.14z" style="fill:', ';"/><path d="m160.58 70.423 22.907-22.897c3.1242 3.1242 6.2056 6.7406 9.2229 10.817 3.0065 4.0765 5.5744 8.0994 7.6715 12.037l-28.578 15.182c-2.9851-5.5958-6.7727-10.689-11.224-15.14z" style="fill:', ';"/><path d="m92.411 15.247c3.8197-0.87736 7.6715-1.5407 11.534-1.9794 4.0765-0.46007 7.9282-0.69546 11.555-0.69546 1.53 0 3.1563 0.0428 4.8682 0.1391l1.851 22.255 5.767-21.57c3.1028 0.37449 6.0666 0.86666 8.8912 1.4658l-10.55 49.763c-1.9259-0.41729-3.702-0.70617-5.3176-0.87736-1.423-0.14979-3.2633-0.22468-5.5102-0.22468-2.2362 0-4.237 0.10699-5.981 0.29958-1.9473 0.22469-3.8732 0.55636-5.767 0.99504z" style="fill:', ';"/><path d="m92.411 15.247c1.9152-0.43869 4.023-0.84526 6.3233-1.2304 2.065-0.34238 4.1514-0.62057 6.2698-0.84525l5.1785 50.565c-1.0913 0.10699-2.1827 0.25679-3.2954 0.43868-0.86665 0.14979-1.9152 0.36378-3.1349 0.64196z" style="fill:', ';"/>'];

        // maParts['08']['env'] = ['<path d="M33.83,33.83a115.5,115.5,0,1,1,0,163.34,115.49,115.49,0,0,1,0-163.34Z" style="fill:', ';"/>'];
        maParts['08']['clo'] = ['<path d="m141.89 195a114.79 114.79 0 0 1 38 16.5 115.55 115.55 0 0 1-128.47 0 114.79 114.79 0 0 1 38-16.5l15.75 15.75h21z" style="fill:', ';"/><path d="m146.4 196.14-17.4 17.44-1.17 1.17h-24.34l-1.18-1.17-17.43-17.44c1.49-0.41 3-0.79 4.51-1.14l4.67-1 12.74 12.74h17.69l12.73-12.74 4.67 1c1.52 0.35 3 0.73 4.51 1.14z" style="fill:', ';"/>'];
        maParts['08']['head'] = ['<path d="m115.5 51.75a63.75 63.75 0 0 0-10.5 126.63v14.09a115.5 115.5 0 0 0-53.729 19.027 115.5 115.5 0 0 0 128.46 0 115.5 115.5 0 0 0-53.729-19.029v-14.084a63.75 63.75 0 0 0 53.25-62.881 63.75 63.75 0 0 0-63.65-63.75 63.75 63.75 0 0 0-0.09961 0z" style="fill:', ';"/>'];
        maParts['08']['mouth'] = ['<path d="m115.68 160.64c7.08 0 13.11-4.93 15.46-11.84a2.14 2.14 0 0 0-1.51-2.6101 2.3 2.3 0 0 0-0.73995-0.0593h-26.42a2.12 2.12 0 0 0-2.31 1.9099 1.85 1.85 0 0 0 0.0593 0.73995c2.3401 6.9301 8.3802 11.86 15.46 11.86z" style="fill:', ';"/>'];
        maParts['08']['eyes'] = ['<path d="m145.38 95.628c-5.1601 2.2597-11.03 2.2597-16.19 0m-47.29 1.75c5.1755-2.2694 11.065-2.2694 16.24 0" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:5.9998px;stroke:', ';"/><path d="m90.016 106.28c-4.4506-0.0105-6.6902 5.3657-3.5508 8.5195 3.1394 3.1539 8.5252 0.93887 8.5352-3.5117 0.0063-2.7522-2.2204-4.9898-4.9727-4.9961l-0.011719-0.01172zm47.281 0c-4.4506-0.0105-6.6902 5.3657-3.5508 8.5195 3.1394 3.1539 8.5252 0.93887 8.5352-3.5117 6e-3 -2.7522-2.2204-4.9898-4.9727-4.9961l-0.01171-0.01172z" style="fill:', ';"/>'];
        maParts['08']['top'] = ['<path d="m108.37 22.019c-6.2698-12.829-17.151-13.396-18.949 1.1769-11.448-9.4583-26.021-4.483-20.361 12.422-12.251-7.9282-24.919 1.7761-17.076 20.853-27.08 2.3646-22.715 24.726-10.111 31.435-9.9002 3.3566-10.701 9.4006-8.464 14.497 2.6574 4.7842 9.0126 6.4737 11.545 9.6519-6.624 0.59419-8.4112 5.6011-5.7404 9.5192 1.6896 2.4787 5.2756 4.2218 8.5971 5.5455 1.0485 0.40658 3.702 1.2732 3.9053 2.4181 0.18744 1.2156-6.7884 3.0055-5.7281 5.2612 0.60648 1.4227 1.7764 2.7151 2.6466 3.7156 1.2807 1.6595 10.755 8.0351 9.4583 4.2049-1.0271-3.7234-2.2148-7.4682-3.1456-11.192-1.1662-5.3069-1.7868-10.721-1.102-16.156 1.4223-5.455 5.069-4.4265 7.7837-8.3588 3.5264-5.7505 2.0296-11.614 2.124-13.575 0.107-1.7868 1.5407-1.1876 3.1884-1.4337 4.3868-0.64196 7.0081-2.1185 8.8377-6.2698 0.77035-1.9259 0.62057-9.7578 0.52426-11.78 0.36378-4.6328 4.1835 0 6.548 0.64196 3.2633 0.88805 6.8797 0.21399 9.0731-2.5037 1.7547-2.3753 2.0864-2.8888 4.6114-0.80245 2.6856 2.2148 4.0979 3.1349 7.6929 3.274 5.5637 0.20329 8.7735-6.2698 11.32-5.6386 3.5201 0.87735 3.6057 5.4567 10.261 4.8682 2.386-0.20329 3.8304-0.86665 5.4032-2.6428 0.88805-0.99505 1.958-2.5037 3.4345-2.6214 1.4658-0.1177 2.3218 2.3646 3.0065 3.4452 1.1926 2.6755 4.0295 3.6513 6.2377 3.3168 1.958-0.17119 3.854-1.4115 5.4268-2.4707 0.99679-0.66102 1.8284-0.81128 1.9256 0.2071 0.29592 2.2271 0.0862 7.7025 0.1596 8.4821 0.10556 8.4609 5.37 10.569 13.223 10.333-0.31871 3.7464 0.0583 11.28 5.4353 14.562 3.9481 2.7604 6.6657 1.2732 6.7299 7.8534 7e-3 6.1914-0.43693 13.061-1.2946 18.189-0.69547 4.0444-1.2412 6.4838-2.5251 10.378-0.64196 1.9152-0.81315 1.9687 1.4123 1.0699 7.1472-3.1456 10.539-11.48 8.3562-18.842-0.43869-2.0436 0.84525-1.7226 2.8781-2.6106 9.5248-4.2363 8.1264-11.335-0.75967-14.273 11.988-3.0926 13.886-8.9002 6.6871-15.375 7.3077-5.9168 3.6378-16.177-2.8032-16.991 12.422-7.0937 5.7349-22.062-5.1036-18.499 4.1728-12.037-5.5637-26.203-21.121-16.894 6.9653-11.373 2.065-22.661-12.101-10.785-3.4559-18.382-15.14-16.584-23.902-5.018 0.09435-20.075-16.001-17.42-18.146-2.5892z" style="fill:', ';"/><path d="m5.4353 80.502c7.4468 9.1373 15.632 8.8912 15.632 8.8912s-6.0772 3.7983-6.8369 9.8755c-0.75966 6.088 4.5579 9.6295 8.0994 10.646 3.5522 1.0058 7.0937-2.7925 7.0937-2.7925s-5.8312 10.646-1.5193 15.964c4.3012 5.3176 11.908 3.0386 11.908 3.0386s-5.3283 10.132 1.0057 14.187c5.8312 3.7234 18.542 7.6715 20.511 8.2706-6.0666-9.7472-9.576-21.249-9.576-33.575v-0.0428c0-35.201 28.546-63.747 63.747-63.747 35.212 0 63.758 28.546 63.758 63.747 0 12.476-3.5843 24.116-9.7899 33.949h0.53496s13.931-1.0057 16.21-9.3727c2.279-8.3562 0.75967-9.8756 0.75967-9.8756s10.635 2.0329 13.417-7.5966l2.7926-9.6295s10.132 0 10.892-7.083c0.75963-7.0937-7.0295-12.411-7.0295-12.411s11.459 0.82385 14.498-10.453c1.0164-3.7555 0.83456-8.2171 0.1391-12.497-17.665-41.161-58.569-69.995-106.18-69.995-30.632 0-60.034 12.187-81.679 33.831v0.0107c-13.171 13.171-22.833 29.22-28.386 46.66z" style="fill:', ';"/>'];

        // Gen(_address).addPartsData('07', 'env', maParts['07']['env']);
        Gen(_address).addPartsData('07', 'clo', maParts['07']['clo']);
        Gen(_address).addPartsData('07', 'head', maParts['07']['head']);
        Gen(_address).addPartsData('07', 'mouth', maParts['07']['mouth']);
        Gen(_address).addPartsData('07', 'eyes', maParts['07']['eyes']);
        Gen(_address).addPartsData('07', 'top', maParts['07']['top']);
        
        // Gen(_address).addPartsData('08', 'env', maParts['08']['env']);
        Gen(_address).addPartsData('08', 'clo', maParts['08']['clo']);
        Gen(_address).addPartsData('08', 'head', maParts['08']['head']);
        Gen(_address).addPartsData('08', 'mouth', maParts['08']['mouth']);
        Gen(_address).addPartsData('08', 'eyes', maParts['08']['eyes']);
        Gen(_address).addPartsData('08', 'top', maParts['08']['top']);

    }
}