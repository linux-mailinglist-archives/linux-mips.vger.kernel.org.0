Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CD04C2A5B
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 01:09:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732650AbfI3XJI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Sep 2019 19:09:08 -0400
Received: from mail-eopbgr820094.outbound.protection.outlook.com ([40.107.82.94]:14848
        "EHLO NAM01-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732668AbfI3XJI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Sep 2019 19:09:08 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gqIzJO4VBSS3PnuvuA1TBJ/EkVobFkYvR8kCAjPDHgyHf1WzzJjJuJXvlUl7VlLg1p7IKlZaUTpx3yiOUARZz7vk2U5TKKd+X4HB4EfqhyrvxJSCXOxiv2xkNm4XHJcBA38heZiQ6gjMUgTISPls4DYTXIpnW0PSVZmGyJUWOj5dLJNRTStHyNzixHKcRP/aIGWclRb2Dv3KVMWRiAL+8UMy/t/7n/D5FAPDIy1mwjBiv8jqKJ9dcd0b+joHIKDS1522IK3IxtUfoegUSWS9Ba6m+L5BmJruR1uL0IX84QqIsAC1y/oVMtDlnqs7yXXHcODpn66MV/DrQKk8bOXVqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9QO9GhbHq2ow+GTkgSArw21MBBAnQZ996yb/+T2VKM=;
 b=ZefsLg9hH43dKKYllfC1qtHcK1ZY0SmlSjlsi1DaYYrT6pRGfPyWuVn5BBq20V1qPWSZLazv2yb2oXqjKWzs5O9L8tH6ZVbW/5k3Fadocx8mdr0A7WSgI2dm1aCYpWTq0LsjgTkoNRo+FPNASNPg0ovBtCXhSkCjdcSnX9tftlbB3dwZN9Y6xMJXvG2xZbanhoSPcufqaK8ZutPKL7EYgy2HL3e9O4BPk0DTe7ukIWDmXB2pSX4e5v6EVDMg+loFDdN4I/rsKDGj1Ylaxvt+nR7gXBwv+oJsfQOZB8TWVNsuRZ649XpPe01mxrAuqFym0lrM2m9y2j0wRotUe6y/lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N9QO9GhbHq2ow+GTkgSArw21MBBAnQZ996yb/+T2VKM=;
 b=mMcneG3UW6lUIaAw7TqmudTTJ+M1NMXlVn0UpiTr3ErzrJNgy2k9Htfbakyu4h1Jnitey+Gu7VJJSAtcNZfWlziUCwSyQVGVqUNvZ7PjNb/lpNl7+cuOU/U0byFlaL5luEKpUbDP/xxZ6jbuTtQC001udNWSoCQ0q9XwpcQyF4M=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1022.namprd22.prod.outlook.com (10.174.167.23) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.17; Mon, 30 Sep 2019 23:08:37 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.017; Mon, 30 Sep 2019
 23:08:37 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH 26/37] MIPS: bitops: Use BIT_WORD() & BITS_PER_LONG
Thread-Topic: [PATCH 26/37] MIPS: bitops: Use BIT_WORD() & BITS_PER_LONG
Thread-Index: AQHVd+P9u1jVk9oA90K0A0rSvCCFNA==
Date:   Mon, 30 Sep 2019 23:08:36 +0000
Message-ID: <20190930230806.2940505-27-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 769e27f4-9c67-4062-2f72-08d745fb1fc2
x-ms-traffictypediagnostic: MWHPR2201MB1022:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1022E40BCAC5BD8037532D5AC1820@MWHPR2201MB1022.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01762B0D64
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(1496009)(39850400004)(346002)(396003)(376002)(136003)(366004)(189003)(199004)(14454004)(256004)(6512007)(81166006)(316002)(81156014)(44832011)(2351001)(486006)(476003)(6916009)(14444005)(186003)(478600001)(2501003)(6436002)(50226002)(8676002)(11346002)(8936002)(2616005)(5640700003)(66946007)(6486002)(42882007)(64756008)(66446008)(66476007)(66556008)(446003)(6506007)(1076003)(305945005)(386003)(52116002)(7736002)(102836004)(2906002)(71190400001)(71200400001)(36756003)(5660300002)(26005)(4326008)(66066001)(54906003)(25786009)(76176011)(107886003)(99286004)(6116002)(3846002);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1022;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dmReIcvoTwZPRmawdY9zlD35slGdLohnzwpJfPqNlEVblinKXEyHdcK6FxZnA3pZvJ1VJK7ButwPeIv0R7Tnbwgx6W+Dj5HV3yJdr/Re0MFbhCQgBkSuuZ/2tWRVxvoLJRsOmxIMxZD35mixWzT9IxmTA0Z7YZEr9P6rPCvVz/GqPcjuRaw0tiOEFHjjmnGBvwsUBzp0wB8LEi/pj4a2PhKYDIvY5GEC6FKENcjsnWD1EP637FPhi/UNX/bbWXxXoywB4f7ZuBYSe8macIEexltadu8iCzVSayQpGJB100PeZ5dEAIyMYgpVjsVcEIZQvHOCt6ZoYwcYwFzyvtupE/27yCoS05UfAKeqQ2llODFZeJrlxbw9kzOlZCfpA+4+rELKjHY7WOCh+TsE+NgQmj/SlWhxRSzu3wz3j/nF/aE=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 769e27f4-9c67-4062-2f72-08d745fb1fc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Sep 2019 23:08:36.9771
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0gFy8ZxTc5kGkdMxdBreIUt9uZEPCu54BVnIjYN8CSH0WIUltDl+t4yP0rvCY8Oh6LrNPBhwm+x+Fyiy1L/MOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1022
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

 arch/mips/include/asm/bitops.h | 24 ++++++++++++------------
 arch/mips/include/asm/llsc.h   |  4 ----
 arch/mips/lib/bitops.c         | 31 +++++++++++++------------------
 3 files changed, 25 insertions(+), 34 deletions(-)

diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.=
h
index 5701f8b41e87..59fe1d5d4fc9 100644
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

