Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61DA4102D7
	for <lists+linux-mips@lfdr.de>; Wed,  1 May 2019 00:53:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727426AbfD3Wxd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 30 Apr 2019 18:53:33 -0400
Received: from mail-eopbgr800137.outbound.protection.outlook.com ([40.107.80.137]:36205
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727012AbfD3Wxc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 30 Apr 2019 18:53:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wavesemi.onmicrosoft.com; s=selector1-wavecomp-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=st0NSVV3AtgvPyxwbfKJnTGNykw6fFl7PqtrI+Dd9Wo=;
 b=dg2TWpKPhbg5mxaoXZXsuPA9fd9MdKgd+7pUUI4Ae8yf4wLarfUFVgoCqjeCWKdbgP7CBQ4L3Xi97ifA1LXJFfLHwpf/m1ZFkyv4YO9+dA/QK4iNebdm5/5NE5sj2Zi6P2n15Dvd3UdRat7oqie9ivcjGWA3Hfo/TA3eD7l4LJQ=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.174.162.17) by
 MWHPR2201MB1197.namprd22.prod.outlook.com (10.174.169.160) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.18; Tue, 30 Apr 2019 22:53:29 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::b9d6:bf19:ec58:2765]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::b9d6:bf19:ec58:2765%7]) with mapi id 15.20.1835.018; Tue, 30 Apr 2019
 22:53:29 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 0/4] MIPS: Exception vector improvements
Thread-Topic: [PATCH 0/4] MIPS: Exception vector improvements
Thread-Index: AQHU/6eHYrWGvpJyA0K+L234LNCFJQ==
Date:   Tue, 30 Apr 2019 22:53:29 +0000
Message-ID: <20190430225216.7164-1-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: ddf40b5e-e9fc-40aa-9622-08d6cdbea99e
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);SRVR:MWHPR2201MB1197;
x-ms-traffictypediagnostic: MWHPR2201MB1197:
x-microsoft-antispam-prvs: <MWHPR2201MB1197047E803C5630A649D480C13A0@MWHPR2201MB1197.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4941;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(376002)(39840400004)(346002)(396003)(366004)(189003)(199004)(53936002)(305945005)(486006)(186003)(42882007)(2616005)(7736002)(6512007)(6916009)(107886003)(44832011)(476003)(99286004)(6436002)(5640700003)(14454004)(3846002)(25786009)(52116002)(2906002)(102836004)(2501003)(6116002)(6506007)(386003)(66446008)(66556008)(26005)(2351001)(66946007)(73956011)(66476007)(50226002)(64756008)(316002)(6486002)(66066001)(54906003)(4326008)(81156014)(8936002)(71190400001)(14444005)(81166006)(256004)(8676002)(1076003)(36756003)(4744005)(71200400001)(68736007)(5660300002)(478600001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1197;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: doQz6bpfgG6U+P0hfZrNsMYI94Bhyc0V/+ezhaQpIfB6NjmkSVobLzgNAbWj2kDb5M6cDKpfUFKAJEmxkQw09Bx9Z9SipuodVul2haCVZ/MnWrAInuvc9wGI67HiXxL+g/j97TbCGxvtEBsVmSq3mhGYs9yAM6WZZsE7zyxHswzFb3HXk/yYybDpuMiDEavyMghePUnAbF3unbZwBcIPkn4NVvlMYIpGbjJoYkTHJCTOKYHXFXK42OXImDpQH695RzXBV8SLq0JzgjavtxUxV7Atmeq1gsoigEjnMH0t1gRm32fO2JdwyP0F//bsiq+4fGECgF3WBWNyXq4vHEpH9rKoooapmEPiH3sycnbrJcYpyMqJyegwiI+SUb8E6l+kf5YO2eWxY7Po26jPUar8af9ORa1cWertGLgVi/WPV4s=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddf40b5e-e9fc-40aa-9622-08d6cdbea99e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 22:53:29.6369
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1197
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

VGhpcyBzZXJpZXMgaW1wcm92ZXMgdGhlIHdheSB3ZSBhbGxvY2F0ZSBtZW1vcnkgZm9yIG91ciBl
eGNlcHRpb24gdmVjdG9yDQomIGNvbmZpZ3VyZSBpdCBpbiBFQmFzZS4NCg0KUGF0Y2ggMiBpbiBw
YXJ0aWN1bGFyIGlzIGltcG9ydGFudCBwcmVwYXJhdGlvbiBmb3IgY2hhbmdlcyBiZWluZyBtYWRl
IGJ5DQpTZXJnZSBTZW1pbiBpbiBoaXMgIm1pcHM6IFBvc3QtYm9vdG1lbS1tZW1ibG9jayB0cmFu
c2l0aW9uIGZpeGVzIg0Kc2VyaWVzLg0KDQpQYXVsIEJ1cnRvbiAoNCk6DQogIE1JUFM6IFVzZSBt
bmVtYmxvY2tfcGh5c19hbGxvYygpIGZvciBleGNlcHRpb24gdmVjdG9yDQogIE1JUFM6IEFsd2F5
cyBhbGxvY2F0ZSBleGNlcHRpb24gdmVjdG9yIGZvciBNSVBTcjIrDQogIE1JUFM6IFN5bmMgaWNh
Y2hlIGZvciB3aG9sZSBleGNlcHRpb24gdmVjdG9yDQogIE1JUFM6IFJlbW92ZSBkdXBsaWNhdGUg
RUJhc2UgY29uZmlndXJhdGlvbg0KDQogYXJjaC9taXBzL2tlcm5lbC90cmFwcy5jIHwgNjMgKysr
KysrKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAy
MiBpbnNlcnRpb25zKCspLCA0MSBkZWxldGlvbnMoLSkNCg0KLS0gDQoyLjIxLjANCg0K
