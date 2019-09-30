Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB14C2A61
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 01:09:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732772AbfI3XJV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 19:09:21 -0400
Received: from mail-eopbgr820129.outbound.protection.outlook.com ([40.107.82.129]:60959
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732761AbfI3XJV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 19:09:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mOpPVlg8QpAXgekZqwzo2V3veVHeLy8Vz+sJHrDVn85ra7aDQvauZbZZjmTTpliCbb2dHRoSAzJMY8Kx+xBld8mc+VsSuL+pTsgYcmNbjU2KbdIyBhhUtqy8f0s7uZdsBrMgdGN/4vtlS2UpXkIjz+ChIQIbJ3T7V7TKAu3+xFdq1JOS6jwMOuWg3SjSSrKlR9//JFvdiNyYCJPGUieVhi13X1SlXv4euQuYnZBbpDchwFjYfuJDQnBasCcRKhhbTJYpF0qLiK1jvvREpI5qK2titScx58muS9fJtGLeIzA8gEU/E8i6UAXz1z+d7hjRGc3izJOX6d3QsboSURbjPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmlD0QaPvWpPJoRxuK+3Qa+UxcFEj5kWoedu2Uz5ojE=;
 b=blFS1ZIx4YxEoa4f8U3/h014B/1Fwe9pZ9eqYqxWXn7ZY1p+N9+xlvBzUZUwseddImUbOgSUhu0/lfGygqYX2K4ITY9WvVIibh7NeGjcrUk2Mz+TjL7RG6W9COujGTJuFdDEcHJ8rixp8Z5PS+fxgz5hBIhOl6s7x9p9dcOWoYtaurc7NFdJtI8QkfPfqKXM0Y4c4ruQNPe7lNHBCSwsYvZGmW3FHBGC2AkJODr4uqZ6ZYc0ew+Azup8UYQ+F7jHrqxEPZKOsijChzQkYlC0WHIm7k/8DM0G/JJ37UtOh4cIxOXAt66YuAAh+wjaVrOro/W6/kDoX5y39LwMAEBbUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmlD0QaPvWpPJoRxuK+3Qa+UxcFEj5kWoedu2Uz5ojE=;
 b=n4mHBYL1KH8nMUwUgOPpX6GUGUmnoydSTiSZ3ozrnHPOluSm3F33DtOImKfesfKka/ktwij4Dg6pBVUV4uHE41qdbZ9QavRe9sV/4efVsI7rEsCksCnPMc80bwC6v05BH3nHibkZa6qiPjo8TieEgbdvzxOzLTbyqOB0R3emhCs=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1022.namprd22.prod.outlook.com (10.174.167.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Mon, 30 Sep 2019 23:09:11 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 23:09:11 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 32/37] MIPS: syscall: Emit Loongson3 sync workarounds within
 asm
Thread-Topic: [PATCH 32/37] MIPS: syscall: Emit Loongson3 sync workarounds
 within asm
Thread-Index: AQHVd+QAF39mXHIVtk2gNcjfUb4ejw==
Date:   Mon, 30 Sep 2019 23:08:42 +0000
Message-ID: <20190930230806.2940505-33-paul.burton@mips.com>
References: <20190930230806.2940505-1-paul.burton@mips.com>
In-Reply-To: <20190930230806.2940505-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR21CA0006.namprd21.prod.outlook.com
 (2603:10b6:a03:114::16) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1510cc6c-703b-4df3-bc9c-08d745fb22db
x-ms-traffictypediagnostic: MWHPR2201MB1022:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1022AC0E97ACA7757A96418EC1820@MWHPR2201MB1022.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2657;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(39850400004)(346002)(396003)(376002)(136003)(366004)(189003)(199004)(14454004)(256004)(6512007)(81166006)(316002)(81156014)(44832011)(2351001)(486006)(476003)(6916009)(14444005)(186003)(478600001)(2501003)(6436002)(50226002)(6666004)(8676002)(11346002)(8936002)(2616005)(5640700003)(66946007)(6486002)(42882007)(64756008)(66446008)(66476007)(66556008)(446003)(6506007)(1076003)(305945005)(386003)(52116002)(7736002)(102836004)(2906002)(71190400001)(71200400001)(36756003)(5660300002)(26005)(4326008)(66066001)(54906003)(25786009)(76176011)(107886003)(99286004)(6116002)(3846002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1022;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dHRk9ulhCtAVY060Ap1PRTGSda90OAY1ED2beqRRDi6PDpXPp4LaMCZCN+JDlUsftiTj1mQPE3TAdwXczBhNdjRVBg6AJ2T/uGh/nQotNACFL80PiR6UEQzUlo2K9ar4UiM4cGcqQGLBMs90bcFFa62gldU8ItmHUXmXd29dpv/4/de8HiufjcIWsRQrXttuJvcpZS6d/bgpZOkBwkK0Cb36UwEnpcKaNHQnaDha2xZidqmBPo4/Mv0ekAwkW48XmVQg2ono3cARNiFzc7OXgIuDAV7vX+rizBb23l3JbNmmLjqWsIS9s5k49ighQ65NonDwFTx6BS2+8W4qTjxSpEGL/8FOQnEyUcF5l3U+0u/4y9KaeQ/jrblHCmpORxnroKxu0QN/PIyxRm/DbCIi2ltqpxI7Rm7K92Zoj51JrXI=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1510cc6c-703b-4df3-bc9c-08d745fb22db
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 23:08:42.4416
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CT2GwZ48ThxDKaDCuGWTvN3qzMByq2HPQDyt95iYEBKOlezMb1XHpf4cgJYrpj8k6fxjFq+jF4s/ccOANLl10Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1022
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Generate the sync instructions required to workaround Loongson3 LL/SC
errata within inline asm blocks, which feels a little safer than doing
it from C where strictly speaking the compiler would be well within its
rights to insert a memory access between the separate asm statements we
previously had, containing sync & ll instructions respectively.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

 arch/mips/kernel/syscall.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/syscall.c b/arch/mips/kernel/syscall.c
index b0e25e913bdb..3ea288ca35f1 100644
--- a/arch/mips/kernel/syscall.c
+++ b/arch/mips/kernel/syscall.c
@@ -37,6 +37,7 @@
 #include <asm/signal.h>
 #include <asm/sim.h>
 #include <asm/shmparam.h>
+#include <asm/sync.h>
 #include <asm/sysmips.h>
 #include <asm/switch_to.h>
=20
@@ -132,12 +133,12 @@ static inline int mips_atomic_set(unsigned long addr,=
 unsigned long new)
 		  [efault] "i" (-EFAULT)
 		: "memory");
 	} else if (cpu_has_llsc) {
-		loongson_llsc_mb();
 		__asm__ __volatile__ (
 		"	.set	push					\n"
 		"	.set	"MIPS_ISA_ARCH_LEVEL"			\n"
 		"	li	%[err], 0				\n"
 		"1:							\n"
+		"	" __SYNC(full, loongson3_war) "			\n"
 		user_ll("%[old]", "(%[addr])")
 		"	move	%[tmp], %[new]				\n"
 		"2:							\n"
--=20
2.23.0

