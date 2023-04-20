// SPDX-License-Identifier: Proprietary
// https://github.com/multiavatar/multiavatar-solidity/blob/master/LICENSE

pragma solidity ^0.8.12;

interface Gen {
    function addPartsData(string memory _nr, string memory _part, string[] memory _data) external;
}

contract PartsData0910 {
    mapping(string=>mapping(string=>string[])) maParts;
    
    constructor(address _address) {
        
        // maParts['09']['env'] = ['<path d="M33.83,33.83a115.5,115.5,0,1,1,0,163.34,115.49,115.49,0,0,1,0-163.34Z" style="fill:', ';"/>'];
        maParts['09']['clo'] = ['<path d="m141.75 195a114.79 114.79 0 0 1 38 16.5 115.53 115.53 0 0 1-128.46 0 114.79 114.79 0 0 1 38-16.5l13.85 13.85v-1.2h17.86v3.1h5z" style="fill:', ';"/><polygon points="115.36 207.65 123.37 224.2 148.3 196.86 143.08 189.95" style="fill:', ';"/><polygon points="115.36 207.65 107.35 224.2 82.42 196.86 87.63 189.95" style="fill:', ';"/>'];
        maParts['09']['head'] = ['<path d="m115.5 51.75a63.75 63.75 0 0 0-10.5 126.63v14.09a115.5 115.5 0 0 0-53.729 19.027 115.5 115.5 0 0 0 128.46 0 115.5 115.5 0 0 0-53.729-19.029v-14.084a63.75 63.75 0 0 0 53.25-62.881 63.75 63.75 0 0 0-63.65-63.75 63.75 63.75 0 0 0-0.09961 0z" style="fill:', ';"/>'];
        maParts['09']['mouth'] = ['<path d="m126.28 149.82c-6.16 2.43-15.52 2.42-21.56 0" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:5.9998px;stroke:', ';"/>'];
        maParts['09']['eyes'] = ['<path d="m83.527 103.98v10h10v-10h-10zm53.945 0v10h10v-10h-10z" style="fill:', ';"/><path d="m56.621 94.906v11.688h5.3418v6.4922h5.3418v6.1055h5.3223v6.2324h26.846v-6.2324h5.3047v-6.1055h5.1445v-6.0039h11.154v6.0039h5.1446v6.1055h5.3066v6.2324h26.846v-6.2324h5.3203v-6.1055h5.3438v-6.4922h5.3418v-11.688z" style="fill:', ';"/><path d="m67.387 100.65v5.9394h5.1992v-5.9394zm5.1992 5.9394v6.4922h5.4238v-6.4922zm5.4238 0h5.1992v-5.9394h-5.1992zm5.1992 0v6.4922h5.4258v-6.4922zm5.4258 6.4922v6.1055h5.1426v-6.1055zm-10.625 0v6.1055h5.1445v-6.1055zm48.281-12.432v5.9394h5.1992v-5.9394zm5.1992 5.9394v6.4922h5.4238v-6.4922zm5.4238 0h5.1992v-5.9394h-5.1992zm5.1992 0v6.4922h5.4258v-6.4922zm5.4258 6.4922v6.1055h5.1426v-6.1055zm-10.625 0v6.1055h5.1445v-6.1055z" style="fill:', ';"/>'];
        maParts['09']['top'] = ['<path d="m157.79 67.5a61.31 61.31 0 0 1-42.79 17.43h-55.7c18.16-37.74 68.27-46.85 98.49-17.43z" style="fill:', ';"/><path d="m122.93 7.0078c-10.503-0.15729-21.09 1.6448-29.545 5.4316-17.141 7.8999-32.169 23.297-43.973 38.779-5.1703 6.8631-8.7779 13.46-8.1855 18.395 0.93114 12.312 10.372 26.483 11.068 36.9 15.663-72.081 105.99-70.452 124.91-7.0525l4e-3 0.0156c5.616-10.926 8.0682-20.188 8.352-27.653 0.43654-15.607-7.8088-21.149-21.735-28.249 1.7934-3.7704 1.7273-7.5023 2.0625-10.154-0.79964-7.8568-3.6796-13.51-10.43-17.758-5.9434-3.7404-13.06-6.0867-18.463-7.2266-4.5319-0.87895-9.2901-1.3562-14.064-1.4277z" style="fill:', ';"/><path d="m42.426 75.338c0.52158 18.689 10.557 74.338-18.115 101.25 12.38 10.603 28.352 19.061 46.025 24.594 11.032-4.6874 22.88-7.4147 34.817-8.5046l0.0633-14.477c-22.49-4.3813-40.766-18.898-48.862-39.967-8.096-21.07-4.7931-44.72 9.2478-62.393zm124.67 2.7207c7.8997 10.886 11.743 24.64 11.787 37.441-0.36632 30.178-22.389 57.576-53.12 62.708l0.0238 14.471c12.282 1.1216 24.518 3.9888 35.825 8.9128 15.488-5.1448 30.007-13.325 42.396-25.043-13.136-22.051-23.282-63.045-18.694-101.55z" style="fill:', ';"/><path d="m143.61 46.383c-11.639 0.12482-20.998 1.8906-20.998 1.8906l-9 3.5059c0.63003-0.0191 1.2603-0.0289 1.8906-0.0293h0.0996c35.169 0.055 60.959 27.235 63.283 63.383 7.4e-4 31.157-22.742 57.213-53.106 63.079l-0.0216 14.498c11.567 1.0563 23.154 3.6067 33.887 8.0463 35.952-15.315 55.082-52.303 36.709-68.279-5.018-7.9035-10.44-15.409-9.5544-23.03 5.0545-50.452 0.39626-63.561-43.189-63.064zm-69.966 21.09c-15.286 3.244-17.096 3.73-31.734 6.6953 3.0304 13.081 3.0583 22.274 1.2085 30.012-3.8004 11.361-8.9712 19.787-12.286 28.764-6.8823 22.459-2.9157 31.982 12.093 46.165 8.6595 8.0693 19.861 16.209 30.939 20.647 2.669-1.0316 5.3729-1.9628 8.106-2.792 7.4979-2.275 15.388-3.6535 23.206-4.3673l0.0433-14.393c-23.933-4.5937-44.283-21.98-50.77-45.817-6.3319-23.265 0.51104-48.752 19.195-64.914z" style="fill:', ';"/>'];

        // maParts['10']['env'] = ['<path d="M33.83,33.83a115.5,115.5,0,1,1,0,163.34,115.49,115.49,0,0,1,0-163.34Z" style="fill:', ';"/>'];
        maParts['10']['clo'] = ['<path d="m141.75 195a114.79 114.79 0 0 1 38 16.5 115.53 115.53 0 0 1-128.46 0 114.79 114.79 0 0 1 38-16.5l15.71 15.75h21z" style="fill:', ';"/><path d="m89.291 195a114.79 114.79 0 0 0-38.002 16.5 115.53 115.53 0 0 0 38.002 16.482zm52.434 0v32.982a115.53 115.53 0 0 0 38-16.482 114.79 114.79 0 0 0-38-16.5z" style="fill:', ';"/><path d="m157.15 199.75c0.2548 7.4501 1.54 14.855 4.9512 21.432a115.53 115.53 0 0 0 17.619-9.6797 114.79 114.79 0 0 0-22.57-11.752zm-83.295 2e-3a114.79 114.79 0 0 0-22.57 11.75 115.53 115.53 0 0 0 17.621 9.6797c3.411-6.5765 4.6944-13.98 4.9492-21.43z" style="fill:', ';"/><path d="m99.197 204.97v2e-3l16.302 16.301 16.301-16.301v-2e-3z" style="fill:', ';"/>'];
        maParts['10']['head'] = ['<path d="m115.5 51.75a63.75 63.75 0 0 0-10.5 126.63v14.09a115.5 115.5 0 0 0-53.729 19.027 115.5 115.5 0 0 0 128.46 0 115.5 115.5 0 0 0-53.729-19.029v-14.084a63.75 63.75 0 0 0 53.25-62.881 63.75 63.75 0 0 0-63.65-63.75 63.75 63.75 0 0 0-0.09961 0z" style="fill:', ';"/>'];
        maParts['10']['mouth'] = ['<path d="m100.19 152.09c2.8726 4.0616 9.8095 4.7232 15.119-0.45432 5.0656 4.5134 11.167 5.6898 15.495 0.31458" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:5.8949;stroke:', ';"/><path d="m109.67 135.53c-0.9758 0.0743-2.05 0.45327-3.1485 0.99414-4.3235 2.1399-7.3862 4.2557-10.639 7.1406-0.6251 0.5715 0.1168 0.77785 1.4238 0.87304 5.6967 0.0536 14.384 0.41404 15.098-0.875 1.9251-2.0788 1.7969-5.3303-0.1816-7.3008-0.701-0.67533-1.5769-0.90632-2.5527-0.83203zm11.656 0c-0.9758-0.0743-1.8517 0.1567-2.5527 0.83203-1.9785 1.9705-2.1067 5.222-0.1817 7.3008 0.7142 1.289 9.401 0.9286 15.098 0.875 1.307-0.0952 2.0489-0.30154 1.4238-0.87304-3.2524-2.8849-6.3151-5.0007-10.639-7.1406-1.0985-0.54087-2.1727-0.91985-3.1485-0.99414z" style="fill:', ';"/>'];
        maParts['10']['eyes'] = ['<path d="m97.56 107.84a10.63 10.63 0 0 1-15 0.13l-0.13-0.13" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:6.3px;stroke:', ';"/><path d="m148.59 107.84a10.63 10.63 0 0 1-15 0.13l-0.13-0.13" style="fill:none;stroke-linecap:round;stroke-linejoin:round;stroke-width:6.3px;stroke:', ';"/>'];
        maParts['10']['top'] = ['<path d="m41.668 87.073c-9.2319-0.0231-11.63 6.5104 2.2676 17.66-14.015 1.1231-4.3662 16.457 4.875 24.66 4.0686 3.0199 6.4647 5.4657 5.5078 1.1348-1.2079-4.9178-1.8184-9.9634-1.8184-15.027 3.26e-4 -7.5692 1.2547-15.016 3.7883-22.183 0.57048-1.7876 1.0689-2.0306-0.37721-2.6839-5.5405-2.4478-10.375-3.5511-14.243-3.5608z" style="fill:', ';"/><path d="m185.48 89.513c-2.4418-0.11189-5.4618 0.81187-9.5148 3.2121-1.314 0.81729-0.70075 1.995-0.32301 3.2653 3.194 10.982 3.8215 22.462 1.2538 33.628-0.31613 1.688-0.47649 3.569 2.6953 1.3516 7.7016-5.371 19.17-18.734 16.918-26.105-1.4251-3.9177-11.4-0.35546-11.4-0.35546s4.987-4.2755 5.3437-9.6191c0.20048-3.0057-1.5237-5.2189-4.9726-5.377z" style="fill:', ';"/><path d="m91.689 36.108c-3.7298-7.3864-9.5859-10.504-17.578-6.7891-9.5194 4.5907-15.629 18.444-13.416 29.232 0 0-8.5511-4.9878-18.17-3.5625-19.623 8.094-1.4102 29.869 10.817 37.342 2.075 1.297 2.5792 1.7432 3.4291-0.37685 2.6746-6.5374 6.1886-12.722 11.297-17.709 4.1039 8.7427 14.629 4.1809 20.006-0.14062 4.4873 9.6838 10.377 6.3535 15.377 3.4785 4.0764 7.8829 10.756 7.25 17.631 0.0625 4.875 4.5625 14.713 4.1867 15.555-3.426 8.4753 2.6244 14.012 10.437 22.962-1.4764 8.8552 6.8221 14.407 16.853 17.122 27.51 0.34 1.554 1.175 0.85565 2.2212 0.44315 10.255-4.286 22.842-15.749 15.705-23.975-3.5623-3.5623-13.539-2.1387-13.539-2.1387s6.77-7.1233 9.2637-18.168c2.4936-11.043-23.514-4.9883-23.514-4.9883s7.4818-5.6993 12.113-13.537c4.6314-7.8378-2.4943-11.756-11.045-11.043-8.5496 0.71204-17.1 7.4805-17.1 7.4805s3.3946-7.8055-3.5625-12.826c-9.5935-6.9234-23.869 6.4121-23.869 6.4121-4.2562-26.835-24.872-6.386-31.707 8.1953z" style="fill:', ';"/>'];

        // Gen(_address).addPartsData('09', 'env', maParts['09']['env']);
        Gen(_address).addPartsData('09', 'clo', maParts['09']['clo']);
        Gen(_address).addPartsData('09', 'head', maParts['09']['head']);
        Gen(_address).addPartsData('09', 'mouth', maParts['09']['mouth']);
        Gen(_address).addPartsData('09', 'eyes', maParts['09']['eyes']);
        Gen(_address).addPartsData('09', 'top', maParts['09']['top']);
        
        // Gen(_address).addPartsData('10', 'env', maParts['10']['env']);
        Gen(_address).addPartsData('10', 'clo', maParts['10']['clo']);
        Gen(_address).addPartsData('10', 'head', maParts['10']['head']);
        Gen(_address).addPartsData('10', 'mouth', maParts['10']['mouth']);
        Gen(_address).addPartsData('10', 'eyes', maParts['10']['eyes']);
        Gen(_address).addPartsData('10', 'top', maParts['10']['top']);

    }
}