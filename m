Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4D77102E0
	for <lists+linux-mips@lfdr.de>; Wed,  1 May 2019 00:54:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726974AbfD3WyH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Apr 2019 18:54:07 -0400
Received: from mail-eopbgr730126.outbound.protection.outlook.com ([40.107.73.126]:52512
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726102AbfD3WyH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 30 Apr 2019 18:54:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jOVOClPsaYOvNrs4HjbWcacOMZzOBwZz5RYJ6ECMzJU=;
 b=GBnRGDstubUCMt9pCumkKeZafAeqSc1LBOX+3CLqCJ/wnulNk0N+2e49+AsvNJXUljo+MuM9Fmp3y36gxvTMDHmKd5EfXK+d0yDw5IgOMLaBYTEixUvWvCNd53d6E5FHh+iuWGVFGeHs2mgChM+mFKxs9BdScYHrPsKZZeMlgps=
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
Subject: [PATCH 3/4] MIPS: Sync icache for whole exception vector
Thread-Topic: [PATCH 3/4] MIPS: Sync icache for whole exception vector
Thread-Index: AQHU/6eIsEP9mm7E+E+1tnr7zP0YIw==
Date:   Tue, 30 Apr 2019 22:53:31 +0000
Message-ID: <20190430225216.7164-4-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 0c8f69d0-6e86-4f73-bab0-08d6cdbeaa79
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:MWHPR2201MB1744;
x-ms-traffictypediagnostic: MWHPR2201MB1744:
x-microsoft-antispam-prvs: <MWHPR2201MB1744AF007EB8AD7DABCB8D43C13A0@MWHPR2201MB1744.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(346002)(136003)(376002)(396003)(39850400004)(366004)(199004)(189003)(3846002)(81166006)(81156014)(8676002)(2351001)(71190400001)(68736007)(50226002)(71200400001)(5660300002)(6512007)(53936002)(6486002)(14444005)(107886003)(6916009)(6116002)(5640700003)(4326008)(8936002)(2906002)(6436002)(36756003)(256004)(44832011)(54906003)(76176011)(66476007)(66946007)(64756008)(6506007)(66556008)(73956011)(99286004)(42882007)(52116002)(478600001)(476003)(4744005)(186003)(66066001)(11346002)(2501003)(102836004)(305945005)(25786009)(7736002)(26005)(316002)(14454004)(446003)(1076003)(2616005)(66446008)(486006)(386003)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1744;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2D5hKcJ13yn8COx0tzUT31Y/ZtuldgcMLbCr0fLanrCJF0Y2KATKm2Vu4CUzK1ce+fDRp6TiM2nEKv48zkkvLy6Q72XgEt3/viLUJL7fiLs50D6G7neOSha+WYOIXkmA9Ku81Bn6Fy1CNZMjt0ph920Igq61IROXDPOBQJSUeznVDaQZ99wWcqGMnXseJ06JmV1kLN15b+tu1kKfEKogwSisTQmDOKdrmntaeuWSwzhavdrXeNNBUdNkjaUsC2LJiPH8fj8qwAa3rz7xItt2nghXUB8HFZpHMqHeOg2lWTFSZpOC4XiFpN806BF/ZDDSfem83HA3IXRuWXgmfenO5mXEI5plpZa5+nmUXkY/wk9CVxbQh29Ntv3in77YS3DLsFGyL96GSCPCX3RTPqmiHj6IASR/DXdutFIkMsEx/oM=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c8f69d0-6e86-4f73-bab0-08d6cdbeaa79
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 22:53:31.2533
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1744
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

UmF0aGVyIHRoYW4gcGVyZm9ybWluZyBjYWNoZSBmbHVzaGluZyBmb3IgYSBmaXhlZCAweDQwMCBi
eXRlcywgdXNlIHRoZQ0KYWN0dWFsIHNpemUgb2YgdGhlIHZlY3RvciBpbiBvcmRlciB0byBlbnN1
cmUgd2UgY292ZXIgYWxsIGVtaXR0ZWQgY29kZQ0Kb24gc3lzdGVtcyB0aGF0IG1ha2UgdXNlIG9m
IHZlY3RvcmVkIGludGVycnVwdHMuDQoNClNpZ25lZC1vZmYtYnk6IFBhdWwgQnVydG9uIDxwYXVs
LmJ1cnRvbkBtaXBzLmNvbT4NCi0tLQ0KIGFyY2gvbWlwcy9rZXJuZWwvdHJhcHMuYyB8IDIgKy0N
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCg0KZGlmZiAt
LWdpdCBhL2FyY2gvbWlwcy9rZXJuZWwvdHJhcHMuYyBiL2FyY2gvbWlwcy9rZXJuZWwvdHJhcHMu
Yw0KaW5kZXggOWI1NjVlZDUxNjYyLi4yNzc1MTkwYWRiZTcgMTAwNjQ0DQotLS0gYS9hcmNoL21p
cHMva2VybmVsL3RyYXBzLmMNCisrKyBiL2FyY2gvbWlwcy9rZXJuZWwvdHJhcHMuYw0KQEAgLTI0
NTQsNyArMjQ1NCw3IEBAIHZvaWQgX19pbml0IHRyYXBfaW5pdCh2b2lkKQ0KIAllbHNlDQogCQlz
ZXRfaGFuZGxlcigweDA4MCwgJmV4Y2VwdF92ZWMzX2dlbmVyaWMsIDB4ODApOw0KIA0KLQlsb2Nh
bF9mbHVzaF9pY2FjaGVfcmFuZ2UoZWJhc2UsIGViYXNlICsgMHg0MDApOw0KKwlsb2NhbF9mbHVz
aF9pY2FjaGVfcmFuZ2UoZWJhc2UsIGViYXNlICsgdmVjX3NpemUpOw0KIA0KIAlzb3J0X2V4dGFi
bGUoX19zdGFydF9fX2RiZV90YWJsZSwgX19zdG9wX19fZGJlX3RhYmxlKTsNCiANCi0tIA0KMi4y
MS4wDQoNCg==
