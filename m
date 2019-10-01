Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFDFCC4323
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 23:54:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728461AbfJAVy1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 17:54:27 -0400
Received: from mail-eopbgr760115.outbound.protection.outlook.com ([40.107.76.115]:25806
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728204AbfJAVyU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 17:54:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LpmWaynSO8nNhi+S9tkXzGOiuvFNTDe1vOrXXVKwQzdEkcV4otEM7ydyiS+CkPMDdK+uggf+YoZUaUJCR/KBEINixQK1ojNaeM7AsPV5Eb03pdp1WD/h6jdlqQ4Ws00+SbZGojYl8aHoOabcJNnWs5eUOPEzDkBJxKWEKnrKA34yxgK9q7i4rmD0Ia1iWpwCwkc4RD/9yC3xl+BqV4Rsf8RfjIMthqY1Q/PgtP+A0P9yvEwfWqZaUiyOufGxIRo7KJozDhs6XTE9XD+3vA2Mgotr50f5jF4aiV9FzCMQzb3jEwq21WZH1F+RZNkZsT56JLTdiXmp21jlRr/dS1pBrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNYKj1hxnjMXXzl1DYbP6CGgH1/iGl4p4wsUEP3r9cY=;
 b=bS7dvq9ff0Tor8eLZ0l38iLBAKJOx8lKkfJjCnTz2f0YriNwrqfbnTyjgE3vMNh04vNxYju8VfvQDtqJeE8wOwBa87/K1SQOZXvaqGqyiiYprir39aRHujCWtBc43tAuZWWnl1YYWBI1ldXBX4lZ69lYyPBLdi4qM5ZQMhIsPmBxrOr4DcnxangHdjZuW5I8BCeOhVfY2M0p0jUE4ckef5fR/5E8PPE56GK4yi6xArzkxA4V/hhHQEHq0LqNL96ATEhRsQH72UBveCAbB7sIRABcQrBxCoeGN4OPOX4pLl8oTYNVdczSVhaM2iUKO0sEEJOss23LxrNh6/6z1Fgsfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LNYKj1hxnjMXXzl1DYbP6CGgH1/iGl4p4wsUEP3r9cY=;
 b=P36tm/mbiPqOGn99iu0S+U6ZZnSvaJC4KW7lvkEA6amQr2b2x6ifKwel2hOTgyQGJAGTaXiBIp2ZfSALtDQQXKx+WFlkrfbXHr6hxaRRXcsl7vUvYhwXYDY8A/o8LQsAykOjclSSy9ehAlN73NkhhrWY7kmrvECGiDrPdZ87YfM=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1439.namprd22.prod.outlook.com (10.174.169.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 21:53:31 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:53:31 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH v2 21/36] MIPS: bitops: Allow immediates in
 test_and_{set,clear,change}_bit
Thread-Topic: [PATCH v2 21/36] MIPS: bitops: Allow immediates in
 test_and_{set,clear,change}_bit
Thread-Index: AQHVeKKqDW9GPW66cUyyL3ilTsVu8g==
Date:   Tue, 1 Oct 2019 21:53:31 +0000
Message-ID: <20191001215249.4157062-22-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: e7d8f364-760b-4534-4c8f-08d746b9cc6e
x-ms-traffictypediagnostic: MWHPR2201MB1439:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB1439C6EA7A33300D2DF74003C19D0@MWHPR2201MB1439.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3173;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(396003)(39840400004)(366004)(346002)(136003)(376002)(199004)(189003)(186003)(11346002)(6512007)(1076003)(486006)(66066001)(26005)(6486002)(316002)(2906002)(5640700003)(6436002)(44832011)(42882007)(25786009)(446003)(6916009)(386003)(6506007)(76176011)(478600001)(52116002)(2616005)(102836004)(476003)(5660300002)(305945005)(64756008)(66446008)(14444005)(2351001)(7736002)(99286004)(54906003)(14454004)(71190400001)(71200400001)(66946007)(66556008)(66476007)(36756003)(3846002)(6116002)(107886003)(4326008)(50226002)(81166006)(81156014)(8676002)(2501003)(8936002)(256004)(14773001)(142933001)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1439;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: mVFS3Nozpc+lygteNzkhBnnOD8rG2y6id7lAu+AEjLdPGl3nXReGMrZkL4t+WgJZ6aXWtXTwXE+fbXf11qi72opElY+G9Hsg0Nf4TuqlUZOEmnHlMFCk4lEztwqktvFh8OFHY55V2jm5vxQAnyga+1YDlkhopJuqQ/ee6ay7C0Mi3ak7hfqtm1XfRA+6We1aw+a1CP95FOQ78AEsP9Q2wgHQ6OoZzY1lOjxqbVekZaDD7MLHF0niDIfodd/eiwehBpQLaBVsFdlfKPXQQGQlKKsRguNf8COhF+w1zGCZJ693d3d0V/zWX1lWtr3NPbJchkc0Zazu/QEuE2uDzqnFol53Be7jk8ph/J0OObvCisvNgisU7d+ZI8xALalnlggGmFVhXIvzUD0tYJNvRSB6eqsxo902U1ZALwdsjUf1dyg=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7d8f364-760b-4534-4c8f-08d746b9cc6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:53:31.0568
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VP3IRFtiBfl5s4Z8Oc4OpVOE9u3otJHiImyX+JX9zx/wwmon3IenpmqsNnCPa1GfoizqIvI9iE+ojOufpL60yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1439
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The logical operations or & xor used in the test_and_set_bit_lock(),
test_and_clear_bit() & test_and_change_bit() functions currently force
the value 1<<bit to be placed in a register. If the bit is compile-time
constant & fits within the immediate field of an or/xor instruction (ie.
16 bits) then we can make use of the ori/xori instruction variants &
avoid the use of an extra register. Add the extra "i" constraints in
order to allow use of these immediate encodings.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

Changes in v2: None

 arch/mips/include/asm/bitops.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.=
h
index ea35a2e87b6d..7314ba5a3683 100644
--- a/arch/mips/include/asm/bitops.h
+++ b/arch/mips/include/asm/bitops.h
@@ -261,7 +261,7 @@ static inline int test_and_set_bit_lock(unsigned long n=
r,
 		"	and	%2, %0, %3				\n"
 		"	.set	pop					\n"
 		: "=3D&r" (temp), "+m" (*m), "=3D&r" (res)
-		: "r" (1UL << bit)
+		: "ir" (1UL << bit)
 		: __LLSC_CLOBBER);
 	} else {
 		loongson_llsc_mb();
@@ -274,7 +274,7 @@ static inline int test_and_set_bit_lock(unsigned long n=
r,
 			"	" __SC	"%2, %1				\n"
 			"	.set	pop				\n"
 			: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m), "=3D&r" (res)
-			: "r" (1UL << bit)
+			: "ir" (1UL << bit)
 			: __LLSC_CLOBBER);
 		} while (unlikely(!res));
=20
@@ -332,7 +332,7 @@ static inline int test_and_clear_bit(unsigned long nr,
 		"	and	%2, %0, %3				\n"
 		"	.set	pop					\n"
 		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m), "=3D&r" (res)
-		: "r" (1UL << bit)
+		: "ir" (1UL << bit)
 		: __LLSC_CLOBBER);
 	} else if ((MIPS_ISA_REV >=3D 2) && __builtin_constant_p(nr)) {
 		loongson_llsc_mb();
@@ -358,7 +358,7 @@ static inline int test_and_clear_bit(unsigned long nr,
 			"	" __SC	"%2, %1				\n"
 			"	.set	pop				\n"
 			: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m), "=3D&r" (res)
-			: "r" (1UL << bit)
+			: "ir" (1UL << bit)
 			: __LLSC_CLOBBER);
 		} while (unlikely(!res));
=20
@@ -400,7 +400,7 @@ static inline int test_and_change_bit(unsigned long nr,
 		"	and	%2, %0, %3				\n"
 		"	.set	pop					\n"
 		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m), "=3D&r" (res)
-		: "r" (1UL << bit)
+		: "ir" (1UL << bit)
 		: __LLSC_CLOBBER);
 	} else {
 		loongson_llsc_mb();
@@ -413,7 +413,7 @@ static inline int test_and_change_bit(unsigned long nr,
 			"	" __SC	"\t%2, %1			\n"
 			"	.set	pop				\n"
 			: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m), "=3D&r" (res)
-			: "r" (1UL << bit)
+			: "ir" (1UL << bit)
 			: __LLSC_CLOBBER);
 		} while (unlikely(!res));
=20
--=20
2.23.0

