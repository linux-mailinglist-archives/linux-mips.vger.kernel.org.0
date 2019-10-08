Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6176BD0168
	for <lists+linux-mips@lfdr.de>; Tue,  8 Oct 2019 21:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729794AbfJHTqI (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Oct 2019 15:46:08 -0400
Received: from mail-eopbgr770100.outbound.protection.outlook.com ([40.107.77.100]:10329
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730413AbfJHTqH (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 8 Oct 2019 15:46:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S9YwsDtTRn5lhtuQhm7lnsBTpi6NpZYNad6L05Y244IDR1UQcZVHTb2XzV6VsFyh+DmsMGKrIzXDDxlTYRtJEmz4fo+RbVyk2dA8OJ1fhzYL8PahgzqlQh2TKJrBg3QDZVYxcrENUm7T/OspXWU1QHqKxWPxuXxvizHYVQsHtQd7R9myJJbL3+vrQsmU+750pZV8kw/VFC1LDuHvr4e2xUdUqAHmiTkJRAKIURw8dt/GmuJW4yBeagzOulHtxSKmOiHJXqGaRMDIVbiE3dcevEeFqT9Vs+q8P8yUzy6D1oocecTjjASwTTJh/CdGEF3a8y/qYFM4xGlFNpXrwvTwdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJuo+yydgSpADjYXdu8R2+9c7spbcVDTp95V4nEVuAg=;
 b=HG6CV9e3tGwRfAQl9Bkfmg4Y6dTG4XjF8Y0/dbkqduF9on0Hgk1wN/wnHU5Pzy+2JJrzpVuoecHJQiy7rFTd5Lg6WP/3Q+MEro5sNVA+dXORpVAx2ibnX+lrXymeH3vU05SxnLby4VoP4p4KQMJ+eSz0jx5qw9hP4TpziVZlJmfLlbqsuiHTnUVN3CdohRRR7vEOjB1wsWxI6TWbOdEyAbnMTald3VKS0w4viiGogCNrjScTUXKQb+cTW45XKNQxtLdUCi7zQg1fT12c3NA+zUUcnPQh5c4nRZYuTvUkMyvNobx5wVslJts/dKybhT2qP8bXQstjyeAPlzCg8kCd7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MJuo+yydgSpADjYXdu8R2+9c7spbcVDTp95V4nEVuAg=;
 b=v/ttXC30HkQuzR9V5rKezaI4vDhYTBlMqmsb0QWOBjGRXWu1dP6TymtfxplmuNcViTJ+kA1QDFb8XgSy3e0y8V/6g7nqqI9/4g+zRDpChgM018NoXUBfDkd4kbT+qiQKgQEW2cRmCpfveivFls7YraForW8oRgHPs4Ycbe0lVEA=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1104.namprd22.prod.outlook.com (10.174.169.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2327.25; Tue, 8 Oct 2019 19:46:02 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::c1dc:dba3:230c:e7f0%8]) with mapi id 15.20.2347.016; Tue, 8 Oct 2019
 19:46:01 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Paul Burton <pburton@wavecomp.com>,
        Alexander Lobakin <alobakin@dlink.ru>
Subject: [PATCH] MIPS: Drop 32-bit asm string functions
Thread-Topic: [PATCH] MIPS: Drop 32-bit asm string functions
Thread-Index: AQHVfhED5+p9f9otwk+aE9NRlW4Sng==
Date:   Tue, 8 Oct 2019 19:46:01 +0000
Message-ID: <20191008194552.2176475-1-paul.burton@mips.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: BYAPR21CA0025.namprd21.prod.outlook.com
 (2603:10b6:a03:114::35) To MWHPR2201MB1277.namprd22.prod.outlook.com
 (2603:10b6:301:18::12)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=pburton@wavecomp.com; 
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.23.0
x-originating-ip: [12.94.197.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2331912e-9e36-4105-8f0f-08d74c2825e9
x-ms-traffictypediagnostic: MWHPR2201MB1104:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB11043113F8E2DDDBA21C8CF8C19A0@MWHPR2201MB1104.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 01842C458A
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(136003)(396003)(346002)(39850400004)(366004)(376002)(189003)(199004)(186003)(42882007)(8676002)(36756003)(4326008)(66066001)(2351001)(6512007)(6306002)(102836004)(26005)(81156014)(81166006)(50226002)(1076003)(5660300002)(2906002)(8936002)(52116002)(386003)(6506007)(71190400001)(71200400001)(99286004)(256004)(66556008)(64756008)(66446008)(66946007)(3846002)(6116002)(54906003)(7736002)(486006)(476003)(44832011)(66476007)(2616005)(316002)(14444005)(966005)(6916009)(5640700003)(6486002)(305945005)(6436002)(2501003)(478600001)(14454004)(25786009)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1104;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aVyjaWAjKz6iIUh/hg1nTnDLBRtWXyh+TjVeH82Nn6zgkFEt1/oOIr6/YJmdOfj1sq/lRXACe2VE3utjJMxRo5VN+NGbLU4pZz2rMeJ3fo3zNiym+wR1pJDUuR34+awgWBA0b9CEDDWHoQaXdRh/j5JtgjtfdVCCLDId9SqAeECrPThxu0tleP3sz+MmNj9IKGGBJwnVKqJgsj+S7ZSGtJo+4t3a5XRi6Mu89H2MJWiBUVI7d45+2X7KE8PYEZW9Fpe+eQPsHlk5Noggk2/vzJZ9Ci/IehdV4rJD+j65gC1PFMmrN9F3GYhwNoZyqAOsoNNmGOLd4n6+IPVDJPfcZTVQY2vgTpvXLK3siqrpdYcjEIy9bMFdbKAzNa7nrnZbZupuluDCdr6dEGlkW9nQeLjlLQGlkYIeCongg9OhyMBI+/eHQRi9JcQPFWyIfThvSC1gyCNssp8Jz9XqYwwwHg==
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2331912e-9e36-4105-8f0f-08d74c2825e9
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2019 19:46:01.8329
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DrGNw+MCsP+ulwICs6uqA1z9c2bY7tB7Ejlv1X1AY7XVGrxuLgx45IgvGHRijwrQdVAL5h0luJ4TISw1W9kHmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1104
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

We have assembly implementations of strcpy(), strncpy(), strcmp() &
strncmp() which:

 - Are simple byte-at-a-time loops with no particular optimizations. As
   a comment in the code describes, they're "rather naive".

 - Offer no clear performance advantage over the generic C
   implementations - in microbenchmarks performed by Alexander Lobakin
   the asm functions sometimes win & sometimes lose, but generally not
   by large margins in either direction.

 - Don't support 64-bit kernels, where we already make use of the
   generic C implementations.

 - Tend to bloat kernel code size due to inlining.

 - Don't support CONFIG_FORTIFY_SOURCE.

 - Won't support nanoMIPS without rework.

For all of these reasons, delete the asm implementations & make use of
the generic C implementations for 32-bit kernels just like we already do
for 64-bit kernels.

Signed-off-by: Paul Burton <paul.burton@mips.com>
URL: https://lore.kernel.org/linux-mips/a2a35f1cf58d6db19eb4af9b4ae21e35@dl=
ink.ru/
Cc: Alexander Lobakin <alobakin@dlink.ru>
---

 arch/mips/include/asm/string.h | 123 ---------------------------------
 1 file changed, 123 deletions(-)

diff --git a/arch/mips/include/asm/string.h b/arch/mips/include/asm/string.=
h
index 4b938c55b397..1de3bbce8e88 100644
--- a/arch/mips/include/asm/string.h
+++ b/arch/mips/include/asm/string.h
@@ -10,129 +10,6 @@
 #ifndef _ASM_STRING_H
 #define _ASM_STRING_H
=20
-#if !defined(__OPTIMIZE__) || !defined(CONFIG_FORTIFY_SOURCE)
-
-/*
- * Most of the inline functions are rather naive implementations so I just
- * didn't bother updating them for 64-bit ...
- */
-#ifdef CONFIG_32BIT
-
-#ifndef IN_STRING_C
-
-#define __HAVE_ARCH_STRCPY
-static __inline__ char *strcpy(char *__dest, __const__ char *__src)
-{
-  char *__xdest =3D __dest;
-
-  __asm__ __volatile__(
-	".set\tnoreorder\n\t"
-	".set\tnoat\n"
-	"1:\tlbu\t$1,(%1)\n\t"
-	"addiu\t%1,1\n\t"
-	"sb\t$1,(%0)\n\t"
-	"bnez\t$1,1b\n\t"
-	"addiu\t%0,1\n\t"
-	".set\tat\n\t"
-	".set\treorder"
-	: "=3Dr" (__dest), "=3Dr" (__src)
-	: "0" (__dest), "1" (__src)
-	: "memory");
-
-  return __xdest;
-}
-
-#define __HAVE_ARCH_STRNCPY
-static __inline__ char *strncpy(char *__dest, __const__ char *__src, size_=
t __n)
-{
-  char *__xdest =3D __dest;
-
-  if (__n =3D=3D 0)
-    return __xdest;
-
-  __asm__ __volatile__(
-	".set\tnoreorder\n\t"
-	".set\tnoat\n"
-	"1:\tlbu\t$1,(%1)\n\t"
-	"subu\t%2,1\n\t"
-	"sb\t$1,(%0)\n\t"
-	"beqz\t$1,2f\n\t"
-	"addiu\t%0,1\n\t"
-	"bnez\t%2,1b\n\t"
-	"addiu\t%1,1\n"
-	"2:\n\t"
-	".set\tat\n\t"
-	".set\treorder"
-	: "=3Dr" (__dest), "=3Dr" (__src), "=3Dr" (__n)
-	: "0" (__dest), "1" (__src), "2" (__n)
-	: "memory");
-
-  return __xdest;
-}
-
-#define __HAVE_ARCH_STRCMP
-static __inline__ int strcmp(__const__ char *__cs, __const__ char *__ct)
-{
-  int __res;
-
-  __asm__ __volatile__(
-	".set\tnoreorder\n\t"
-	".set\tnoat\n\t"
-	"lbu\t%2,(%0)\n"
-	"1:\tlbu\t$1,(%1)\n\t"
-	"addiu\t%0,1\n\t"
-	"bne\t$1,%2,2f\n\t"
-	"addiu\t%1,1\n\t"
-	"bnez\t%2,1b\n\t"
-	"lbu\t%2,(%0)\n\t"
-#if defined(CONFIG_CPU_R3000)
-	"nop\n\t"
-#endif
-	"move\t%2,$1\n"
-	"2:\tsubu\t%2,$1\n"
-	"3:\t.set\tat\n\t"
-	".set\treorder"
-	: "=3Dr" (__cs), "=3Dr" (__ct), "=3Dr" (__res)
-	: "0" (__cs), "1" (__ct));
-
-  return __res;
-}
-
-#endif /* !defined(IN_STRING_C) */
-
-#define __HAVE_ARCH_STRNCMP
-static __inline__ int
-strncmp(__const__ char *__cs, __const__ char *__ct, size_t __count)
-{
-	int __res;
-
-	__asm__ __volatile__(
-	".set\tnoreorder\n\t"
-	".set\tnoat\n"
-	"1:\tlbu\t%3,(%0)\n\t"
-	"beqz\t%2,2f\n\t"
-	"lbu\t$1,(%1)\n\t"
-	"subu\t%2,1\n\t"
-	"bne\t$1,%3,3f\n\t"
-	"addiu\t%0,1\n\t"
-	"bnez\t%3,1b\n\t"
-	"addiu\t%1,1\n"
-	"2:\n\t"
-#if defined(CONFIG_CPU_R3000)
-	"nop\n\t"
-#endif
-	"move\t%3,$1\n"
-	"3:\tsubu\t%3,$1\n\t"
-	".set\tat\n\t"
-	".set\treorder"
-	: "=3Dr" (__cs), "=3Dr" (__ct), "=3Dr" (__count), "=3Dr" (__res)
-	: "0" (__cs), "1" (__ct), "2" (__count));
-
-	return __res;
-}
-#endif /* CONFIG_32BIT */
-#endif /* !defined(__OPTIMIZE__) || !defined(CONFIG_FORTIFY_SOURCE) */
-
 #define __HAVE_ARCH_MEMSET
 extern void *memset(void *__s, int __c, size_t __count);
=20
--=20
2.23.0

