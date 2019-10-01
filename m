Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3DFCEC4317
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 23:54:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728269AbfJAVxs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 17:53:48 -0400
Received: from mail-eopbgr730113.outbound.protection.outlook.com ([40.107.73.113]:17171
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728256AbfJAVxs (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 17:53:48 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jYHGFkRlb3yIf2LG0p0UI+FELIlufJeT97UQN/GS1OcEII4SLCQqlCEjnFXAip5dbbosO2gbsMa27ZQBcyrx2xD2mUeSfJRuyVdtLwrEhT34Dj7RRi9BEs+Q1TU0zpAE8wQIeb/BbiahUU7KcuUaXS2QYU9cFDhwf+qvVBQN9pHXQaN2MutfLfQK+0o8uWxL2Ih7aso5k65plAM7nc57Xsdhk+s5ObpE/4oEefWyuF/Q487aquo1v9xFlJBXJxtF3edoRKRPSm4feyJmQ+GiqssRfd+nFQGWt/6dQStlG2iUlPg3yM4riI3B6qwqQ/QG9sWr6bOtH4umWNXQWpRqng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=daRCgn13zIlHccXug0wPnms++7PKm6/04xIJWExUjNQ=;
 b=ZHBDvFoD+deEi7nu1hwukUCZPssl6tPylX01oI5j1UdDZ2Svb1lsyjaaKcL6IBmHY/iV5Kq9WGKBzRXcB7ui/+GYEytIvZzA/2FKW8GmmQANQbiZzTmskR/qobZSbEWFYa6mKwPxCmNTE3L/AAzSRxEK7Y12bWySS/4SU6vSi1tz8HlnomncBcTOQFHd13+UrUg9TElT4Yam2ZKtPifQUDwdjv9JWdge2fwmQoKX55k588m/LtyOulsEd8XdE3uBGsAkcRacGhL6bzfZc6LRWIl8d5cLyShlziQFr1bL/BRjdWehPKOyGU9p6suUiiBtTTOkv+YyRi3UFyJQKAr2VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=daRCgn13zIlHccXug0wPnms++7PKm6/04xIJWExUjNQ=;
 b=U7gEdpFGtss0zaQGOugOzdqe76v3Qqkw/mHOL/OJFOk8FHxDzQaBKfSaqqphmpcyy0KuzqZVwAhzVW3h8IbxSonb56SE8W4oulAWsJEI741/rX0s2zvYjhufLxt6Yes5QwcohHlw/XJIHz7WcR/0osYbFRLfab89e9LmErtts0o=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1439.namprd22.prod.outlook.com (10.174.169.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 21:53:35 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:53:34 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH v2 25/36] MIPS: bitops: Use BIT_WORD() & BITS_PER_LONG
Thread-Topic: [PATCH v2 25/36] MIPS: bitops: Use BIT_WORD() & BITS_PER_LONG
Thread-Index: AQHVeKKsakmoK+XUGUmcY9FGfdcSIQ==
Date:   Tue, 1 Oct 2019 21:53:34 +0000
Message-ID: <20191001215249.4157062-26-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 8f01e9a7-0ca9-45b5-b469-08d746b9ce7d
x-ms-traffictypediagnostic: MWHPR2201MB1439:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB14392CE10A076D300A34C591C19D0@MWHPR2201MB1439.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(1496009)(396003)(39840400004)(366004)(346002)(136003)(376002)(199004)(189003)(186003)(11346002)(6512007)(1076003)(486006)(66066001)(26005)(6486002)(316002)(2906002)(5640700003)(6436002)(44832011)(42882007)(25786009)(446003)(6916009)(386003)(6506007)(76176011)(478600001)(52116002)(2616005)(102836004)(476003)(5660300002)(305945005)(64756008)(66446008)(14444005)(2351001)(7736002)(99286004)(54906003)(14454004)(71190400001)(71200400001)(66946007)(66556008)(66476007)(36756003)(3846002)(6116002)(107886003)(4326008)(50226002)(81166006)(81156014)(8676002)(2501003)(8936002)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1439;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7rlgR6FLkNBfAWHISw5m4fjEfeZZjJS4V6UeN3DiXdrniIQTAnUq2TEc7eCQR6rnu9+J7JwZaxZBEDdOOrboFd4EpEXQ24+wsjKwHQLFEVg83QxEKNiR3Gac2VXycLerZeiUt1DJ5WZKLtYAiT5mENAEsBdsO1cw5Zf82vA3xJ4Svb/NZ8frH68TuMSk7yUw4r2RMDSo/WyjQrCk8PY6MXJmxp6k0G3tdubj2cU91snEwZxFHdWHTb8v55wWLk/Pq0eOAqyqeA8xAKfgoA+tLzLzSy3UIXMrt8eZHg7LL63/CxcRzoXtDN/n9qkPaciTrv/cMGBNQW/eKn5H14gdaIRdOQWT3XcR3p3k9dLSKJlN28+U99HgPgCY3eLeb+3QFGJ5oOo6pEAWG+n9RB0s6Wtq7cV6gj3AMT7fyYdo8Hc=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f01e9a7-0ca9-45b5-b469-08d746b9ce7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:53:34.4902
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oBuGi01PXFjRRVLGtoiyiwGvCZ+Fw9GyrTG7U+SrLQbV6A7zjP/Wr5RnxqRCXweeK0/mIpC15xxJQIixlecppg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1439
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Rather than using custom SZLONG_LOG & SZLONG_MASK macros to shift & mask
a bit index to form word & bit offsets respectively, make use of the
standard BIT_WORD() & BITS_PER_LONG macros for the same purpose.

volatile is added to the definition of pointers to the long-sized word
we'll operate on, in order to prevent the compiler complaining that we
cast away the volatile qualifier of the addr argument. This should have
no effect on generated code, which in the LL/SC case is inline asm
anyway & in the non-LLSC case access is constrained by compiler barriers
provided by raw_local_irq_{save,restore}().

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

Changes in v2: None

 arch/mips/include/asm/bitops.h | 24 ++++++++++++------------
 arch/mips/include/asm/llsc.h   |  4 ----
 arch/mips/lib/bitops.c         | 31 +++++++++++++------------------
 3 files changed, 25 insertions(+), 34 deletions(-)

diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.=
h
index fba0a842b98a..d39fca2def60 100644
--- a/arch/mips/include/asm/bitops.h
+++ b/arch/mips/include/asm/bitops.h
@@ -87,8 +87,8 @@ int __mips_test_and_change_bit(unsigned long nr,
  */
 static inline void set_bit(unsigned long nr, volatile unsigned long *addr)
 {
-	unsigned long *m =3D ((unsigned long *)addr) + (nr >> SZLONG_LOG);
-	int bit =3D nr & SZLONG_MASK;
+	volatile unsigned long *m =3D &addr[BIT_WORD(nr)];
+	int bit =3D nr % BITS_PER_LONG;
=20
 	if (!kernel_uses_llsc) {
 		__mips_set_bit(nr, addr);
@@ -117,8 +117,8 @@ static inline void set_bit(unsigned long nr, volatile u=
nsigned long *addr)
  */
 static inline void clear_bit(unsigned long nr, volatile unsigned long *add=
r)
 {
-	unsigned long *m =3D ((unsigned long *)addr) + (nr >> SZLONG_LOG);
-	int bit =3D nr & SZLONG_MASK;
+	volatile unsigned long *m =3D &addr[BIT_WORD(nr)];
+	int bit =3D nr % BITS_PER_LONG;
=20
 	if (!kernel_uses_llsc) {
 		__mips_clear_bit(nr, addr);
@@ -160,8 +160,8 @@ static inline void clear_bit_unlock(unsigned long nr, v=
olatile unsigned long *ad
  */
 static inline void change_bit(unsigned long nr, volatile unsigned long *ad=
dr)
 {
-	unsigned long *m =3D ((unsigned long *)addr) + (nr >> SZLONG_LOG);
-	int bit =3D nr & SZLONG_MASK;
+	volatile unsigned long *m =3D &addr[BIT_WORD(nr)];
+	int bit =3D nr % BITS_PER_LONG;
=20
 	if (!kernel_uses_llsc) {
 		__mips_change_bit(nr, addr);
@@ -183,8 +183,8 @@ static inline void change_bit(unsigned long nr, volatil=
e unsigned long *addr)
 static inline int test_and_set_bit_lock(unsigned long nr,
 	volatile unsigned long *addr)
 {
-	unsigned long *m =3D ((unsigned long *)addr) + (nr >> SZLONG_LOG);
-	int bit =3D nr & SZLONG_MASK;
+	volatile unsigned long *m =3D &addr[BIT_WORD(nr)];
+	int bit =3D nr % BITS_PER_LONG;
 	unsigned long res, orig;
=20
 	if (!kernel_uses_llsc) {
@@ -228,8 +228,8 @@ static inline int test_and_set_bit(unsigned long nr,
 static inline int test_and_clear_bit(unsigned long nr,
 	volatile unsigned long *addr)
 {
-	unsigned long *m =3D ((unsigned long *)addr) + (nr >> SZLONG_LOG);
-	int bit =3D nr & SZLONG_MASK;
+	volatile unsigned long *m =3D &addr[BIT_WORD(nr)];
+	int bit =3D nr % BITS_PER_LONG;
 	unsigned long res, orig;
=20
 	smp_mb__before_llsc();
@@ -267,8 +267,8 @@ static inline int test_and_clear_bit(unsigned long nr,
 static inline int test_and_change_bit(unsigned long nr,
 	volatile unsigned long *addr)
 {
-	unsigned long *m =3D ((unsigned long *)addr) + (nr >> SZLONG_LOG);
-	int bit =3D nr & SZLONG_MASK;
+	volatile unsigned long *m =3D &addr[BIT_WORD(nr)];
+	int bit =3D nr % BITS_PER_LONG;
 	unsigned long res, orig;
=20
 	smp_mb__before_llsc();
diff --git a/arch/mips/include/asm/llsc.h b/arch/mips/include/asm/llsc.h
index d240a4a2d1c4..c49738bc3bda 100644
--- a/arch/mips/include/asm/llsc.h
+++ b/arch/mips/include/asm/llsc.h
@@ -12,15 +12,11 @@
 #include <asm/isa-rev.h>
=20
 #if _MIPS_SZLONG =3D=3D 32
-#define SZLONG_LOG 5
-#define SZLONG_MASK 31UL
 #define __LL		"ll	"
 #define __SC		"sc	"
 #define __INS		"ins	"
 #define __EXT		"ext	"
 #elif _MIPS_SZLONG =3D=3D 64
-#define SZLONG_LOG 6
-#define SZLONG_MASK 63UL
 #define __LL		"lld	"
 #define __SC		"scd	"
 #define __INS		"dins	"
diff --git a/arch/mips/lib/bitops.c b/arch/mips/lib/bitops.c
index fba402c0879d..116d0bd8b2ae 100644
--- a/arch/mips/lib/bitops.c
+++ b/arch/mips/lib/bitops.c
@@ -7,6 +7,7 @@
  * Copyright (c) 1999, 2000  Silicon Graphics, Inc.
  */
 #include <linux/bitops.h>
+#include <linux/bits.h>
 #include <linux/irqflags.h>
 #include <linux/export.h>
=20
@@ -19,12 +20,11 @@
  */
 void __mips_set_bit(unsigned long nr, volatile unsigned long *addr)
 {
-	unsigned long *a =3D (unsigned long *)addr;
-	unsigned bit =3D nr & SZLONG_MASK;
+	volatile unsigned long *a =3D &addr[BIT_WORD(nr)];
+	unsigned int bit =3D nr % BITS_PER_LONG;
 	unsigned long mask;
 	unsigned long flags;
=20
-	a +=3D nr >> SZLONG_LOG;
 	mask =3D 1UL << bit;
 	raw_local_irq_save(flags);
 	*a |=3D mask;
@@ -41,12 +41,11 @@ EXPORT_SYMBOL(__mips_set_bit);
  */
 void __mips_clear_bit(unsigned long nr, volatile unsigned long *addr)
 {
-	unsigned long *a =3D (unsigned long *)addr;
-	unsigned bit =3D nr & SZLONG_MASK;
+	volatile unsigned long *a =3D &addr[BIT_WORD(nr)];
+	unsigned int bit =3D nr % BITS_PER_LONG;
 	unsigned long mask;
 	unsigned long flags;
=20
-	a +=3D nr >> SZLONG_LOG;
 	mask =3D 1UL << bit;
 	raw_local_irq_save(flags);
 	*a &=3D ~mask;
@@ -63,12 +62,11 @@ EXPORT_SYMBOL(__mips_clear_bit);
  */
 void __mips_change_bit(unsigned long nr, volatile unsigned long *addr)
 {
-	unsigned long *a =3D (unsigned long *)addr;
-	unsigned bit =3D nr & SZLONG_MASK;
+	volatile unsigned long *a =3D &addr[BIT_WORD(nr)];
+	unsigned int bit =3D nr % BITS_PER_LONG;
 	unsigned long mask;
 	unsigned long flags;
=20
-	a +=3D nr >> SZLONG_LOG;
 	mask =3D 1UL << bit;
 	raw_local_irq_save(flags);
 	*a ^=3D mask;
@@ -86,13 +84,12 @@ EXPORT_SYMBOL(__mips_change_bit);
 int __mips_test_and_set_bit_lock(unsigned long nr,
 				 volatile unsigned long *addr)
 {
-	unsigned long *a =3D (unsigned long *)addr;
-	unsigned bit =3D nr & SZLONG_MASK;
+	volatile unsigned long *a =3D &addr[BIT_WORD(nr)];
+	unsigned int bit =3D nr % BITS_PER_LONG;
 	unsigned long mask;
 	unsigned long flags;
 	int res;
=20
-	a +=3D nr >> SZLONG_LOG;
 	mask =3D 1UL << bit;
 	raw_local_irq_save(flags);
 	res =3D (mask & *a) !=3D 0;
@@ -111,13 +108,12 @@ EXPORT_SYMBOL(__mips_test_and_set_bit_lock);
  */
 int __mips_test_and_clear_bit(unsigned long nr, volatile unsigned long *ad=
dr)
 {
-	unsigned long *a =3D (unsigned long *)addr;
-	unsigned bit =3D nr & SZLONG_MASK;
+	volatile unsigned long *a =3D &addr[BIT_WORD(nr)];
+	unsigned int bit =3D nr % BITS_PER_LONG;
 	unsigned long mask;
 	unsigned long flags;
 	int res;
=20
-	a +=3D nr >> SZLONG_LOG;
 	mask =3D 1UL << bit;
 	raw_local_irq_save(flags);
 	res =3D (mask & *a) !=3D 0;
@@ -136,13 +132,12 @@ EXPORT_SYMBOL(__mips_test_and_clear_bit);
  */
 int __mips_test_and_change_bit(unsigned long nr, volatile unsigned long *a=
ddr)
 {
-	unsigned long *a =3D (unsigned long *)addr;
-	unsigned bit =3D nr & SZLONG_MASK;
+	volatile unsigned long *a =3D &addr[BIT_WORD(nr)];
+	unsigned int bit =3D nr % BITS_PER_LONG;
 	unsigned long mask;
 	unsigned long flags;
 	int res;
=20
-	a +=3D nr >> SZLONG_LOG;
 	mask =3D 1UL << bit;
 	raw_local_irq_save(flags);
 	res =3D (mask & *a) !=3D 0;
--=20
2.23.0

