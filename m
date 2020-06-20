Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E22982022E2
	for <lists+linux-mips@lfdr.de>; Sat, 20 Jun 2020 11:35:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727841AbgFTJe6 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 20 Jun 2020 05:34:58 -0400
Received: from mail2.protonmail.ch ([185.70.40.22]:54587 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727866AbgFTJe6 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 20 Jun 2020 05:34:58 -0400
Date:   Sat, 20 Jun 2020 09:34:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me; s=protonmail;
        t=1592645694; bh=AmHbVOMk66AqezIk6cxSXO5/iQAq0kMicOJudm4j0nU=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=J6R89rH4S6CN6c8EcCRqpTBc/YykQDuLfkKvjSsI1rswYs8WnzkV9UFia8TP/9Q9C
         qYbwmksLHPfDILMII95hmI3B1LLh9fJBBV0uKd+sjUKnRMyMtr60RdGXftYqxEhqTL
         ETxdshEhvF1O7yk1KHlL2g/x1+m8M0T3mSusHc9FXfwYEJAhnrq5tpOeT1BqN8MFDZ
         McbL8t2fEa99uzKDJb/LKkSIZlNsz36MTy2FjGPVkczwAr5x31PKa6JI36gv6Uztm+
         /Pu/h3h31fuO8e8UzaJzTKpon3S90Y7pchsv8/9h/NpLajchj3OQmSRa970UkpBeUr
         zv2f4lnlN9DJg==
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
From:   Alexander Lobakin <alobakin@pm.me>
Cc:     Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Paul Burton <paulburton@kernel.org>,
        Alexander Lobakin <alobakin@pm.me>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Reply-To: Alexander Lobakin <alobakin@pm.me>
Subject: [PATCH mips-next 2/3] MIPS: io: fix sparse flood on asm/io.h
Message-ID: <HyB5xAO4R0VR5UqO8muH7SX_FFMvIzCPTWnsyxHCQ0TSm5qDtSVd8pULRukOxWeEQst7KH0AMIK9JgLzNYQL-UNcQHj89_3ShKpGg4VKBF8=@pm.me>
In-Reply-To: <OXAnLrccR2GxIpepN5IUjppNnjyVAnjQmCIx2RmgpMLsOzOBgXMKYvmjivy4Rq0bAVf11R5V9_FwfGx-MML3dShuOOoPUtAHUHUedlVrW_g=@pm.me>
References: <OXAnLrccR2GxIpepN5IUjppNnjyVAnjQmCIx2RmgpMLsOzOBgXMKYvmjivy4Rq0bAVf11R5V9_FwfGx-MML3dShuOOoPUtAHUHUedlVrW_g=@pm.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

MIPS MMIO macros for byteswapping from/to hardware endianness are a bit
tricky because they use cpu_to_le{16,32,64}() in both directions.
This generates a lot of questions from sparse as __le{16,32,64} types
are 'restricted' and direct cast is forbidden in order to prevent messing
up the byteorder.
As MMIO ops are used in almost every single driver, this leads to console
flooding and complicates bug hunting.

We could fix it in a more proper way, i.e. separate from device /
to device byteswap macros and expand __BUILD_MEMORY_*(), but this seems
redundant and will produce code duplication.
Instead, just expand the existing *ioswab*() macros with forced
typecasting to stop floods.

Signed-off-by: Alexander Lobakin <alobakin@pm.me>
---
 .../include/asm/mach-cavium-octeon/mangle-port.h     | 12 +++++++++---
 arch/mips/include/asm/mach-generic/mangle-port.h     | 12 ++++++------
 arch/mips/include/asm/mach-ip27/mangle-port.h        |  6 +++---
 arch/mips/include/asm/mach-ip30/mangle-port.h        |  6 +++---
 arch/mips/include/asm/mach-ip32/mangle-port.h        |  6 +++---
 arch/mips/include/asm/mach-tx39xx/mangle-port.h      |  6 +++---
 arch/mips/include/asm/mach-tx49xx/mangle-port.h      |  6 +++---
 7 files changed, 30 insertions(+), 24 deletions(-)

diff --git a/arch/mips/include/asm/mach-cavium-octeon/mangle-port.h b/arch/=
mips/include/asm/mach-cavium-octeon/mangle-port.h
index 8ff2cbdf2c3e..239fcc874b99 100644
--- a/arch/mips/include/asm/mach-cavium-octeon/mangle-port.h
+++ b/arch/mips/include/asm/mach-cavium-octeon/mangle-port.h
@@ -48,11 +48,17 @@ static inline bool __should_swizzle_addr(u64 p)
=20
 # define ioswabb(a, x)=09=09(x)
 # define __mem_ioswabb(a, x)=09(x)
-# define ioswabw(a, x)=09=09(__should_swizzle_bits(a) ? le16_to_cpu(x) : x=
)
+# define ioswabw(a, x)=09=09(__should_swizzle_bits(a) ?=09=09\
+=09=09=09=09 le16_to_cpu((__force __le16)(x)) :=09\
+=09=09=09=09 (x))
 # define __mem_ioswabw(a, x)=09(x)
-# define ioswabl(a, x)=09=09(__should_swizzle_bits(a) ? le32_to_cpu(x) : x=
)
+# define ioswabl(a, x)=09=09(__should_swizzle_bits(a) ?=09=09\
+=09=09=09=09 le32_to_cpu((__force __le32)(x)) :=09\
+=09=09=09=09 (x))
 # define __mem_ioswabl(a, x)=09(x)
-# define ioswabq(a, x)=09=09(__should_swizzle_bits(a) ? le64_to_cpu(x) : x=
)
+# define ioswabq(a, x)=09=09(__should_swizzle_bits(a) ?=09=09\
+=09=09=09=09 le64_to_cpu((__force __le64)(x)) :=09\
+=09=09=09=09 (x))
 # define __mem_ioswabq(a, x)=09(x)
=20
 #endif /* __ASM_MACH_GENERIC_MANGLE_PORT_H */
diff --git a/arch/mips/include/asm/mach-generic/mangle-port.h b/arch/mips/i=
nclude/asm/mach-generic/mangle-port.h
index e4daf163706c..77c65c294db6 100644
--- a/arch/mips/include/asm/mach-generic/mangle-port.h
+++ b/arch/mips/include/asm/mach-generic/mangle-port.h
@@ -29,11 +29,11 @@
=20
 # define ioswabb(a, x)=09=09(x)
 # define __mem_ioswabb(a, x)=09(x)
-# define ioswabw(a, x)=09=09le16_to_cpu(x)
+# define ioswabw(a, x)=09=09le16_to_cpu((__force __le16)(x))
 # define __mem_ioswabw(a, x)=09(x)
-# define ioswabl(a, x)=09=09le32_to_cpu(x)
+# define ioswabl(a, x)=09=09le32_to_cpu((__force __le32)(x))
 # define __mem_ioswabl(a, x)=09(x)
-# define ioswabq(a, x)=09=09le64_to_cpu(x)
+# define ioswabq(a, x)=09=09le64_to_cpu((__force __le64)(x))
 # define __mem_ioswabq(a, x)=09(x)
=20
 #else
@@ -41,11 +41,11 @@
 # define ioswabb(a, x)=09=09(x)
 # define __mem_ioswabb(a, x)=09(x)
 # define ioswabw(a, x)=09=09(x)
-# define __mem_ioswabw(a, x)=09cpu_to_le16(x)
+# define __mem_ioswabw(a, x)=09((__force u16)cpu_to_le16(x))
 # define ioswabl(a, x)=09=09(x)
-# define __mem_ioswabl(a, x)=09cpu_to_le32(x)
+# define __mem_ioswabl(a, x)=09((__force u32)cpu_to_le32(x))
 # define ioswabq(a, x)=09=09(x)
-# define __mem_ioswabq(a, x)=09cpu_to_le64(x)
+# define __mem_ioswabq(a, x)=09((__force u64)cpu_to_le64(x))
=20
 #endif
=20
diff --git a/arch/mips/include/asm/mach-ip27/mangle-port.h b/arch/mips/incl=
ude/asm/mach-ip27/mangle-port.h
index 27c56efa519f..f71c38bbfc2f 100644
--- a/arch/mips/include/asm/mach-ip27/mangle-port.h
+++ b/arch/mips/include/asm/mach-ip27/mangle-port.h
@@ -16,10 +16,10 @@
 # define ioswabb(a, x)=09=09(x)
 # define __mem_ioswabb(a, x)=09(x)
 # define ioswabw(a, x)=09=09(x)
-# define __mem_ioswabw(a, x)=09cpu_to_le16(x)
+# define __mem_ioswabw(a, x)=09((__force u16)cpu_to_le16(x))
 # define ioswabl(a, x)=09=09(x)
-# define __mem_ioswabl(a, x)=09cpu_to_le32(x)
+# define __mem_ioswabl(a, x)=09((__force u32)cpu_to_le32(x))
 # define ioswabq(a, x)=09=09(x)
-# define __mem_ioswabq(a, x)=09cpu_to_le64(x)
+# define __mem_ioswabq(a, x)=09((__force u64)cpu_to_le64(x))
=20
 #endif /* __ASM_MACH_IP27_MANGLE_PORT_H */
diff --git a/arch/mips/include/asm/mach-ip30/mangle-port.h b/arch/mips/incl=
ude/asm/mach-ip30/mangle-port.h
index f3e1262a2d5e..439c6a601830 100644
--- a/arch/mips/include/asm/mach-ip30/mangle-port.h
+++ b/arch/mips/include/asm/mach-ip30/mangle-port.h
@@ -13,10 +13,10 @@
 #define ioswabb(a, x)=09=09(x)
 #define __mem_ioswabb(a, x)=09(x)
 #define ioswabw(a, x)=09=09(x)
-#define __mem_ioswabw(a, x)=09cpu_to_le16(x)
+#define __mem_ioswabw(a, x)=09((__force u16)cpu_to_le16(x))
 #define ioswabl(a, x)=09=09(x)
-#define __mem_ioswabl(a, x)=09cpu_to_le32(x)
+#define __mem_ioswabl(a, x)=09((__force u32)cpu_to_le32(x))
 #define ioswabq(a, x)=09=09(x)
-#define __mem_ioswabq(a, x)=09cpu_to_le64(x)
+#define __mem_ioswabq(a, x)=09((__force u64)cpu_to_le64(x))
=20
 #endif /* __ASM_MACH_IP30_MANGLE_PORT_H */
diff --git a/arch/mips/include/asm/mach-ip32/mangle-port.h b/arch/mips/incl=
ude/asm/mach-ip32/mangle-port.h
index c5ef72ccb0d5..4bc3d20e8293 100644
--- a/arch/mips/include/asm/mach-ip32/mangle-port.h
+++ b/arch/mips/include/asm/mach-ip32/mangle-port.h
@@ -17,10 +17,10 @@
 # define ioswabb(a, x)=09=09(x)
 # define __mem_ioswabb(a, x)=09(x)
 # define ioswabw(a, x)=09=09(x)
-# define __mem_ioswabw(a, x)=09cpu_to_le16(x)
+# define __mem_ioswabw(a, x)=09((__force u16)cpu_to_le16(x))
 # define ioswabl(a, x)=09=09(x)
-# define __mem_ioswabl(a, x)=09cpu_to_le32(x)
+# define __mem_ioswabl(a, x)=09((__force u32)cpu_to_le32(x))
 # define ioswabq(a, x)=09=09(x)
-# define __mem_ioswabq(a, x)=09cpu_to_le64(x)
+# define __mem_ioswabq(a, x)=09((__force u64)cpu_to_le64(x))
=20
 #endif /* __ASM_MACH_IP32_MANGLE_PORT_H */
diff --git a/arch/mips/include/asm/mach-tx39xx/mangle-port.h b/arch/mips/in=
clude/asm/mach-tx39xx/mangle-port.h
index ab7a70bd895e..95be459950f7 100644
--- a/arch/mips/include/asm/mach-tx39xx/mangle-port.h
+++ b/arch/mips/include/asm/mach-tx39xx/mangle-port.h
@@ -14,11 +14,11 @@ extern unsigned long (*__swizzle_addr_b)(unsigned long =
port);
=20
 #define ioswabb(a, x)=09=09(x)
 #define __mem_ioswabb(a, x)=09(x)
-#define ioswabw(a, x)=09=09le16_to_cpu(x)
+#define ioswabw(a, x)=09=09le16_to_cpu((__force __le16)(x))
 #define __mem_ioswabw(a, x)=09(x)
-#define ioswabl(a, x)=09=09le32_to_cpu(x)
+#define ioswabl(a, x)=09=09le32_to_cpu((__force __le32)(x))
 #define __mem_ioswabl(a, x)=09(x)
-#define ioswabq(a, x)=09=09le64_to_cpu(x)
+#define ioswabq(a, x)=09=09le64_to_cpu((__force __le64)(x))
 #define __mem_ioswabq(a, x)=09(x)
=20
 #endif /* __ASM_MACH_TX39XX_MANGLE_PORT_H */
diff --git a/arch/mips/include/asm/mach-tx49xx/mangle-port.h b/arch/mips/in=
clude/asm/mach-tx49xx/mangle-port.h
index e061ef38fb5f..98c7abf4484a 100644
--- a/arch/mips/include/asm/mach-tx49xx/mangle-port.h
+++ b/arch/mips/include/asm/mach-tx49xx/mangle-port.h
@@ -16,12 +16,12 @@
 extern u16 (*ioswabw)(volatile u16 *a, u16 x);
 extern u16 (*__mem_ioswabw)(volatile u16 *a, u16 x);
 #else
-#define ioswabw(a, x)=09=09le16_to_cpu(x)
+#define ioswabw(a, x)=09=09le16_to_cpu((__force __le16)(x))
 #define __mem_ioswabw(a, x)=09(x)
 #endif
-#define ioswabl(a, x)=09=09le32_to_cpu(x)
+#define ioswabl(a, x)=09=09le32_to_cpu((__force __le32)(x))
 #define __mem_ioswabl(a, x)=09(x)
-#define ioswabq(a, x)=09=09le64_to_cpu(x)
+#define ioswabq(a, x)=09=09le64_to_cpu((__force __le64)(x))
 #define __mem_ioswabq(a, x)=09(x)
=20
 #endif /* __ASM_MACH_TX49XX_MANGLE_PORT_H */
--=20
2.27.0


