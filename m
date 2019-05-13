Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F8E41BD8C
	for <lists+linux-mips@lfdr.de>; Mon, 13 May 2019 21:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728897AbfEMTDc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 May 2019 15:03:32 -0400
Received: from mail-eopbgr750135.outbound.protection.outlook.com ([40.107.75.135]:43598
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727849AbfEMTDc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 13 May 2019 15:03:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sBKgj/3D1Uohb5yQEfxt6psurJi+5vkvpKT5R5KjkR4=;
 b=fTJfkH9sGwuMIpyYYoWDivLv0Cyfcxmy7ViwAuscEMcAm8jlQuvd4fnMriRdRPXGk1PkZHsQsWUszDjoYY+l5OoHwfdX8TGguapU3HjnVTkNJJN6IYNF1NYAWz9TsUQPY/yFf30DcKaR3vqiiDOlAUFsW4vsQZsryAdZ8aErMJ0=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.174.162.17) by
 MWHPR2201MB1280.namprd22.prod.outlook.com (10.174.162.20) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.24; Mon, 13 May 2019 19:03:29 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::90ff:8d19:8459:834b]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::90ff:8d19:8459:834b%7]) with mapi id 15.20.1878.024; Mon, 13 May 2019
 19:03:29 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Marcin Nowakowski <marcin.nowakowski@fungible.com>
CC:     Paul Burton <pburton@wavecomp.com>,
        "marcin.nowakowski@fungible.com" <marcin.nowakowski@fungible.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] [MIPS] generic: fix appended dtb support
Thread-Topic: [PATCH] [MIPS] generic: fix appended dtb support
Thread-Index: AQHVCYf8QViK0alTN0KMmqkWg43Ek6ZpageA
Date:   Mon, 13 May 2019 19:03:29 +0000
Message-ID: <MWHPR2201MB12772BB19CF18D67E63F5B93C10F0@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190513123243.9515-1-marcin.nowakowski@fungible.com>
In-Reply-To: <20190513123243.9515-1-marcin.nowakowski@fungible.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR02CA0063.namprd02.prod.outlook.com
 (2603:10b6:a03:54::40) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:24::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 851d961f-8954-416c-901e-08d6d7d5af35
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:MWHPR2201MB1280;
x-ms-traffictypediagnostic: MWHPR2201MB1280:
x-microsoft-antispam-prvs: <MWHPR2201MB1280A31FF283F74BC1703380C10F0@MWHPR2201MB1280.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0036736630
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(376002)(346002)(39840400004)(366004)(136003)(189003)(199004)(5660300002)(54906003)(55016002)(8676002)(76176011)(99286004)(7696005)(2906002)(3846002)(7736002)(81166006)(6116002)(305945005)(316002)(73956011)(14454004)(33656002)(52536014)(4744005)(25786009)(66476007)(66446008)(66556008)(64756008)(66946007)(52116002)(478600001)(42882007)(102836004)(71200400001)(486006)(4326008)(44832011)(6436002)(476003)(71190400001)(9686003)(229853002)(446003)(386003)(11346002)(6506007)(81156014)(66066001)(8936002)(26005)(186003)(6916009)(6246003)(74316002)(256004)(53936002)(68736007)(41533002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1280;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ojKmHZN1lpBUQfHVxRu2XN69Yi0S+Qeq8AhRUdIN9UxyPWfVarcZMLiciz1eeUOPqkYwTL5f/cVlGGiI6dWwAVWf98qA1oJLowTxnFuTE9tOEZiUSedGG8STrRNQ62jtO001CCcbMFnw9DbymrfIUnl5Yxt6BqNjo6RU7TbwqGSa9I8AOf1+T4n8wxSxON1ruBhoE4iYoTmtnkgMwq4L3gZO6cn41kjxAyBgzOaTMz8N5mG5q49KVj6Oyu6k8DNoeUXWxj7RvOscuur4V+lc6QlfLEbOe/J3OX1g4o2MV2zQuszr1KSrelQ6AM7KzwZvWyDWml89iJrswf10mrFXcpqQRT+YyHemCA0YNirY9y0tFVS7Pug0W579Q3LAKZI/2wfrK/APiFvSqH7aVZRaHuRUCF+/FWBVCY/Be5ClL3A=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 851d961f-8954-416c-901e-08d6d7d5af35
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 May 2019 19:03:29.2677
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1280
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGVsbG8sDQoNCk1hcmNpbiBOb3dha293c2tpIHdyb3RlOg0KPiBBcHBlbmRlZCBEVEIgc3VwcG9y
dCBpcyBtb3N0bHkgaW50ZW5kZWQgdG8gYmUgdXNlZCBvbiBsZWdhY3kgc3lzdGVtcywNCj4gYnV0
IGl0IGlzIGEgdmFsaWQgZmVhdHVyZSB0aGF0IGNhbiBiZSBlbmFibGVkIGZvciBnZW5lcmljIHBs
YXRmb3JtLA0KPiB3aGljaCBjdXJyZW50bHkgZG9lc24ndCBzdXBwb3J0IGl0IC0gaWYgc2VsZWN0
ZWQsIHRoZSBhcHBlbmRlZCBEVEIgd2lsbA0KPiBiZSBpZ25vcmVkIGJ5IHRoZSBwbGF0Zm9ybSBz
dGFydHVwIGNvZGUuDQo+IA0KPiBEdXJpbmcga2VybmVsIHN0YXJ0dXAsIHRoZSBhcHBlbmRlZCBE
VEIncyBsb2NhdGlvbiBpcyBzdG9yZWQgaW4NCj4gZndfcGFzc2VkX2R0YiBpZiB0aGUgaW5pdCBj
b2RlIGZpbmRzIHdoYXQgYXBwZWFycyB0byBiZSBhIHZhbGlkIERUQi4NCj4gT3RoZXJ3aXNlIChp
ZiBhMCA9PSAtMiksIGExIGlzIHN0b3JlZCBpbiBmd19wYXNzZWRfZHRiLCBzbyBlaXRoZXIgd2F5
IGl0DQo+IHdpbGwgYWx3YXlzIHBvaW50IHRvIGVpdGhlciBhIHVzZXItcGFzZWQgRFRCIG9yIGJ1
aWx0LWluIERUQi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hcmNpbiBOb3dha293c2tpIDxtYXJj
aW4ubm93YWtvd3NraUBmdW5naWJsZS5jb20+DQoNCkFwcGxpZWQgdG8gbWlwcy1uZXh0Lg0KDQpU
aGFua3MsDQogICAgUGF1bA0KDQpbIFRoaXMgbWVzc2FnZSB3YXMgYXV0by1nZW5lcmF0ZWQ7IGlm
IHlvdSBiZWxpZXZlIGFueXRoaW5nIGlzIGluY29ycmVjdA0KICB0aGVuIHBsZWFzZSBlbWFpbCBw
YXVsLmJ1cnRvbkBtaXBzLmNvbSB0byByZXBvcnQgaXQuIF0NCg==
