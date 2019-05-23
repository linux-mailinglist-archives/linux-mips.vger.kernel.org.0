Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00E642742B
	for <lists+linux-mips@lfdr.de>; Thu, 23 May 2019 03:57:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729912AbfEWB4o (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 May 2019 21:56:44 -0400
Received: from mail-eopbgr760111.outbound.protection.outlook.com ([40.107.76.111]:64430
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729906AbfEWB4o (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 22 May 2019 21:56:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RA3fROGId0YERH1Os19dww+AQRC8kViJyoxSSa08Gl4=;
 b=PHwnI/yprv7KH0DmTlvdozvdVJBKgbw8u4h5+S/9oNUuXrF8UPPS+7WDDVYMbFAh7MqLQ9sV7G57d8b1OJQWns00mpdRUaIiLxv+ke8kE/U2EIjsEaZE1fgt+nECSvetzdggANw4PWVX85kwbRsrfIwjehTr2pBlgRm6tUZ8fbA=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.174.162.17) by
 MWHPR2201MB1184.namprd22.prod.outlook.com (10.174.171.39) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.16; Thu, 23 May 2019 01:56:42 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::90ff:8d19:8459:834b]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::90ff:8d19:8459:834b%7]) with mapi id 15.20.1922.017; Thu, 23 May 2019
 01:56:42 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <pburton@wavecomp.com>,
        James Hogan <jhogan@kernel.org>,
        Atsushi Nemoto <anemo@mba.ocn.ne.jp>,
        Mike Rapoport <rppt@linux.ibm.com>,
        "Maciej W . Rozycki" <macro@linux-mips.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH] MIPS: TXx9: Fix boot crash in free_initmem()
Thread-Topic: [PATCH] MIPS: TXx9: Fix boot crash in free_initmem()
Thread-Index: AQHVEHaN6hs4HpqTb0uEoailppzfaKZ39JkA
Date:   Thu, 23 May 2019 01:56:41 +0000
Message-ID: <MWHPR2201MB1277268FA658B58629931DC5C1010@MWHPR2201MB1277.namprd22.prod.outlook.com>
References: <20190522081535.16583-1-geert@linux-m68k.org>
In-Reply-To: <20190522081535.16583-1-geert@linux-m68k.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR11CA0037.namprd11.prod.outlook.com
 (2603:10b6:a03:80::14) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:24::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3839860b-9e5b-4ca5-eb37-08d6df21e68c
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:MWHPR2201MB1184;
x-ms-traffictypediagnostic: MWHPR2201MB1184:
x-microsoft-antispam-prvs: <MWHPR2201MB1184CFD13D62993DF7385859C1010@MWHPR2201MB1184.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 00462943DE
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(346002)(396003)(39850400004)(136003)(366004)(189003)(199004)(486006)(52116002)(99286004)(476003)(256004)(6916009)(81166006)(81156014)(6246003)(42882007)(8676002)(76176011)(8936002)(7696005)(53936002)(66946007)(68736007)(66556008)(64756008)(316002)(66446008)(66476007)(73956011)(44832011)(54906003)(71200400001)(186003)(71190400001)(6436002)(33656002)(6116002)(3846002)(26005)(74316002)(5660300002)(6506007)(52536014)(446003)(11346002)(386003)(2906002)(55016002)(229853002)(9686003)(45080400002)(102836004)(4326008)(7736002)(305945005)(66066001)(478600001)(14454004)(25786009);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1184;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4ildBvarFenDFS4WzIzmAZQvsIoKYRjIfRZRljxC0oL/kDuIQbwnBLcwPXXeqaGkEOUQnFYBQT1LB0II6u9AAKfwJ7U3yuw1/15ASr2ac8oMaa6fR1dDI4LAbn1jv4RhOHPd0MT3E33GepuJaj557MwwJsBVuOouzTHhfgvW+1IHzMjNXZWWGn0L6/AcpyaLqg+oh0T+u8xJLJcWdKYKBwyBC+8d7An+8rZ3oJUwcKpm+Qlw2hISyr+FvjjThDaDXE3hDi7vpy2FLqfofETKElnhMDoSe/aTg//7PANP0cFKckZV4EPcufR3yevS8nKhyUbpyMsi2VHhlkQawZYD1NBfOA/TnHRREEo07t5XozkW/5CDIXHOpyo7XQoeotj/DHaTtGmoobM2/d17n4FdjEJibpunwGPdSwXt3uQ4OeY=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3839860b-9e5b-4ca5-eb37-08d6df21e68c
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 May 2019 01:56:41.8396
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1184
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGVsbG8sDQoNCkdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToNCj4gT24gcmJ0eDQ5Mjc6DQo+IA0K
PiBCVUc6IEJhZCBwYWdlIHN0YXRlIGluIHByb2Nlc3Mgc3dhcHBlciAgcGZuOjAwMDAxDQo+IHBh
Z2U6ODA0Yjc4MjAgcmVmY291bnQ6MCBtYXBjb3VudDotMTI4IG1hcHBpbmc6MDAwMDAwMDAgaW5k
ZXg6MHgxDQo+IGZsYWdzOiAweDAoKQ0KPiByYXc6IDAwMDAwMDAwIDAwMDAwMTAwIDAwMDAwMjAw
IDAwMDAwMDAwIDAwMDAwMDAxIDAwMDAwMDAwIGZmZmZmZjdmIDAwMDAwMDAwDQo+IHBhZ2UgZHVt
cGVkIGJlY2F1c2U6IG5vbnplcm8gbWFwY291bnQNCj4gTW9kdWxlcyBsaW5rZWQgaW46DQo+IENQ
VTogMCBQSUQ6IDEgQ29tbTogc3dhcHBlciBOb3QgdGFpbnRlZCA1LjIuMC1yYzEtcmJ0eDQ5Mjct
MDA0NjgtZzNjMDVlYTNkNDA3N2I3NTYgIzE0MQ0KPiBTdGFjayA6IDAwMDAwMDAwIDEwMDA4NDAw
IDgwNDBkYzRjIDg3YzFiOTc0IDgwNDRhZjYzIDgwNDBkYzRjIDAwMDAwMDAxIDgwNGEzNDkwDQo+
IDAwMDAwMDAxIDgxMDAwMDAwIDAwMzBmMjMxIDgwMTQ4NTU4IDAwMDAwMDAzIDEwMDA4NDAwIDg3
YzFkZDgwIDNkMGY5YTJjDQo+IDAwMDAwMDAwIDAwMDAwMDAwIDgwNGIwMDAwIDAwMDAwMDAwIDAw
MDAwMDA3IDAwMDAwMDAwIDAwMDAwMDgxIDAwMDAwMDAwDQo+IDYyNzIyZDMxIDAwMDAwMDgwIDgw
NGIwMDAwIDM5MzQ3ODc0IDAwMDAwMDAwIDgwNGI3ODIwIDgwNDBjZTE4IDgxMDAwMDEwDQo+IDAw
MDAwMDAxIDAwMDAwMDA3IDAwMDAwMDAxIDgxMDAwMDAwIDAwMDAwMDE4IDgwMjFkZTI0IDAwMDAw
MDAwIDgwNGEwMDAwDQo+IC4uLg0KPiBDYWxsIFRyYWNlOg0KPiBbPDgwMTBhZGVjPl0gc2hvd19z
dGFjaysweDc0LzB4MTA0DQo+IFs8ODAxYTVlNDQ+XSBiYWRfcGFnZSsweDEzMC8weDEzOA0KPiBb
PDgwMWE2NTRjPl0gZnJlZV9wY3BwYWdlc19idWxrKzB4MTdjLzB4M2IwDQo+IFs8ODAxYTc4OWM+
XSBmcmVlX3VucmVmX3BhZ2UrMHg0MC8weDY4DQo+IFs8ODAxMTIwZjQ+XSBmcmVlX2luaXRfcGFn
ZXMrMHhlYy8weDEwNA0KPiBbPDgwM2JkZGU4Pl0gZnJlZV9pbml0bWVtKzB4MTAvMHg1OA0KPiBb
PDgwM2JkYjhjPl0ga2VybmVsX2luaXQrMHgyMC8weDEwMA0KPiBbPDgwMTA1N2M4Pl0gcmV0X2Zy
b21fa2VybmVsX3RocmVhZCsweDE0LzB4MWMNCj4gDQo+IEFzIG9mIGNvbW1pdCBiOTNkZGM0Zjkx
NTYyMDVlICgibWlwczogUmVzZXJ2ZSBtZW1vcnkgZm9yIHRoZSBrZXJuZWwNCj4gaW1hZ2UgcmVz
b3VyY2VzIiksIGJvb3RtZW1faW5pdCgpIG5vIGxvbmdlciByZXNlcnZlcyB0aGUgbWVtb3J5IGJl
bG93DQo+IHRoZSBrZXJuZWwsIHdoaWxlIHByb21fZnJlZV9wcm9tX21lbW9yeSgpIHN0aWxsIGZy
ZWVzIGl0Lg0KPiANCj4gRml4IHRoaXMgYnkgcmV2ZXJ0aW5nIGNvbW1pdCBiNjI2M2ZmMmQ2ZTU4
Y2MyICgiTUlQUzogVFh4OTogSW1wbGVtZW50DQo+IHByb21fZnJlZV9wcm9tX21lbW9yeSIpLg0K
PiANCj4gU3VnZ2VzdGVkLWJ5OiBTZXJnZSBTZW1pbiA8ZmFuY2VyLmxhbmNlckBnbWFpbC5jb20+
DQo+IEZpeGVzOiBiOTNkZGM0ZjkxNTYyMDVlICgibWlwczogUmVzZXJ2ZSBtZW1vcnkgZm9yIHRo
ZSBrZXJuZWwgaW1hZ2UgcmVzb3VyY2VzIikNCj4gU2lnbmVkLW9mZi1ieTogR2VlcnQgVXl0dGVy
aG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gUmV2aWV3ZWQtYnk6IEF0c3VzaGkgTmVt
b3RvIDxhbmVtb0BtYmEub2NuLm5lLmpwPg0KDQpBcHBsaWVkIHRvIG1pcHMtZml4ZXMuDQoNClRo
YW5rcywNCiAgICBQYXVsDQoNClsgVGhpcyBtZXNzYWdlIHdhcyBhdXRvLWdlbmVyYXRlZDsgaWYg
eW91IGJlbGlldmUgYW55dGhpbmcgaXMgaW5jb3JyZWN0DQogIHRoZW4gcGxlYXNlIGVtYWlsIHBh
dWwuYnVydG9uQG1pcHMuY29tIHRvIHJlcG9ydCBpdC4gXQ0K
