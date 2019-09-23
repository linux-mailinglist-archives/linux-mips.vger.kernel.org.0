Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B65B1BBAF2
	for <lists+linux-mips@lfdr.de>; Mon, 23 Sep 2019 20:07:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437842AbfIWSHf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 23 Sep 2019 14:07:35 -0400
Received: from mail-eopbgr730137.outbound.protection.outlook.com ([40.107.73.137]:6328
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2438123AbfIWSHe (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 23 Sep 2019 14:07:34 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JhGBwZOgKF9uMI9kFlEHlv/eqAfsLR4/NPnTk0ewderXPkWbX6vwkWzMlcLg1/ksfP0uK/WucepxFjboycvMREnYiNT79s5pLtIOT5LpqcEfaP5NdvXd0Ju1V1Kag3EhJ27ZqcpsXfbvh/tuF35fd9WLeqoLH4RsWW8xxCMVaEyVY0tw2bdiPDWzXzU1brM4t5bd6fBPN0sYcXH2POFT7HCQvDtqKSBBSJWvjDGSwGsAI/c83tNFYvQ9e5th1jEF20AOSAjQ/CCKZ/48b91sr+onmf+vFD9NGvUrmavjanXwfsWfmtRkQp3G2Z+p4G5UuUH5Ycbcl1qPf1hY7q01sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhZKmkL2FC/vbycMA+2tP6QfvuPaFPAPQcd1LF1/c2A=;
 b=cbnZlcHquMYo/mc/f4gwuQaQyl7xH5b0Hsdp1jREooQy20/jLaY4SnSGX8kWv4CkUr7mTXZT5pPu5lXJcghZag1rq3TokRLe3mjTTA3IYrBXEuYlKmiZ8dyJbiN1L2lUQw3M1lc7OasqsU34QMlxgw2i2HnbzpNPMONyUTYLlX8kpV5Fi/tDC8XST5nfPZ2QB4+gnCNyLOy6JcDEYDRP44O2UtxXQuOpUbFpaWbKNSusn6R9LmoWjiFEkOKhvWsR4sUoJxY3A1Eza35WohnzNu94tzFzwE/w3TCtW2tac+655HzqXo/5pCwrQ+qnaBZX1lOXGNDziIg7TiVgh80kWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bhZKmkL2FC/vbycMA+2tP6QfvuPaFPAPQcd1LF1/c2A=;
 b=tQwuvZSvZjkEAIUXyYhbRojxcOCtc10B5XHk3xLDOyoVxmtl5lqvjZ24/H4502moHIgBwhTBvfgeEKrxBDMEFrMLYEYwYwhoJrbn/C6nR4hv9afdgVBIHFnygw+9BmIx+bFBUZxxMhrvvAt8fe/PyVk8IhPvWmnd87gqlu/oWyU=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1390.namprd22.prod.outlook.com (10.174.162.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.23; Mon, 23 Sep 2019 18:07:30 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::f9e8:5e8c:7194:fad3%11]) with mapi id 15.20.2284.023; Mon, 23 Sep
 2019 18:07:30 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
CC:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>
Subject: Re: [GIT PULL] MIPS changes
Thread-Topic: [GIT PULL] MIPS changes
Thread-Index: AQHVcjnDwc5rEfS1+0+Wv+DUIcjh9w==
Date:   Mon, 23 Sep 2019 18:07:30 +0000
Message-ID: <20190923180728.flp6jx4jc2bh7cys@pburton-laptop>
References: <20190921231022.kawfomtmka737arq@pburton-laptop>
 <CAHk-=wjmJbF3p9vZTW2nbeD4LkG-JZV+uqv8BnxzojJ5SZsLjw@mail.gmail.com>
In-Reply-To: <CAHk-=wjmJbF3p9vZTW2nbeD4LkG-JZV+uqv8BnxzojJ5SZsLjw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR05CA0030.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::43) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 838e750c-2939-4ae4-8cb1-08d74050e63a
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600167)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:MWHPR2201MB1390;
x-ms-traffictypediagnostic: MWHPR2201MB1390:
x-microsoft-antispam-prvs: <MWHPR2201MB13906A7F895A7062224683CDC1850@MWHPR2201MB1390.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 0169092318
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(346002)(366004)(39840400004)(396003)(376002)(136003)(189003)(199004)(14454004)(99286004)(66946007)(6916009)(446003)(71190400001)(42882007)(66556008)(71200400001)(486006)(8936002)(11346002)(76176011)(8676002)(6486002)(25786009)(386003)(6506007)(256004)(14444005)(33716001)(6246003)(81166006)(81156014)(9686003)(6512007)(7736002)(5660300002)(52116002)(64756008)(476003)(66476007)(44832011)(478600001)(58126008)(66446008)(66066001)(53546011)(54906003)(4326008)(6436002)(26005)(6116002)(3846002)(305945005)(102836004)(229853002)(316002)(1076003)(186003)(2906002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1390;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: QEsQHvSlvpTO+13MHMiLcgDRps24e3Fi70yUKQatsT9mWwMPsATaKN9xVrkGJa4GvdNGZ9MnSfHbQ4nZ7S/Ck4m4ZAOPA7PtO8jE97EsB2NnRIWkcrsi9jed+i7qNaLMvx9UilZd2f+6A+NOjbBm3uzu4w2bchZKjNN0mtpvXG0/30wjmlVT1/teQXRAm82EsXsi6ebRhqkbGhoV067DpVuYz7y/ZQi0varUndnLClTNDQad1cfptU2yJEP9Y37zrSERUdHPjXjVEA677QuZuX6pje+TJJAbwjhymlj6GT/F+M5pCqn0EdWUP5U0gxWbzxXJ+Zk2x35OZt7ZBU+M6sNJ+7d6/CZVCD++jGcrP4C01oZW84S7NvyMmjDqEMQBH5CgTV6vX8dTTJruWTctfqhJvG9HucfstfEoibRPGAw=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <BEEEF671CAE0E24894FA514926C67763@namprd22.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 838e750c-2939-4ae4-8cb1-08d74050e63a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Sep 2019 18:07:30.2931
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: b32VhWYDNMWk3kBZaxQOh+Yycpt4+r//y2nKvCAgaMaEnd2fEQE5u8NP7oPnSK1P3qyTXSCPAU7XI6BCP+tL1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1390
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGkgTGludXMsDQoNCk9uIFN1biwgU2VwIDIyLCAyMDE5IGF0IDExOjM1OjM2QU0gLTA3MDAsIExp
bnVzIFRvcnZhbGRzIHdyb3RlOg0KPiBPbiBTYXQsIFNlcCAyMSwgMjAxOSBhdCA0OjEwIFBNIFBh
dWwgQnVydG9uIDxwYXVsLmJ1cnRvbkBtaXBzLmNvbT4gd3JvdGU6DQo+ID4NCj4gPiBIZXJlIGFy
ZSB0aGUgbWFpbiBNSVBTIGNoYW5nZXMgZm9yIHY1LjQ7IHBsZWFzZSBwdWxsLg0KPiANCj4gSG1t
LiBJIHB1bGxlZCBhbmQgYmVjYXVzZSBpbml0aWFsIHRlc3RzIGRpZG4ndCBzaG93IGFueSBpc3N1
ZXMsIEkNCj4gYWxyZWFkeSBwdXNoZWQgb3V0Lg0KPiANCj4gQnV0IHNvbWUgdW5yZWxhdGVkIGZ1
cnRoZXIgdGVzdGluZyB0aGVuIHNob3dzIHRoYXQgdGhpczoNCj4gDQo+ID4gRmxvcmlhbiBGYWlu
ZWxsaSAoMik6DQo+ID4gICAgICAgZmlybXdhcmU6IGJjbTQ3eHhfbnZyYW06IENvcnJlY3Qgc2l6
ZV90IHByaW50ZiBmb3JtYXQNCj4gPiAgICAgICBmaXJtd2FyZTogYmNtNDd4eF9udnJhbTogQWxs
b3cgQ09NUElMRV9URVNUDQo+IA0KPiBjYXVzZXMgcHJvYmxlbXMsIGFuZCBjb21taXQgZmViNGVi
MDYwYzNhICgiZmlybXdhcmU6IGJjbTQ3eHhfbnZyYW06DQo+IENvcnJlY3Qgc2l6ZV90IHByaW50
ZiBmb3JtYXQiKSBpcyBidWdneToNCj4gDQo+ICAgZHJpdmVycy9maXJtd2FyZS9icm9hZGNvbS9i
Y200N3h4X252cmFtLmM6IEluIGZ1bmN0aW9uIOKAmG52cmFtX2luaXTigJk6DQo+ICAgZHJpdmVy
cy9maXJtd2FyZS9icm9hZGNvbS9iY200N3h4X252cmFtLmM6MTUxOiB3YXJuaW5nOiBmb3JtYXQg
4oCYJXp14oCZDQo+IGV4cGVjdHMgYXJndW1lbnQgb2YgdHlwZSDigJhzaXplX3TigJksIGJ1dCBh
cmd1bWVudCAyIGhhcyB0eXBlIOKAmHUzMuKAmSB7YWthDQo+IOKAmHVuc2lnbmVkIGludOKAmX0g
Wy1XZm9ybWF0PV0NCj4gDQo+IGFuZCB0aGUgY2hhbmdlIHRvIHVzZSAlenUgd2FzIGNvbXBsZXRl
bHkgd3JvbmcuDQo+IA0KPiBJdCBwcmludHMgb3V0ICdoZWFkZXIubGVuJywgd2hpY2ggaXMgYW4g
dTMyLCBub3QgbnZyYW1fbGVuIHdoaWNoIGlzIGEgc2l6ZV90Lg0KPiANCj4gVHNzayB0c3NrLg0K
DQpPb3BzaWUuDQoNCj4gSSd2ZSBmaXhlZCBpdCBpbiBteSB0cmVlLCBidXQgdGhpcyBzaG91bGQg
aGF2ZSBzaG93biB1cCBpbiBsaW51eC1uZXh0LA0KPiBvciBpbiBNSVBTIHRlc3RpbmcuIFRoZSBw
cm9jZXNzIGNsZWFybHkgZmFpbGVkLg0KDQpMb29raW5nIGJhY2sgSSBkbyBzZWUgdGhhdCB0aGUg
a2J1aWxkIHRlc3Qgcm9ib3QgcmVwb3J0ZWQgYW4gaXNzdWUgaGVyZSwNCnNvIG9uZSBhc3BlY3Qg
b2YgdGhlIGZhaWx1cmUgaXMgc3F1YXJlbHkgb24gbXkgbm90IGhhdmluZyBjYXVnaHQgdXAgb24N
CmVtYWlsIHByb3Blcmx5IHlldC4NCg0KQW5vdGhlciBpc3N1ZSBpcyB0aGF0IHRoZXJlIGFyZSBj
dXJyZW50bHkgJ2V4cGVjdGVkJyB3YXJuaW5ncyBkb3R0ZWQNCnRocm91Z2ggdGhlIHRyZWUgZm9y
IHZhcmlvdXMgZGVmY29uZmlncywgc28gd2hpbHN0IEkgZG8gcGVyZm9ybSB0ZXN0DQpidWlsZHMg
YmVmb3JlIHN1Ym1pdHRpbmcgcHVsbCByZXF1ZXN0cyBJIGdlbmVyYWxseSBkb24ndCBwYXkgdG9v
IG11Y2gNCmF0dGVudGlvbiB0byB3YXJuaW5ncy4uLiBTbyBhbiBpbXByb3ZlbWVudCBJJ2xsIGxv
b2sgYXQgaXMgZml4aW5nIHVwDQp0aG9zZSB3YXJuaW5ncyAmIGJ1aWxkaW5nIHdpdGggLVdlcnJv
ciwgb3IgYXQgbGVhc3Qgbm90IGlnbm9yaW5nDQp3YXJuaW5ncy4NCg0KTXkgYXBvbG9naWVzIGFu
ZCB0aGFua3MgZm9yIGZpeGluZyB0aGlzIHVwLA0KDQpQYXVsDQo=
