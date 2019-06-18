Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96A274AD49
	for <lists+linux-mips@lfdr.de>; Tue, 18 Jun 2019 23:25:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730181AbfFRVZr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 18 Jun 2019 17:25:47 -0400
Received: from mail-eopbgr700136.outbound.protection.outlook.com ([40.107.70.136]:12412
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730102AbfFRVZq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 18 Jun 2019 17:25:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zvpdZ2pPhzG/3ieOMAa+irgqt0s0wfVKeF1mfzC00UQ=;
 b=HZAjCSKLQ8/5igWdZQzBgZZx5PQmClGlB/zzb01xsmXMS1QQhKUvIH106RdBnBCPkzji7yjTJnPfxV8JVMbATFYYEXKJo1ZkJTPI3srgtssCximGW8koWtg0tQIxHkaA2wlJXflXw9H6p+rBhKvjepcJ/pgn4BgUeZMUqkvvrBs=
Received: from CY4PR22MB0245.namprd22.prod.outlook.com (10.169.184.140) by
 CY4PR22MB0904.namprd22.prod.outlook.com (10.171.168.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1987.15; Tue, 18 Jun 2019 21:25:43 +0000
Received: from CY4PR22MB0245.namprd22.prod.outlook.com
 ([fe80::485f:8a3b:54d1:5bce]) by CY4PR22MB0245.namprd22.prod.outlook.com
 ([fe80::485f:8a3b:54d1:5bce%4]) with mapi id 15.20.1987.014; Tue, 18 Jun 2019
 21:25:43 +0000
From:   Dmitry Korotin <dkorotin@wavecomp.com>
To:     Paul Burton <pburton@wavecomp.com>
CC:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        Dmitry Korotin <dkorotin@wavecomp.com>
Subject: [PATCH] pte_special()/pte_mkspecial() support added.
Thread-Topic: [PATCH] pte_special()/pte_mkspecial() support added.
Thread-Index: AQHVJhxiFj4Vd2DAQk+q0ZxAK6DWBw==
Date:   Tue, 18 Jun 2019 21:25:43 +0000
Message-ID: <CY4PR22MB02459E11B2FD5E241F8C30C2AFEA0@CY4PR22MB0245.namprd22.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR08CA0072.namprd08.prod.outlook.com
 (2603:10b6:a03:117::49) To CY4PR22MB0245.namprd22.prod.outlook.com
 (2603:10b6:903:11::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=dkorotin@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [216.35.128.4]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7ce3409a-3a75-4237-44f7-08d6f4338440
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:CY4PR22MB0904;
x-ms-traffictypediagnostic: CY4PR22MB0904:
x-microsoft-antispam-prvs: <CY4PR22MB0904FD208169486663C8F14BAFEA0@CY4PR22MB0904.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2331;
x-forefront-prvs: 007271867D
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(136003)(39850400004)(376002)(366004)(346002)(189003)(199004)(486006)(71190400001)(305945005)(14454004)(71200400001)(86362001)(68736007)(74316002)(7736002)(52536014)(8936002)(81166006)(8676002)(81156014)(66446008)(107886003)(4326008)(66556008)(9686003)(55016002)(6436002)(53936002)(6636002)(478600001)(66066001)(66476007)(5660300002)(73956011)(54906003)(316002)(52116002)(26005)(256004)(102836004)(6862004)(7696005)(64756008)(99286004)(25786009)(66946007)(6506007)(386003)(476003)(3846002)(33656002)(6116002)(186003)(2906002);DIR:OUT;SFP:1102;SCL:1;SRVR:CY4PR22MB0904;H:CY4PR22MB0245.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: HiK6dtFDyOb8xTB+Bm83iwtP2Aoe0HaXb7FPGm1tyMYtTkquWOBp6xB9U/PCibp2l9dm0WatVz1KLPUXn5WZSX6puDxZJyxVS8Mwytl5y+es9r20T3Mcj0prpSldyh+HDBT8UsRPK53vGflhzjVgLIcYL0NG5UzWuFUOjYajnLahImUSSJHv6mRDr0AD96GxRtQxliop2p/q8Ua7Nd/mrFUynIPxvCwB82SPwLqgG+0YGLG+hevjPhVft/w4W88XG9+YUiE2xqbb9Myxq0w+yszAQ60VnVMZQnNQvVyAl4R8CgSl0bIKk8XHbBq+Uui9k/I0XixHLP1V7aFG00LMNHMH+jTyCwEfgvQYsfB24urzpwaH3s+8UnFhjDv9bdUG2AHtjs5c7we+8DWa4+vPcUp/t5Q/XKxXh044md82xBs=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: wavecomp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ce3409a-3a75-4237-44f7-08d6f4338440
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2019 21:25:43.5311
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dkorotin@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR22MB0904
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

ICAgIHB0ZV9zcGVjaWFsKCkvcHRlX21rc3BlY2lhbCgpIHN1cHBvcnQgYWRkZWQuDQoNClNpZ25l
ZC1vZmYtYnk6IERtaXRyeSBLb3JvdGluIDxka29yb3RpbkB3YXZlY29tcC5jb20+DQotLS0NCiBh
cmNoL21pcHMvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgfCAgICAxICsNCiBhcmNoL21pcHMv
aW5jbHVkZS9hc20vcGd0YWJsZS1iaXRzLmggfCAgICA1ICsrKysrDQogYXJjaC9taXBzL2luY2x1
ZGUvYXNtL3BndGFibGUuaCAgICAgIHwgICAxMyArKysrKysrKysrKy0tDQogMyBmaWxlcyBjaGFu
Z2VkLCAxNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvYXJj
aC9taXBzL0tjb25maWcgYi9hcmNoL21pcHMvS2NvbmZpZw0KaW5kZXggNzBkMzIwMC4uMGE0Njk5
NSAxMDA2NDQNCi0tLSBhL2FyY2gvbWlwcy9LY29uZmlnDQorKysgYi9hcmNoL21pcHMvS2NvbmZp
Zw0KQEAgLTgwLDYgKzgwLDcgQEAgY29uZmlnIE1JUFMNCiAJc2VsZWN0IFJUQ19MSUINCiAJc2Vs
ZWN0IFNZU0NUTF9FWENFUFRJT05fVFJBQ0UNCiAJc2VsZWN0IFZJUlRfVE9fQlVTDQorCXNlbGVj
dCBBUkNIX0hBU19QVEVfU1BFQ0lBTA0KIA0KIG1lbnUgIk1hY2hpbmUgc2VsZWN0aW9uIg0KIA0K
ZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9pbmNsdWRlL2FzbS9wZ3RhYmxlLWJpdHMuaCBiL2FyY2gv
bWlwcy9pbmNsdWRlL2FzbS9wZ3RhYmxlLWJpdHMuaA0KaW5kZXggZjg4YTQ4Yy4uZTAxNThhZiAx
MDA2NDQNCi0tLSBhL2FyY2gvbWlwcy9pbmNsdWRlL2FzbS9wZ3RhYmxlLWJpdHMuaA0KKysrIGIv
YXJjaC9taXBzL2luY2x1ZGUvYXNtL3BndGFibGUtYml0cy5oDQpAQCAtNTIsNiArNTIsNyBAQCBl
bnVtIHBndGFibGVfYml0cyB7DQogCV9QQUdFX1dSSVRFX1NISUZULA0KIAlfUEFHRV9BQ0NFU1NF
RF9TSElGVCwNCiAJX1BBR0VfTU9ESUZJRURfU0hJRlQsDQorCV9QQUdFX1NQRUNJQUxfU0hJRlQs
DQogfTsNCiANCiAvKg0KQEAgLTc4LDYgKzc5LDcgQEAgZW51bSBwZ3RhYmxlX2JpdHMgew0KIAlf
UEFHRV9XUklURV9TSElGVCwNCiAJX1BBR0VfQUNDRVNTRURfU0hJRlQsDQogCV9QQUdFX01PRElG
SUVEX1NISUZULA0KKwlfUEFHRV9TUEVDSUFMX1NISUZULA0KIH07DQogDQogI2VsaWYgZGVmaW5l
ZChDT05GSUdfQ1BVX1IzMDAwKSB8fCBkZWZpbmVkKENPTkZJR19DUFVfVFgzOVhYKQ0KQEAgLTkw
LDYgKzkyLDcgQEAgZW51bSBwZ3RhYmxlX2JpdHMgew0KIAlfUEFHRV9XUklURV9TSElGVCwNCiAJ
X1BBR0VfQUNDRVNTRURfU0hJRlQsDQogCV9QQUdFX01PRElGSUVEX1NISUZULA0KKwlfUEFHRV9T
UEVDSUFMX1NISUZULA0KIA0KIAkvKiBVc2VkIGJ5IFRMQiBoYXJkd2FyZSAocGxhY2VkIGluIEVu
dHJ5TG8pICovDQogCV9QQUdFX0dMT0JBTF9TSElGVCA9IDgsDQpAQCAtMTEzLDYgKzExNiw3IEBA
IGVudW0gcGd0YWJsZV9iaXRzIHsNCiAjaWYgZGVmaW5lZChDT05GSUdfNjRCSVQpICYmIGRlZmlu
ZWQoQ09ORklHX01JUFNfSFVHRV9UTEJfU1VQUE9SVCkNCiAJX1BBR0VfSFVHRV9TSElGVCwNCiAj
ZW5kaWYNCisJX1BBR0VfU1BFQ0lBTF9TSElGVCwNCiANCiAJLyogVXNlZCBieSBUTEIgaGFyZHdh
cmUgKHBsYWNlZCBpbiBFbnRyeUxvKikgKi8NCiAjaWYgZGVmaW5lZChDT05GSUdfQ1BVX0hBU19S
SVhJKQ0KQEAgLTEzNSw2ICsxMzksNyBAQCBlbnVtIHBndGFibGVfYml0cyB7DQogI2lmIGRlZmlu
ZWQoQ09ORklHXzY0QklUKSAmJiBkZWZpbmVkKENPTkZJR19NSVBTX0hVR0VfVExCX1NVUFBPUlQp
DQogIyBkZWZpbmUgX1BBR0VfSFVHRQkJKDEgPDwgX1BBR0VfSFVHRV9TSElGVCkNCiAjZW5kaWYN
CisjZGVmaW5lIF9QQUdFX1NQRUNJQUwJCSgxIDw8IF9QQUdFX1NQRUNJQUxfU0hJRlQpDQogDQog
LyogVXNlZCBieSBUTEIgaGFyZHdhcmUgKHBsYWNlZCBpbiBFbnRyeUxvKikgKi8NCiAjaWYgZGVm
aW5lZChDT05GSUdfWFBBKQ0KZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9pbmNsdWRlL2FzbS9wZ3Rh
YmxlLmggYi9hcmNoL21pcHMvaW5jbHVkZS9hc20vcGd0YWJsZS5oDQppbmRleCA0Y2NiNDY1Li5h
YjY2ODQ0IDEwMDY0NA0KLS0tIGEvYXJjaC9taXBzL2luY2x1ZGUvYXNtL3BndGFibGUuaA0KKysr
IGIvYXJjaC9taXBzL2luY2x1ZGUvYXNtL3BndGFibGUuaA0KQEAgLTM5Myw4ICszOTMsMTcgQEAg
c3RhdGljIGlubGluZSBwdGVfdCBwdGVfbWtodWdlKHB0ZV90IHB0ZSkNCiB9DQogI2VuZGlmIC8q
IENPTkZJR19NSVBTX0hVR0VfVExCX1NVUFBPUlQgKi8NCiAjZW5kaWYNCi1zdGF0aWMgaW5saW5l
IGludCBwdGVfc3BlY2lhbChwdGVfdCBwdGUpCXsgcmV0dXJuIDA7IH0NCi1zdGF0aWMgaW5saW5l
IHB0ZV90IHB0ZV9ta3NwZWNpYWwocHRlX3QgcHRlKQl7IHJldHVybiBwdGU7IH0NCisNCitzdGF0
aWMgaW5saW5lIGludCBwdGVfc3BlY2lhbChwdGVfdCBwdGUpDQorew0KKwlyZXR1cm4gcHRlX3Zh
bChwdGUpICYgX1BBR0VfU1BFQ0lBTDsNCit9DQorDQorc3RhdGljIGlubGluZSBwdGVfdCBwdGVf
bWtzcGVjaWFsKHB0ZV90IHB0ZSkNCit7DQorCXB0ZV92YWwocHRlKSB8PSBfUEFHRV9TUEVDSUFM
Ow0KKwlyZXR1cm4gcHRlOw0KK30NCiANCiAvKg0KICAqIE1hY3JvIHRvIG1ha2UgbWFyayBhIHBh
Z2UgcHJvdGVjdGlvbiB2YWx1ZSBhcyAidW5jYWNoZWFibGUiLgkgTm90ZQ0KLS0gDQoxLjcuMQ0K
DQo=
