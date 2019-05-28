Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A06A2CD11
	for <lists+linux-mips@lfdr.de>; Tue, 28 May 2019 19:05:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbfE1RFH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 28 May 2019 13:05:07 -0400
Received: from mail-eopbgr740138.outbound.protection.outlook.com ([40.107.74.138]:6077
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726600AbfE1RFG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 28 May 2019 13:05:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavesemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P8y8zpvR8eIaKBVFI/gn8od5yvKJPTrHdwCTyw9QYw4=;
 b=MZd312xuDnEQoXWldvCRHyWQQBulMNj3gr+yNIQFUcwG5f6u18bpBhsOq+derL9f6KhX1irc/zSQDJZ8MDsACI+cfoNBF4NYX/frXcb55het/yiH1aKMI1B9TvaRfg3h7ArJMQZWrCj/WCORYwUgwqJ+McNJS84AR3FxcQ4cNH8=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.174.162.17) by
 MWHPR2201MB1725.namprd22.prod.outlook.com (10.164.206.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1922.15; Tue, 28 May 2019 17:05:04 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::90ff:8d19:8459:834b]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::90ff:8d19:8459:834b%7]) with mapi id 15.20.1922.021; Tue, 28 May 2019
 17:05:04 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 2/2] MIPS: Make virt_addr_valid() return bool
Thread-Topic: [PATCH 2/2] MIPS: Make virt_addr_valid() return bool
Thread-Index: AQHVFXd+OhmrHtHwAUuhxD1EVo2LSw==
Date:   Tue, 28 May 2019 17:05:04 +0000
Message-ID: <20190528170444.1557-2-paul.burton@mips.com>
References: <20190528170444.1557-1-paul.burton@mips.com>
In-Reply-To: <20190528170444.1557-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR07CA0060.namprd07.prod.outlook.com
 (2603:10b6:a03:60::37) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:24::17)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.21.0
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: cd6ccf3a-b6e2-4e45-b7d9-08d6e38ea098
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:MWHPR2201MB1725;
x-ms-traffictypediagnostic: MWHPR2201MB1725:
x-microsoft-antispam-prvs: <MWHPR2201MB172584AD518E5ECA603B662BC11E0@MWHPR2201MB1725.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:883;
x-forefront-prvs: 00514A2FE6
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39840400004)(366004)(376002)(136003)(346002)(189003)(199004)(5640700003)(25786009)(2906002)(316002)(478600001)(71190400001)(71200400001)(476003)(2616005)(53936002)(446003)(186003)(486006)(11346002)(6916009)(14454004)(68736007)(305945005)(42882007)(2501003)(6436002)(6486002)(44832011)(26005)(4326008)(8676002)(3846002)(6116002)(107886003)(81156014)(81166006)(2351001)(5660300002)(52116002)(76176011)(1076003)(102836004)(7736002)(6512007)(6506007)(386003)(64756008)(99286004)(73956011)(66946007)(50226002)(66066001)(66476007)(66556008)(36756003)(66446008)(256004)(8936002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1725;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: FUw8NIpY/ozVtYQ96VN/6k2IV4n5QpJA7LcyM9MyeRrZVk0//ihCnUmSgszNYYPMasoQuBHtSt2L1WUP5iZD7ILGN+Bd94EBbKCip1VYztO7WETIUoiXtBQYvDz4cLY22GGJbXi3ioQfGwyLYzFNhjZ1Fh2giiPJbsWzkJVY5G/ba+YJGneL1Gf7XS6Py7eoQ66Z1YnG8awDpxw0uYyTQOSxT3yBpc7sdvIUyZJL4tZbVVQZAKyO6g1z6ies338dDjNV+0UV3YpGrPvGaR0GkwAX4oaVWzF1nMePRDG1Qkkz+HFYkxR3o6dT4ofR5A8HIV+nXbw32t7VG1Of5TRZ5dJzMmUaUpxp6XYjK//0QpkPRRJZvmu4gobhIdmxPf15R7DRcTWDeHRS09+LvT9nWfk6RQ3eDyFpp93iQxuWGHA=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd6ccf3a-b6e2-4e45-b7d9-08d6e38ea098
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2019 17:05:04.5483
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pburton@wavecomp.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1725
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

dmlydF9hZGRyX3ZhbGlkKCkgcmVhbGx5IHJldHVybnMgYSBib29sZWFuIHZhbHVlLCBidXQgY3Vy
cmVudGx5IHVzZXMgYW4NCmludGVnZXIgdG8gcmVwcmVzZW50IGl0LiBTd2l0Y2ggdG8gdGhlIGJv
b2wgdHlwZSB0byBtYWtlIGl0IGNsZWFyZXIgdGhhdA0Kd2UgcmVhbGx5IGFyZSByZXR1cm5pbmcg
YSB0cnVlIG9yIGZhbHNlIHZhbHVlLg0KDQpTaWduZWQtb2ZmLWJ5OiBQYXVsIEJ1cnRvbiA8cGF1
bC5idXJ0b25AbWlwcy5jb20+DQotLS0NCg0KIGFyY2gvbWlwcy9pbmNsdWRlL2FzbS9wYWdlLmgg
fCAyICstDQogYXJjaC9taXBzL21tL21tYXAuYyAgICAgICAgICB8IDQgKystLQ0KIDIgZmlsZXMg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEv
YXJjaC9taXBzL2luY2x1ZGUvYXNtL3BhZ2UuaCBiL2FyY2gvbWlwcy9pbmNsdWRlL2FzbS9wYWdl
LmgNCmluZGV4IDZiMzFjOTNiNWVhYS4uYTI1NjQzZDI1OGNiIDEwMDY0NA0KLS0tIGEvYXJjaC9t
aXBzL2luY2x1ZGUvYXNtL3BhZ2UuaA0KKysrIGIvYXJjaC9taXBzL2luY2x1ZGUvYXNtL3BhZ2Uu
aA0KQEAgLTI0OSw3ICsyNDksNyBAQCBzdGF0aWMgaW5saW5lIGludCBwZm5fdmFsaWQodW5zaWdu
ZWQgbG9uZyBwZm4pDQogI2RlZmluZSB2aXJ0X3RvX3BmbihrYWRkcikgICAJUEZOX0RPV04odmly
dF90b19waHlzKCh2b2lkICopKGthZGRyKSkpDQogI2RlZmluZSB2aXJ0X3RvX3BhZ2Uoa2FkZHIp
CXBmbl90b19wYWdlKHZpcnRfdG9fcGZuKGthZGRyKSkNCiANCi1leHRlcm4gaW50IF9fdmlydF9h
ZGRyX3ZhbGlkKGNvbnN0IHZvbGF0aWxlIHZvaWQgKmthZGRyKTsNCitleHRlcm4gYm9vbCBfX3Zp
cnRfYWRkcl92YWxpZChjb25zdCB2b2xhdGlsZSB2b2lkICprYWRkcik7DQogI2RlZmluZSB2aXJ0
X2FkZHJfdmFsaWQoa2FkZHIpCQkJCQkJXA0KIAlfX3ZpcnRfYWRkcl92YWxpZCgoY29uc3Qgdm9s
YXRpbGUgdm9pZCAqKSAoa2FkZHIpKQ0KIA0KZGlmZiAtLWdpdCBhL2FyY2gvbWlwcy9tbS9tbWFw
LmMgYi9hcmNoL21pcHMvbW0vbW1hcC5jDQppbmRleCA3NzU1YTFmYWQwNWEuLjUwZWU3MjEzYjQz
MiAxMDA2NDQNCi0tLSBhL2FyY2gvbWlwcy9tbS9tbWFwLmMNCisrKyBiL2FyY2gvbWlwcy9tbS9t
bWFwLmMNCkBAIC0yMDEsMTIgKzIwMSwxMiBAQCB1bnNpZ25lZCBsb25nIGFyY2hfcmFuZG9taXpl
X2JyayhzdHJ1Y3QgbW1fc3RydWN0ICptbSkNCiAJcmV0dXJuIHJldDsNCiB9DQogDQotaW50IF9f
dmlydF9hZGRyX3ZhbGlkKGNvbnN0IHZvbGF0aWxlIHZvaWQgKmthZGRyKQ0KK2Jvb2wgX192aXJ0
X2FkZHJfdmFsaWQoY29uc3Qgdm9sYXRpbGUgdm9pZCAqa2FkZHIpDQogew0KIAl1bnNpZ25lZCBs
b25nIHZhZGRyID0gKHVuc2lnbmVkIGxvbmcpdmFkZHI7DQogDQogCWlmICgodmFkZHIgPCBQQUdF
X09GRlNFVCkgfHwgKHZhZGRyID49IE1BUF9CQVNFKSkNCi0JCXJldHVybiAwOw0KKwkJcmV0dXJu
IGZhbHNlOw0KIA0KIAlyZXR1cm4gcGZuX3ZhbGlkKFBGTl9ET1dOKHZpcnRfdG9fcGh5cyhrYWRk
cikpKTsNCiB9DQotLSANCjIuMjEuMA0KDQo=
