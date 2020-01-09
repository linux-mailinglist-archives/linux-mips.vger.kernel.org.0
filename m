Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 10213135D33
	for <lists+linux-mips@lfdr.de>; Thu,  9 Jan 2020 16:49:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727701AbgAIPta (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Jan 2020 10:49:30 -0500
Received: from mail-eopbgr1310045.outbound.protection.outlook.com ([40.107.131.45]:62720
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732481AbgAIPta (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 9 Jan 2020 10:49:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QmZGMShaFDzjQ+yFwe6Y4YzohJH6QO9sPDZjsiV/6ita/yMhozWk2JYObJ34+cN4PZbWMoKsR9xKCdFb7yvMMknZGfQHWUA7NceB4NObfjiy1PW5e/Aht3GjmV2TSvhAkUvw3yLLL8+KJviIuMO6BvNHXLNZh2sOg9KK4u+nenqRI0wCpNxaK9lwOwi+bs7YNMLZ79qMxeP/RHSGm7evANeGPlq05zcLiFCVAU8WFSXdDIsEFsOnXqlBVaayZ7AALf9Jv6lP2L3gu/k6bprghegpwLHzLFSiIhIDTsJ3bv8pYHXs36vfe13TNc0jcF6EitMgAX/2x2+YnrOfAVxihw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzyTqtbOfq3Ig0yXTX1EWjydOU+uAenurCB81rAkFjg=;
 b=QJ52Eq/x+M2OQwLmU/sgx6/IBDXNdkYRmRupBx06tvb8CtT4AvGht+kl4CIwRUPZn98Ras0YMPqN6/LcQladEE1T0rcR1OxfcIhKUoXZzO3CSIHPSrlAAvPBfBm2akQ4wLPdSCmSs2SnKbLlbUEPHG4FWHXWmW6j48B/9fRIB/lEy5CRM1e9vTCI/EoMio8+e99Cle+w6ZRdCR/IrV8WPh179gcDgCofEqbkohJEyTSlkRXSqlCA833yPjp3BB8e59rm8c5X2JcxQAP0Gu/Gr9YVa2Y1UFAoEeZVtUjSRzdZPlQaaCu9+reSDPwcsdLC3Kb4lyNaum9VD6ipcg4trA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=teo-en-ming-corp.com; dmarc=pass action=none
 header.from=teo-en-ming-corp.com; dkim=pass header.d=teo-en-ming-corp.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=teoenmingcorp.onmicrosoft.com; s=selector2-teoenmingcorp-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZzyTqtbOfq3Ig0yXTX1EWjydOU+uAenurCB81rAkFjg=;
 b=Jp4ePqWJ4pnHEZBPzksQcdNVnng+CTywfNryZVh4oZzBHB/Pt4IB8e2W8QGegzk23FhcEENo/7VZ+FYM1LudwjopvOh8yhH9TYFryh5umQZqpfViTDezdGz+JqgXYgigOZEKVSlhR+zStCUxdYrCj0vCk6S1nQvV2X1vFmhMlSY=
Received: from KU1PR01MB2134.apcprd01.prod.exchangelabs.com (10.170.174.138)
 by KU1PR01MB2005.apcprd01.prod.exchangelabs.com (52.133.203.15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2602.15; Thu, 9 Jan
 2020 15:49:25 +0000
Received: from KU1PR01MB2134.apcprd01.prod.exchangelabs.com
 ([fe80::8122:ca17:cba6:19aa]) by KU1PR01MB2134.apcprd01.prod.exchangelabs.com
 ([fe80::8122:ca17:cba6:19aa%5]) with mapi id 15.20.2623.010; Thu, 9 Jan 2020
 15:49:25 +0000
From:   Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Turritopsis Dohrnii Teo En Ming <ceo@teo-en-ming-corp.com>
Subject: Singapore Citizen Mr. Teo En Ming's Refugee Seeking Attempts as at 9
 Jan 2020 Thursday
Thread-Topic: Singapore Citizen Mr. Teo En Ming's Refugee Seeking Attempts as
 at 9 Jan 2020 Thursday
Thread-Index: AdXHBFVPWJ4dc97HSIm4t0y4LfTbRg==
Date:   Thu, 9 Jan 2020 15:49:25 +0000
Message-ID: <KU1PR01MB2134C81B03A25383C17B566687390@KU1PR01MB2134.apcprd01.prod.exchangelabs.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=ceo@teo-en-ming-corp.com; 
x-originating-ip: [2401:7400:c802:de67:f1ab:6fde:d925:5c0c]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ed4d64d-5753-4ddf-de0a-08d7951b8114
x-ms-traffictypediagnostic: KU1PR01MB2005:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <KU1PR01MB2005C8649811877E76C1B27487390@KU1PR01MB2005.apcprd01.prod.exchangelabs.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 02778BF158
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(366004)(346002)(376002)(39830400003)(396003)(136003)(189003)(199004)(6506007)(316002)(7696005)(5660300002)(4326008)(33656002)(55016002)(81156014)(8676002)(81166006)(9686003)(86362001)(8936002)(66946007)(71200400001)(66476007)(64756008)(66446008)(52536014)(107886003)(66556008)(4000180100002)(6916009)(2906002)(508600001)(966005)(76116006)(186003);DIR:OUT;SFP:1101;SCL:1;SRVR:KU1PR01MB2005;H:KU1PR01MB2134.apcprd01.prod.exchangelabs.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: teo-en-ming-corp.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0aPg2wYc6XS4QuCcnzZvSNBxsIrbLEOso70SmZ5Bn8AVx+WGzE6KspsTJXFdb06c60IsNXOvp1yseEL2E2VbwBX9pt3sSAf9mHlLRQ2ZXsCiDC1EfP+LYFdKSkSDtBqJ6HmkEgQKq7VD1EHI18EzTogHx8UWHC3GD8KBwUZ8gagaw1+vBRzrDriNql5jrRA93N8KnxjAOt1B4IhJKY+80aJupHwecy7BVo62CM3P+NWkynax0pNQBkzcFneyjDrg6YYm+ltlvINL4jMGUcWFDyV9GwaWdbDJsKtL/cASIzk6d6vp3UG7FRe1UNC1MyPzFv5WE7JJW4AH7hxkRSXRWapZ7tQIErPfo6A6mvj2Kc/hDVozqOvt8Ps2vXgo92aQ6kqp7c1ghzLdTCfYdHGSaJQX+AZzL+3Gp0WBHsDuUiHiH0rvtH99pSh7gMai6ctkWvFPdLZoEq/zCv4vH6eAv60FT3/4H3LGqvusERs3oZLuH0Te/e3qihI7iLw5wNDGo7Jfi/5PUWqWVSNg7Yh22Q==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: teo-en-ming-corp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ed4d64d-5753-4ddf-de0a-08d7951b8114
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jan 2020 15:49:25.6269
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b3f6ae-c453-4b93-aec9-f17508e5885c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s6FxE2gZHt/Rijl8IFwmyyGDAUdgAdDsGDsmPCeDbfldV+oUPIWF1lDCCMGIOLooU9mtCSfmsbXQuE9Y/Ic0SKFs1lmJ0eFwXqc8ZBjjGvU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU1PR01MB2005
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SUBJECT: Singapore Citizen Mr. Teo En Ming's Refugee Seeking Attempts as at=
 9 Jan 2020 Thursday

In reverse chronological order:

[1] Application for Offshore Refugee/Humanitarian Visa to Australia, 25 Dec=
 2019 (Christmas) to 9 Jan 2020

Photo #1: Page 1 of Form 842 Application for an Offshore Humanitarian visa,=
 Refugee and Humanitarian (Class XB) visa

Photo #2: Front of DHL Express plastic envelope (yellow)

Photo #3: Back of DHL Express plastic envelope (white)

Photo #4: DHL Express Shipment Waybill

Photo #5: DHL Express Shipment Tracking Online Page, showing that my applic=
ation for offshore refugee visa to Australia=20
was picked up at 1619 hours on 25 Dec 2019 in Singapore and delivered to Ca=
nberra - Braddon - Australia
on 30 Dec 2019 at 11:10 AM Braddon, Australian Capital Territory (ACT) Time

Photo #6: DHL Express Electronic Proof of Delivery, showing that my applica=
tion for offshore refugee visa to Australia=20
was received and signed by staff Mohsin Mahmood at the Special Humanitarian=
 Processing Center,=20
3 Lonsdale Street, Braddon, Australian Capital Territory (ACT) 2612, Canber=
ra, Australia.

Photo #7: Page 5 of Form 842 Application for an Offshore Humanitarian visa,=
 Refugee and Humanitarian (Class XB) visa, bearing the=20
official stamp of the Australian Government Department of Home Affairs at N=
ew South Wales (NSW):=20
"COURIER RECEIVED; HOME AFFAIRS; NSW; 27 DEC 2019" and=20
"HOME AFFAIRS; NSW; 27 DEC 2019" at the bottom.

References:

For the above-mentioned seven photos, please refer to my RAID 1 mirroring r=
edundant Blogger and Wordpress blogs at

https://tdtemcerts.blogspot.sg/

https://tdtemcerts.wordpress.com/



[2] Petition to the Government of Taiwan for Refugee Status, 5th
August 2019 Monday

Photo #1: At the building of the National Immigration Agency, Ministry
of the Interior, Taipei, Taiwan, 5th August 2019

Photo #2: Queue ticket no. 515 at the National Immigration Agency,
Ministry of the Interior, Taipei, Taiwan, 5th August 2019

Photo #3: Submission of documents/petition to the National Immigration
Agency, Ministry of the Interior, Taipei, Taiwan, 5th August 2019

Photos #4 and #5: Acknowledgement of Receipt (no. 03142) for the
submission of documents/petition from the National Immigration Agency,
Ministry of the Interior, Taipei, Taiwan, 5th August 2019, 10:00 AM

References:

(a) Petition to the Government of Taiwan for Refugee Status, 5th
August 2019 Monday (Blogger blog)

Link: https://tdtemcerts.blogspot.sg/2019/08/petition-to-government-of-taiw=
an-for.html

(b) Petition to the Government of Taiwan for Refugee Status, 5th
August 2019 Monday (Wordpress blog)

Link: https://tdtemcerts.wordpress.com/2019/08/23/petition-to-the-governmen=
t-of-taiwan-for-refugee-status/



[3] Application for Refugee Status at the United Nations High Commissioner =
for Refugees (UNHCR),=20
Bangkok, Thailand, 21st March 2017 Tuesday

References:

(a) [YOUTUBE] Vlog: The Road to Application for Refugee Status at the
United Nations High Commissioner for Refugees (UNHCR), Bangkok

Link: https://www.youtube.com/watch?v=3DutpuAa1eUNI

YouTube video Published on March 22nd, 2017

Views as at 9 Jan 2020: 659

YouTube Channel: Turritopsis Dohrnii Teo En Ming
Subscribers as at 9 Jan 2020: 3.14K
Link: https://www.youtube.com/channel/UC__F2hzlqNEEGx-IXxQi3hA






-----BEGIN EMAIL SIGNATURE-----

The Gospel for all Targeted Individuals (TIs):

[The New York Times] Microwave Weapons Are Prime Suspect in Ills of
U.S. Embassy Workers

Link:=A0https://www.nytimes.com/2018/09/01/science/sonic-attack-cuba-microw=
ave.html

***************************************************************************=
*****************

Singaporean Mr. Turritopsis Dohrnii Teo En Ming's Academic
Qualifications as at 14 Feb 2019 and refugee seeking attempts at the
United Nations Refugee Agency Bangkok (21 Mar 2017) and in Taiwan (5
Aug 2019):

[1]=A0https://tdtemcerts.wordpress.com/

[2]=A0https://tdtemcerts.blogspot.sg/

[3]=A0https://www.scribd.com/user/270125049/Teo-En-Ming

-----END EMAIL SIGNATURE-----

