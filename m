Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D1CF5102D8
	for <lists+linux-mips@lfdr.de>; Wed,  1 May 2019 00:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727012AbfD3Wxf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Apr 2019 18:53:35 -0400
Received: from mail-eopbgr800137.outbound.protection.outlook.com ([40.107.80.137]:36205
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727341AbfD3Wxf (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 30 Apr 2019 18:53:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eHheTCa2/fHIVf1dPrBgm4mO/6qR/YdcpjibyC8ZHas=;
 b=cFvHj283wUQ0FQEcEeyKknFhcixzlCtwhsmv/BlbFAAJTh7kcbonVTvjQY5ZRwJPJwI3EtDoRRg2Tw1VUekZDXAmxRzW03mXSpaG3ADktSj62nGyEVCpkRNjGIqW4NTG2ZMPUmz0RXgK+5bYkU6mOjf5LZyDhq54XSwrji2uttM=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.174.162.17) by
 MWHPR2201MB1197.namprd22.prod.outlook.com (10.174.169.160) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.18; Tue, 30 Apr 2019 22:53:30 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::b9d6:bf19:ec58:2765]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::b9d6:bf19:ec58:2765%7]) with mapi id 15.20.1835.018; Tue, 30 Apr 2019
 22:53:30 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 1/4] MIPS: Use memblock_phys_alloc() for exception vector
Thread-Topic: [PATCH 1/4] MIPS: Use memblock_phys_alloc() for exception vector
Thread-Index: AQHU/6eHQ/g7IE/wjkmbMM+qxRJ3+Q==
Date:   Tue, 30 Apr 2019 22:53:30 +0000
Message-ID: <20190430225216.7164-2-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 228d3ee5-1a64-4378-befb-08d6cdbea9f0
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:MWHPR2201MB1197;
x-ms-traffictypediagnostic: MWHPR2201MB1197:
x-microsoft-antispam-prvs: <MWHPR2201MB1197D68B83355AE2A43D743DC13A0@MWHPR2201MB1197.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1417;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(376002)(39840400004)(346002)(396003)(366004)(189003)(199004)(53936002)(305945005)(486006)(11346002)(186003)(42882007)(446003)(2616005)(7736002)(6512007)(6916009)(107886003)(44832011)(476003)(76176011)(99286004)(6436002)(5640700003)(14454004)(3846002)(25786009)(52116002)(2906002)(102836004)(2501003)(6116002)(6506007)(386003)(66446008)(66556008)(26005)(2351001)(66946007)(73956011)(66476007)(50226002)(64756008)(316002)(6486002)(66066001)(54906003)(4326008)(81156014)(8936002)(71190400001)(81166006)(256004)(8676002)(1076003)(36756003)(71200400001)(68736007)(5660300002)(478600001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1197;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: YkkWACjrbHZlf3V4bwpnRGHBxQupRzVQk+Dj92yP+Qo0rC+qn1tINkcqUQh4aBXvVGgIkk57jNoRFarRSquLqx+v08InTrwIKY6wRcm5HASBUGWc0G+ts0eBnSXy3CoYaYSoUlwtDKFsrl8krKX9LzAlZR+eM7IkONvuc/WD1P5kXS4NHKB0Iwi2CHvI1ansQb3kHDNqrx8uliiV8AJ7cZUzIlL1u4Vyi0ikVaBTMqCit+2H8fNH+AQln2DjLAL80Q0xLovHZJ26Vzxuoei1j97ISJGk79KvFLTV+zLJM8WbiZMCBvj519D957ivs/a+JzbqFPp1rGPLlb84WYob46m6wTq106cKUHFHgw/IelRvx/j2bb8n8OWrMx3fMnIiWDgVQ8YhxppamOAKaWecUJKUZ5xH/UXHadGLMvyia9Q=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 228d3ee5-1a64-4378-befb-08d6cdbea9f0
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 22:53:30.1073
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1197
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

QWxsb2NhdGUgdGhlIGV4Y2VwdGlvbiB2ZWN0b3IgdXNpbmcgbWVtYmxvY2tfcGh5c19hbGxvYygp
IHdoaWNoIGdpdmVzIHVzDQphIHBoeXNpY2FsIGFkZHJlc3MsIHJhdGhlciB0aGFuIHRoZSBwcmV2
aW91cyBjb252b2x1dGVkIHNldHVwIHdoaWNoDQpvYnRhaW5lZCBhIHZpcnR1YWwgYWRkcmVzcyB1
c2luZyBtZW1ibG9ja19hbGxvYygpLCBjb252ZXJ0ZWQgaXQgdG8gYQ0KcGh5c2ljYWwgYWRkcmVz
cyAmIHRoZW4gYmFjayB0byBhIHZpcnR1YWwgYWRkcmVzcy4NCg0KU2lnbmVkLW9mZi1ieTogUGF1
bCBCdXJ0b24gPHBhdWwuYnVydG9uQG1pcHMuY29tPg0KLS0tDQogYXJjaC9taXBzL2tlcm5lbC90
cmFwcy5jIHwgOCArKysrLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQg
ZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9hcmNoL21pcHMva2VybmVsL3RyYXBzLmMgYi9h
cmNoL21pcHMva2VybmVsL3RyYXBzLmMNCmluZGV4IDk4Y2E1NWQ2MjIwMS4uMDBmNDRiMTYzODVl
IDEwMDY0NA0KLS0tIGEvYXJjaC9taXBzL2tlcm5lbC90cmFwcy5jDQorKysgYi9hcmNoL21pcHMv
a2VybmVsL3RyYXBzLmMNCkBAIC0yMjkyLDkgKzIyOTIsOCBAQCB2b2lkIF9faW5pdCB0cmFwX2lu
aXQodm9pZCkNCiAJCXVuc2lnbmVkIGxvbmcgc2l6ZSA9IDB4MjAwICsgVkVDVE9SU1BBQ0lORyo2
NDsNCiAJCXBoeXNfYWRkcl90IGViYXNlX3BhOw0KIA0KLQkJZWJhc2UgPSAodW5zaWduZWQgbG9u
ZykNCi0JCQltZW1ibG9ja19hbGxvYyhzaXplLCAxIDw8IGZscyhzaXplKSk7DQotCQlpZiAoIWVi
YXNlKQ0KKwkJZWJhc2VfcGEgPSBtZW1ibG9ja19waHlzX2FsbG9jKHNpemUsIDEgPDwgZmxzKHNp
emUpKTsNCisJCWlmICghZWJhc2VfcGEpDQogCQkJcGFuaWMoIiVzOiBGYWlsZWQgdG8gYWxsb2Nh
dGUgJWx1IGJ5dGVzIGFsaWduPTB4JXhcbiIsDQogCQkJICAgICAgX19mdW5jX18sIHNpemUsIDEg
PDwgZmxzKHNpemUpKTsNCiANCkBAIC0yMzA5LDkgKzIzMDgsMTAgQEAgdm9pZCBfX2luaXQgdHJh
cF9pbml0KHZvaWQpDQogCQkgKiBFVkEgaXMgc3BlY2lhbCB0aG91Z2ggYXMgaXQgYWxsb3dzIHNl
Z21lbnRzIHRvIGJlIHJlYXJyYW5nZWQNCiAJCSAqIGFuZCB0byBiZWNvbWUgdW5jYWNoZWQgZHVy
aW5nIGNhY2hlIGVycm9yIGhhbmRsaW5nLg0KIAkJICovDQotCQllYmFzZV9wYSA9IF9fcGEoZWJh
c2UpOw0KIAkJaWYgKCFJU19FTkFCTEVEKENPTkZJR19FVkEpICYmICFXQVJOX09OKGViYXNlX3Bh
ID49IDB4MjAwMDAwMDApKQ0KIAkJCWViYXNlID0gQ0tTRUcwQUREUihlYmFzZV9wYSk7DQorCQll
bHNlDQorCQkJZWJhc2UgPSAodW5zaWduZWQgbG9uZylwaHlzX3RvX3ZpcnQoZWJhc2VfcGEpOw0K
IAl9IGVsc2Ugew0KIAkJZWJhc2UgPSBDQUNfQkFTRTsNCiANCi0tIA0KMi4yMS4wDQoNCg==
