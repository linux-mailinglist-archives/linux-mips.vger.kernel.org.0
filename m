Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D7222E9635
	for <lists+linux-mips@lfdr.de>; Mon,  4 Jan 2021 14:43:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725830AbhADNn0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 4 Jan 2021 08:43:26 -0500
Received: from mout.gmx.net ([212.227.15.18]:49203 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726579AbhADNn0 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 4 Jan 2021 08:43:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1609767711;
        bh=Ua1mWCOr4LTqZEzaZB63R+wqOSGeuV/pZ/FWoM0VPhU=;
        h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
        b=XXVA98H338CGlNh0jAaSwxv9QPyaCWoBJXpSuXxmOcUB0ViwMTcUcgBNUJCc8wdHx
         lzCDTO1FhQnolhtc3xQxsw1X1h8Op4LyS+Xlg9nxYch4xNqKCi5JNpeMuSt937ukVl
         A022gXPvqw1zqMW5etTp7epzSb/uODWj1wHnq7wg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from Valinor ([82.128.181.212]) by mail.gmx.com (mrgmx004
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MuUj2-1k5HKf1KMc-00rZ1N; Mon, 04
 Jan 2021 14:41:51 +0100
Date:   Mon, 4 Jan 2021 15:43:24 +0200
From:   Lauri Kasanen <cand@gmx.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de
Subject: [PATCH 1/6] Revert "MIPS: Remove unused R4300 CPU support"
Message-Id: <20210104154324.3a9bc605ad06f9e923edc71f@gmx.com>
X-Mailer: Sylpheed 3.5.0 (GTK+ 2.18.6; x86_64-unknown-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qSihf0RbTxq0atQcjyjdGnvf6znumx/nJD6Aa1tcfDfwZlGaSBp
 y+3cQpUiiY36HZkD0wTzMIkoBWbjTT4cqKHPy3xvLo75Rcs2D4SoKGx2gjn2GjKHfsX8GmJ
 d/cp6eHU/JZbAfCGCohDtJGvXDuaoYaTJrAc6eLcxPkacpau9tw7ezjVcB92Ea+qj0S0Irk
 j5gWhbqi+gVm6Drh5NQUA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:GohQ31yBFJY=:xzRDRzygj8EHcf/k6PKLTt
 kBovM5U0rgmTWnQJJ4yXobtMKiyOV2UU/khBhaPZ6+I8UELheiKxjyj2mP6kqn9HjQtyIMDgb
 6xUNU3hHV1M+u5Xxis6afOtsbblQUI12wHkua+T9jMqSlsrC+TLPgt+rmJjAYlEXAShm5iMyt
 EHwNYZlP/dzyGdOke+HIfuDQ3/qvEXNGGrWM3Cy7OzleIR00EZRFY4BdqUfgcxiRDTggyyEUC
 bgQn6kBlTy6YKbjx/1gqlJYeVwT8e6NQlErzXHeDWlCJHsPClZGpDvEWGTSoA7g6SPJXKxF5W
 5IDbNfOa5S8A9VMAIA69UoXoOlHLEkM1lwH4SO8uosBZ/AG0gZ/BMnfBDXyFIJJComRCCsUlt
 3X13w93loj9Q+A48BIxKaa/xjOv81ghMGkMOoSpr2UqDMeA9vsku7erMuhWAv43ir1xvDc6yD
 Z/KTVR1b3Pt3kuPR+S0y/IHt1MextftVi+341eUA325SiBTZ1jLjLUZcKlCWR9CjBig9D2NX1
 N0lJ/3CxYQpXDCkH4gKLcE5yu+nEddiKkv7dGHcyoz7cOjFtycPTR1S6MudkiCsG9wRU3zSps
 VAZdv5hgwXPd1ml3qXPiAsolyuId4M2GyaLoqGoUdnNR4Y5EgFkNJFrZQBMGGMdLz4JpXoaYu
 JUHSycJb0pRxI/OGf1CGIJbTPTY0HlrdXFchYm+WkrLGe50x5zyWEY5gAw4Zgj9emBHaRbsvg
 WHTTGyz8vm1yYPPbTTvniaLVGiT5amr26b6/szJdecTAhF+TphfgOQfCpEivSoUSOApYNc/qz
 y8aAh6IE77s2/smKAPcgU51fEt5lWKDBzo1U46sm87u3NoeZ/xVX0u6fBX+mmypK1NpF65GVy
 ZtfdPquHOAu6C+g/qlrw==
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

