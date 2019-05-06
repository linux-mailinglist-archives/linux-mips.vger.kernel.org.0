Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0DDDF1543E
	for <lists+linux-mips@lfdr.de>; Mon,  6 May 2019 21:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbfEFTOZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 6 May 2019 15:14:25 -0400
Received: from mail-eopbgr730105.outbound.protection.outlook.com ([40.107.73.105]:18848
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726145AbfEFTOZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 6 May 2019 15:14:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VZniHIvFV4g87ZcWH7R2RiGWXVFUYRzo9R5yRE3Jdfk=;
 b=jauZjq9kobQzWMbJACVbwpCKw9ed7wMksJQcZ/6785Do17rBMUO6V3CBJSqexpKONFrDGvUa8Qx5+dAB4OzZkm8co0rbyMw+8sYN9GtEyNWWqi+dKw5zzBku1I2RPMCn1f42yGnmyWPWTe+M1XtLx6InPhvJS6TZd9YwGTUohN4=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.174.162.17) by
 MWHPR2201MB1710.namprd22.prod.outlook.com (10.164.206.152) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Mon, 6 May 2019 19:14:21 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::90ff:8d19:8459:834b]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::90ff:8d19:8459:834b%7]) with mapi id 15.20.1856.012; Mon, 6 May 2019
 19:14:21 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     Serge Semin <fancer.lancer@gmail.com>
CC:     Ralf Baechle <ralf@linux-mips.org>,
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
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 3/5] mips: Print the kernel virtual mem layout on
 debugging
Thread-Topic: [PATCH v2 3/5] mips: Print the kernel virtual mem layout on
 debugging
Thread-Index: AQHVAdjen1ZtC4ijSU6H00TkGOPWpqZefB4A
Date:   Mon, 6 May 2019 19:14:21 +0000
Message-ID: <20190506191419.w3qtkgcjrjjuzwmu@pburton-laptop>
References: <20190503175041.7949-1-fancer.lancer@gmail.com>
 <20190503175041.7949-4-fancer.lancer@gmail.com>
In-Reply-To: <20190503175041.7949-4-fancer.lancer@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR03CA0021.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::34) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:24::17)
user-agent: NeoMutt/20180716
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 71200244-a40b-4e69-1e65-08d6d2570b3a
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:MWHPR2201MB1710;
x-ms-traffictypediagnostic: MWHPR2201MB1710:
x-microsoft-antispam-prvs: <MWHPR2201MB1710752D97C6EB5BFB42F1B1C1300@MWHPR2201MB1710.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0029F17A3F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(7916004)(136003)(376002)(39840400004)(366004)(346002)(396003)(189003)(199004)(8936002)(33716001)(6506007)(386003)(66476007)(66556008)(64756008)(66446008)(76176011)(476003)(9686003)(6512007)(6246003)(229853002)(42882007)(186003)(4326008)(6116002)(81156014)(3846002)(81166006)(53936002)(71190400001)(2906002)(8676002)(1076003)(73956011)(66946007)(26005)(102836004)(71200400001)(44832011)(99286004)(446003)(14444005)(7736002)(7416002)(14454004)(68736007)(5660300002)(256004)(305945005)(478600001)(66066001)(6486002)(52116002)(11346002)(25786009)(54906003)(6916009)(486006)(58126008)(6436002)(316002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1710;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: hfDIzVrchINdFefuIkmlXWf4Irsf+VECltx9HxaRfq8S9gKimIQv2FM8XFdLcqE3I1S+7U2zSTf1ADtx0B4OsDBKW+p/TPyik4dxSmlttcj+qkMlwj3/LEczs0KQD50DDNW28Yfr3tflJqb00wbfCgeQ/a5+WF4oJGH4C7v0XcOnI1whTORwKn/GW6snZON3/Jg0H7MhLc2bftzSPOWbdA0+6lXPyNu7tMT6ZTaFzqhttZYYfvcZEcVZkJKp5/oSdotp2e6mwq51s99czvJXx7KhW2ut7EpUWAPyPUSgXaDqZNUNYHZXtuPyls1FzRS81WbzOmQMgYvkDXvnMmJJ2FNCgrl5xmtKn1nM95tvSxjSfx9xt1pBwGyi71ReABbZcKx+r7DJ4e3+dCAGINzOiBWkLAhQpIH0WHmQ0OjjzsU=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A2C18C92E5361A449F6EB74EB7056F22@namprd22.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71200244-a40b-4e69-1e65-08d6d2570b3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2019 19:14:21.4672
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1710
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

SGkgU2VyZ2UsDQoNCk9uIEZyaSwgTWF5IDAzLCAyMDE5IGF0IDA4OjUwOjM5UE0gKzAzMDAsIFNl
cmdlIFNlbWluIHdyb3RlOg0KPiBJdCBpcyB1c2VmdWwgYXQgbGVhc3QgZm9yIGRlYnVnZ2luZyB0
byBoYXZlIHRoZSBrZXJuZWwgdmlydHVhbA0KPiBtZW1vcnkgbGF5b3V0IHByaW50ZWQgYXQgYm9v
dCB0aW1lIHNvIHRvIGhhdmUgdGhlIGZ1bGwgaW5mb3JtYXRpb24NCj4gYWJvdXQgdGhlIGJvb3Rl
ZCBrZXJuZWwuIE1ha2UgdGhlIHByaW50aW5nIG9wdGlvbmFsIGFuZCBhdmFpbGFibGUNCj4gb25s
eSB3aGVuIERFQlVHX0tFUk5FTCBjb25maWcgaXMgZW5hYmxlZCBzbyBub3QgdG8gbGVhayBhIHNl
bnNpdGl2ZQ0KPiBrZXJuZWwgaW5mb3JtYXRpb24uDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTZXJn
ZSBTZW1pbiA8ZmFuY2VyLmxhbmNlckBnbWFpbC5jb20+DQo+IC0tLQ0KPiAgYXJjaC9taXBzL21t
L2luaXQuYyB8IDQ5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
Kw0KPiAgMSBmaWxlIGNoYW5nZWQsIDQ5IGluc2VydGlvbnMoKykNCg0KRllJIHRoZSByZXN0IG9m
IHRoZSBzZXJpZXMgaXMgaW4gbWlwcy1uZXh0LCBidXQgSSBsZWZ0IHRoaXMgb25lIG91dA0KYmVj
YXVzZSBpdCBnaXZlcyBtZSBjb21waWxlIGVycm9ycyBmb3IgNjRyNmVsX2RlZmNvbmZpZzoNCg0K
SW4gZmlsZSBpbmNsdWRlZCBmcm9tIC4vaW5jbHVkZS9saW51eC9wcmludGsuaDo3LA0KICAgICAg
ICAgICAgICAgICBmcm9tIC4vaW5jbHVkZS9saW51eC9rZXJuZWwuaDoxNSwNCiAgICAgICAgICAg
ICAgICAgZnJvbSAuL2luY2x1ZGUvYXNtLWdlbmVyaWMvYnVnLmg6MTgsDQogICAgICAgICAgICAg
ICAgIGZyb20gLi9hcmNoL21pcHMvaW5jbHVkZS9hc20vYnVnLmg6NDIsDQogICAgICAgICAgICAg
ICAgIGZyb20gLi9pbmNsdWRlL2xpbnV4L2J1Zy5oOjUsDQogICAgICAgICAgICAgICAgIGZyb20g
YXJjaC9taXBzL21tL2luaXQuYzoxMToNCmFyY2gvbWlwcy9tbS9pbml0LmM6IEluIGZ1bmN0aW9u
IOKAmG1lbV9wcmludF9rbWFwX2luZm/igJk6DQouL2luY2x1ZGUvbGludXgva2Vybl9sZXZlbHMu
aDo1OjE4OiBlcnJvcjogZm9ybWF0IOKAmCVsZOKAmSBleHBlY3RzIGFyZ3VtZW50IG9mIHR5cGUg
4oCYbG9uZyBpbnTigJksIGJ1dCBhcmd1bWVudCA0IGhhcyB0eXBlIOKAmGxvbmcgbG9uZyB1bnNp
Z25lZCBpbnTigJkgWy1XZXJyb3I9Zm9ybWF0PV0NCiAjZGVmaW5lIEtFUk5fU09IICJcMDAxIiAg
LyogQVNDSUkgU3RhcnQgT2YgSGVhZGVyICovDQogICAgICAgICAgICAgICAgICBefn5+fn4NCi4v
aW5jbHVkZS9saW51eC9rZXJuX2xldmVscy5oOjEzOjIxOiBub3RlOiBpbiBleHBhbnNpb24gb2Yg
bWFjcm8g4oCYS0VSTl9TT0jigJkNCiAjZGVmaW5lIEtFUk5fTk9USUNFIEtFUk5fU09IICI1IiAv
KiBub3JtYWwgYnV0IHNpZ25pZmljYW50IGNvbmRpdGlvbiAqLw0KICAgICAgICAgICAgICAgICAg
ICAgXn5+fn5+fn4NCi4vaW5jbHVkZS9saW51eC9wcmludGsuaDozMDc6OTogbm90ZTogaW4gZXhw
YW5zaW9uIG9mIG1hY3JvIOKAmEtFUk5fTk9USUNF4oCZDQogIHByaW50ayhLRVJOX05PVElDRSBw
cl9mbXQoZm10KSwgIyNfX1ZBX0FSR1NfXykNCiAgICAgICAgIF5+fn5+fn5+fn5+DQphcmNoL21p
cHMvbW0vaW5pdC5jOjY5OjI6IG5vdGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyDigJhwcl9ub3Rp
Y2XigJkNCiAgcHJfbm90aWNlKCJLZXJuZWwgdmlydHVhbCBtZW1vcnkgbGF5b3V0OlxuIg0KICBe
fn5+fn5+fn4NCmFyY2gvbWlwcy9tbS9pbml0LmM6NzA6Mzk6IG5vdGU6IGZvcm1hdCBzdHJpbmcg
aXMgZGVmaW5lZCBoZXJlDQogICAgICIgICAgbG93bWVtICA6IDB4JXB4IC0gMHglcHggICglNGxk
IE1CKVxuIg0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfn5+Xg0KICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJTRsbGQNCkluIGZpbGUgaW5jbHVkZWQgZnJv
bSAuL2FyY2gvbWlwcy9pbmNsdWRlL2FzbS9idWcuaDo1LA0KICAgICAgICAgICAgICAgICBmcm9t
IC4vaW5jbHVkZS9saW51eC9idWcuaDo1LA0KICAgICAgICAgICAgICAgICBmcm9tIGFyY2gvbWlw
cy9tbS9pbml0LmM6MTE6DQpJbiBmdW5jdGlvbiDigJhtZW1fcHJpbnRfa21hcF9pbmZv4oCZLA0K
ICAgIGlubGluZWQgZnJvbSDigJhtZW1faW5pdOKAmSBhdCBhcmNoL21pcHMvbW0vaW5pdC5jOjUz
MDoyOg0KLi9pbmNsdWRlL2xpbnV4L2NvbXBpbGVyLmg6MzQ0OjM4OiBlcnJvcjogY2FsbCB0byDi
gJhfX2NvbXBpbGV0aW1lX2Fzc2VydF85OeKAmSBkZWNsYXJlZCB3aXRoIGF0dHJpYnV0ZSBlcnJv
cjogQlVJTERfQlVHX09OIGZhaWxlZDogRklYQUREUl9UT1AgPCBQQUdFX09GRlNFVA0KICBfY29t
cGlsZXRpbWVfYXNzZXJ0KGNvbmRpdGlvbiwgbXNnLCBfX2NvbXBpbGV0aW1lX2Fzc2VydF8sIF9f
TElORV9fKQ0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeDQouL2luY2x1
ZGUvbGludXgvY29tcGlsZXIuaDozMjU6NDogbm90ZTogaW4gZGVmaW5pdGlvbiBvZiBtYWNybyDi
gJhfX2NvbXBpbGV0aW1lX2Fzc2VydOKAmQ0KICAgIHByZWZpeCAjIyBzdWZmaXgoKTsgICAgXA0K
ICAgIF5+fn5+fg0KLi9pbmNsdWRlL2xpbnV4L2NvbXBpbGVyLmg6MzQ0OjI6IG5vdGU6IGluIGV4
cGFuc2lvbiBvZiBtYWNybyDigJhfY29tcGlsZXRpbWVfYXNzZXJ04oCZDQogIF9jb21waWxldGlt
ZV9hc3NlcnQoY29uZGl0aW9uLCBtc2csIF9fY29tcGlsZXRpbWVfYXNzZXJ0XywgX19MSU5FX18p
DQogIF5+fn5+fn5+fn5+fn5+fn5+fn4NCi4vaW5jbHVkZS9saW51eC9idWlsZF9idWcuaDozOToz
Nzogbm90ZTogaW4gZXhwYW5zaW9uIG9mIG1hY3JvIOKAmGNvbXBpbGV0aW1lX2Fzc2VydOKAmQ0K
ICNkZWZpbmUgQlVJTERfQlVHX09OX01TRyhjb25kLCBtc2cpIGNvbXBpbGV0aW1lX2Fzc2VydCgh
KGNvbmQpLCBtc2cpDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+
fn5+fn5+fn5+fn5+DQouL2luY2x1ZGUvbGludXgvYnVpbGRfYnVnLmg6NTA6Mjogbm90ZTogaW4g
ZXhwYW5zaW9uIG9mIG1hY3JvIOKAmEJVSUxEX0JVR19PTl9NU0figJkNCiAgQlVJTERfQlVHX09O
X01TRyhjb25kaXRpb24sICJCVUlMRF9CVUdfT04gZmFpbGVkOiAiICNjb25kaXRpb24pDQogIF5+
fn5+fn5+fn5+fn5+fn4NCmFyY2gvbWlwcy9tbS9pbml0LmM6OTk6Mjogbm90ZTogaW4gZXhwYW5z
aW9uIG9mIG1hY3JvIOKAmEJVSUxEX0JVR19PTuKAmQ0KICBCVUlMRF9CVUdfT04oRklYQUREUl9U
T1AgPCBQQUdFX09GRlNFVCk7DQogIF5+fn5+fn5+fn5+fg0KY2MxOiBhbGwgd2FybmluZ3MgYmVp
bmcgdHJlYXRlZCBhcyBlcnJvcnMNCm1ha2VbM106ICoqKiBbc2NyaXB0cy9NYWtlZmlsZS5idWls
ZDoyNzg6IGFyY2gvbWlwcy9tbS9pbml0Lm9dIEVycm9yIDENCm1ha2VbMl06ICoqKiBbc2NyaXB0
cy9NYWtlZmlsZS5idWlsZDo0ODk6IGFyY2gvbWlwcy9tbV0gRXJyb3IgMg0KDQpUaGFua3MsDQog
ICAgUGF1bA0K
