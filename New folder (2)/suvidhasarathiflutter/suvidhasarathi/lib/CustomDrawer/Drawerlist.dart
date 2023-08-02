import 'package:flutter/material.dart';
import 'package:suvidha_sarathi/Navigationscreen/route_screen.dart';
import 'package:suvidha_sarathi/Unitls/geticon.dart';
import 'package:suvidha_sarathi/model/Drawermodel.dart';

List<Drawermodel> model = [
  Drawermodel(
    id: 0,
    name: 'Home',
    screenname: RouteScreen.Login,
    icon: getIcons.Home,
  ),
  Drawermodel(
    id: 1,
    name: 'Why Suvidha Sarthi ?',
    screenname: RouteScreen.Home,
    icon: getIcons.why_suvidha_sarthi,
  ),
  Drawermodel(
    id: 2,
    name: 'Events',
    screenname: RouteScreen.Home,
    icon: getIcons.event,
  ),
  Drawermodel(
    id: 3,
    name: 'My Contribution',
    screenname: RouteScreen.Home,
    icon: getIcons.my_contribution,
  ),
  Drawermodel(
    id: 4,
    name: 'Contribute Now',
    screenname: RouteScreen.Home,
    icon: getIcons.contributenow,
  ),
  Drawermodel(
    id: 5,
    name: 'About Us',
    screenname: RouteScreen.Home,
    icon: getIcons.about_us,
  ),
  Drawermodel(
    id: 6,
    name: 'Contact Us',
    screenname: RouteScreen.Home,
    icon: getIcons.contact_us,
  ),
  Drawermodel(
    id: 7,
    name: 'FAQ',
    screenname: RouteScreen.Home,
    icon: getIcons.faqs,
  ),
  Drawermodel(
    id: 8,
    name: 'Feedback',
    screenname: RouteScreen.Home,
    icon: getIcons.feedBack,
  ),
  Drawermodel(
    id: 9,
    name: 'Privacy Policy',
    screenname: RouteScreen.Home,
    icon: getIcons.privacy_policy,
  ),
  Drawermodel(
    id: 10,
    name: 'Notifications',
    screenname: RouteScreen.Home,
    icon: getIcons.notifications,
  ),
  Drawermodel(
    id: 11,
    name: 'Support',
    screenname: RouteScreen.Home,
    icon: getIcons.support,
  ),
  Drawermodel(
    id: 12,
    name: 'Logout',
    screenname: RouteScreen.Home,
    icon: getIcons.logout,
  ),
];
