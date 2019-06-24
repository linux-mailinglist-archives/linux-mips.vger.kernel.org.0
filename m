Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E63B851CE9
	for <lists+linux-mips@lfdr.de>; Mon, 24 Jun 2019 23:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726740AbfFXVQI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 24 Jun 2019 17:16:08 -0400
Received: from mail-eopbgr820124.outbound.protection.outlook.com ([40.107.82.124]:54875
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726009AbfFXVQG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 24 Jun 2019 17:16:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x9E8W3rxSrngeZbAi/Vo56L1PD1L1vEqWIIaN030/94=;
 b=jzzHjU8cU01DYfCDu3WE28Fx6talann16tiHIu5Nq/DoSMkSWVT8UKLBmrOJxI6mM5X2/4WY0/03ibM99L1hfUeZwVsefKgCqvyEhqF4kIniXSyY3PFBPmgav0mzgGut6Msgfw/xQvKW0C0fWyo5OqKCISLWZojGLK2pMdv+NAY=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1760.namprd22.prod.outlook.com (10.164.206.163) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.13; Mon, 24 Jun 2019 21:16:02 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::6975:b632:c85b:9e40]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::6975:b632:c85b:9e40%2]) with mapi id 15.20.2008.014; Mon, 24 Jun 2019
 21:16:02 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "petrcvekcz@gmail.com" <petrcvekcz@gmail.com>
CC:     "hauke@hauke-m.de" <hauke@hauke-m.de>,
        "john@phrozen.org" <john@phrozen.org>,
        Petr Cvek <petrcvekcz@gmail.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "openwrt-devel@lists.openwrt.org" <openwrt-devel@lists.openwrt.org>,
        "pakahmar@hotmail.com" <pakahmar@hotmail.com>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v2 0/7] MIPS: lantiq: irq: Various fixes, add SMP support
Thread-Topic: [PATCH v2 0/7] MIPS: lantiq: irq: Various fixes, add SMP support
Thread-Index: AQHVJ7CjVKON6u8MZ0a3RFHnFgNU16arVKqA
Date:   Mon, 24 Jun 2019 21:16:02 +0000
Message-ID: <MWHPR2201MB1277EA8336E41AB191A2C04BC1E00@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <cover.1561065843.git.petrcvekcz@gmail.com>
In-Reply-To: <cover.1561065843.git.petrcvekcz@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR07CA0045.namprd07.prod.outlook.com
 (2603:10b6:a03:60::22) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 0a21adc5-44c1-4622-239d-08d6f8e92942
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1760;
x-ms-traffictypediagnostic: MWHPR2201MB1760:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <MWHPR2201MB1760ACD12BA8ECED83C92069C1E00@MWHPR2201MB1760.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 007814487B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(39840400004)(136003)(366004)(376002)(396003)(189003)(199004)(486006)(1361003)(14444005)(53936002)(7736002)(68736007)(6916009)(76176011)(386003)(66066001)(25786009)(4326008)(186003)(305945005)(42882007)(2501003)(316002)(256004)(74316002)(6506007)(99286004)(54906003)(476003)(2351001)(52116002)(11346002)(446003)(44832011)(7696005)(26005)(8676002)(102836004)(6116002)(5640700003)(3846002)(1730700003)(9686003)(71190400001)(6306002)(71200400001)(14454004)(5660300002)(229853002)(8936002)(52536014)(1411001)(6436002)(966005)(64756008)(66556008)(33656002)(66446008)(66476007)(6246003)(73956011)(2906002)(55016002)(478600001)(66946007)(81166006)(81156014);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1760;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ia74aolydG8nl+pPMNncfto8D9oTWDrrULVjDKyXhlxa488vQJP9QLc3dNdCUH+sRNTFam+gkUBfhYGl0aVKikJ4ZpZtn5OCGEnLL12SOk4rRauy+zSBQscAsaxeKkNGiMzw4owVtGBCSWdByjun8tf2tT8Z/BWhotdaoYL2440kgHKOdF6uVVJ52wQ/7hWD0smr6y83bKD44sRG2CtfSTCkWxRX4wZvdavTGdkCvJjvuKuPQDHiz2OTMel5/TJL4risXAqrHywKWmHcPYvqAmkk3vhu9uDb1sNTHRfJ1Ej20ZpjclCXqrYqFdVGalg5sKAylxmZzKuqPQKx8MWYfO9gonjAF5X/Lqw6PwIVY9KYHMKTqnf0FzWNBYn2b7GnB+dUPE+ZB6OVM/d8sGj9NgZR8OUJan6m2DLXf4vf9qM=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a21adc5-44c1-4622-239d-08d6f8e92942
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2019 21:16:02.5594
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1760
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGVsbG8sDQoNCnBldHJjdmVrY3pAZ21haWwuY29tIHdyb3RlOg0KPiBGcm9tOiBQZXRyIEN2ZWsg
PHBldHJjdmVrY3pAZ21haWwuY29tPg0KPiANCj4gSGksDQo+IA0KPiBXaGlsZSBoYWNraW5nIHdp
dGggbXkgbW9kZW0gaW4gb3BlbndydCBJJ3ZlIGZvdW5kIGluIHRoZSBsYW50aXEgdnJ4MjY4IFNv
Qw0KPiB0aGVyZSBpcyBvbmx5IGEgc3VwcG9ydCBmb3IgdGhlIHByb2Nlc3NlcyBTTVAgYW5kIG5v
dCBmb3IgaW50ZXJydXB0DQo+IHJvdXRpbmcuIEFmdGVyIHNvbWUgbG9va2luZyBpbnRvIHZlbmRv
cnMgcmVsZWFzZWQgc291cmNlIGNvZGVzIChwcm9iYWJseQ0KPiBpbnRlbCBVR1cpIGFuZCBieSBv
YnNlcnZpbmcgU29DJ3MgbWVtb3J5IG1hcCBJJ3ZlIGZvdW5kIG91dCB0aGVyZSBpcw0KPiBhIHNl
Y29uZCBpbnRlcnJ1cHQgY29udHJvbGxlciAoSUNVKSBmb3IgdGhlIHNlY29uZCBWUEUuIFRoZSBs
YXN0IHBhdGNoIG9mDQo+IHRoaXMgc2VyaWVzIGFkZHMgYSBzdXBwb3J0IGZvciBpdC4gVGhlIGNv
ZGUgaXMgZGlmZmVyZW50IGZyb20gaW50ZWwgVUdXJ3MNCj4gc2V0IGFmZmluaXR5IGZ1bmN0aW9u
LCB3aGVyZSB0aGUgaW50ZXJydXB0IGxpbmUgZ2V0cyBlbmFibGVkIChzd2l0Y2hlZCkNCj4gdG8g
dGhlIHNlY29uZCBJQ1UuIEluc3RlYWQgb25seSB0aGUgY3B1bWFzayBnZXRzIGNoYW5nZWQgaW4g
bXkgc2V0IGFmZmluaXR5Lg0KPiBUaGUgY2hhbmdlIHdpbGwgYmUgd3JpdHRlbiBpbnRvIHRoZSBo
YXJkd2FyZSBhZnRlciB0aGUgbmV4dCBpcnEgZW5hYmxlIGNhbGwuDQo+IFRoaXMgd2FzIGNoYW5n
ZWQgYmVjYXVzZSBvZiBzdGFiaWxpdHkgcmVhc29ucyBpbiB0aGUgaGlnaCBpcnEgbG9hZCBvZg0K
PiB0aGUgU29DLg0KPiANCj4gVGhlIGZpcnN0IHBhcnQgb2YgdGhlIHNlcmllcyBhcmUgbW9yZSBv
ciBsZXNzIGNvc21ldGljIGNoYW5nZXMgb2YgbG9uZw0KPiBuYW1lcywgZGlmZmVyZW50IHR5cGVz
IGFuZCBmZXcgZml4ZWQgd2FybmluZ3MgZnJvbSBjaGVja3BhdGNoLiBUaGVyZSBpcw0KPiBhIGZp
eCBpbiBwYXJ0IDUsIHdoZXJlIEkndmUgZm91bmQgdGhlIG1pc3NpbmcgYml0ZmllbGQgY2xlYXIg
YmVmb3JlIE9SaW5nDQo+IHdpdGggYSBuZXcgdmFsdWUuDQo+IA0KPiBUaGUgU01QIGluIHBhcnQg
NyBjaGFuZ2VzIGRldmljZXRyZWUgZGVmaW5pdGlvbiBmb3IgYSByZWdpc3RlciByZWdpb25zDQo+
IG9mIHRoZSBJQ1UuIFByZXZpb3VzbHksIHRoZXJlIHdhcyBhIHJlZ2lvbiBmb3IgYSBzaW5nbGUg
SU0gKGEgbWFzay91bm1hc2svDQo+IGVuYWJsZS8uLi4gc2V0IGZvciAzMiBpbnRlcnJ1cHRzKS4g
Tm93IGl0IGlzIHRoZSB3aG9sZSBJQ1UuIEl0IG1hdGNoIG1vcmUNCj4gdGhlIGhhcmR3YXJlIGxh
eW91dC4gVGhlcmUgaXMgbm8gY29tcGF0aWJpbGl0eSBpc3N1ZSBpbiB2YW5pbGxhLCBvbmx5DQo+
IG9wZW53cnQgd2FzIGFmZmVjdGVkIGJ5IHRoZXNlIGRldmljZXRyZWVzLg0KPiANCj4gQWxzbyBp
biB0aGUgVUdXJ3MgbHRxX2VuYWJsZV9pcnEoKSwgdGhlcmUgd2FzIGEgc3RhdHVzIGJpdCByZXNl
dCBiZWZvcmUNCj4gdGhlIGFjdHVhbCBJUlEgbGluZSBlbmFibGUuIEl0IHdhcyBtYXJrZWQgYXMg
IkJ1ZyBmaXggZm9yIGZha2UgaW50ZXJydXB0Ii4NCj4gVGhlIGNvZGUgc2VlbXMgdG8gd29yayB3
aXRob3V0IGl0ICh2YW5pbGxhIGFuZCBuZXcgU01QKSwgYnV0IEkndmUgbWFkZQ0KPiBhbiBhc3Nl
cnQgaWYgdGhpcyBiaXQgaXMgc2V0IGJlZm9yZSB0aGUgYWN0dWFsIGVuYWJsZS4gVGhlIGFzc2Vy
dCByZXBvcnRlZA0KPiB0aGVzZSBJUlEgc291cmNlczoNCj4gDQo+IDIyOjAwMDA0MDAwICAgICBz
cGlfcnggIChvbmx5IHdoZW4gU1BJIGlzIGFjY2Vzc2VkKQ0KPiA2MzowMDgwMDAwMCAgICAgbWVp
X2NwZSAocGVybWFuZW50IDFzKQ0KPiAxMTI6MDAwMDAxMDAgICAgYXNjX3R4DQo+IA0KPiBCdXQg
dGhlIGNvZGUgc2VlbXMgdG8gcnVuIGFueXdheSBJIGRpZG4ndCBpbmNsdWRlIHRoZSBzdGF0dXMg
Yml0IHJlc2V0IHBhcnQuDQo+IA0KPiBUaGUgU01QIGFmZmluaXR5IHVwZGF0ZSBpcyBkb25lIGV2
ZXJ5IElSUSBlbmFibGUsIHdoZXJlIGl0IGV4dHJhY3QgdGhlIGZpcnN0DQo+IHZhbGlkIFZQRSBm
cm9tIGFmZmluaXR5IGNwdW1hc2suIFRoaXMgaXMgc3RhbmRhcmQgaW4gdGhlIGtlcm5lbC4NCj4g
DQo+IFRoZSBjb2RlIHdhcyB0ZXN0ZWQgaW4gbm9zbXAgY29uZmlndXJhdGlvbiBvbiBUUExpbmsg
Vzk5ODBCIGluIG9wZW53cnQgdHJlZQ0KPiAocGF0Y2hlZCBrZXJuZWwgdjQuMTQpLiBUaGUgbGFu
dGlxIGRldmljZXMgb3RoZXIgdGhhbiB2cngyNjggd2VyZSBub3QNCj4gdGVzdGVkLg0KPiANCj4g
RGlzY3Vzc2lvbiBvbiBvcGVud3J0IHJlbGF0ZWQgcGFydHMgZm9yIGxhbnRpcSBJQ1UgU01QIGlz
IGhlcmUgKGRldmljZXRyZWVzLA0KPiB0aGluZ3Mgbm90IGluIHRoZSB2YW5pbGxhIGtlcm5lbCwg
UkZDIHZlcnNpb25zIG9mIHRoZSBwYXRjaCk6DQo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5v
cmcvcGF0Y2gvMTEwMDgzMi8NCj4gDQo+IENoYW5nZXMgc2luY2UgdjE6DQo+ICogQWRkZWQgYSBk
ZWZpbmUgZm9yIElNIHNpemUNCj4gKiBDaGFuZ2VkIGx0cV9pY3VfbWVtYmFzZSBhcnJheSBzaXpl
IHRvIE5SX0NQVVMgc28gZm9yX2VhY2hfcG9zc2libGVfY3B1KCkNCj4gd2lsbCBub3Qgb3ZlcmZs
b3cNCj4gKiBSZW1vdmVkIGFmZmluaXR5IGF1dG8gcm90YXRpb24gKGNhbiBiZSBhZGQgbGF0ZXIg
ZnJvbSB2MSBpZiByZXF1aXJlZCkNCj4gKiBDb21taXQgbWVzc2FnZXMgd29yZGluZ3MNCj4gDQo+
IFBldHIgQ3ZlayAoNyk6DQo+IE1JUFM6IGxhbnRpcTogTW92ZSBtYWNybyBkaXJlY3RseSB0byBp
b21lbSBmdW5jdGlvbg0KPiBNSVBTOiBsYW50aXE6IENoYW5nZSB2YXJpYWJsZXMgdG8gdGhlIHNh
bWUgdHlwZSBhcyB0aGUgc291cmNlDQo+IE1JUFM6IGxhbnRpcTogRml4IGF0dHJpYnV0ZXMgb2Yg
b2ZfZGV2aWNlX2lkIHN0cnVjdHVyZQ0KPiBNSVBTOiBsYW50aXE6IFJlbW92ZSB1bnVzZWQgbWFj
cm9zDQo+IE1JUFM6IGxhbnRpcTogRml4IGJpdGZpZWxkIG1hc2tpbmcNCj4gTUlQUzogbGFudGlx
OiBTaG9ydGVuIHJlZ2lzdGVyIG5hbWVzLCByZW1vdmUgdW51c2VkIG1hY3Jvcw0KPiBNSVBTOiBs
YW50aXE6IEFkZCBTTVAgc3VwcG9ydCBmb3IgbGFudGlxIGludGVycnVwdCBjb250cm9sbGVyDQo+
IA0KPiBhcmNoL21pcHMvbGFudGlxL2lycS5jIHwgMTc3ICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tLS0tLS0tDQo+IDEgZmlsZSBjaGFuZ2VkLCAxMjYgaW5zZXJ0aW9ucygrKSwg
NTEgZGVsZXRpb25zKC0pDQoNClNlcmllcyBhcHBsaWVkIHRvIG1pcHMtbmV4dC4NCg0KVGhhbmtz
LA0KICAgIFBhdWwNCg0KWyBUaGlzIG1lc3NhZ2Ugd2FzIGF1dG8tZ2VuZXJhdGVkOyBpZiB5b3Ug
YmVsaWV2ZSBhbnl0aGluZyBpcyBpbmNvcnJlY3QNCiAgdGhlbiBwbGVhc2UgZW1haWwgcGF1bC5i
dXJ0b25AbWlwcy5jb20gdG8gcmVwb3J0IGl0LiBdDQo=
