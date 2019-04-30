Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2CA2102E2
	for <lists+linux-mips@lfdr.de>; Wed,  1 May 2019 00:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbfD3WyO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Apr 2019 18:54:14 -0400
Received: from mail-eopbgr730135.outbound.protection.outlook.com ([40.107.73.135]:10752
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727329AbfD3WyN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 30 Apr 2019 18:54:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMVi4FVJEBfMsD1OyvzqC1p+9/tDvvideOn1qHlLqNw=;
 b=bmnNlmmc1HwN5Me4M+UmapPjqUFz7Pqp1HQfiCxrAeI2jbJZkyTMru9/Y2cfMewmH+KXhtKoznp74iTtYcTyAqZULs9XVsgg02UNclYpTbUjzhOdVhA+uIXkxGU9zebx/0HaPmLE5qu8zVY8uqztLqVqfb71sDDLpftccksafc8=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.174.162.17) by
 MWHPR2201MB1744.namprd22.prod.outlook.com (10.164.206.162) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Tue, 30 Apr 2019 22:53:31 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::b9d6:bf19:ec58:2765]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::b9d6:bf19:ec58:2765%7]) with mapi id 15.20.1835.018; Tue, 30 Apr 2019
 22:53:31 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 2/4] MIPS: Always allocate exception vector for MIPSr2+
Thread-Topic: [PATCH 2/4] MIPS: Always allocate exception vector for MIPSr2+
Thread-Index: AQHU/6eHq3rsHFWee0K5mWbWUirPiQ==
Date:   Tue, 30 Apr 2019 22:53:30 +0000
Message-ID: <20190430225216.7164-3-paul.burton@mips.com>
References: <20190430225216.7164-1-paul.burton@mips.com>
In-Reply-To: <20190430225216.7164-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR07CA0076.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::17) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:24::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.21.0
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e448b7a7-b2da-478d-e535-08d6cdbeaa39
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:MWHPR2201MB1744;
x-ms-traffictypediagnostic: MWHPR2201MB1744:
x-microsoft-antispam-prvs: <MWHPR2201MB17445F914934252CBF9B162FC13A0@MWHPR2201MB1744.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(136003)(376002)(396003)(39850400004)(366004)(199004)(189003)(3846002)(81166006)(81156014)(8676002)(2351001)(71190400001)(68736007)(50226002)(71200400001)(5660300002)(6512007)(53936002)(6486002)(107886003)(6916009)(6116002)(5640700003)(4326008)(8936002)(2906002)(6436002)(36756003)(256004)(44832011)(54906003)(76176011)(66476007)(66946007)(64756008)(6506007)(66556008)(73956011)(99286004)(42882007)(52116002)(478600001)(476003)(186003)(66066001)(11346002)(2501003)(102836004)(305945005)(25786009)(7736002)(26005)(316002)(14454004)(446003)(1076003)(2616005)(66446008)(486006)(386003);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1744;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XKVY6RKFTQTMHG9uhMFKk7p7G0WaHaNr3qIXCdwLpSvyWb+trLNXv/XzAyBUvrbhLF5QR9vCenGLTLx2a4jxeIbkMDE3ClqBUXrgryDtXE5STQONoBpoeX4equ79IZ+aN3AGELtmjVSIW/W9mCRg6q1sj+YqkySDuDBr7HB8YldXaQTntqbgQlXU8buuA1SO/sd8RlHWLomo7a7+ASznPiTsocM6dczQXcEd8QqaQ7lHc8JK8qadTqdI0q+go2il8RszKZkXl6Wi4N7UENxEHjJonnJOcTrON8lkW1lefsbY27IzA8icZJb297m7JdYw6T8UY93GLNYIOhwbvZtKY9bMK5IWc71IAZUXnfdOX8aT7kndTwMJ1gAbfGPfE9Lu3by+4yevv4C+EHeXiA8NZ+vWoe8k4B7O/t27oldsHpA=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e448b7a7-b2da-478d-e535-08d6cdbeaa39
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 22:53:30.5287
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1744
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Q3VycmVudGx5IHdlIGFsbG9jYXRlIHRoZSBleGNlcHRpb24gdmVjdG9yIG9uIHN5c3RlbXMgd2hp
Y2ggdXNlIGENCnZlY3RvcmVkIGludGVycnVwdCBtb2RlLCBidXQgb3RoZXJ3aXNlIGF0dGVtcHQg
dG8gcmV1c2Ugd2hhdGV2ZXINCmV4Y2VwdGlvbiB2ZWN0b3IgdGhlIGJvb3Rsb2FkZXIgdXNlcy4N
Cg0KVGhpcyBjYW4gYmUgcHJvYmxlbWF0aWMgZm9yIGEgbnVtYmVyIG9mIHJlYXNvbnM6DQoNCiAg
MSkgVGhlIG1lbW9yeSBpc24ndCBwcm9wZXJseSBtYXJrZWQgcmVzZXJ2ZWQgaW4gdGhlIG1lbWJs
b2NrDQogICAgIGFsbG9jYXRvci4gV2UndmUgcmVsaWVkIG9uIHRoZSBmYWN0IHRoYXQgRUJhc2Ug
aXMgZ2VuZXJhbGx5IGluIHRoZQ0KICAgICBtZW1vcnkgYmVsb3cgdGhlIGtlcm5lbCBpbWFnZSB3
aGljaCB3ZSBkb24ndCBmcmVlLCBidXQgdGhpcyBpcw0KICAgICBhYm91dCB0byBjaGFuZ2UuDQoN
CiAgMikgUmVjZW50IHZlcnNpb25zIG9mIFUtQm9vdCBwbGFjZSB0aGVpciBleGNlcHRpb24gdmVj
dG9yIGhpZ2ggaW4NCiAgICAga3NlZzAsIGluIG1lbW9yeSB3aGljaCBpc24ndCBwcm90ZWN0ZWQg
YnkgYmVpbmcgbG93ZXIgdGhhbiB0aGUNCiAgICAga2VybmVsIGFueXdheSAmIGNhbiBlbmQgdXAg
YmVpbmcgY2xvYmJlcmVkLg0KDQogIDMpIFdlIGFyZSB1bm5lY2Vzc2FyaWx5IHJlbGlhbnQgdXBv
biB0aGVyZSBiZWluZyBtZW1vcnkgYXQgdGhlIGFkZHJlc3MNCiAgICAgRUJhc2UgcG9pbnRzIHRv
IHVwb24gZW50cnkgdG8gdGhlIGtlcm5lbC4gVGhpcyBpcyBvZnRlbiB0aGUgY2FzZSwNCiAgICAg
YnV0IGlmIHRoZSBib290bG9hZGVyIGRvZXNuJ3QgY29uZmlndXJlIEVCYXNlICYgbGVhdmVzIGl0
IHdpdGggaXRzDQogICAgIGRlZmF1bHQgdmFsdWUgdGhlbiB3ZSByZWx5IHVwb24gdGhlcmUgYmVp
bmcgbWVtb3J5IGF0IHBoeXNpY2FsDQogICAgIGFkZHJlc3MgMCBmb3Igbm8gZ29vZCByZWFzb24u
DQoNCkltcHJvdmUgdGhpcyBzaXR1YXRpb24gYnkgYWxsb2NhdGluZyB0aGUgZXhjZXB0aW9uIHZl
Y3RvciBpbiBhbGwgY2FzZXMNCndoZW4gcnVubmluZyBvbiBNSVBTcjIgb3IgaGlnaGVyLCBhbmQg
cmVzZXJ2aW5nIHRoZSBtZW1vcnkgZm9yIE1JUFNyMSBvcg0KbG93ZXIuIFRoaXMgZW5zdXJlcyB3
ZSBkb24ndCBjbG9iYmVyIHRoZSBleGNlcHRpb24gdmVjdG9yIGluIGFueQ0KY29uZmlndXJhdGlv
biwgYW5kIGZvciBNSVBTcjIgJiBoaWdoZXIgcmVtb3ZlcyB0aGUgbmVlZCBmb3IgbWVtb3J5IGF0
DQpwaHlzaWNhbCBhZGRyZXNzIDAuDQoNClNpZ25lZC1vZmYtYnk6IFBhdWwgQnVydG9uIDxwYXVs
LmJ1cnRvbkBtaXBzLmNvbT4NCi0tLQ0KIGFyY2gvbWlwcy9rZXJuZWwvdHJhcHMuYyB8IDM1ICsr
KysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDE1IGlu
c2VydGlvbnMoKyksIDIwIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvYXJjaC9taXBzL2tl
cm5lbC90cmFwcy5jIGIvYXJjaC9taXBzL2tlcm5lbC90cmFwcy5jDQppbmRleCAwMGY0NGIxNjM4
NWUuLjliNTY1ZWQ1MTY2MiAxMDA2NDQNCi0tLSBhL2FyY2gvbWlwcy9rZXJuZWwvdHJhcHMuYw0K
KysrIGIvYXJjaC9taXBzL2tlcm5lbC90cmFwcy5jDQpAQCAtMjI4NCwxOCArMjI4NCwyNyBAQCB2
b2lkIF9faW5pdCB0cmFwX2luaXQodm9pZCkNCiAJZXh0ZXJuIGNoYXIgZXhjZXB0X3ZlYzNfZ2Vu
ZXJpYzsNCiAJZXh0ZXJuIGNoYXIgZXhjZXB0X3ZlYzQ7DQogCWV4dGVybiBjaGFyIGV4Y2VwdF92
ZWMzX3I0MDAwOw0KLQl1bnNpZ25lZCBsb25nIGk7DQorCXVuc2lnbmVkIGxvbmcgaSwgdmVjX3Np
emU7DQorCXBoeXNfYWRkcl90IGViYXNlX3BhOw0KIA0KIAljaGVja193YWl0KCk7DQogDQotCWlm
IChjcHVfaGFzX3ZlaWMgfHwgY3B1X2hhc192aW50KSB7DQotCQl1bnNpZ25lZCBsb25nIHNpemUg
PSAweDIwMCArIFZFQ1RPUlNQQUNJTkcqNjQ7DQotCQlwaHlzX2FkZHJfdCBlYmFzZV9wYTsNCisJ
aWYgKCFjcHVfaGFzX21pcHNfcjJfcjYpIHsNCisJCWViYXNlID0gQ0FDX0JBU0U7DQorCQllYmFz
ZV9wYSA9IHZpcnRfdG9fcGh5cygodm9pZCAqKWViYXNlKTsNCisJCXZlY19zaXplID0gMHg0MDA7
DQorDQorCQltZW1ibG9ja19yZXNlcnZlKGViYXNlX3BhLCB2ZWNfc2l6ZSk7DQorCX0gZWxzZSB7
DQorCQlpZiAoY3B1X2hhc192ZWljIHx8IGNwdV9oYXNfdmludCkNCisJCQl2ZWNfc2l6ZSA9IDB4
MjAwICsgVkVDVE9SU1BBQ0lORyo2NDsNCisJCWVsc2UNCisJCQl2ZWNfc2l6ZSA9IFBBR0VfU0la
RTsNCiANCi0JCWViYXNlX3BhID0gbWVtYmxvY2tfcGh5c19hbGxvYyhzaXplLCAxIDw8IGZscyhz
aXplKSk7DQorCQllYmFzZV9wYSA9IG1lbWJsb2NrX3BoeXNfYWxsb2ModmVjX3NpemUsIDEgPDwg
ZmxzKHZlY19zaXplKSk7DQogCQlpZiAoIWViYXNlX3BhKQ0KIAkJCXBhbmljKCIlczogRmFpbGVk
IHRvIGFsbG9jYXRlICVsdSBieXRlcyBhbGlnbj0weCV4XG4iLA0KLQkJCSAgICAgIF9fZnVuY19f
LCBzaXplLCAxIDw8IGZscyhzaXplKSk7DQorCQkJICAgICAgX19mdW5jX18sIHZlY19zaXplLCAx
IDw8IGZscyh2ZWNfc2l6ZSkpOw0KIA0KIAkJLyoNCiAJCSAqIFRyeSB0byBlbnN1cmUgZWJhc2Ug
cmVzaWRlcyBpbiBLU2VnMCBpZiBwb3NzaWJsZS4NCkBAIC0yMzEyLDIwICsyMzIxLDYgQEAgdm9p
ZCBfX2luaXQgdHJhcF9pbml0KHZvaWQpDQogCQkJZWJhc2UgPSBDS1NFRzBBRERSKGViYXNlX3Bh
KTsNCiAJCWVsc2UNCiAJCQllYmFzZSA9ICh1bnNpZ25lZCBsb25nKXBoeXNfdG9fdmlydChlYmFz
ZV9wYSk7DQotCX0gZWxzZSB7DQotCQllYmFzZSA9IENBQ19CQVNFOw0KLQ0KLQkJaWYgKGNwdV9o
YXNfbWlwc19yMl9yNikgew0KLQkJCWlmIChjcHVfaGFzX2ViYXNlX3dnKSB7DQotI2lmZGVmIENP
TkZJR182NEJJVA0KLQkJCQllYmFzZSA9IChyZWFkX2MwX2ViYXNlXzY0KCkgJiB+MHhmZmYpOw0K
LSNlbHNlDQotCQkJCWViYXNlID0gKHJlYWRfYzBfZWJhc2UoKSAmIH4weGZmZik7DQotI2VuZGlm
DQotCQkJfSBlbHNlIHsNCi0JCQkJZWJhc2UgKz0gKHJlYWRfYzBfZWJhc2UoKSAmIDB4M2ZmZmYw
MDApOw0KLQkJCX0NCi0JCX0NCiAJfQ0KIA0KIAlpZiAoY3B1X2hhc19tbWlwcykgew0KLS0gDQoy
LjIxLjANCg0K
