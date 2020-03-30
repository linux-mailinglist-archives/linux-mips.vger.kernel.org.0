Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE29E19771D
	for <lists+linux-mips@lfdr.de>; Mon, 30 Mar 2020 10:56:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729399AbgC3I45 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 30 Mar 2020 04:56:57 -0400
Received: from sender3-op-o12.zoho.com.cn ([124.251.121.243]:17955 "EHLO
        sender3-op-o12.zoho.com.cn" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729649AbgC3I44 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Mon, 30 Mar 2020 04:56:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1585558535;
        s=mail; d=flygoat.com; i=jiaxun.yang@flygoat.com;
        h=Date:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:To:CC:From:Message-ID;
        bh=k3P7nzhoickrDkqUDCUF2p6kTXmN3G+pCGHzFtX731M=;
        b=Nx823drL4woCmFyu1yF5qFs+yIeZ06BEwV7Db62bhAKWKwPo0xiWo43z47/v7Y1k
        tq7bM2CSUshZ8u3i5JDHX9sBe+DcuQD2ie8uAKMX27BkGaDgHi27LTcGCI63ZuFpsec
        Wt7WxtuXGiYfuPhRs3uiRpj26Zlf38uqgcXgCTOA=
Received: from [10.233.233.252] (183.156.33.130 [183.156.33.130]) by mx.zoho.com.cn
        with SMTPS id 1585558532453819.0757232544435; Mon, 30 Mar 2020 16:55:32 +0800 (CST)
Date:   Mon, 30 Mar 2020 16:55:25 +0800
User-Agent: K-9 Mail for Android
In-Reply-To: <1585557531-18849-1-git-send-email-maobibo@loongson.cn>
References: <1585557531-18849-1-git-send-email-maobibo@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 02/39] MIPS: loongson64: Add header files path prefix
To:     bibo mao <maobibo@loongson.cn>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>
CC:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <53CC90A0-3926-4642-91D4-F4F265F6AE90@flygoat.com>
X-ZohoCNMailClient: External
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



=E4=BA=8E 2020=E5=B9=B43=E6=9C=8830=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=884=
:38:51, bibo mao <maobibo@loongson=2Ecn> =E5=86=99=E5=88=B0:
>Remove header files from arch/mips/include/asm/mach-loongson64
>to arch/mips/loongson64/include/mach
>
>Signed-off-by: bibo mao <maobibo@loongson=2Ecn>

Hi Bibo,

Thanks for your patch=2E

What's your intention?
Did you meet any problem about headers?

>---
>arch/mips/Kconfig                                                 | 1 +
>arch/mips/loongson64/Platform                                     | 2
>+-
>arch/mips/loongson64/env=2Ec                                        | 8
>++++----
> =2E=2E=2E/asm/mach-loongson64 =3D> loongson64/include/mach}/boot_param=
=2Eh  | 0
> =2E=2E=2E/mach-loongson64 =3D> loongson64/include/mach}/builtin_dtbs=2Eh=
    | 0
> =2E=2E=2E/include/mach}/cpu-feature-overrides=2Eh                       =
  | 0
>arch/mips/loongson64/include/mach/floppy=2Eh                        | 2
>++
>arch/mips/loongson64/include/mach/ide=2Eh                           | 2
>++
>arch/mips/loongson64/include/mach/ioremap=2Eh                       | 2
>++
>=2E=2E=2E/asm/mach-loongson64 =3D> loongson64/include/mach}/irq=2Eh      =
   | 2
>+-
> =2E=2E=2E/include/mach}/kernel-entry-init=2Eh                           =
  | 0
>arch/mips/loongson64/include/mach/kmalloc=2Eh                       | 2
>++
>=2E=2E=2E/asm/mach-loongson64 =3D> loongson64/include/mach}/loongson=2Eh =
   | 2
>+-
> =2E=2E=2E/mach-loongson64 =3D> loongson64/include/mach}/loongson_hwmon=
=2Eh  | 0
> =2E=2E=2E/mach-loongson64 =3D> loongson64/include/mach}/loongson_regs=2E=
h   | 0
>arch/mips/loongson64/include/mach/mangle-port=2Eh                   | 2
>++
> =2E=2E=2E/asm/mach-loongson64 =3D> loongson64/include/mach}/mc146818rtc=
=2Eh | 0
>=2E=2E=2E/asm/mach-loongson64 =3D> loongson64/include/mach}/mmzone=2Eh   =
   | 2
>+-
> =2E=2E=2E/asm/mach-loongson64 =3D> loongson64/include/mach}/pci=2Eh     =
    | 0
> =2E=2E=2E/asm/mach-loongson64 =3D> loongson64/include/mach}/spaces=2Eh  =
    | 0
> =2E=2E=2E/asm/mach-loongson64 =3D> loongson64/include/mach}/topology=2Eh=
    | 0
>arch/mips/loongson64/include/mach/war=2Eh                           | 2
>++
> =2E=2E=2E/asm/mach-loongson64 =3D> loongson64/include/mach}/workarounds=
=2Eh | 0
>arch/mips/loongson64/init=2Ec                                       | 2
>+-
>arch/mips/loongson64/numa=2Ec                                       | 2
>+-
>arch/mips/loongson64/pci=2Ec                                        | 6
>+++---
>arch/mips/loongson64/platform=2Ec                                   | 6
>+++---
>arch/mips/loongson64/pm=2Ec                                         | 2
>+-
>arch/mips/loongson64/reset=2Ec                                      | 4
>++--
>arch/mips/loongson64/setup=2Ec                                      | 2
>+-
>arch/mips/loongson64/smp=2Ec                                        | 8
>++++----
>arch/mips/loongson64/time=2Ec                                       | 2
>+-
>arch/mips/oprofile/op_model_loongson3=2Ec                           | 4
>++--
>arch/mips/pci/fixup-loongson3=2Ec                                   | 2
>+-
>arch/mips/pci/ops-loongson3=2Ec                                     | 2
>+-
>drivers/gpio/gpio-loongson=2Ec                                      | 4
>++++
>drivers/irqchip/irq-loongson-liointc=2Ec                            | 2
>+-
>drivers/platform/mips/cpu_hwmon=2Ec                                 | 8
>++++----
> 38 files changed, 51 insertions(+), 34 deletions(-)
>rename arch/mips/{include/asm/mach-loongson64 =3D>
>loongson64/include/mach}/boot_param=2Eh (100%)
>rename arch/mips/{include/asm/mach-loongson64 =3D>
>loongson64/include/mach}/builtin_dtbs=2Eh (100%)
>rename arch/mips/{include/asm/mach-loongson64 =3D>
>loongson64/include/mach}/cpu-feature-overrides=2Eh (100%)
> create mode 100644 arch/mips/loongson64/include/mach/floppy=2Eh
> create mode 100644 arch/mips/loongson64/include/mach/ide=2Eh
> create mode 100644 arch/mips/loongson64/include/mach/ioremap=2Eh
>rename arch/mips/{include/asm/mach-loongson64 =3D>
>loongson64/include/mach}/irq=2Eh (89%)
>rename arch/mips/{include/asm/mach-loongson64 =3D>
>loongson64/include/mach}/kernel-entry-init=2Eh (100%)
> create mode 100644 arch/mips/loongson64/include/mach/kmalloc=2Eh
>rename arch/mips/{include/asm/mach-loongson64 =3D>
>loongson64/include/mach}/loongson=2Eh (99%)
>rename arch/mips/{include/asm/mach-loongson64 =3D>
>loongson64/include/mach}/loongson_hwmon=2Eh (100%)
>rename arch/mips/{include/asm/mach-loongson64 =3D>
>loongson64/include/mach}/loongson_regs=2Eh (100%)
> create mode 100644 arch/mips/loongson64/include/mach/mangle-port=2Eh
>rename arch/mips/{include/asm/mach-loongson64 =3D>
>loongson64/include/mach}/mc146818rtc=2Eh (100%)
>rename arch/mips/{include/asm/mach-loongson64 =3D>
>loongson64/include/mach}/mmzone=2Eh (96%)
>rename arch/mips/{include/asm/mach-loongson64 =3D>
>loongson64/include/mach}/pci=2Eh (100%)
>rename arch/mips/{include/asm/mach-loongson64 =3D>
>loongson64/include/mach}/spaces=2Eh (100%)
>rename arch/mips/{include/asm/mach-loongson64 =3D>
>loongson64/include/mach}/topology=2Eh (100%)
> create mode 100644 arch/mips/loongson64/include/mach/war=2Eh
>rename arch/mips/{include/asm/mach-loongson64 =3D>
>loongson64/include/mach}/workarounds=2Eh (100%)
>
>diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
>index 12f05bb=2E=2Ea7f821d 100644
>--- a/arch/mips/Kconfig
>+++ b/arch/mips/Kconfig
>@@ -491,6 +491,7 @@ config MACH_LOONGSON64
> 	select COMMON_CLK
> 	select USE_OF
> 	select BUILTIN_DTB
>+	select HAVE_MACH_HEAD_FILES
> 	help
> 	  This enables the support of Loongson-2/3 family of machines=2E
>=20
>diff --git a/arch/mips/loongson64/Platform
>b/arch/mips/loongson64/Platform
>index d5eb94c=2E=2Eaa0e112 100644
>--- a/arch/mips/loongson64/Platform
>+++ b/arch/mips/loongson64/Platform
>@@ -56,5 +56,5 @@ cflags-y +=3D $(call cc-option,-mno-loongson-mmi)
> #
>=20
> platform-$(CONFIG_MACH_LOONGSON64) +=3D loongson64/
>-cflags-$(CONFIG_MACH_LOONGSON64) +=3D
>-I$(srctree)/arch/mips/include/asm/mach-loongson64 -mno-branch-likely
>+cflags-$(CONFIG_MACH_LOONGSON64) +=3D
>-I$(srctree)/arch/mips/loongson64/include -mno-branch-likely
> load-$(CONFIG_CPU_LOONGSON64) +=3D 0xffffffff80200000
>diff --git a/arch/mips/loongson64/env=2Ec b/arch/mips/loongson64/env=2Ec
>index 2554ef1=2E=2E6c73614 100644
>--- a/arch/mips/loongson64/env=2Ec
>+++ b/arch/mips/loongson64/env=2Ec
>@@ -15,10 +15,10 @@
>  */
> #include <linux/export=2Eh>
> #include <asm/bootinfo=2Eh>
>-#include <loongson=2Eh>
>-#include <boot_param=2Eh>
>-#include <builtin_dtbs=2Eh>
>-#include <workarounds=2Eh>
>+#include <mach/loongson=2Eh>
>+#include <mach/boot_param=2Eh>
>+#include <mach/builtin_dtbs=2Eh>
>+#include <mach/workarounds=2Eh>
>=20
> u32 cpu_clock_freq;
> EXPORT_SYMBOL(cpu_clock_freq);
>diff --git a/arch/mips/include/asm/mach-loongson64/boot_param=2Eh
>b/arch/mips/loongson64/include/mach/boot_param=2Eh
>similarity index 100%
>rename from arch/mips/include/asm/mach-loongson64/boot_param=2Eh
>rename to arch/mips/loongson64/include/mach/boot_param=2Eh
>diff --git a/arch/mips/include/asm/mach-loongson64/builtin_dtbs=2Eh
>b/arch/mips/loongson64/include/mach/builtin_dtbs=2Eh
>similarity index 100%
>rename from arch/mips/include/asm/mach-loongson64/builtin_dtbs=2Eh
>rename to arch/mips/loongson64/include/mach/builtin_dtbs=2Eh
>diff --git
>a/arch/mips/include/asm/mach-loongson64/cpu-feature-overrides=2Eh
>b/arch/mips/loongson64/include/mach/cpu-feature-overrides=2Eh
>similarity index 100%
>rename from
>arch/mips/include/asm/mach-loongson64/cpu-feature-overrides=2Eh
>rename to arch/mips/loongson64/include/mach/cpu-feature-overrides=2Eh
>diff --git a/arch/mips/loongson64/include/mach/floppy=2Eh
>b/arch/mips/loongson64/include/mach/floppy=2Eh
>new file mode 100644
>index 0000000=2E=2E8e17183
>--- /dev/null
>+++ b/arch/mips/loongson64/include/mach/floppy=2Eh
>@@ -0,0 +1,2 @@
>+/* SPDX-License-Identifier: GPL-2=2E0 */
>+#include <asm/mach-generic/floppy=2Eh>
>diff --git a/arch/mips/loongson64/include/mach/ide=2Eh
>b/arch/mips/loongson64/include/mach/ide=2Eh
>new file mode 100644
>index 0000000=2E=2E1251c0c
>--- /dev/null
>+++ b/arch/mips/loongson64/include/mach/ide=2Eh
>@@ -0,0 +1,2 @@
>+/* SPDX-License-Identifier: GPL-2=2E0 */
>+#include <asm/mach-generic/ide=2Eh>
>diff --git a/arch/mips/loongson64/include/mach/ioremap=2Eh
>b/arch/mips/loongson64/include/mach/ioremap=2Eh
>new file mode 100644
>index 0000000=2E=2E2369393
>--- /dev/null
>+++ b/arch/mips/loongson64/include/mach/ioremap=2Eh
>@@ -0,0 +1,2 @@
>+/* SPDX-License-Identifier: GPL-2=2E0 */
>+#include <asm/mach-generic/ioremap=2Eh>
>diff --git a/arch/mips/include/asm/mach-loongson64/irq=2Eh
>b/arch/mips/loongson64/include/mach/irq=2Eh
>similarity index 89%
>rename from arch/mips/include/asm/mach-loongson64/irq=2Eh
>rename to arch/mips/loongson64/include/mach/irq=2Eh
>index d41dc4a=2E=2E55bafce 100644
>--- a/arch/mips/include/asm/mach-loongson64/irq=2Eh
>+++ b/arch/mips/loongson64/include/mach/irq=2Eh
>@@ -2,7 +2,7 @@
> #ifndef __ASM_MACH_LOONGSON64_IRQ_H_
> #define __ASM_MACH_LOONGSON64_IRQ_H_
>=20
>-#include <boot_param=2Eh>
>+#include <mach/boot_param=2Eh>
>=20
> /* cpu core interrupt numbers */
> #define MIPS_CPU_IRQ_BASE 56
>diff --git a/arch/mips/include/asm/mach-loongson64/kernel-entry-init=2Eh
>b/arch/mips/loongson64/include/mach/kernel-entry-init=2Eh
>similarity index 100%
>rename from arch/mips/include/asm/mach-loongson64/kernel-entry-init=2Eh
>rename to arch/mips/loongson64/include/mach/kernel-entry-init=2Eh
>diff --git a/arch/mips/loongson64/include/mach/kmalloc=2Eh
>b/arch/mips/loongson64/include/mach/kmalloc=2Eh
>new file mode 100644
>index 0000000=2E=2E4f056db
>--- /dev/null
>+++ b/arch/mips/loongson64/include/mach/kmalloc=2Eh
>@@ -0,0 +1,2 @@
>+/* SPDX-License-Identifier: GPL-2=2E0 */
>+#include <asm/mach-generic/kmalloc=2Eh>
>diff --git a/arch/mips/include/asm/mach-loongson64/loongson=2Eh
>b/arch/mips/loongson64/include/mach/loongson=2Eh
>similarity index 99%
>rename from arch/mips/include/asm/mach-loongson64/loongson=2Eh
>rename to arch/mips/loongson64/include/mach/loongson=2Eh
>index fde1b75=2E=2E9d719b9 100644
>--- a/arch/mips/include/asm/mach-loongson64/loongson=2Eh
>+++ b/arch/mips/loongson64/include/mach/loongson=2Eh
>@@ -10,7 +10,7 @@
> #include <linux/io=2Eh>
> #include <linux/init=2Eh>
> #include <linux/irq=2Eh>
>-#include <boot_param=2Eh>
>+#include <mach/boot_param=2Eh>
>=20
>=20
> /* machine-specific reboot/halt operation */
>diff --git a/arch/mips/include/asm/mach-loongson64/loongson_hwmon=2Eh
>b/arch/mips/loongson64/include/mach/loongson_hwmon=2Eh
>similarity index 100%
>rename from arch/mips/include/asm/mach-loongson64/loongson_hwmon=2Eh
>rename to arch/mips/loongson64/include/mach/loongson_hwmon=2Eh
>diff --git a/arch/mips/include/asm/mach-loongson64/loongson_regs=2Eh
>b/arch/mips/loongson64/include/mach/loongson_regs=2Eh
>similarity index 100%
>rename from arch/mips/include/asm/mach-loongson64/loongson_regs=2Eh
>rename to arch/mips/loongson64/include/mach/loongson_regs=2Eh
>diff --git a/arch/mips/loongson64/include/mach/mangle-port=2Eh
>b/arch/mips/loongson64/include/mach/mangle-port=2Eh
>new file mode 100644
>index 0000000=2E=2Eb9736e3
>--- /dev/null
>+++ b/arch/mips/loongson64/include/mach/mangle-port=2Eh
>@@ -0,0 +1,2 @@
>+/* SPDX-License-Identifier: GPL-2=2E0 */
>+#include <asm/mach-generic/mangle-port=2Eh>
>diff --git a/arch/mips/include/asm/mach-loongson64/mc146818rtc=2Eh
>b/arch/mips/loongson64/include/mach/mc146818rtc=2Eh
>similarity index 100%
>rename from arch/mips/include/asm/mach-loongson64/mc146818rtc=2Eh
>rename to arch/mips/loongson64/include/mach/mc146818rtc=2Eh
>diff --git a/arch/mips/include/asm/mach-loongson64/mmzone=2Eh
>b/arch/mips/loongson64/include/mach/mmzone=2Eh
>similarity index 96%
>rename from arch/mips/include/asm/mach-loongson64/mmzone=2Eh
>rename to arch/mips/loongson64/include/mach/mmzone=2Eh
>index 3a25dbd=2E=2E57f7375 100644
>--- a/arch/mips/include/asm/mach-loongson64/mmzone=2Eh
>+++ b/arch/mips/loongson64/include/mach/mmzone=2Eh
>@@ -9,7 +9,7 @@
> #ifndef _ASM_MACH_LOONGSON64_MMZONE_H
> #define _ASM_MACH_LOONGSON64_MMZONE_H
>=20
>-#include <boot_param=2Eh>
>+#include <mach/boot_param=2Eh>
> #define NODE_ADDRSPACE_SHIFT 44
> #define NODE0_ADDRSPACE_OFFSET 0x000000000000UL
> #define NODE1_ADDRSPACE_OFFSET 0x100000000000UL
>diff --git a/arch/mips/include/asm/mach-loongson64/pci=2Eh
>b/arch/mips/loongson64/include/mach/pci=2Eh
>similarity index 100%
>rename from arch/mips/include/asm/mach-loongson64/pci=2Eh
>rename to arch/mips/loongson64/include/mach/pci=2Eh
>diff --git a/arch/mips/include/asm/mach-loongson64/spaces=2Eh
>b/arch/mips/loongson64/include/mach/spaces=2Eh
>similarity index 100%
>rename from arch/mips/include/asm/mach-loongson64/spaces=2Eh
>rename to arch/mips/loongson64/include/mach/spaces=2Eh
>diff --git a/arch/mips/include/asm/mach-loongson64/topology=2Eh
>b/arch/mips/loongson64/include/mach/topology=2Eh
>similarity index 100%
>rename from arch/mips/include/asm/mach-loongson64/topology=2Eh
>rename to arch/mips/loongson64/include/mach/topology=2Eh
>diff --git a/arch/mips/loongson64/include/mach/war=2Eh
>b/arch/mips/loongson64/include/mach/war=2Eh
>new file mode 100644
>index 0000000=2E=2E5b0422a
>--- /dev/null
>+++ b/arch/mips/loongson64/include/mach/war=2Eh
>@@ -0,0 +1,2 @@
>+/* SPDX-License-Identifier: GPL-2=2E0 */
>+#include <asm/mach-generic/war=2Eh>
>diff --git a/arch/mips/include/asm/mach-loongson64/workarounds=2Eh
>b/arch/mips/loongson64/include/mach/workarounds=2Eh
>similarity index 100%
>rename from arch/mips/include/asm/mach-loongson64/workarounds=2Eh
>rename to arch/mips/loongson64/include/mach/workarounds=2Eh
>diff --git a/arch/mips/loongson64/init=2Ec b/arch/mips/loongson64/init=2E=
c
>index da38944=2E=2Edebbb75 100644
>--- a/arch/mips/loongson64/init=2Ec
>+++ b/arch/mips/loongson64/init=2Ec
>@@ -12,7 +12,7 @@
> #include <asm/cacheflush=2Eh>
> #include <asm/fw/fw=2Eh>
>=20
>-#include <loongson=2Eh>
>+#include <mach/loongson=2Eh>
>=20
> static void __init mips_nmi_setup(void)
> {
>diff --git a/arch/mips/loongson64/numa=2Ec b/arch/mips/loongson64/numa=2E=
c
>index 1ae072d=2E=2Ee852535 100644
>--- a/arch/mips/loongson64/numa=2Ec
>+++ b/arch/mips/loongson64/numa=2Ec
>@@ -24,7 +24,7 @@
> #include <asm/mc146818-time=2Eh>
> #include <asm/time=2Eh>
> #include <asm/wbflush=2Eh>
>-#include <boot_param=2Eh>
>+#include <mach/boot_param=2Eh>
>=20
> static struct pglist_data prealloc__node_data[MAX_NUMNODES];
> unsigned char __node_distances[MAX_NUMNODES][MAX_NUMNODES];
>diff --git a/arch/mips/loongson64/pci=2Ec b/arch/mips/loongson64/pci=2Ec
>index e84ae20=2E=2E7011d88 100644
>--- a/arch/mips/loongson64/pci=2Ec
>+++ b/arch/mips/loongson64/pci=2Ec
>@@ -5,9 +5,9 @@
>  */
> #include <linux/pci=2Eh>
>=20
>-#include <pci=2Eh>
>-#include <loongson=2Eh>
>-#include <boot_param=2Eh>
>+#include <mach/pci=2Eh>
>+#include <mach/loongson=2Eh>
>+#include <mach/boot_param=2Eh>
>=20
> static struct resource loongson_pci_mem_resource =3D {
> 	=2Ename	=3D "pci memory space",
>diff --git a/arch/mips/loongson64/platform=2Ec
>b/arch/mips/loongson64/platform=2Ec
>index 9674ae1=2E=2E2cd8b9b 100644
>--- a/arch/mips/loongson64/platform=2Ec
>+++ b/arch/mips/loongson64/platform=2Ec
>@@ -10,9 +10,9 @@
> #include <linux/slab=2Eh>
> #include <linux/platform_device=2Eh>
> #include <asm/bootinfo=2Eh>
>-#include <boot_param=2Eh>
>-#include <loongson_hwmon=2Eh>
>-#include <workarounds=2Eh>
>+#include <mach/boot_param=2Eh>
>+#include <mach/loongson_hwmon=2Eh>
>+#include <mach/workarounds=2Eh>
>=20
> static int __init loongson3_platform_init(void)
> {
>diff --git a/arch/mips/loongson64/pm=2Ec b/arch/mips/loongson64/pm=2Ec
>index 7c8556f=2E=2Eb05c6dd 100644
>--- a/arch/mips/loongson64/pm=2Ec
>+++ b/arch/mips/loongson64/pm=2Ec
>@@ -12,7 +12,7 @@
> #include <asm/i8259=2Eh>
> #include <asm/mipsregs=2Eh>
>=20
>-#include <loongson=2Eh>
>+#include <mach/loongson=2Eh>
>=20
> static unsigned int __maybe_unused cached_master_mask;	/* i8259A */
> static unsigned int __maybe_unused cached_slave_mask;
>diff --git a/arch/mips/loongson64/reset=2Ec
>b/arch/mips/loongson64/reset=2Ec
>index bc76710=2E=2E0fd1d50 100644
>--- a/arch/mips/loongson64/reset=2Ec
>+++ b/arch/mips/loongson64/reset=2Ec
>@@ -12,8 +12,8 @@
> #include <asm/idle=2Eh>
> #include <asm/reboot=2Eh>
>=20
>-#include <loongson=2Eh>
>-#include <boot_param=2Eh>
>+#include <mach/loongson=2Eh>
>+#include <mach/boot_param=2Eh>
>=20
> static inline void loongson_reboot(void)
> {
>diff --git a/arch/mips/loongson64/setup=2Ec
>b/arch/mips/loongson64/setup=2Ec
>index 6fe3fff=2E=2E4e7e3a4 100644
>--- a/arch/mips/loongson64/setup=2Ec
>+++ b/arch/mips/loongson64/setup=2Ec
>@@ -13,7 +13,7 @@
>=20
> #include <asm/prom=2Eh>
>=20
>-#include <loongson=2Eh>
>+#include <mach/loongson=2Eh>
>=20
> void *loongson_fdt_blob;
>=20
>diff --git a/arch/mips/loongson64/smp=2Ec b/arch/mips/loongson64/smp=2Ec
>index e1fe8bb=2E=2Ed0fc0fc 100644
>--- a/arch/mips/loongson64/smp=2Ec
>+++ b/arch/mips/loongson64/smp=2Ec
>@@ -4,7 +4,7 @@
>  * Author: Chen Huacai, chenhc@lemote=2Ecom
>  */
>=20
>-#include <irq=2Eh>
>+#include <mach/irq=2Eh>
> #include <linux/init=2Eh>
> #include <linux/cpu=2Eh>
> #include <linux/sched=2Eh>
>@@ -18,9 +18,9 @@
> #include <asm/clock=2Eh>
> #include <asm/tlbflush=2Eh>
> #include <asm/cacheflush=2Eh>
>-#include <loongson=2Eh>
>-#include <loongson_regs=2Eh>
>-#include <workarounds=2Eh>
>+#include <mach/loongson=2Eh>
>+#include <mach/loongson_regs=2Eh>
>+#include <mach/workarounds=2Eh>
>=20
> #include "smp=2Eh"
>=20
>diff --git a/arch/mips/loongson64/time=2Ec b/arch/mips/loongson64/time=2E=
c
>index 1245f22=2E=2E4f8fdf8 100644
>--- a/arch/mips/loongson64/time=2Ec
>+++ b/arch/mips/loongson64/time=2Ec
>@@ -10,7 +10,7 @@
> #include <asm/time=2Eh>
> #include <asm/hpet=2Eh>
>=20
>-#include <loongson=2Eh>
>+#include <mach/loongson=2Eh>
>=20
> void __init plat_time_init(void)
> {
>diff --git a/arch/mips/oprofile/op_model_loongson3=2Ec
>b/arch/mips/oprofile/op_model_loongson3=2Ec
>index 436b1fc=2E=2E9ca6432 100644
>--- a/arch/mips/oprofile/op_model_loongson3=2Ec
>+++ b/arch/mips/oprofile/op_model_loongson3=2Ec
>@@ -12,8 +12,8 @@
> #include <linux/spinlock=2Eh>
> #include <linux/interrupt=2Eh>
> #include <linux/uaccess=2Eh>
>-#include <irq=2Eh>
>-#include <loongson=2Eh>
>+#include <mach/irq=2Eh>
>+#include <mach/loongson=2Eh>
> #include "op_impl=2Eh"
>=20
> #define LOONGSON3_PERFCNT_OVERFLOW	(1ULL << 63)
>diff --git a/arch/mips/pci/fixup-loongson3=2Ec
>b/arch/mips/pci/fixup-loongson3=2Ec
>index 8a741c2=2E=2E6c63c30 100644
>--- a/arch/mips/pci/fixup-loongson3=2Ec
>+++ b/arch/mips/pci/fixup-loongson3=2Ec
>@@ -24,7 +24,7 @@
>  */
>=20
> #include <linux/pci=2Eh>
>-#include <boot_param=2Eh>
>+#include <mach/boot_param=2Eh>
>=20
> static void print_fixup_info(const struct pci_dev *pdev)
> {
>diff --git a/arch/mips/pci/ops-loongson3=2Ec
>b/arch/mips/pci/ops-loongson3=2Ec
>index 2f6ad36=2E=2Ef40b805 100644
>--- a/arch/mips/pci/ops-loongson3=2Ec
>+++ b/arch/mips/pci/ops-loongson3=2Ec
>@@ -5,7 +5,7 @@
>=20
> #include <asm/mips-boards/bonito64=2Eh>
>=20
>-#include <loongson=2Eh>
>+#include <mach/loongson=2Eh>
>=20
> #define PCI_ACCESS_READ  0
> #define PCI_ACCESS_WRITE 1
>diff --git a/drivers/gpio/gpio-loongson=2Ec
>b/drivers/gpio/gpio-loongson=2Ec
>index a421458=2E=2Eebcd75a 100644
>--- a/drivers/gpio/gpio-loongson=2Ec
>+++ b/drivers/gpio/gpio-loongson=2Ec
>@@ -17,7 +17,11 @@
> #include <linux/platform_device=2Eh>
> #include <linux/bitops=2Eh>
> #include <asm/types=2Eh>
>+#ifdef CONFIG_HAVE_MACH_HEAD_FILES
>+#include <mach/loongson=2Eh>
>+#else
> #include <loongson=2Eh>
>+#endif
>=20
> #define STLS2F_N_GPIO		4
> #define STLS3A_N_GPIO		16
>diff --git a/drivers/irqchip/irq-loongson-liointc=2Ec
>b/drivers/irqchip/irq-loongson-liointc=2Ec
>index 63b6147=2E=2Efb23eb1 100644
>--- a/drivers/irqchip/irq-loongson-liointc=2Ec
>+++ b/drivers/irqchip/irq-loongson-liointc=2Ec
>@@ -16,7 +16,7 @@
> #include <linux/smp=2Eh>
> #include <linux/irqchip/chained_irq=2Eh>
>=20
>-#include <boot_param=2Eh>
>+#include <mach/boot_param=2Eh>
>=20
> #define LIOINTC_CHIP_IRQ	32
> #define LIOINTC_NUM_PARENT 4
>diff --git a/drivers/platform/mips/cpu_hwmon=2Ec
>b/drivers/platform/mips/cpu_hwmon=2Ec
>index 0d27cb7=2E=2E4bb71af 100644
>--- a/drivers/platform/mips/cpu_hwmon=2Ec
>+++ b/drivers/platform/mips/cpu_hwmon=2Ec
>@@ -6,10 +6,10 @@
> #include <linux/hwmon=2Eh>
> #include <linux/hwmon-sysfs=2Eh>
>=20
>-#include <loongson=2Eh>
>-#include <boot_param=2Eh>
>-#include <loongson_hwmon=2Eh>
>-#include <loongson_regs=2Eh>
>+#include <mach/loongson=2Eh>
>+#include <mach/boot_param=2Eh>
>+#include <mach/loongson_hwmon=2Eh>
>+#include <mach/loongson_regs=2Eh>
>=20
> static int csr_temp_enable =3D 0;
>=20

--=20
Jiaxun Yang
