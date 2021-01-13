Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B23992F4E41
	for <lists+linux-mips@lfdr.de>; Wed, 13 Jan 2021 16:16:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726011AbhAMPOy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 Jan 2021 10:14:54 -0500
Received: from mout.gmx.net ([212.227.17.22]:36917 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726118AbhAMPOx (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 13 Jan 2021 10:14:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1610550801;
        bh=Ua1mWCOr4LTqZEzaZB63R+wqOSGeuV/pZ/FWoM0VPhU=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
        b=EjvCz0Bzav/NqkqTtJzHKx36Ytz1dIlrN4OtdOKLQ7lrtMJIWjfAwYShEo3kYxpby
         rGw0FNPn+d4BpdgELueNGgafVv78YmVQ2ZjzR8edq5kGXEMKLuo2k2zETpuUpNJ66R
         g+qYRHoPVR3MnxgRmRHHc6qNvv/b1q9VP+cT1yXQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.203.161.65]) by mail.gmx.com (mrgmx105
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1Ma24y-1kTvNN1sNI-00W2Ab; Wed, 13
 Jan 2021 16:13:21 +0100
Date:   Wed, 13 Jan 2021 17:10:07 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de
Subject: [PATCH 1/6 v6] Revert "MIPS: Remove unused R4300 CPU support"
Message-Id: <20210113171007.27fe6b22bf30839c74023e50@gmx.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qEW1+u/+y2sdnrGz4ReJAylgtnG5VCfaELmb/dxS3TmTWxKPOVZ
 KX7jJNO9F5PoM+gN6I8MuxScKXFpWiH8tWWAwy02ywdSXQT4Slmw85Chdiu2LoTkZCHmx+C
 OgsWvW+3gcAqvptNTKxYUN58W0Uhh/9UwY2S10EUvln1HxFJ9KF6TIkbaD6Z1Kf0Vcxy0NF
 UCCujY5cklVEvYv0UmA6g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:dX4YoNjPAPQ=:HZdAPqeUL6W4Li7lDseIjm
 PetUgWdvF9/jumvm0y3M1DqpSlLjJBxERhzD+xsFtEYddaCrMoimuzFBjCcSnc5gunVXs/Rd/
 E5lhggtnBHvkvHYFdCpqk9w1S8mweX1/vO5ifMQc+RxJKwnjv+jMpF047CZmYCCn2mAS3wLI7
 QQqkxvk7Jwtu3wUMdvMMuJMc4RqQ9Xo3Qe+x7ufOUQDaHEC14ySYwMIDhz08Vq0Tzde4AoN9O
 zFywn1uz8T4JodcVObMsdrcyp3UmF+yJVJgqq+cA2a3SfeoRZu1IoAzzpYhSJJc1uFxHFzhVM
 +C3lAkLeJ0mF+p/eZ7phbG3PZUm1oZgOQzmeTPSjoeoTDvZj6qxJjMWh32Kt7FFM7hiasZc2B
 Iiwq0uwe4wxieN5XhngpW2QkkBoJ8OWSfF8YYXl2YQrv8YSLgc9nSxswCnCJK6Y2oxYiE+m8D
 f5EE1M9LxGG4SSf+4lQB5RH9X+KFa03Fxdn4T3OpUgHEmcQRPtwGDBS9+QvAyLZtmTtg+xL23
 YKIgrb/B9mLNGgoCzFz1V4z1Dg9/Y168d1rhPu/UTGELCIgKwQfDz3hVuGZx3V71oBogGYHMv
 iXxZRXOgWgf3X9zzxnrEWSOqPu9Gbf+9WhHMdCWzOeLr6/sKXOh0TQjUGYPagcCIvQIlvkqxd
 MYkuIxcYQZ8tgP9acJlgjqtWSnKpGk68IXSFgOaWpMs2fC8KYm1++4vtS/ZPVzX2/dDTwlBNw
 O8tFn5FByAk798F19VTqQh9mFou6BykU7pm5xLh9eQn6jaKXE/W+yjWPjUbCYj0wm3EfuEZHS
 9gPRNkaFuKqTzFdHaI74PvgJmPkMS3Pf6sSZV9XihQiNHl7UugH3oU+yGgpnYub23Uo5OHA0E
 rDUAIyDFd+eyuWAfQ71w==
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This reverts commit f9065b54d437c4660e3d974ad9ce5188c068cd76.

We're adding Nintendo 64 support, so the VR4300 is no longer unused.

Signed-off-by: Lauri Kasanen <cand@gmx.com>
=2D--
 arch/mips/Kconfig                | 12 ++++++++++++
 arch/mips/Makefile               |  1 +
 arch/mips/include/asm/cpu-type.h |  5 +++++
 arch/mips/include/asm/cpu.h      |  2 +-
 arch/mips/include/asm/vermagic.h |  2 ++
 arch/mips/kernel/cpu-probe.c     |  9 +++++++++
 arch/mips/kernel/idle.c          |  1 +
 arch/mips/mm/c-r4k.c             |  1 +
 arch/mips/mm/tlbex.c             |  1 +
 9 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 2000bb2..4b52588 100644
=2D-- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -1661,6 +1661,15 @@ config CPU_VR41XX
 	  kernel built with this option will not run on any other type of
 	  processor or vice versa.

+config CPU_R4300
+	bool "R4300"
+	depends on SYS_HAS_CPU_R4300
+	select CPU_SUPPORTS_32BIT_KERNEL
+	select CPU_SUPPORTS_64BIT_KERNEL
+	select CPU_HAS_LOAD_STORE_LR
+	help
+	  MIPS Technologies R4300-series processors.
+
 config CPU_R4X00
 	bool "R4x00"
 	depends on SYS_HAS_CPU_R4X00
@@ -1995,6 +2004,9 @@ config SYS_HAS_CPU_TX39XX
 config SYS_HAS_CPU_VR41XX
 	bool

+config SYS_HAS_CPU_R4300
+	bool
+
 config SYS_HAS_CPU_R4X00
 	bool

diff --git a/arch/mips/Makefile b/arch/mips/Makefile
index 0d0f29d..d7d8c20 100644
=2D-- a/arch/mips/Makefile
+++ b/arch/mips/Makefile
@@ -141,6 +141,7 @@ cflags-y +=3D -fno-stack-check
 #
 cflags-$(CONFIG_CPU_R3000)	+=3D -march=3Dr3000
 cflags-$(CONFIG_CPU_TX39XX)	+=3D -march=3Dr3900
+cflags-$(CONFIG_CPU_R4300)	+=3D -march=3Dr4300 -Wa,--trap
 cflags-$(CONFIG_CPU_VR41XX)	+=3D -march=3Dr4100 -Wa,--trap
 cflags-$(CONFIG_CPU_R4X00)	+=3D -march=3Dr4600 -Wa,--trap
 cflags-$(CONFIG_CPU_TX49XX)	+=3D -march=3Dr4600 -Wa,--trap
diff --git a/arch/mips/include/asm/cpu-type.h b/arch/mips/include/asm/cpu-=
type.h
index 3288cef..2be5d7b 100644
=2D-- a/arch/mips/include/asm/cpu-type.h
+++ b/arch/mips/include/asm/cpu-type.h
@@ -122,6 +122,11 @@ static inline int __pure __get_cpu_type(const int cpu=
_type)
 	case CPU_VR4181A:
 #endif

+#ifdef CONFIG_SYS_HAS_CPU_R4300
+	case CPU_R4300:
+	case CPU_R4310:
+#endif
+
 #ifdef CONFIG_SYS_HAS_CPU_R4X00
 	case CPU_R4000PC:
 	case CPU_R4000SC:
diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index c9222cc..9e6211e 100644
=2D-- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -302,7 +302,7 @@ enum cpu_type_enum {
 	/*
 	 * R4000 class processors
 	 */
-	CPU_R4000PC, CPU_R4000SC, CPU_R4000MC, CPU_R4200,
+	CPU_R4000PC, CPU_R4000SC, CPU_R4000MC, CPU_R4200, CPU_R4300, CPU_R4310,
 	CPU_R4400PC, CPU_R4400SC, CPU_R4400MC, CPU_R4600, CPU_R4640, CPU_R4650,
 	CPU_R4700, CPU_R5000, CPU_R5500, CPU_NEVADA, CPU_R10000,
 	CPU_R12000, CPU_R14000, CPU_R16000, CPU_VR41XX, CPU_VR4111, CPU_VR4121,
diff --git a/arch/mips/include/asm/vermagic.h b/arch/mips/include/asm/verm=
agic.h
index 4d2dae0..371c187 100644
=2D-- a/arch/mips/include/asm/vermagic.h
+++ b/arch/mips/include/asm/vermagic.h
@@ -26,6 +26,8 @@
 #define MODULE_PROC_FAMILY "TX39XX "
 #elif defined CONFIG_CPU_VR41XX
 #define MODULE_PROC_FAMILY "VR41XX "
+#elif defined CONFIG_CPU_R4300
+#define MODULE_PROC_FAMILY "R4300 "
 #elif defined CONFIG_CPU_R4X00
 #define MODULE_PROC_FAMILY "R4X00 "
 #elif defined CONFIG_CPU_TX49XX
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index e685369..84f7034 100644
=2D-- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1154,6 +1154,15 @@ static inline void cpu_probe_legacy(struct cpuinfo_=
mips *c, unsigned int cpu)
 			break;
 		}
 		break;
+	case PRID_IMP_R4300:
+		c->cputype =3D CPU_R4300;
+		__cpu_name[cpu] =3D "R4300";
+		set_isa(c, MIPS_CPU_ISA_III);
+		c->fpu_msk31 |=3D FPU_CSR_CONDX;
+		c->options =3D R4K_OPTS | MIPS_CPU_FPU | MIPS_CPU_32FPR |
+			     MIPS_CPU_LLSC;
+		c->tlbsize =3D 32;
+		break;
 	case PRID_IMP_R4600:
 		c->cputype =3D CPU_R4600;
 		__cpu_name[cpu] =3D "R4600";
diff --git a/arch/mips/kernel/idle.c b/arch/mips/kernel/idle.c
index 18e69eb..1aca3b4 100644
=2D-- a/arch/mips/kernel/idle.c
+++ b/arch/mips/kernel/idle.c
@@ -151,6 +151,7 @@ void __init check_wait(void)
 		cpu_wait =3D r39xx_wait;
 		break;
 	case CPU_R4200:
+/*	case CPU_R4300: */
 	case CPU_R4600:
 	case CPU_R4640:
 	case CPU_R4650:
diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
index 9cede7c..da7796e 100644
=2D-- a/arch/mips/mm/c-r4k.c
+++ b/arch/mips/mm/c-r4k.c
@@ -1164,6 +1164,7 @@ static void probe_pcache(void)
 	case CPU_R4400PC:
 	case CPU_R4400SC:
 	case CPU_R4400MC:
+	case CPU_R4300:
 		icache_size =3D 1 << (12 + ((config & CONF_IC) >> 9));
 		c->icache.linesz =3D 16 << ((config & CONF_IB) >> 5);
 		c->icache.ways =3D 1;
diff --git a/arch/mips/mm/tlbex.c b/arch/mips/mm/tlbex.c
index a7521b8..0fb1db8 100644
=2D-- a/arch/mips/mm/tlbex.c
+++ b/arch/mips/mm/tlbex.c
@@ -549,6 +549,7 @@ void build_tlb_write_entry(u32 **p, struct uasm_label =
**l,
 		tlbw(p);
 		break;

+	case CPU_R4300:
 	case CPU_5KC:
 	case CPU_TX49XX:
 	case CPU_PR4450:
=2D-
2.6.2

