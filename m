Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8841AC4312
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 23:53:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728257AbfJAVxr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 17:53:47 -0400
Received: from mail-eopbgr750107.outbound.protection.outlook.com ([40.107.75.107]:29167
        "EHLO NAM02-BL2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728240AbfJAVxq (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 17:53:46 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Frz/9ntv4VE04FuzGA9mmRhK6HhFpja33WvQN4SyY4JLrafKVtsjlGCING4STKaY6IOccs/y3HHc7gXxZaNhAry8eqyPrVNZjPZYqGwaMTFKBBTQ5N0qo4pnGfpTzAxDb3DEzglAs3u/YhLxGFXox/xf3SMzLHD6z/24if53t5cFGzmSBT0HtOdbVr6hW29HN7V4KE4EyyAHrFKSSIVxlx4STrIeJQDL3NhJGj7gbEDlCsvHPfCdDM2wvpx5Qgwit/3mr4HDj3P8BMW5Y1ZgZzLDdZ4V1MMAF5vUPxMjWc5z5p4EFIxgvGplyPhJ9kltMipReeaLn8aCbaZekSNu7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9dOVhBTnEotVmDabnalZVGySzNoS0tZ4vxHpl0prAg=;
 b=VgfyZSsx641Gv92bRrDpFTsmkLf17RlT2DX+fKrVV/YwFnDkFNkF5cXXsMAPBGFZAWZi07dvwVpwA2GLqFrfZPy1neUOx9tUyU59y1Nie46fgonHHQW2Inb+qJpP426ZGpFwg6Evn6BCx/+Oe4Y3mpauyMjJDKBxEAH9EzPeEOmAvnKZzP5mQy5cCMxyw6ZfFKgsyNa0iWQR61js23WQW5jV1xJ26U1VKs5wEuEhW9DA+IvBnubVXTY5f8bys6b5uXzLK+Snx2mNXSkqTr1iuGnsc2BDgBkyyqLNfdEH3Bd833dO67aMpo6l7HX6/rMQ3+VYNfrn9Two5Bk8UQ3G6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A9dOVhBTnEotVmDabnalZVGySzNoS0tZ4vxHpl0prAg=;
 b=LJdoGSNlu/J1cDF0+q5c3xMX/a/9mN+k1Mvhe+U11x7bS2JZ7tFt1qJloyMZlEBVV5Gpl+vRHZVuzD+PuWB7zXGreUVIP70JADVLaHQWbRT1oySU1H4qln+Adgx2yhG0kvVw/cOOQsXtJcuz6FRSuqgocIyBpdc+fin1ua2+c6I=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1581.namprd22.prod.outlook.com (10.174.167.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.15; Tue, 1 Oct 2019 21:53:38 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:53:38 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH v2 29/36] MIPS: cmpxchg: Omit redundant barriers for Loongson3
Thread-Topic: [PATCH v2 29/36] MIPS: cmpxchg: Omit redundant barriers for
 Loongson3
Thread-Index: AQHVeKKu2dehK6fuHUiwbbrrNcwXQQ==
Date:   Tue, 1 Oct 2019 21:53:38 +0000
Message-ID: <20191001215249.4157062-30-paul.burton@mips.com>
References: <20191001215249.4157062-1-paul.burton@mips.com>
In-Reply-To: <20191001215249.4157062-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR07CA0093.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::34) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6def6961-48d1-434a-3951-08d746b9d0ac
x-ms-traffictypediagnostic: MWHPR2201MB1581:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1581F5934A22E570FB619B86C19D0@MWHPR2201MB1581.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(39850400004)(366004)(346002)(396003)(376002)(189003)(199004)(8936002)(26005)(478600001)(6512007)(8676002)(81166006)(81156014)(6916009)(386003)(76176011)(186003)(6506007)(25786009)(52116002)(6436002)(99286004)(6486002)(316002)(102836004)(54906003)(14454004)(5640700003)(2501003)(486006)(66476007)(7736002)(256004)(66556008)(66946007)(1076003)(64756008)(36756003)(107886003)(66066001)(66446008)(4326008)(42882007)(2906002)(3846002)(6116002)(476003)(446003)(2616005)(11346002)(2351001)(71190400001)(44832011)(5660300002)(50226002)(305945005)(71200400001)(133343001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1581;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Pape8/43qeLdaKIgHbl0tp2QJFgt5oMix2kbxrYN7fbNuIu1503DxCD4FHkNrjJeys5hJE3bLlpGOK4nfdrsSW1vmV1lmeZ8eqdA0PghzkWbozyF2WmWO4GR1qdm2uz52RLHDJW2H56eVMfmmVcxJubhtm4wr+z4jew+NIhV8SYplqddlsOArXhAlxHLEy+UTiHdHFUulqj4I/1Xvf2VX2FEX2pkYukfq5I2tWJtoixvFeMIz+vQ28wvy4aDCo0ePyYw2cU56kcc1xIMJXIkU9FQs0gLCekJaqBvts5PD44JApqlzfXdimUBYfXn7pY13DNWAf7QT8C+TnmO52vhixadpCD3BS67n074219fIAO5DbEzg40aKGGs6NdP9dWIecjzCqGV/EKyBfgDLJeE6970D9qXdu0Hb6NA9ywOyPQ=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6def6961-48d1-434a-3951-08d746b9d0ac
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:53:38.1375
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wV4dJa3CvVECHtkp8LQpIycJ1DnnUA/AgRiEjPfP5pOb9XfuwHmIwLtq1HlabnYJZ69oZN+CKfQrQiuPyOmUCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1581
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When building a kernel configured to support Loongson3 LL/SC workarounds
(ie. CONFIG_CPU_LOONGSON3_WORKAROUNDS=3Dy) the inline assembly in
__xchg_asm() & __cmpxchg_asm() already emits completion barriers, and as
such we don't need to emit extra barriers from the xchg() or cmpxchg()
macros. Add compile-time constant checks causing us to omit the
redundant memory barriers.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

Changes in v2: None

 arch/mips/include/asm/cmpxchg.h | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/arch/mips/include/asm/cmpxchg.h b/arch/mips/include/asm/cmpxch=
g.h
index fc121d20a980..820df68e32e1 100644
--- a/arch/mips/include/asm/cmpxchg.h
+++ b/arch/mips/include/asm/cmpxchg.h
@@ -94,7 +94,13 @@ static inline unsigned long __xchg(volatile void *ptr, u=
nsigned long x,
 ({									\
 	__typeof__(*(ptr)) __res;					\
 									\
-	smp_mb__before_llsc();						\
+	/*								\
+	 * In the Loongson3 workaround case __xchg_asm() already	\
+	 * contains a completion barrier prior to the LL, so we don't	\
+	 * need to emit an extra one here.				\
+	 */								\
+	if (!__SYNC_loongson3_war)					\
+		smp_mb__before_llsc();					\
 									\
 	__res =3D (__typeof__(*(ptr)))					\
 		__xchg((ptr), (unsigned long)(x), sizeof(*(ptr)));	\
@@ -179,9 +185,23 @@ static inline unsigned long __cmpxchg(volatile void *p=
tr, unsigned long old,
 ({									\
 	__typeof__(*(ptr)) __res;					\
 									\
-	smp_mb__before_llsc();						\
+	/*								\
+	 * In the Loongson3 workaround case __cmpxchg_asm() already	\
+	 * contains a completion barrier prior to the LL, so we don't	\
+	 * need to emit an extra one here.				\
+	 */								\
+	if (!__SYNC_loongson3_war)					\
+		smp_mb__before_llsc();					\
+									\
 	__res =3D cmpxchg_local((ptr), (old), (new));			\
-	smp_llsc_mb();							\
+									\
+	/*								\
+	 * In the Loongson3 workaround case __cmpxchg_asm() already	\
+	 * contains a completion barrier after the SC, so we don't	\
+	 * need to emit an extra one here.				\
+	 */								\
+	if (!__SYNC_loongson3_war)					\
+		smp_llsc_mb();						\
 									\
 	__res;								\
 })
--=20
2.23.0

