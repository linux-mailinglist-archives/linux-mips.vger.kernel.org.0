Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE9F4C431D
	for <lists+linux-mips@lfdr.de>; Tue,  1 Oct 2019 23:54:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728231AbfJAVxp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Oct 2019 17:53:45 -0400
Received: from mail-eopbgr730113.outbound.protection.outlook.com ([40.107.73.113]:17171
        "EHLO NAM05-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728200AbfJAVxk (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Oct 2019 17:53:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jhlmrJtnFZS1uRLa/L/tibdnZROlxPEQ5wQG+jI781nhIys3WUnWms74P5ZeMreAOSZQis3QPRGzYyBwepDw665wcIhLXv54AZPwQyCzDxzPMqFp7fvBfwbYq3RO1nkeZ2T5GTuhVu6iIx3FqLQ8pPBp1DgBkKsn3utXn1rBIWbeAIm2j9nJGboqgN4XCs5/q0RPf5Nrog/FknNxT1J8FKnXe5WEZBtrJiRe5cE7U7KlQj2dekDKRoNMSGaZuHpNia4yOcz0SH+71tU5yrpMOQ1yT2N8bAcCYNPZ+btBBU8r0ovTy6a9l1UbB+oKnc8ZgQUIDIHU4Rki8mIoXuhdIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ci/15PmHn5aOkSH4PGDpm2VAoB19B/XPaRo/e5fUaXA=;
 b=JX6LY+WSa54PYRK7E1y/CDQazB6OEbmXi4OYqkfWDyziOmwVjPMDnV+dt3Ue+4Hg/65BqMrG1QcHdOgvoDGpeRQgkMoQW3IGjklOZdh23kFx5aM7/SqyGljPv7yw067343oIKY/ivQ5BSedgMaj7p1CrHIHPcwXkKZfWjczenHiLY70Agns0CJhpKF7NPPcmaVHsCJ6K0HeczyTbiC3ACFKJyTrE5t9eFlrrpBJshZ6UXXjVrF2/eoTk9jo5S9glyKB7+uyxz6TZglx79ZYmg9H7ro6sVs/ANIv0AnIg9UbnZupowqKTpGMBT97mida+6BWU5drLzvIKzK+kMi9W3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wavecomp.com; dmarc=pass action=none header.from=mips.com;
 dkim=pass header.d=mips.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wavecomp.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ci/15PmHn5aOkSH4PGDpm2VAoB19B/XPaRo/e5fUaXA=;
 b=Zir1FnQDp4HaGyU5Al1Csalw5RaMiQgqtO8dc1PavhdBrNZC9tWwuDfjE9EZV/4THOLtOSFrgtYYpyzQukpz50JkKm5EB4aY66clWNltTkcmw6oxug1JOR8UV6hQPv+1kEOXqCCJeZO1FHFU7fkSmSoDKM50GAb5vJP404nPuaI=
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com (10.172.60.12) by
 MWHPR2201MB1439.namprd22.prod.outlook.com (10.174.169.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2305.20; Tue, 1 Oct 2019 21:53:32 +0000
Received: from MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481]) by MWHPR2201MB1277.namprd22.prod.outlook.com
 ([fe80::498b:c2cd:e816:1481%2]) with mapi id 15.20.2305.022; Tue, 1 Oct 2019
 21:53:32 +0000
From:   Paul Burton <paul.burton@mips.com>
To:     "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
CC:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Paul Burton <pburton@wavecomp.com>
Subject: [PATCH v2 22/36] MIPS: bitops: Use the BIT() macro
Thread-Topic: [PATCH v2 22/36] MIPS: bitops: Use the BIT() macro
Thread-Index: AQHVeKKqA6Bv8sCnekWZwAB+VsQHGA==
Date:   Tue, 1 Oct 2019 21:53:31 +0000
Message-ID: <20191001215249.4157062-23-paul.burton@mips.com>
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
x-ms-office365-filtering-correlation-id: 1450bc32-0afc-4610-589c-08d746b9cced
x-ms-traffictypediagnostic: MWHPR2201MB1439:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR2201MB143955AA7D4332496C37ACE2C19D0@MWHPR2201MB1439.namprd22.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1201;
x-forefront-prvs: 0177904E6B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(979002)(396003)(39840400004)(366004)(346002)(136003)(376002)(199004)(189003)(186003)(11346002)(6512007)(1076003)(486006)(66066001)(26005)(6486002)(316002)(2906002)(5640700003)(6436002)(44832011)(42882007)(25786009)(446003)(6916009)(386003)(6506007)(76176011)(478600001)(52116002)(2616005)(102836004)(476003)(5660300002)(305945005)(64756008)(66446008)(14444005)(2351001)(7736002)(99286004)(54906003)(14454004)(71190400001)(71200400001)(66946007)(66556008)(66476007)(36756003)(3846002)(6116002)(107886003)(4326008)(50226002)(81166006)(81156014)(8676002)(2501003)(8936002)(256004)(969003)(989001)(999001)(1009001)(1019001);DIR:OUT;SFP:1102;SCL:1;SRVR:MWHPR2201MB1439;H:MWHPR2201MB1277.namprd22.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: wavecomp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: SZLAzBOYsmF7EkeXRPnIpcbQ0VmxULLbUV99kglxFa7lxAJVsa1MHnGQYQqduLyyqtW5D7JTPdaOYeX8EYMp3jOnlB7I960jAUpOZdQI2F/kYUSIyTqbR5szrNRbGcV21JYw6/jw+tlGni06R+9NHPG7uCveyL2XEtWXHVbU9RLy20s7iMGvd0FinQaOwHGDV2PmEWI+Mn8s8m0iB2klUQmH3UIfk+RlIe3uyFTfhZLRumkhENqv0zN+rOhgrq63QnYKb0jfjzYrEP5Iz3L7ovwB8yRrRDKhrrGMC2DNTk5aQEjdz9ZMCnOADrXnuf9kAlYrTCcIZ6syvFXdamdxwECQB3jtoSvclpBbJcyV/uH1+pYVN8d3aONHQzRC6P4J4YpkR5e3+xXni17Bndd+EsiPbiN0m+uTMRwVyvAsC1E=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: mips.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1450bc32-0afc-4610-589c-08d746b9cced
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Oct 2019 21:53:31.9024
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 463607d3-1db3-40a0-8a29-970c56230104
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nHVVRwVUr1tCqku9VBwEj933BjwgzbXejnjPpgZ5XcyKM+P5ow0yuG1e9CHrSCX43OYKLF7XQ+Uzm37np4jU3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR2201MB1439
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use the BIT() macro in asm/bitops.h rather than open-coding its
equivalent.

Signed-off-by: Paul Burton <paul.burton@mips.com>
---

Changes in v2: None

 arch/mips/include/asm/bitops.h | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/arch/mips/include/asm/bitops.h b/arch/mips/include/asm/bitops.=
h
index 7314ba5a3683..0f8ff896e86b 100644
--- a/arch/mips/include/asm/bitops.h
+++ b/arch/mips/include/asm/bitops.h
@@ -13,6 +13,7 @@
 #error only <linux/bitops.h> can be included directly
 #endif
=20
+#include <linux/bits.h>
 #include <linux/compiler.h>
 #include <linux/types.h>
 #include <asm/barrier.h>
@@ -70,7 +71,7 @@ static inline void set_bit(unsigned long nr, volatile uns=
igned long *addr)
 		"	beqzl	%0, 1b					\n"
 		"	.set	pop					\n"
 		: "=3D&r" (temp), "=3D" GCC_OFF_SMALL_ASM() (*m)
-		: "ir" (1UL << bit), GCC_OFF_SMALL_ASM() (*m)
+		: "ir" (BIT(bit)), GCC_OFF_SMALL_ASM() (*m)
 		: __LLSC_CLOBBER);
 		return;
 	}
@@ -99,7 +100,7 @@ static inline void set_bit(unsigned long nr, volatile un=
signed long *addr)
 		"	" __SC	"%0, %1				\n"
 		"	.set	pop				\n"
 		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m)
-		: "ir" (1UL << bit)
+		: "ir" (BIT(bit))
 		: __LLSC_CLOBBER);
 	} while (unlikely(!temp));
 }
@@ -135,7 +136,7 @@ static inline void clear_bit(unsigned long nr, volatile=
 unsigned long *addr)
 		"	beqzl	%0, 1b					\n"
 		"	.set	pop					\n"
 		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m)
-		: "ir" (~(1UL << bit))
+		: "ir" (~(BIT(bit)))
 		: __LLSC_CLOBBER);
 		return;
 	}
@@ -164,7 +165,7 @@ static inline void clear_bit(unsigned long nr, volatile=
 unsigned long *addr)
 		"	" __SC "%0, %1				\n"
 		"	.set	pop				\n"
 		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m)
-		: "ir" (~(1UL << bit))
+		: "ir" (~(BIT(bit)))
 		: __LLSC_CLOBBER);
 	} while (unlikely(!temp));
 }
@@ -213,7 +214,7 @@ static inline void change_bit(unsigned long nr, volatil=
e unsigned long *addr)
 		"	beqzl	%0, 1b				\n"
 		"	.set	pop				\n"
 		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m)
-		: "ir" (1UL << bit)
+		: "ir" (BIT(bit))
 		: __LLSC_CLOBBER);
 		return;
 	}
@@ -228,7 +229,7 @@ static inline void change_bit(unsigned long nr, volatil=
e unsigned long *addr)
 		"	" __SC	"%0, %1				\n"
 		"	.set	pop				\n"
 		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m)
-		: "ir" (1UL << bit)
+		: "ir" (BIT(bit))
 		: __LLSC_CLOBBER);
 	} while (unlikely(!temp));
 }
@@ -261,7 +262,7 @@ static inline int test_and_set_bit_lock(unsigned long n=
r,
 		"	and	%2, %0, %3				\n"
 		"	.set	pop					\n"
 		: "=3D&r" (temp), "+m" (*m), "=3D&r" (res)
-		: "ir" (1UL << bit)
+		: "ir" (BIT(bit))
 		: __LLSC_CLOBBER);
 	} else {
 		loongson_llsc_mb();
@@ -274,11 +275,11 @@ static inline int test_and_set_bit_lock(unsigned long=
 nr,
 			"	" __SC	"%2, %1				\n"
 			"	.set	pop				\n"
 			: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m), "=3D&r" (res)
-			: "ir" (1UL << bit)
+			: "ir" (BIT(bit))
 			: __LLSC_CLOBBER);
 		} while (unlikely(!res));
=20
-		res =3D temp & (1UL << bit);
+		res =3D temp & BIT(bit);
 	}
=20
 	smp_llsc_mb();
@@ -332,7 +333,7 @@ static inline int test_and_clear_bit(unsigned long nr,
 		"	and	%2, %0, %3				\n"
 		"	.set	pop					\n"
 		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m), "=3D&r" (res)
-		: "ir" (1UL << bit)
+		: "ir" (BIT(bit))
 		: __LLSC_CLOBBER);
 	} else if ((MIPS_ISA_REV >=3D 2) && __builtin_constant_p(nr)) {
 		loongson_llsc_mb();
@@ -358,11 +359,11 @@ static inline int test_and_clear_bit(unsigned long nr=
,
 			"	" __SC	"%2, %1				\n"
 			"	.set	pop				\n"
 			: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m), "=3D&r" (res)
-			: "ir" (1UL << bit)
+			: "ir" (BIT(bit))
 			: __LLSC_CLOBBER);
 		} while (unlikely(!res));
=20
-		res =3D temp & (1UL << bit);
+		res =3D temp & BIT(bit);
 	}
=20
 	smp_llsc_mb();
@@ -400,7 +401,7 @@ static inline int test_and_change_bit(unsigned long nr,
 		"	and	%2, %0, %3				\n"
 		"	.set	pop					\n"
 		: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m), "=3D&r" (res)
-		: "ir" (1UL << bit)
+		: "ir" (BIT(bit))
 		: __LLSC_CLOBBER);
 	} else {
 		loongson_llsc_mb();
@@ -413,11 +414,11 @@ static inline int test_and_change_bit(unsigned long n=
r,
 			"	" __SC	"\t%2, %1			\n"
 			"	.set	pop				\n"
 			: "=3D&r" (temp), "+" GCC_OFF_SMALL_ASM() (*m), "=3D&r" (res)
-			: "ir" (1UL << bit)
+			: "ir" (BIT(bit))
 			: __LLSC_CLOBBER);
 		} while (unlikely(!res));
=20
-		res =3D temp & (1UL << bit);
+		res =3D temp & BIT(bit);
 	}
=20
 	smp_llsc_mb();
--=20
2.23.0

