import 'package:flutter/material.dart';

class privacypolicy extends StatefulWidget {
  const privacypolicy({super.key});

  @override
  State<privacypolicy> createState() => _privacypolicyState();
}

class _privacypolicyState extends State<privacypolicy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0), // Add some padding around the content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
              ),
            ),
            SizedBox(height: 20), // Add some space between title and content
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  'Last Updated: 2024-07-29\n\n'
                      'Mos Bilh built the "Fasa Todo" app as a Commercial app. This SERVICE is provided by Mos Bilh and is intended for use as is. '
                      'This page is used to inform visitors regarding our policies with the collection, use, and disclosure of Personal Information if anyone decided to use our Service.\n\n'
                      'If you choose to use our Service, then you agree to the collection and use of information in relation to this policy. The Personal Information that we collect is used for providing and improving the Service. We will not use or share your information with anyone except as described in this Privacy Policy.\n\n'
                      'The terms used in this Privacy Policy have the same meanings as in our Terms and Conditions, which is accessible at Copy Cat unless otherwise defined in this Privacy Policy.\n\n'
                      'Information Collection and Use :\n'
                      'We are committed to ensuring your privacy while using our Service. We do not collect any personal data from users of our app.\n\n'
                      'No Data Collection :\n'
                      'Our app does not collect, store, or share any information about you or your device. This includes, but is not limited to, Device IDs, personal information, or usage data.\n\n'
                      'No Third-Party Services :\n'
                      'Our app does not use any third-party services that collect or process user data.\n\n'
                      'Log Data :\n'
                      'We want to inform you that whenever you use our Service, in a case of an error in the app we collect data and information (through third-party products) on your phone called Log Data. This Log Data may include information such as your device Internet Protocol (“IP”) address, device name, operating system version, the configuration of the app when utilizing our Service, the time and date of your use of the Service, and other statistics.\n\n'
                      'Cookies:\n'
                      'Cookies are files with a small amount of data that are commonly used as anonymous unique identifiers. These are sent to your browser from the websites that you visit and are stored on your devices internal memory. This Service does not use these cookies explicitly. However, the app may use third-party code and libraries that use “cookies” to collect information and improve their services. You have the option to either accept or refuse these cookies and know when a cookie is being sent to your device. If you choose to refuse our cookies, you may not be able to use some portions of this Service.\n\n'
                      'Service Providers :\n'
                      'We may employ third-party companies and individuals due to the following reasons: To facilitate our Service; To provide the Service on our behalf; To perform Service-related services; or To assist us in analyzing how our Service is used.\n\n'
                      'We want to inform users of this Service that these third parties have access to your Personal Information. The reason is to perform the tasks assigned to them on our behalf. However, they are obligated not to disclose or use the information for any other purpose.\n\n'
                      'Security :\n'
                      'We value your trust in providing us your Personal Information, thus we are striving to use commercially acceptable means of protecting it. But remember that no method of transmission over the internet, or method of electronic storage is 100% secure and reliable, and we cannot guarantee its absolute security.\n\n'
                      'Links to Other Sites :\n'
                      'This Service may contain links to other sites. If you click on a third-party link, you will be directed to that site. Note that these external sites are not operated by us. Therefore, we strongly advise you to review the Privacy Policy of these websites. We have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.\n\n'
                      'Children’s Privacy :\n'
                      'These Services do not address anyone under the age of 18. We do not knowingly collect personally identifiable information from children under 18. In the case we discover that a child under 18 has provided us with personal information, we immediately delete this from our servers. If you are a parent or guardian and you are aware that your child has provided us with personal information, please contact us so that we will be able to do necessary actions.\n\n'
                      'Changes to This Privacy Policy :\n'
                      'We may update our Privacy Policy from time to time. Thus, you are advised to review this page periodically for any changes. We will notify you of any changes by posting the new Privacy Policy on this page.\n'
                      'This policy is effective as of 2024-09-02\n\n'
                      'Data Deletion Right :\n'
                      'You have the right to access, rectify, object to, or erase the data maintained by us. You may request a change/delete to your personal data by contacting us by referring the issue via email.\n'
                      'Email: nainulaman867@gmail.com\n'
                      'If you believe our processing of your personal data infringes data protection laws, you have a legal right to initiate a complaint with a supervisory authority. Do not hesitate to contact us if you find any issue.\n\n'
                      'Contact Us :\n'
                      'If you have any questions or suggestions about our Privacy Policy, do not hesitate to contact us at "nainulaman867@gmail.com".\n',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
