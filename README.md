This app is simple math problems game i made for learning purpose.
Not much complex and no network or persistent storage etc used plain simple math problems.

This app is not very screen responsive by which i mean it wont look uniform on different devices
e.g pixel 4 emulator and iphone 14 pro max emulator, nexus 7 tablet emulator, ipad 12.9 inches

So i want this app to look consistent on any screen size, so use any means you deem necessary to make it responsive on all devices, just don't change any logic and work only on UI.

Try to make small commits meaning commit changes of one screen when its done and so on and try to add a little description.

After you are done with this small task we will have a short meeting on your approach and move further.

Hi Bro,

1- I have manage changes on LevelSelectionPage and found some problems about responsive on my phone as well and manage this 
page Portrait and Landscape mode as well by using OrientationBuilder which work based Phone, Tablet Orientation
change and also found some issue on Stack Widget and Positioned Widget Use which I manage you can check it.

2- About Game Selection Page images which your using in the Stack there sizes(dimensions) are very small use at least
250 x 250 size dimensions which work accurately on all screen Devices specially phone but for Tablet if we increase
size it will make picture good and not blur

2a) Fixed issue on Dialog as well Text about No. of Questions is not showing accurately because of Positioned 
Widget and I have manage it you can check code.

You can check my work on LevelSelection page to get more idea and same you can apply to other screens.

about responsive_helper class it usually used to check Layout of Device based on that can add font sizes etc
like if device is phone ? fontsize18 : fontSize24 I didn't use because it work based on Widget Recreate or call
first time but we can use it in Orientation Builder if we want 