Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 930052E63E
	for <lists+linux-mips@lfdr.de>; Wed, 29 May 2019 22:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726454AbfE2Ufl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 May 2019 16:35:41 -0400
Received: from mail-eopbgr790110.outbound.protection.outlook.com ([40.107.79.110]:21178
        "EHLO NAM03-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726362AbfE2Ufl (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 May 2019 16:35:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uH+WMU7daOngIMZ4nvkcc4G3f9aYFouZEL4PdXtGbx4=;
 b=NSgXvhVu6Vcl++wjb5qUUASfq/h774BMv7AbX7/WH3pjzIIoO+7TQHI2t6N19Seokrl/sLq2G9Lj2iH7ehc+R5MyU1bIvOQbwzA2j0E+kCysk6ZRfCzo36ErTQJOS3LKBXOku9laHCtqWlxo4aBp0Pcw+3Urll1+tvWRbLe/KLk=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.174.162.17) by
 MWHPR2201MB1071.namprd22.prod.outlook.com (10.174.169.145) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.15; Wed, 29 May 2019 20:35:38 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::90ff:8d19:8459:834b]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::90ff:8d19:8459:834b%7]) with mapi id 15.20.1922.021; Wed, 29 May 2019
 20:35:38 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     YueHaibing <yuehaibing@huawei.com>
CC:     "ralf@linux-mips.org" <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        "jhogan@kernel.org" <jhogan@kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH -next] MIPS: uprobes: remove set but not used variable
 'epc'
Thread-Topic: [PATCH -next] MIPS: uprobes: remove set but not used variable
 'epc'
Thread-Index: AQHVEvS1dT+b64Tw0029Z/MKHa+DFKaCljUA
Date:   Wed, 29 May 2019 20:35:34 +0000
Message-ID: <MWHPR2201MB127743ADD206B4064E9E5AAAC11F0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190525122024.4908-1-yuehaibing@huawei.com>
In-Reply-To: <20190525122024.4908-1-yuehaibing@huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR08CA0014.namprd08.prod.outlook.com
 (2603:10b6:a03:100::27) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:24::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d9b9175e-116a-4013-2787-08d6e4753321
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1071;
x-ms-traffictypediagnostic: MWHPR2201MB1071:
x-microsoft-antispam-prvs: <MWHPR2201MB1071EA23903C0B6A6622C896C11F0@MWHPR2201MB1071.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 0052308DC6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(366004)(396003)(376002)(39850400004)(136003)(199004)(189003)(54906003)(26005)(74316002)(6116002)(2906002)(66066001)(71200400001)(7736002)(52536014)(102836004)(6916009)(5660300002)(25786009)(4744005)(486006)(66476007)(66556008)(64756008)(66446008)(71190400001)(3846002)(476003)(11346002)(73956011)(305945005)(44832011)(186003)(66946007)(446003)(42882007)(81156014)(7696005)(14444005)(76176011)(52116002)(478600001)(14454004)(53936002)(4326008)(256004)(6246003)(316002)(33656002)(8936002)(229853002)(9686003)(8676002)(6436002)(6666004)(68736007)(6506007)(99286004)(55016002)(81166006)(386003);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1071;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4LQ88epWezc/jI+tQHWunto5JQsJjMtv1e8X7hbIo1PbHx24syRMocm7PoVKDQA97CzcsyuUUcW9pS/QziAUAYQzCCqTVWAl4jB6ZtQhKoZX/8dINXsDCBK+/xiEpLy9bcjJd+vX5oW6eqedLs0puW3+wmYVfQyXBf46cBc2+RBCjzn4InUAPbDWyjmtd6YbUkJ6IchhlJKYcgzii5h8kWgO/1qYkh3YHYSETLOVbv1F9ec+qf2KesXo8jNHHgDpDYWgzOwu2iE/6Z5xnKyyC/BpDcEhy9c1AcIFluOUrNPvHRsbWZI3IbSIcO95LTiRiuja8boXVuTZDRxUSe2peXYQlGHJkVFhthziMTWze+4ST5oxzYburd2PWQ+EAex6uZ3sbmxr6j1uy76F7c9/GlJrkswb6uVeOaGPMp+EpkM=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9b9175e-116a-4013-2787-08d6e4753321
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2019 20:35:34.2403
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1071
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGVsbG8sDQoNCll1ZUhhaWJpbmcgd3JvdGU6DQo+IEZpeGVzIGdjYyAnLVd1bnVzZWQtYnV0LXNl
dC12YXJpYWJsZScgd2FybmluZzoNCj4gDQo+IGFyY2gvbWlwcy9rZXJuZWwvdXByb2Jlcy5jOiBJ
biBmdW5jdGlvbiAnYXJjaF91cHJvYmVfcHJlX3hvbCc6DQo+IGFyY2gvbWlwcy9rZXJuZWwvdXBy
b2Jlcy5jOjExNToxNzogd2FybmluZzogdmFyaWFibGUgJ2VwYycgc2V0IGJ1dCBub3QgdXNlZCBb
LVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0NCj4gDQo+IEl0J3MgbmV2ZXIgdXNlZCBzaW5jZSBp
bnRyb2R1Y3Rpb24gaW4NCj4gY29tbWl0IDQwZTA4NGE1MDZlYiAoIk1JUFM6IEFkZCB1cHJvYmVz
IHN1cHBvcnQuIikNCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdA
aHVhd2VpLmNvbT4NCg0KQXBwbGllZCB0byBtaXBzLWZpeGVzLg0KDQpUaGFua3MsDQogICAgUGF1
bA0KDQpbIFRoaXMgbWVzc2FnZSB3YXMgYXV0by1nZW5lcmF0ZWQ7IGlmIHlvdSBiZWxpZXZlIGFu
eXRoaW5nIGlzIGluY29ycmVjdA0KICB0aGVuIHBsZWFzZSBlbWFpbCBwYXVsLmJ1cnRvbkBtaXBz
LmNvbSB0byByZXBvcnQgaXQuIF0NCg==
