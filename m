Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E4D45195D9
	for <lists+linux-mips@lfdr.de>; Fri, 10 May 2019 01:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726711AbfEIXxB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 May 2019 19:53:01 -0400
Received: from mail-eopbgr780139.outbound.protection.outlook.com ([40.107.78.139]:29123
        "EHLO NAM03-BY2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726838AbfEIXw5 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 9 May 2019 19:52:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxGZ4RV87mXbInmDStlHmVXyjk3HnDBo00Cb/VF3gYw=;
 b=nQ6moesoZ7r7Su3eIuHb7b2meKLRYrOS2ParVmyCGg49Z1IwUEypQM0BMA+85rzNB3uYQvSST4x0Yqd/ueIPfrQ6VJYpTMWjt79bBhhgKjJxOU9DEU2rDQX+vCX1RaDljy5AV357VVHmYPyi0TGSP2cdeTsKgMCmqd97GllY2Ao=
Received: from CY4PR2201MB1272.namprd22.prod.outlook.com (10.171.214.23) by
 CY4PR2201MB1207.namprd22.prod.outlook.com (10.171.210.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1878.22; Thu, 9 May 2019 23:52:55 +0000
Received: from CY4PR2201MB1272.namprd22.prod.outlook.com
 ([fe80::954e:662f:d233:dc53]) by CY4PR2201MB1272.namprd22.prod.outlook.com
 ([fe80::954e:662f:d233:dc53%4]) with mapi id 15.20.1856.012; Thu, 9 May 2019
 23:52:55 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
CC:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v4 2/3] MIPS: SGI-IP27: use generic PCI driver
Thread-Topic: [PATCH v4 2/3] MIPS: SGI-IP27: use generic PCI driver
Thread-Index: AQHVBRkrl8qChjiQJ0aAX93J0bdRdaZjem+A
Date:   Thu, 9 May 2019 23:52:55 +0000
Message-ID: <CY4PR2201MB127279A4EDE97CC1B64A5DEDC1330@CY4PR2201MB1272.namprd22.prod.outlook.com>
References: <20190507210917.4691-3-tbogendoerfer@suse.de>
In-Reply-To: <20190507210917.4691-3-tbogendoerfer@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR07CA0039.namprd07.prod.outlook.com
 (2603:10b6:a03:60::16) To CY4PR2201MB1272.namprd22.prod.outlook.com
 (2603:10b6:910:6e::23)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [73.93.154.214]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d112d72-de22-4f32-32db-08d6d4d974df
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:CY4PR2201MB1207;
x-ms-traffictypediagnostic: CY4PR2201MB1207:
x-microsoft-antispam-prvs: <CY4PR2201MB120762EFFEFC81B747974113C1330@CY4PR2201MB1207.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 003245E729
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(376002)(346002)(39850400004)(396003)(366004)(189003)(199004)(2906002)(486006)(53936002)(446003)(6116002)(6246003)(256004)(476003)(11346002)(4326008)(76176011)(74316002)(6436002)(25786009)(186003)(9686003)(3846002)(54906003)(42882007)(55016002)(44832011)(33656002)(71190400001)(71200400001)(305945005)(68736007)(6916009)(316002)(229853002)(102836004)(386003)(6506007)(7736002)(478600001)(4744005)(52536014)(26005)(8936002)(66066001)(66446008)(81166006)(81156014)(8676002)(66946007)(66556008)(64756008)(73956011)(66476007)(99286004)(5660300002)(52116002)(14454004)(7696005)(41533002);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR2201MB1207;H:CY4PR2201MB1272.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: OLzjyEubEBQDgEpmdEUNePJdL04ey02RzdLGad+e/maTu50W4LceN5ZgWyeJKz0wzBClw9QxSVblJg9o+Ua27Xtxe6xjWSvGbKnS08fPJ+6aED+KAJCfl75sQrZmCjqvDeTC2d9CJ84MpFqt8nCvh/AUy2oj/Acu6rt6VLrHjqgLguHmD4/zAyqQDQXDGLE+zHubrE9f4/AsSZdsDiPSQi+P4Z0k2V18Oe5/EFM2ItqhD8BpgKo0RQoNO+c874G0PkiPVYMx15lPODhA55Zm4mN4EjefGEGUbcgW98ahvIc4mnUWvb/jBxC5xGsYwc7HEFzbp+VyWgwXzv5vI0blocW12lD696x677tu6+vpltI1k5KZ5OnQxTyCJnnEJC7sgNbXwafoFZXOO0nF83DcYuIDSExbarqqW/OLpG8o+3E=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d112d72-de22-4f32-32db-08d6d4d974df
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2019 23:52:55.8374
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR2201MB1207
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGVsbG8sDQoNClRob21hcyBCb2dlbmRvZXJmZXIgd3JvdGU6DQo+IENvbnZlcnRlZCBicmlkZ2Ug
Y29kZSB0byBhIHBsYXRmb3JtIGRyaXZlciB1c2luZyB0aGUgUENJIGdlbmVyaWMgZHJpdmVyDQo+
IGZyYW1ld29yayBhbmQgdXNlIGFkZGluZyBwbGF0Zm9ybSBkZXZpY2VzIGR1cmluZyB4dGFsayBz
Y2FuLiBUaGlzIGFsbG93cw0KPiBlYXNpZXIgc2hhcmluZyBicmlkZ2UgZHJpdmVyIGZvciBvdGhl
ciBTR0kgcGxhdGZvcm1zIGxpa2UgSVAzMCAoT2N0YW5lKSBhbmQNCj4gSVAzNSAoT3JpZ2luIDNr
LCBGdWVsLCBUZXpybykuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgQm9nZW5kb2VyZmVy
IDx0Ym9nZW5kb2VyZmVyQHN1c2UuZGU+DQoNCkFwcGxpZWQgdG8gbWlwcy1uZXh0Lg0KDQpUaGFu
a3MsDQogICAgUGF1bA0KDQpbIFRoaXMgbWVzc2FnZSB3YXMgYXV0by1nZW5lcmF0ZWQ7IGlmIHlv
dSBiZWxpZXZlIGFueXRoaW5nIGlzIGluY29ycmVjdA0KICB0aGVuIHBsZWFzZSBlbWFpbCBwYXVs
LmJ1cnRvbkBtaXBzLmNvbSB0byByZXBvcnQgaXQuIF0NCg==
