Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 193F5C4311
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 23:53:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728241AbfJAVxp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 17:53:45 -0400
Received: from mail-eopbgr730113.outbound.protection.outlook.com ([40.107.73.113]:17171
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728188AbfJAVxi (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 17:53:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LEQMBzS2/VV3yC2wtCoLAWGYjZW7OfyD2sBK9ribcgJ4kz/4/GzsbGgilWV/Tbu6/0Hrp2DPvwjC34lIxmHC7TQhuuIApKJN+GXIkr3oP2+35amX9j+ELMXCKpzgFtdrdlfK2aaR2sXCc3w+PKqFOgC5e8eMXa1DDeure3AyNe3f2ecD3ugGNSiUuEiMbcSeZg5G/AtbEIuDYWff8sIQMWkmDVZMMW3hB4O9GtaYjbCfziq7DsaBtszYQiLUnjcDjUSOa+8S3HXhq1L42e43RxPTF593ejlY0fE1VMblVIQsishAbx08vBfruHPtdeADdYXC9KN8fLZyMWhFcyl3nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWYJd2itdUXXQdiCnhaWS4h86JUAe1WbuhxmdT9ZDs4=;
 b=fQ8WgVW1Viwytd0PmUkSUD7kqpWzQsRBJUPmV/jqNOvn68VtoPf8DbxzKJh3p2LEeL7WqcyOG/17BvhE5kquGNVt7jXFwKMgwxcjojHiA6aw2UMcB1hpE8gPXC6RK6RTVJxujJGesjz82nkWFAuGHWBgPi89E7sxnxYlcxtaTKaCNLFw2uexLAXONYEBlF7Dz1kJjASajNT6ADJ42+XqtduM1PSKEEHRZnPP1olajcz+2CH2bAG1eED3HaFe+/KhWhmTjybBynm5Z4t2fdA1rtVlqBQFuJeYRF8RjqGcdSUb7xpTe7wddTGC8EbfcjlVJpNVJv+wr2lges7LHD+tOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lWYJd2itdUXXQdiCnhaWS4h86JUAe1WbuhxmdT9ZDs4=;
 b=mcmvXfwiMkkMUQXMkqEKgC8/uoPDwlFU10/MojuGZto7uoMtB/C2NSHQ4iN42EsD7kCPz7YOz71zKDzc/bT7bZvnnZkvLoAn91Kj2nMOT38RgBOraziQzi+x0A2I+fyMFY0ltGNzBTjXzNjdtIGfw3DtsbTLHsA/3rWaFWczXFU=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1439.namprd22.prod.outlook.com (10.174.169.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 21:53:30 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:53:30 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH v2 20/36] MIPS: bitops: Implement test_and_set_bit() in terms
 of _lock variant
Thread-Topic: [PATCH v2 20/36] MIPS: bitops: Implement test_and_set_bit() in
 terms of _lock variant
Thread-Index: AQHVeKKpuvngwP/IhkelpS2BN9urcQ==
Date:   Tue, 1 Oct 2019 21:53:30 +0000
Message-ID: <20191001215249.4157062-21-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: bc2eeb68-7ce4-4f10-03b6-08d746b9cbf0
x-ms-traffictypediagnostic: MWHPR2201MB1439:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB143971E06CA6116A59AB8274C19D0@MWHPR2201MB1439.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(39840400004)(366004)(346002)(136003)(376002)(199004)(189003)(186003)(11346002)(6512007)(1076003)(486006)(66066001)(26005)(6486002)(316002)(2906002)(5640700003)(6436002)(44832011)(42882007)(25786009)(446003)(6916009)(386003)(6506007)(76176011)(478600001)(52116002)(2616005)(102836004)(476003)(5660300002)(305945005)(64756008)(66446008)(14444005)(2351001)(7736002)(99286004)(54906003)(14454004)(71190400001)(71200400001)(66946007)(66556008)(66476007)(36756003)(3846002)(6116002)(107886003)(4326008)(50226002)(81166006)(81156014)(8676002)(2501003)(8936002)(256004);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1439;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bN/IaQ7QKyX4FJLZOavGPVqKE3gv3Ima4B7Xl+0i7eKHwJB7R6jnOA3DkSI9oj3iVkQK3pxDKxjPknDx7OWs0CjVbktC5dy5OAEwtCNsAq+JLWlTQKCEBV24xtHCHKvURHREbwKB2dyUaL6v8UO5ST6y0at5UtsdEq/AFPSxLu0buA2jO5h3sYUOJ9ehF7KtQjkYRj2B4khYCEN/o7e/mklTHUOyQKs1/aUpUmTKbEycllTDMZxeUCCW2hDLzQv4pFdYppDNyVRqre380wy88XeE693G3eZEED+22znVtIZuazuvDE8izh/0whBZH87cqo0SSWldL5s5DS2AL++pLUrdEPgbChk0T1BKsRUjjzIWgtqWK0TGuclVY2RnZRC23yDJAKQfeFGdbJ2vkCy0ztdxKNHoOYGMCwt8pN+Fzrg=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc2eeb68-7ce4-4f10-03b6-08d746b9cbf0
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:53:30.2262
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B7rF5kz8P1ugKeaKZdQcMA5d0jkDINu2d8qkFqAzzfGrlbOM6b+reWRNU0utovLC7Cvrcjvz/ScRfsu+tSz1jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1439
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The only difference between test_and_set_bit() & test_and_set_bit_lock()
is memory ordering barrier semantics - the former provides a full
barrier whilst the latter only provides acquire semantics.

We can therefore implement test_and_set_bit() in terms of
test_and_set_bit_lock() with the addition of the extra memory barrier.
Do this in order to avoid duplicating logic.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

Changes in v2: None

 arch/mips/include/asm/bitops.h | 66 +++++++---------------------------
 arch/mips/lib/bitops.c         | 26 --------------
 2 files changed, 13 insertions(+), 79 deletions(-)

diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.=
h
index 03532ae9f528..ea35a2e87b6d 100644
--- a/arch/mips/include/asm/bitops.h
+++ b/arch/mips/include/asm/bitops.h
@@ -31,8 +31,6 @@
 void __mips_set_bit(unsigned long nr, volatile unsigned long *addr);
 void __mips_clear_bit(unsigned long nr, volatile unsigned long *addr);
 void __mips_change_bit(unsigned long nr, volatile unsigned long *addr);
-int __mips_test_and_set_bit(unsigned long nr,
-			    volatile unsigned long *addr);
 int __mips_test_and_set_bit_lock(unsigned long nr,
 				 volatile unsigned long *addr);
 int __mips_test_and_clear_bit(unsigned long nr,
@@ -236,24 +234,22 @@ static inline void change_bit(unsigned long nr, volat=
ile unsigned long *addr)
 }
=20
 /*
- * test_and_set_bit - Set a bit and return its old value
+ * test_and_set_bit_lock - Set a bit and return its old value
  * @nr: Bit to set
  * @addr: Address to count from
  *
- * This operation is atomic and cannot be reordered.
- * It also implies a memory barrier.
+ * This operation is atomic and implies acquire ordering semantics
+ * after the memory operation.
  */
-static inline int test_and_set_bit(unsigned long nr,
+static inline int test_and_set_bit_lock(unsigned long nr,
 	volatile unsigned long *addr)
 {
 	unsigned long *m =3D ((unsigned long *)addr) + (nr >> SZLONG_LOG);
 	int bit =3D nr & SZLONG_MASK;
 	unsigned long res, temp;
=20
-	smp_mb__before_llsc();
-
 	if (!kernel_uses_llsc) {
-		res =3D __mips_test_and_set_bit(nr, addr);
+		res =3D __mips_test_and_set_bit_lock(nr, addr);
 	} else if (R10000_LLSC_WAR) {
 		__asm__ __volatile__(
 		"	.set	push					\n"
@@ -264,7 +260,7 @@ static inline int test_and_set_bit(unsigned long nr,
 		"	beqzl	%2, 1b					\n"
 		"	and	%2, %0, %3				\n"
 		"	.set	pop					\n"
-		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m), "=3D&r" (res)
+		: "=3D&r" (temp), "+m" (*m), "=3D&r" (res)
 		: "r" (1UL << bit)
 		: __LLSC_CLOBBER);
 	} else {
@@ -291,56 +287,20 @@ static inline int test_and_set_bit(unsigned long nr,
 }
=20
 /*
- * test_and_set_bit_lock - Set a bit and return its old value
+ * test_and_set_bit - Set a bit and return its old value
  * @nr: Bit to set
  * @addr: Address to count from
  *
- * This operation is atomic and implies acquire ordering semantics
- * after the memory operation.
+ * This operation is atomic and cannot be reordered.
+ * It also implies a memory barrier.
  */
-static inline int test_and_set_bit_lock(unsigned long nr,
+static inline int test_and_set_bit(unsigned long nr,
 	volatile unsigned long *addr)
 {
-	unsigned long *m =3D ((unsigned long *)addr) + (nr >> SZLONG_LOG);
-	int bit =3D nr & SZLONG_MASK;
-	unsigned long res, temp;
-
-	if (!kernel_uses_llsc) {
-		res =3D __mips_test_and_set_bit_lock(nr, addr);
-	} else if (R10000_LLSC_WAR) {
-		__asm__ __volatile__(
-		"	.set	push					\n"
-		"	.set	arch=3Dr4000				\n"
-		"1:	" __LL "%0, %1		# test_and_set_bit	\n"
-		"	or	%2, %0, %3				\n"
-		"	" __SC	"%2, %1					\n"
-		"	beqzl	%2, 1b					\n"
-		"	and	%2, %0, %3				\n"
-		"	.set	pop					\n"
-		: "=3D&r" (temp), "+m" (*m), "=3D&r" (res)
-		: "r" (1UL << bit)
-		: __LLSC_CLOBBER);
-	} else {
-		do {
-			__asm__ __volatile__(
-			"	.set	push				\n"
-			"	.set	"MIPS_ISA_ARCH_LEVEL"		\n"
-			"	" __LL "%0, %1	# test_and_set_bit	\n"
-			"	or	%2, %0, %3			\n"
-			"	" __SC	"%2, %1				\n"
-			"	.set	pop				\n"
-			: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m), "=3D&r" (res)
-			: "r" (1UL << bit)
-			: __LLSC_CLOBBER);
-		} while (unlikely(!res));
-
-		res =3D temp & (1UL << bit);
-	}
-
-	smp_llsc_mb();
-
-	return res !=3D 0;
+	smp_mb__before_llsc();
+	return test_and_set_bit_lock(nr, addr);
 }
+
 /*
  * test_and_clear_bit - Clear a bit and return its old value
  * @nr: Bit to clear
diff --git a/arch/mips/lib/bitops.c b/arch/mips/lib/bitops.c
index 3b2a1e78a543..fba402c0879d 100644
--- a/arch/mips/lib/bitops.c
+++ b/arch/mips/lib/bitops.c
@@ -77,32 +77,6 @@ void __mips_change_bit(unsigned long nr, volatile unsign=
ed long *addr)
 EXPORT_SYMBOL(__mips_change_bit);
=20
=20
-/**
- * __mips_test_and_set_bit - Set a bit and return its old value.  This is
- * called by test_and_set_bit() if it cannot find a faster solution.
- * @nr: Bit to set
- * @addr: Address to count from
- */
-int __mips_test_and_set_bit(unsigned long nr,
-			    volatile unsigned long *addr)
-{
-	unsigned long *a =3D (unsigned long *)addr;
-	unsigned bit =3D nr & SZLONG_MASK;
-	unsigned long mask;
-	unsigned long flags;
-	int res;
-
-	a +=3D nr >> SZLONG_LOG;
-	mask =3D 1UL << bit;
-	raw_local_irq_save(flags);
-	res =3D (mask & *a) !=3D 0;
-	*a |=3D mask;
-	raw_local_irq_restore(flags);
-	return res;
-}
-EXPORT_SYMBOL(__mips_test_and_set_bit);
-
-
 /**
  * __mips_test_and_set_bit_lock - Set a bit and return its old value.  Thi=
s is
  * called by test_and_set_bit_lock() if it cannot find a faster solution.
--=20
2.23.0

