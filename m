Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F19415435
	for <lists+linux-mips@lfdr.de>; Mon,  6 May 2019 21:12:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726802AbfEFTMH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 May 2019 15:12:07 -0400
Received: from mail-eopbgr820123.outbound.protection.outlook.com ([40.107.82.123]:6422
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726771AbfEFTMF (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 6 May 2019 15:12:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7nBO7rTtbaQuglxR+X9jbbvya5IFhavDrUWJkRRl688=;
 b=klipIAfe/OBfP4VKMNL/PPuINcqqr8v6HJLZJkAZAHTTSok8HyxVxDlLBgG4HxM6Jf6Vp+yNMkQe8//sl+CQLzcyI6ibtTB+0SWrHDaQMsgoIEazIFuhj1dfXwqiS2FCKk1hwd4Lb4ZEO0POilcJujK9AvPL8GI0+USgeUQ5NJk=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.174.162.17) by
 MWHPR2201MB1215.namprd22.prod.outlook.com (10.174.161.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.12; Mon, 6 May 2019 19:12:01 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::90ff:8d19:8459:834b]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::90ff:8d19:8459:834b%7]) with mapi id 15.20.1856.012; Mon, 6 May 2019
 19:12:01 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Serge Semin <fancer.lancer@gmail.com>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michal Hocko <mhocko@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>,
        Huacai Chen <chenhc@lemote.com>,
        Stefan Agner <stefan@agner.ch>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Juergen Gross <jgross@suse.com>,
        Serge Semin <Sergey.Semin@t-platforms.ru>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v2 4/5] mips: Make sure dt memory regions are valid
Thread-Topic: [PATCH v2 4/5] mips: Make sure dt memory regions are valid
Thread-Index: AQHVAdjfuMzs6t2E4UWTcJCe4/VKhaZee3aA
Date:   Mon, 6 May 2019 19:12:01 +0000
Message-ID: <MWHPR2201MB1277083FDFA3D964B24F33B7C1300@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190503175041.7949-5-fancer.lancer@gmail.com>
In-Reply-To: <20190503175041.7949-5-fancer.lancer@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR07CA0050.namprd07.prod.outlook.com
 (2603:10b6:a03:60::27) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:24::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 54e1973a-8775-4f22-07c4-08d6d256b752
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:MWHPR2201MB1215;
x-ms-traffictypediagnostic: MWHPR2201MB1215:
x-microsoft-antispam-prvs: <MWHPR2201MB1215102D795A2A663A423540C1300@MWHPR2201MB1215.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0029F17A3F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(39840400004)(136003)(366004)(376002)(346002)(396003)(189003)(199004)(2906002)(53936002)(74316002)(7736002)(305945005)(8936002)(4326008)(81166006)(7416002)(25786009)(8676002)(6246003)(81156014)(71200400001)(229853002)(4744005)(71190400001)(5660300002)(6436002)(9686003)(33656002)(55016002)(11346002)(386003)(6506007)(186003)(14444005)(52536014)(256004)(102836004)(66066001)(68736007)(42882007)(52116002)(54906003)(7696005)(99286004)(26005)(316002)(66946007)(73956011)(66476007)(64756008)(66446008)(66556008)(44832011)(478600001)(6116002)(3846002)(76176011)(476003)(14454004)(6916009)(486006)(446003)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1215;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: jscjNTx5wuXIS7SRE+lJrZKmMbysCWHw475i7r/TcXPPzE3OzUb+gh7Mc1w97+eK1c4h4739rTe2O2HzNhNS2mNEb7lmKOMhUYk4SQGtmNFnMXdHkgwZHW6oujuSqII8B+rc4O0qY2wSdAbksG0tIxmkYCr2onxW1TLAVOBbyE9WodwiPNpf/63VyvuQDmnqEzWQYDTtOmlQ9XwwwwHPVt4l5QOZS+b02PLuzzUYRmezwn6ulLM/mpuPyfIOvuQ7S8tcWOKPGckpVBOLWqmZjnRnKwbC1hp7JiVH4zdKtfauwJi1GMz1K5ZEV0hMz5yEnZvgNzCAZobFC96sKJ8wJuRhyIqKm7/M1Xy6S7sHGgg8G+q3y9IUnDjESJJrd3sU3/sNvqZ9E6LEUteXj9T30KoOFHfcIEsFGHWwQhuO5rg=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54e1973a-8775-4f22-07c4-08d6d256b752
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2019 19:12:01.6721
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1215
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGVsbG8sDQoNClNlcmdlIFNlbWluIHdyb3RlOg0KPiBUaGVyZSBhcmUgc2l0dWF0aW9ucyB3aGVu
IG1lbW9yeSByZWdpb25zIGNvbWluZyBmcm9tIGR0cyBtYXkgYmUNCj4gdG9vIGJpZyBmb3IgdGhl
IHBsYXRmb3JtIHBoeXNpY2FsIGFkZHJlc3Mgc3BhY2UuIFRoaXMgZXNwZWNpYWxseQ0KPiBjb25j
ZXJucyBYUEEtY2FwYWJsZSBzeXN0ZW1zLiBCb290bG9hZGVyIG1heSBkZXRlcm1pbmUgbW9yZSB0
aGFuIDRHQg0KPiBtZW1vcnkgYXZhaWxhYmxlIGFuZCBwYXNzIGl0IHRvIHRoZSBrZXJuZWwgb3Zl
ciBkdHMgbWVtb3J5IG5vZGUsIHdoaWxlDQo+IGtlcm5lbCBpcyBidWlsdCB3aXRob3V0IFhQQS82
NEJJVCBzdXBwb3J0LiBJbiB0aGlzIGNhc2UgdGhlIHJlZ2lvbg0KPiBtYXkgZWl0aGVyIHNpbXBs
eSBiZSB0cnVuY2F0ZWQgYnkgYWRkX21lbW9yeV9yZWdpb24oKSBtZXRob2QNCj4gb3IgYnkgdTY0
LT5waHlzX2FkZHJfdCB0eXBlIGNhc3RpbmcuIEJ1dCBpbiB3b3JzdCBjYXNlIHRoZSBtZXRob2QN
Cj4gY2FuIGV2ZW4gZHJvcCB0aGUgbWVtb3J5IHJlZ2lvbiBpZiBpdCBleGNlZWRzIFBIWVNfQURE
Ul9NQVggc2l6ZS4NCj4gU28gbGV0cyBtYWtlIHN1cmUgdGhlIHJldHJpZXZlZCBmcm9tIGR0cyBt
ZW1vcnkgcmVnaW9ucyBhcmUgdmFsaWQsDQo+IGFuZCBpZiBzb21lIG9mIHRoZW0gYXJlbid0LCBq
dXN0IG1hbnVhbGx5IHRydW5jYXRlIHRoZW0gd2l0aCBhIHdhcm5pbmcNCj4gcHJpbnRlZCBvdXQu
DQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTZXJnZSBTZW1pbiA8ZmFuY2VyLmxhbmNlckBnbWFpbC5j
b20+DQoNCkFwcGxpZWQgdG8gbWlwcy1uZXh0Lg0KDQpUaGFua3MsDQogICAgUGF1bA0KDQpbIFRo
aXMgbWVzc2FnZSB3YXMgYXV0by1nZW5lcmF0ZWQ7IGlmIHlvdSBiZWxpZXZlIGFueXRoaW5nIGlz
IGluY29ycmVjdA0KICB0aGVuIHBsZWFzZSBlbWFpbCBwYXVsLmJ1cnRvbkBtaXBzLmNvbSB0byBy
ZXBvcnQgaXQuIF0NCg==
