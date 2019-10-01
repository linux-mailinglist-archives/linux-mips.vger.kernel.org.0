Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 39D26C4419
	for <lists+linux-mips@lfdr.de>; Wed,  2 Oct 2019 01:04:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbfJAXEf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 19:04:35 -0400
Received: from mail-eopbgr700103.outbound.protection.outlook.com ([40.107.70.103]:24961
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725977AbfJAXEf (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 19:04:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AzdhPEU5FhZPaYabzAVMEsAMtI3xnzFolGw46d0Xz296uY5T3Bke6BlZBIrGDnAf/BGCvOwH0phXCzBb3YObG5zMnnMgUjahWvxADns6ZssMeAOEhDYVJEknNWpkSwnv3F25pA34Pnuo8qrzT57S3YoYCDqZKgzshy+K+hOST0Xjn41Pe+xQtLalKt4DOakbq+KDqzUFN3hmyb7n6qOWURd6ax3NK9oGi4yx++O+NKCGzM6rqfoLd3AVdSTwm7Bvqi7DIcrStPvC19U8lV/QWyogsEW70/D6Awk6upPy+sZnW1zlwunmnwy9aLhNnxLBeNP2qjJ5jFSKWnM26B+bpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NPHLw0pS8+HG8knoohicDrP7xWc44hogR0zaiYO45fo=;
 b=j7r8Zv8hx+arLauXZ9OPIDoiGlPQdq5konkbN3SfRmyrr+hALsHjHLuH0mT+OJT/A5VctZAz+H9OXPk9Ak687cfCDZ00P5ok+enruQHZ9STAva/NAy8Aq+0g8kjv1uow4FxwXvzFh10JkNrAi9DaVu3u3A2ewq1TIAMkBI8/LbiS5+7nCi9YBzUgEfxkGoy2ZcC5opN8mPO0v0AMPvCmYRKLMVF0KjRlf3X0z4P9f9ZmeBVC5w7uSHNSmMl9TrCS78p//YMFdW6TXSUCtjbs9ubAyfjeItyO2knuN21oOiEffhuamPFEuWjxIUbXPgIFD9Ktl462gF6gMcVMo4aPFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NPHLw0pS8+HG8knoohicDrP7xWc44hogR0zaiYO45fo=;
 b=d9bn6qZ1oRPIzmg0dawsHR5FzxCWvqjjeugs9jZKpNcSwr1Cnm1QQ7CCD0rv+CJEpfMcZ3R9rTqPM03BG4ti1ASS7FLmg5yd2bI+Cmsxl98duLcQYqtOwEAPcIBBEkpbtIsUSTvmDKd/Lqu81L4U6cCaqBOw1tZ5Nq2DGHFa5rU=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1232.namprd22.prod.outlook.com (10.174.160.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.22; Tue, 1 Oct 2019 23:04:33 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 23:04:33 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 2/2] MIPS: r4k-bugs64: Drop CONFIG_CPU_MIPSR6 checks
Thread-Topic: [PATCH 2/2] MIPS: r4k-bugs64: Drop CONFIG_CPU_MIPSR6 checks
Thread-Index: AQHVeKyWluX6IfkjCEmRNCCctB5Cmw==
Date:   Tue, 1 Oct 2019 23:04:32 +0000
Message-ID: <20191001230423.70119-2-paul.burton@mips.com>
References: <20191001230423.70119-1-paul.burton@mips.com>
In-Reply-To: <20191001230423.70119-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR06CA0055.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::32) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [73.93.153.72]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3296482a-6d79-4f5d-4d49-08d746c3b8b7
x-ms-traffictypediagnostic: MWHPR2201MB1232:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB12324C08F58C6AFF8E2FE7F3C19D0@MWHPR2201MB1232.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3383;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(366004)(136003)(39850400004)(346002)(396003)(199004)(189003)(50226002)(1076003)(486006)(256004)(11346002)(5660300002)(446003)(42882007)(6436002)(5640700003)(7736002)(476003)(305945005)(14454004)(44832011)(6512007)(99286004)(6116002)(3846002)(2351001)(76176011)(386003)(6506007)(2906002)(26005)(2616005)(52116002)(102836004)(71200400001)(186003)(71190400001)(66066001)(66946007)(36756003)(66476007)(66556008)(64756008)(8676002)(66446008)(4326008)(2501003)(25786009)(81166006)(81156014)(316002)(107886003)(478600001)(6486002)(8936002)(6916009);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1232;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: cLnWj4OjK7qRNWuPRUMxy2KrRSdPybahQF2JgMSOr9jhM0xLChIGgYaodgQIhRqyfbnC5WcVPvMLunsHIJXDtRVfOE5AstA0LDA2I30K1pcUuIznYlDI8IdBSWPsoBxcS5vk8Wyp2tuhT0xclceEPtV33zFMR3nvnLbfWHP21/EYfig9Uq75lHvwBEWCORf6CXYhGFyDGZVm1JxFuK6nk3wpbooYKhpC5dLNECDJjRyqa6mca9d2xJqR7b+yEUrKNf5yROeEJmsAwHJcjm/+wBd6payJgKKqDZUhn3mbxtEhthSUY331tIqyUka+5J83YyeOsNVitJFY0y6vnpR+i0Zl3frb5giOj8v9qf37WN7g+5CMZS3QMGZrvCCWKkttxipOeuRv+q4Yqb5aetjZjGL+UYnPXjTxHxlrkLUje0Q=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3296482a-6d79-4f5d-4d49-08d746c3b8b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 23:04:32.9901
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wk5twrJWvcL/gMRxZu07prxb0wdrcye+KuPD8OhYn4sW2OXGpG3M+/NGeI6jXL+C6WIHjyYhyvo5If4/WJwsXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1232
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The r4k-bugs64 code will no longer be built for MIPSr6 kernel
configurations, so there's no need to perform checks for MIPSr6 within
the code. Drop those redundant checks.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/kernel/r4k-bugs64.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/arch/mips/kernel/r4k-bugs64.c b/arch/mips/kernel/r4k-bugs64.c
index fa62cd1dff93..a0c2ba728f45 100644
--- a/arch/mips/kernel/r4k-bugs64.c
+++ b/arch/mips/kernel/r4k-bugs64.c
@@ -240,7 +240,7 @@ static inline void check_daddi(void)
 	panic(bug64hit, !DADDI_WAR ? daddiwar : nowar);
 }
=20
-int daddiu_bug	=3D IS_ENABLED(CONFIG_CPU_MIPSR6) ? 0 : -1;
+int daddiu_bug	=3D -1;
=20
 static inline void check_daddiu(void)
 {
@@ -310,14 +310,11 @@ static inline void check_daddiu(void)
=20
 void __init check_bugs64_early(void)
 {
-	if (!IS_ENABLED(CONFIG_CPU_MIPSR6)) {
-		check_mult_sh();
-		check_daddiu();
-	}
+	check_mult_sh();
+	check_daddiu();
 }
=20
 void __init check_bugs64(void)
 {
-	if (!IS_ENABLED(CONFIG_CPU_MIPSR6))
-		check_daddi();
+	check_daddi();
 }
--=20
2.23.0

