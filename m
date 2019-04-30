Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39841102E1
	for <lists+linux-mips@lfdr.de>; Wed,  1 May 2019 00:54:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726102AbfD3WyJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Apr 2019 18:54:09 -0400
Received: from mail-eopbgr730126.outbound.protection.outlook.com ([40.107.73.126]:52512
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726412AbfD3WyJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 30 Apr 2019 18:54:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qtbz6mE49FpnGim7EJath83x1e4VFruX9FPcZup/oR4=;
 b=HkJQR3846M/2DHy9XeeHoJRMSXA61Aj55Yl+H3tRnXVwlTaxwzRl6xt6R7bZGD8FyFZBmQkfSJePlGVvgegHTm5aX7w7sjx6sh0nsmZXVZxi71cA110lpOHDsPfoWmxBMwedXUgA/WfD0WPQynT3b0X6LWRMDk/tt+mB6r70RbU=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.174.162.17) by
 MWHPR2201MB1744.namprd22.prod.outlook.com (10.164.206.162) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.13; Tue, 30 Apr 2019 22:53:32 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::b9d6:bf19:ec58:2765]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::b9d6:bf19:ec58:2765%7]) with mapi id 15.20.1835.018; Tue, 30 Apr 2019
 22:53:32 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 4/4] MIPS: Remove duplicate EBase configuration
Thread-Topic: [PATCH 4/4] MIPS: Remove duplicate EBase configuration
Thread-Index: AQHU/6eIV2nSYKWR60CEA4kuJGhSYA==
Date:   Tue, 30 Apr 2019 22:53:31 +0000
Message-ID: <20190430225216.7164-5-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 85bac6ef-4f85-406d-d5ca-08d6cdbeaae7
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:MWHPR2201MB1744;
x-ms-traffictypediagnostic: MWHPR2201MB1744:
x-microsoft-antispam-prvs: <MWHPR2201MB17443196D25504CCD3583F4CC13A0@MWHPR2201MB1744.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(346002)(136003)(376002)(396003)(39850400004)(366004)(199004)(189003)(3846002)(81166006)(81156014)(8676002)(2351001)(71190400001)(68736007)(50226002)(71200400001)(5660300002)(6512007)(53936002)(6486002)(107886003)(6916009)(6116002)(5640700003)(4326008)(8936002)(2906002)(6436002)(36756003)(256004)(44832011)(54906003)(76176011)(66476007)(66946007)(64756008)(6506007)(66556008)(73956011)(99286004)(42882007)(52116002)(478600001)(476003)(186003)(66066001)(11346002)(2501003)(102836004)(305945005)(25786009)(7736002)(26005)(316002)(14454004)(446003)(1076003)(2616005)(66446008)(486006)(386003)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1744;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FqXbmZDpotBxwXqOzsCFjVADDndoRVUDJLKXukXHBQdIzSmyy3vykvRp+gNClTtasTI/lOLIBEsjE5T5ILrsITPRIZSNryQJtSkVDEl4rlW1MQdLHb33ux7H6YyYPpG1wCK3vlGM1kj4PpxTj245AuWQs67c8JnctZ6JK98yo4i26Y4TVyK0yzmUHWJlWroE0Di4IBnOZwv04VeGaDm5e/ef46kC1zyfRLYp4mWbcEH6hg0xvPwR+8oVehAdfynqceEgXl0owEEoU1gFQaZQO1rBCMkbvRiaXm1euBbDaz/zFNHzLDI5tR79kWExK8PVZfm+SamOgqI56xsIHV8EYG7kaPhKKe7nkFiTAW+3npusXwLLDv64KckmR8SJ4VUuE7wd+zcMvZ6eC3ZjQWutocbGBOEtzIcmEdZFFMdyRtM=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85bac6ef-4f85-406d-d5ca-08d6cdbeaae7
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 22:53:31.7376
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1744
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Q2xlYW4gdXAgb3VyIGNvbmZpZ3VyYXRpb24gb2YgdGhlIEVCYXNlIHJlZ2lzdGVyIGJ5IG1ha2lu
Zw0KY29uZmlndXJlX2V4Y2VwdGlvbl92ZWN0b3IoKSB3cml0ZSB0byBpdCB1bmNvbmRpdGlvbmFs
bHkgb24gc3lzdGVtcw0KaW1wbGVtZW50aW5nIE1JUFNyMiBvciBoaWdoZXIsIGFuZCByZW1vdmlu
ZyB0aGUgZHVwbGljYXRlIGNvZGUgaW4NCnBlcl9jcHVfdHJhcF9pbml0KCkuIFRoZSBsYXR0ZXIg
d291bGQgaGF2ZSBkdXBsaWNhdGVkIHdvcmsgb24gc3lzdGVtcw0Kd2l0aCB2ZWN0b3JlZCBpbnRl
cnJ1cHRzLCBhbmQgZGlkbid0IHNldCBCRVYgZm9yIHNhZmV0eSBsaWtlIHRoZQ0KY29uZmlndXJl
X2V4Y2VwdGlvbl92ZWN0b3IoKSB2ZXJzaW9uIG9mIHRoZSBjb2RlIGRvZXMuDQoNClNpZ25lZC1v
ZmYtYnk6IFBhdWwgQnVydG9uIDxwYXVsLmJ1cnRvbkBtaXBzLmNvbT4NCi0tLQ0KIGFyY2gvbWlw
cy9rZXJuZWwvdHJhcHMuYyB8IDIwICsrKy0tLS0tLS0tLS0tLS0tLS0tDQogMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9hcmNo
L21pcHMva2VybmVsL3RyYXBzLmMgYi9hcmNoL21pcHMva2VybmVsL3RyYXBzLmMNCmluZGV4IDI3
NzUxOTBhZGJlNy4uYzUyNzY2YTViODVmIDEwMDY0NA0KLS0tIGEvYXJjaC9taXBzL2tlcm5lbC90
cmFwcy5jDQorKysgYi9hcmNoL21pcHMva2VybmVsL3RyYXBzLmMNCkBAIC0yMTUxLDcgKzIxNTEs
NyBAQCBzdGF0aWMgdm9pZCBjb25maWd1cmVfaHdyZW5hKHZvaWQpDQogDQogc3RhdGljIHZvaWQg
Y29uZmlndXJlX2V4Y2VwdGlvbl92ZWN0b3Iodm9pZCkNCiB7DQotCWlmIChjcHVfaGFzX3ZlaWMg
fHwgY3B1X2hhc192aW50KSB7DQorCWlmIChjcHVfaGFzX21pcHNfcjJfcjYpIHsNCiAJCXVuc2ln
bmVkIGxvbmcgc3IgPSBzZXRfYzBfc3RhdHVzKFNUMF9CRVYpOw0KIAkJLyogSWYgYXZhaWxhYmxl
LCB1c2UgV0cgdG8gc2V0IHRvcCBiaXRzIG9mIEVCQVNFICovDQogCQlpZiAoY3B1X2hhc19lYmFz
ZV93Zykgew0KQEAgLTIxNjMsNiArMjE2Myw4IEBAIHN0YXRpYyB2b2lkIGNvbmZpZ3VyZV9leGNl
cHRpb25fdmVjdG9yKHZvaWQpDQogCQl9DQogCQl3cml0ZV9jMF9lYmFzZShlYmFzZSk7DQogCQl3
cml0ZV9jMF9zdGF0dXMoc3IpOw0KKwl9DQorCWlmIChjcHVfaGFzX3ZlaWMgfHwgY3B1X2hhc192
aW50KSB7DQogCQkvKiBTZXR0aW5nIHZlY3RvciBzcGFjaW5nIGVuYWJsZXMgRUkvVkkgbW9kZSAg
Ki8NCiAJCWNoYW5nZV9jMF9pbnRjdGwoMHgzZTAsIFZFQ1RPUlNQQUNJTkcpOw0KIAl9DQpAQCAt
MjE5MywyMiArMjE5NSw2IEBAIHZvaWQgcGVyX2NwdV90cmFwX2luaXQoYm9vbCBpc19ib290X2Nw
dSkNCiAJICogIG8gcmVhZCBJbnRDdGwuSVBGREMgdG8gZGV0ZXJtaW5lIHRoZSBmYXN0IGRlYnVn
IGNoYW5uZWwgaW50ZXJydXB0DQogCSAqLw0KIAlpZiAoY3B1X2hhc19taXBzX3IyX3I2KSB7DQot
CQkvKg0KLQkJICogV2Ugc2hvdWxkbid0IHRydXN0IGEgc2Vjb25kYXJ5IGNvcmUgaGFzIGEgc2Fu
ZSBFQkFTRSByZWdpc3Rlcg0KLQkJICogc28gdXNlIHRoZSBvbmUgY2FsY3VsYXRlZCBieSB0aGUg
Ym9vdCBDUFUuDQotCQkgKi8NCi0JCWlmICghaXNfYm9vdF9jcHUpIHsNCi0JCQkvKiBJZiBhdmFp
bGFibGUsIHVzZSBXRyB0byBzZXQgdG9wIGJpdHMgb2YgRUJBU0UgKi8NCi0JCQlpZiAoY3B1X2hh
c19lYmFzZV93Zykgew0KLSNpZmRlZiBDT05GSUdfNjRCSVQNCi0JCQkJd3JpdGVfYzBfZWJhc2Vf
NjQoZWJhc2UgfCBNSVBTX0VCQVNFX1dHKTsNCi0jZWxzZQ0KLQkJCQl3cml0ZV9jMF9lYmFzZShl
YmFzZSB8IE1JUFNfRUJBU0VfV0cpOw0KLSNlbmRpZg0KLQkJCX0NCi0JCQl3cml0ZV9jMF9lYmFz
ZShlYmFzZSk7DQotCQl9DQotDQogCQljcDBfY29tcGFyZV9pcnFfc2hpZnQgPSBDQVVTRUJfVEkg
LSBDQVVTRUJfSVA7DQogCQljcDBfY29tcGFyZV9pcnEgPSAocmVhZF9jMF9pbnRjdGwoKSA+PiBJ
TlRDVExCX0lQVEkpICYgNzsNCiAJCWNwMF9wZXJmY291bnRfaXJxID0gKHJlYWRfYzBfaW50Y3Rs
KCkgPj4gSU5UQ1RMQl9JUFBDSSkgJiA3Ow0KLS0gDQoyLjIxLjANCg0K
