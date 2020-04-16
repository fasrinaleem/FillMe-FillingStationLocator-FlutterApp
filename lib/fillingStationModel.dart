import 'package:google_maps_flutter/google_maps_flutter.dart';

class FillingStation {
  String stationName;
  String address;
  String description;
  String image;
  LatLng locationCodes;

  FillingStation(
      {this.stationName,
      this.address,
      this.description,
      this.image,
      this.locationCodes});
}

final List<FillingStation> fillingStations = [
  FillingStation(
      stationName: 'Ceypetco Filling Station',
      address: 'WW4M+WP Koswatta',
      description: 'Gas station',
      image:
          'https://lh5.googleusercontent.com/p/AF1QipPdPWEt26_1-1QqnzF-HLbzWIsSatEPyO28DUpg=w408-h306-k-no',
      locationCodes: LatLng(6.907520, 79.934333)),
  FillingStation(
      stationName: 'Laugfs Petroleum Mabima',
      address: 'WXV6+3H Heiyanthuduwa',
      description: 'Fuel supplier',
      image:
          'https://lh5.googleusercontent.com/p/AF1QipMZdPB8beRxm8zPdnZa6IBc4lrZ0Tx99rgFAoDe=w426-h240-k-no',
      locationCodes: LatLng(6.945538, 79.961803)),
  FillingStation(
      stationName: 'Shakthi Filling Station',
      address: 'WXGJ+J3 Kaduwela',
      description: 'Fuel supplier',
      image:
          'https://lh5.googleusercontent.com/p/AF1QipNVox-L0RHuFdzZjdH6X1yoQ00Vf70GhOS7Xq3s=w426-h240-k-no',
      locationCodes: LatLng(6.927123, 79.980328)),
  FillingStation(
      stationName: 'Ceypetco Fuel Station Malabe',
      address: 'WX32+WP Malabe',
      description: 'Fuel supplier',
      image:
          'https://lh5.googleusercontent.com/p/AF1QipP2vJLHPLXbwDe9FLVx3IscJnKYzEb9-0qg1fuL=w493-h240-k-no',
      locationCodes: LatLng(6.937780, 79.948108)),
  FillingStation(
      stationName: 'Laugfs Petroleum Koswatta',
      address: 'No. 260 H, B240, Battaramulla',
      description: 'Gas station',
      image:
          'https://lh5.googleusercontent.com/p/AF1QipOsDC8yjp_Lbrl8rxoH4k2L9tlDa6crkYOkkQ1G=w408-h306-k-no',
      locationCodes: LatLng(6.906790, 79.929307)),
  FillingStation(
      stationName: 'Lanka Filling Station',
      address: 'AB10, Kaduwela',
      description: 'Gas station',
      image:
          'https://lh5.googleusercontent.com/p/AF1QipNPCD89hVCiJY_1q1C6ArComeos-dTla-l-SO_l=w426-h240-k-no',
      locationCodes: LatLng(6.939502, 79.980591)),
  FillingStation(
      stationName: 'Ceypetco Filling Station',
      address: 'WWQX+46 Welivita',
      description: 'Gas station',
      image:
          'https://lh5.googleusercontent.com/p/AF1QipOfeNy2aFUCGidd5Us-wpngh89uvKD-LqTM3tsx=w408-h272-k-no',
      locationCodes: LatLng(6.941078, 79.948545)),
  FillingStation(
      stationName: 'CEYPETCO Filling Station',
      address: 'VXJH+XW Boralugoda',
      description: 'Gas station',
      image:
          'https://geo2.ggpht.com/cbk?panoid=XIDb-hm0dZnh5XKZbucPqw&output=thumbnail&cb_client=search.gws-prod.gps&thumb=2&w=408&h=240&yaw=238.86092&pitch=0&thumbfov=100',
      locationCodes: LatLng(6.887634, 79.978989)),
  FillingStation(
      stationName: 'Lanka IOC Filling Station',
      address: 'VXJ6+56 Hokandara',
      description: 'Gas station',
      image:
          'https://lh5.googleusercontent.com/p/AF1QipM4jkHPq4U_viM_Rnzwhar3pVIT1pCPvOUNMzD2=w485-h240-k-no',
      locationCodes: LatLng(6.880734, 79.960526)),
  FillingStation(
      stationName: 'Ceypetco Filling Station',
      address: 'WW28+WX Battaramulla',
      description: 'Gas station',
      image:
          'https://lh5.googleusercontent.com/p/AF1QipMOOvGFOpK1tSje9ztdUFm-5x_MZNJ_FVM-syGz=w408-h240-k-no-pi-0-ya40-ro-0-fo100',
      locationCodes: LatLng(6.902589, 79.917381)),
];
