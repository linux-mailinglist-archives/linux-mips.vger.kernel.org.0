Return-Path: <linux-mips+bounces-1077-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B52C83A0F2
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jan 2024 06:13:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F9001C273B7
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jan 2024 05:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E6EEC8EA;
	Wed, 24 Jan 2024 05:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FFFZAekk"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7981DE54C
	for <linux-mips@vger.kernel.org>; Wed, 24 Jan 2024 05:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706073200; cv=none; b=DsvxPpoZXAfym+Ap/EWiyxtAlBtOKmrHEukq7pcLv7LPNC2WFgDWNi68sE46sR6bXBtVRdkZvqjM0ze/GiSY8JNsgU/pHruE2hYJcMb+Mpszi1sIPtAaJVyAxAnitPd157MiMWeKZyQm6LJtw78TRGV2wwaZeLGPcdHvGzbb4D8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706073200; c=relaxed/simple;
	bh=y4NjTEU6wTyCOumdnwRhmGKWQJfpX2fR2OYxt5ROtKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-type; b=ZyMbkCbbMze6g2mRClxaeHHDaufZ6jD0DrOQCCLqKLud7ClN06+fl7YcUSgyO2XBfgs9bNO05O1s0TJVaXHb/ntF4+TmJE+6DFYl7iuBg7+C7vFHED2Ho558fbQLiPlNH5ilCZ8kdF7wVbPTlYb5JVRl5J0knKcAK0ybN1oHWLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FFFZAekk; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706073196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g86OdfqBcSib9Tcax/hwlrdBf9BeBOiuB7XEQWW6wYk=;
	b=FFFZAekk7f4ZIbjVpkD/DB0BmoYSmkz9WKtz73XBE1WXF9tMN7df1n24dQLV93Mfn/Gbj1
	JoJJ4zvBXSIJIVHhws5IfcLjD2ENnhAHfiWX9eynGE2lBd8dNtrjSHPM9XslzNGVCPgIq3
	viNSb26AgaAx+kIveNOf3sPNnJxgfVE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-7WNEYIx7NxS6kIfTf5SGcg-1; Wed, 24 Jan 2024 00:13:13 -0500
X-MC-Unique: 7WNEYIx7NxS6kIfTf5SGcg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6647786C143;
	Wed, 24 Jan 2024 05:13:12 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.116.117])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C155F1C060AF;
	Wed, 24 Jan 2024 05:13:05 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: kexec@lists.infradead.org,
	x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	loongarch@lists.linux.dev,
	akpm@linux-foundation.org,
	ebiederm@xmission.com,
	hbathini@linux.ibm.com,
	piliu@redhat.com,
	viro@zeniv.linux.org.uk,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH linux-next v3 01/14] kexec: split crashkernel reservation code out from crash_core.c
Date: Wed, 24 Jan 2024 13:12:41 +0800
Message-ID: <20240124051254.67105-2-bhe@redhat.com>
In-Reply-To: <20240124051254.67105-1-bhe@redhat.com>
References: <20240124051254.67105-1-bhe@redhat.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.7

Both kdump and fa_dump of ppc rely on crashkernel reservation. Move the
relevant codes into separate files:
crash_reserve.c, include/linux/crash_reserve.h.

And also add config item CRASH_RESERVE to control its enabling of the
codes. And update config items which has relationship with crashkernel
reservation.

And also change ifdeffery from CONFIG_CRASH_CORE to CONFIG_CRASH_RESERVE
when those scopes are only crashkernel reservation related.

And also rename arch/XXX/include/asm/{crash_core.h => crash_reserve.h}
on arm64, x86 and risc-v because those architectures' crash_core.h
is only related to crashkernel reservation.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 arch/arm64/Kconfig                            |   2 +-
 .../asm/{crash_core.h => crash_reserve.h}     |   4 +-
 arch/powerpc/Kconfig                          |   1 +
 arch/powerpc/mm/nohash/kaslr_booke.c          |   4 +-
 arch/riscv/Kconfig                            |   2 +-
 .../asm/{crash_core.h => crash_reserve.h}     |   4 +-
 arch/x86/Kconfig                              |   2 +-
 .../asm/{crash_core.h => crash_reserve.h}     |   6 +-
 include/linux/crash_core.h                    |  40 --
 include/linux/crash_reserve.h                 |  48 ++
 include/linux/kexec.h                         |   1 +
 kernel/Kconfig.kexec                          |   5 +-
 kernel/Makefile                               |   1 +
 kernel/crash_core.c                           | 438 -----------------
 kernel/crash_reserve.c                        | 464 ++++++++++++++++++
 15 files changed, 531 insertions(+), 491 deletions(-)
 rename arch/arm64/include/asm/{crash_core.h => crash_reserve.h} (81%)
 rename arch/riscv/include/asm/{crash_core.h => crash_reserve.h} (78%)
 rename arch/x86/include/asm/{crash_core.h => crash_reserve.h} (92%)
 create mode 100644 include/linux/crash_reserve.h
 create mode 100644 kernel/crash_reserve.c

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 3d2300aca238..96fb363d2f52 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1520,7 +1520,7 @@ config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool y
 
 config ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
-	def_bool CRASH_CORE
+	def_bool CRASH_RESERVE
 
 config TRANS_TABLE
 	def_bool y
diff --git a/arch/arm64/include/asm/crash_core.h b/arch/arm64/include/asm/crash_reserve.h
similarity index 81%
rename from arch/arm64/include/asm/crash_core.h
rename to arch/arm64/include/asm/crash_reserve.h
index 9f5c8d339f44..4afe027a4e7b 100644
--- a/arch/arm64/include/asm/crash_core.h
+++ b/arch/arm64/include/asm/crash_reserve.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef _ARM64_CRASH_CORE_H
-#define _ARM64_CRASH_CORE_H
+#ifndef _ARM64_CRASH_RESERVE_H
+#define _ARM64_CRASH_RESERVE_H
 
 /* Current arm64 boot protocol requires 2MB alignment */
 #define CRASH_ALIGN                     SZ_2M
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index b9fc064d38d2..7f704ae5c5ef 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -691,6 +691,7 @@ config FA_DUMP
 	bool "Firmware-assisted dump"
 	depends on PPC64 && (PPC_RTAS || PPC_POWERNV)
 	select CRASH_CORE
+	select CRASH_RESERVE
 	select CRASH_DUMP
 	help
 	  A robust mechanism to get reliable kernel crash dump with
diff --git a/arch/powerpc/mm/nohash/kaslr_booke.c b/arch/powerpc/mm/nohash/kaslr_booke.c
index b4f2786a7d2b..cdff129abb14 100644
--- a/arch/powerpc/mm/nohash/kaslr_booke.c
+++ b/arch/powerpc/mm/nohash/kaslr_booke.c
@@ -13,7 +13,7 @@
 #include <linux/delay.h>
 #include <linux/memblock.h>
 #include <linux/libfdt.h>
-#include <linux/crash_core.h>
+#include <linux/crash_reserve.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
 #include <asm/cacheflush.h>
@@ -173,7 +173,7 @@ static __init bool overlaps_region(const void *fdt, u32 start,
 
 static void __init get_crash_kernel(void *fdt, unsigned long size)
 {
-#ifdef CONFIG_CRASH_CORE
+#ifdef CONFIG_CRASH_RESERVE
 	unsigned long long crash_size, crash_base;
 	int ret;
 
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 69d24f513922..7c6869e43a4a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -767,7 +767,7 @@ config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool y
 
 config ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
-	def_bool CRASH_CORE
+	def_bool CRASH_RESERVE
 
 config COMPAT
 	bool "Kernel support for 32-bit U-mode"
diff --git a/arch/riscv/include/asm/crash_core.h b/arch/riscv/include/asm/crash_reserve.h
similarity index 78%
rename from arch/riscv/include/asm/crash_core.h
rename to arch/riscv/include/asm/crash_reserve.h
index e1874b23feaf..013962e63587 100644
--- a/arch/riscv/include/asm/crash_core.h
+++ b/arch/riscv/include/asm/crash_reserve.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef _RISCV_CRASH_CORE_H
-#define _RISCV_CRASH_CORE_H
+#ifndef _RISCV_CRASH_RESERVE_H
+#define _RISCV_CRASH_RESERVE_H
 
 #define CRASH_ALIGN			PMD_SIZE
 
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 502986237cb6..a9243e0948a3 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2106,7 +2106,7 @@ config ARCH_SUPPORTS_CRASH_HOTPLUG
 	def_bool y
 
 config ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
-	def_bool CRASH_CORE
+	def_bool CRASH_RESEERVE
 
 config PHYSICAL_START
 	hex "Physical address where the kernel is loaded" if (EXPERT || CRASH_DUMP)
diff --git a/arch/x86/include/asm/crash_core.h b/arch/x86/include/asm/crash_reserve.h
similarity index 92%
rename from arch/x86/include/asm/crash_core.h
rename to arch/x86/include/asm/crash_reserve.h
index 76af98f4e801..152239f95541 100644
--- a/arch/x86/include/asm/crash_core.h
+++ b/arch/x86/include/asm/crash_reserve.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _X86_CRASH_CORE_H
-#define _X86_CRASH_CORE_H
+#ifndef _X86_CRASH_RESERVE_H
+#define _X86_CRASH_RESERVE_H
 
 /* 16M alignment for crash kernel regions */
 #define CRASH_ALIGN             SZ_16M
@@ -39,4 +39,4 @@ static inline unsigned long crash_low_size_default(void)
 #endif
 }
 
-#endif /* _X86_CRASH_CORE_H */
+#endif /* _X86_CRASH_RESERVE_H */
diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
index 9eaeaafe0cad..1fde49246fa6 100644
--- a/include/linux/crash_core.h
+++ b/include/linux/crash_core.h
@@ -5,14 +5,6 @@
 #include <linux/linkage.h>
 #include <linux/elfcore.h>
 #include <linux/elf.h>
-#ifdef CONFIG_ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
-#include <asm/crash_core.h>
-#endif
-
-/* Location of a reserved region to hold the crash kernel.
- */
-extern struct resource crashk_res;
-extern struct resource crashk_low_res;
 
 #define CRASH_CORE_NOTE_NAME	   "CORE"
 #define CRASH_CORE_NOTE_HEAD_BYTES ALIGN(sizeof(struct elf_note), 4)
@@ -87,38 +79,6 @@ Elf_Word *append_elf_note(Elf_Word *buf, char *name, unsigned int type,
 			  void *data, size_t data_len);
 void final_note(Elf_Word *buf);
 
-int __init parse_crashkernel(char *cmdline, unsigned long long system_ram,
-		unsigned long long *crash_size, unsigned long long *crash_base,
-		unsigned long long *low_size, bool *high);
-
-#ifdef CONFIG_ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
-#ifndef DEFAULT_CRASH_KERNEL_LOW_SIZE
-#define DEFAULT_CRASH_KERNEL_LOW_SIZE	(128UL << 20)
-#endif
-#ifndef CRASH_ALIGN
-#define CRASH_ALIGN			SZ_2M
-#endif
-#ifndef CRASH_ADDR_LOW_MAX
-#define CRASH_ADDR_LOW_MAX		SZ_4G
-#endif
-#ifndef CRASH_ADDR_HIGH_MAX
-#define CRASH_ADDR_HIGH_MAX		memblock_end_of_DRAM()
-#endif
-
-void __init reserve_crashkernel_generic(char *cmdline,
-		unsigned long long crash_size,
-		unsigned long long crash_base,
-		unsigned long long crash_low_size,
-		bool high);
-#else
-static inline void __init reserve_crashkernel_generic(char *cmdline,
-		unsigned long long crash_size,
-		unsigned long long crash_base,
-		unsigned long long crash_low_size,
-		bool high)
-{}
-#endif
-
 /* Alignment required for elf header segment */
 #define ELF_CORE_HEADER_ALIGN   4096
 
diff --git a/include/linux/crash_reserve.h b/include/linux/crash_reserve.h
new file mode 100644
index 000000000000..5a9df944fb80
--- /dev/null
+++ b/include/linux/crash_reserve.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef LINUX_CRASH_RESERVE_H
+#define LINUX_CRASH_RESERVE_H
+
+#include <linux/linkage.h>
+#include <linux/elfcore.h>
+#include <linux/elf.h>
+#ifdef CONFIG_ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
+#include <asm/crash_reserve.h>
+#endif
+
+/* Location of a reserved region to hold the crash kernel.
+ */
+extern struct resource crashk_res;
+extern struct resource crashk_low_res;
+
+int __init parse_crashkernel(char *cmdline, unsigned long long system_ram,
+		unsigned long long *crash_size, unsigned long long *crash_base,
+		unsigned long long *low_size, bool *high);
+
+#ifdef CONFIG_ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
+#ifndef DEFAULT_CRASH_KERNEL_LOW_SIZE
+#define DEFAULT_CRASH_KERNEL_LOW_SIZE	(128UL << 20)
+#endif
+#ifndef CRASH_ALIGN
+#define CRASH_ALIGN			SZ_2M
+#endif
+#ifndef CRASH_ADDR_LOW_MAX
+#define CRASH_ADDR_LOW_MAX		SZ_4G
+#endif
+#ifndef CRASH_ADDR_HIGH_MAX
+#define CRASH_ADDR_HIGH_MAX		memblock_end_of_DRAM()
+#endif
+
+void __init reserve_crashkernel_generic(char *cmdline,
+		unsigned long long crash_size,
+		unsigned long long crash_base,
+		unsigned long long crash_low_size,
+		bool high);
+#else
+static inline void __init reserve_crashkernel_generic(char *cmdline,
+		unsigned long long crash_size,
+		unsigned long long crash_base,
+		unsigned long long crash_low_size,
+		bool high)
+{}
+#endif
+#endif /* LINUX_CRASH_RESERVE_H */
diff --git a/include/linux/kexec.h b/include/linux/kexec.h
index 400cb6c02176..6d79bfb52e5b 100644
--- a/include/linux/kexec.h
+++ b/include/linux/kexec.h
@@ -16,6 +16,7 @@
 #if !defined(__ASSEMBLY__)
 
 #include <linux/crash_core.h>
+#include <linux/crash_reserve.h>
 #include <asm/io.h>
 #include <linux/range.h>
 
diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
index 946dffa048b7..8b7be71edd85 100644
--- a/kernel/Kconfig.kexec
+++ b/kernel/Kconfig.kexec
@@ -2,11 +2,15 @@
 
 menu "Kexec and crash features"
 
+config CRASH_RESERVE
+	bool
+
 config CRASH_CORE
 	bool
 
 config KEXEC_CORE
 	select CRASH_CORE
+	select CRASH_RESERVE
 	bool
 
 config KEXEC_ELF
@@ -96,7 +100,6 @@ config KEXEC_JUMP
 config CRASH_DUMP
 	bool "kernel crash dumps"
 	depends on ARCH_SUPPORTS_CRASH_DUMP
-	select CRASH_CORE
 	select KEXEC_CORE
 	help
 	  Generate crash dump after being started by kexec.
diff --git a/kernel/Makefile b/kernel/Makefile
index ce105a5558fc..05fa88b3ab74 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -69,6 +69,7 @@ obj-$(CONFIG_KALLSYMS) += kallsyms.o
 obj-$(CONFIG_KALLSYMS_SELFTEST) += kallsyms_selftest.o
 obj-$(CONFIG_BSD_PROCESS_ACCT) += acct.o
 obj-$(CONFIG_CRASH_CORE) += crash_core.o
+obj-$(CONFIG_CRASH_RESERVE) += crash_reserve.o
 obj-$(CONFIG_KEXEC_CORE) += kexec_core.o
 obj-$(CONFIG_KEXEC) += kexec.o
 obj-$(CONFIG_KEXEC_FILE) += kexec_file.o
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 49b31e59d3cc..ae0d1ce89b46 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -34,444 +34,6 @@ u32 *vmcoreinfo_note;
 /* trusted vmcoreinfo, e.g. we can make a copy in the crash memory */
 static unsigned char *vmcoreinfo_data_safecopy;
 
-/* Location of the reserved area for the crash kernel */
-struct resource crashk_res = {
-	.name  = "Crash kernel",
-	.start = 0,
-	.end   = 0,
-	.flags = IORESOURCE_BUSY | IORESOURCE_SYSTEM_RAM,
-	.desc  = IORES_DESC_CRASH_KERNEL
-};
-struct resource crashk_low_res = {
-	.name  = "Crash kernel",
-	.start = 0,
-	.end   = 0,
-	.flags = IORESOURCE_BUSY | IORESOURCE_SYSTEM_RAM,
-	.desc  = IORES_DESC_CRASH_KERNEL
-};
-
-/*
- * parsing the "crashkernel" commandline
- *
- * this code is intended to be called from architecture specific code
- */
-
-
-/*
- * This function parses command lines in the format
- *
- *   crashkernel=ramsize-range:size[,...][@offset]
- *
- * The function returns 0 on success and -EINVAL on failure.
- */
-static int __init parse_crashkernel_mem(char *cmdline,
-					unsigned long long system_ram,
-					unsigned long long *crash_size,
-					unsigned long long *crash_base)
-{
-	char *cur = cmdline, *tmp;
-	unsigned long long total_mem = system_ram;
-
-	/*
-	 * Firmware sometimes reserves some memory regions for its own use,
-	 * so the system memory size is less than the actual physical memory
-	 * size. Work around this by rounding up the total size to 128M,
-	 * which is enough for most test cases.
-	 */
-	total_mem = roundup(total_mem, SZ_128M);
-
-	/* for each entry of the comma-separated list */
-	do {
-		unsigned long long start, end = ULLONG_MAX, size;
-
-		/* get the start of the range */
-		start = memparse(cur, &tmp);
-		if (cur == tmp) {
-			pr_warn("crashkernel: Memory value expected\n");
-			return -EINVAL;
-		}
-		cur = tmp;
-		if (*cur != '-') {
-			pr_warn("crashkernel: '-' expected\n");
-			return -EINVAL;
-		}
-		cur++;
-
-		/* if no ':' is here, than we read the end */
-		if (*cur != ':') {
-			end = memparse(cur, &tmp);
-			if (cur == tmp) {
-				pr_warn("crashkernel: Memory value expected\n");
-				return -EINVAL;
-			}
-			cur = tmp;
-			if (end <= start) {
-				pr_warn("crashkernel: end <= start\n");
-				return -EINVAL;
-			}
-		}
-
-		if (*cur != ':') {
-			pr_warn("crashkernel: ':' expected\n");
-			return -EINVAL;
-		}
-		cur++;
-
-		size = memparse(cur, &tmp);
-		if (cur == tmp) {
-			pr_warn("Memory value expected\n");
-			return -EINVAL;
-		}
-		cur = tmp;
-		if (size >= total_mem) {
-			pr_warn("crashkernel: invalid size\n");
-			return -EINVAL;
-		}
-
-		/* match ? */
-		if (total_mem >= start && total_mem < end) {
-			*crash_size = size;
-			break;
-		}
-	} while (*cur++ == ',');
-
-	if (*crash_size > 0) {
-		while (*cur && *cur != ' ' && *cur != '@')
-			cur++;
-		if (*cur == '@') {
-			cur++;
-			*crash_base = memparse(cur, &tmp);
-			if (cur == tmp) {
-				pr_warn("Memory value expected after '@'\n");
-				return -EINVAL;
-			}
-		}
-	} else
-		pr_info("crashkernel size resulted in zero bytes\n");
-
-	return 0;
-}
-
-/*
- * That function parses "simple" (old) crashkernel command lines like
- *
- *	crashkernel=size[@offset]
- *
- * It returns 0 on success and -EINVAL on failure.
- */
-static int __init parse_crashkernel_simple(char *cmdline,
-					   unsigned long long *crash_size,
-					   unsigned long long *crash_base)
-{
-	char *cur = cmdline;
-
-	*crash_size = memparse(cmdline, &cur);
-	if (cmdline == cur) {
-		pr_warn("crashkernel: memory value expected\n");
-		return -EINVAL;
-	}
-
-	if (*cur == '@')
-		*crash_base = memparse(cur+1, &cur);
-	else if (*cur != ' ' && *cur != '\0') {
-		pr_warn("crashkernel: unrecognized char: %c\n", *cur);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-#define SUFFIX_HIGH 0
-#define SUFFIX_LOW  1
-#define SUFFIX_NULL 2
-static __initdata char *suffix_tbl[] = {
-	[SUFFIX_HIGH] = ",high",
-	[SUFFIX_LOW]  = ",low",
-	[SUFFIX_NULL] = NULL,
-};
-
-/*
- * That function parses "suffix"  crashkernel command lines like
- *
- *	crashkernel=size,[high|low]
- *
- * It returns 0 on success and -EINVAL on failure.
- */
-static int __init parse_crashkernel_suffix(char *cmdline,
-					   unsigned long long *crash_size,
-					   const char *suffix)
-{
-	char *cur = cmdline;
-
-	*crash_size = memparse(cmdline, &cur);
-	if (cmdline == cur) {
-		pr_warn("crashkernel: memory value expected\n");
-		return -EINVAL;
-	}
-
-	/* check with suffix */
-	if (strncmp(cur, suffix, strlen(suffix))) {
-		pr_warn("crashkernel: unrecognized char: %c\n", *cur);
-		return -EINVAL;
-	}
-	cur += strlen(suffix);
-	if (*cur != ' ' && *cur != '\0') {
-		pr_warn("crashkernel: unrecognized char: %c\n", *cur);
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static __init char *get_last_crashkernel(char *cmdline,
-			     const char *name,
-			     const char *suffix)
-{
-	char *p = cmdline, *ck_cmdline = NULL;
-
-	/* find crashkernel and use the last one if there are more */
-	p = strstr(p, name);
-	while (p) {
-		char *end_p = strchr(p, ' ');
-		char *q;
-
-		if (!end_p)
-			end_p = p + strlen(p);
-
-		if (!suffix) {
-			int i;
-
-			/* skip the one with any known suffix */
-			for (i = 0; suffix_tbl[i]; i++) {
-				q = end_p - strlen(suffix_tbl[i]);
-				if (!strncmp(q, suffix_tbl[i],
-					     strlen(suffix_tbl[i])))
-					goto next;
-			}
-			ck_cmdline = p;
-		} else {
-			q = end_p - strlen(suffix);
-			if (!strncmp(q, suffix, strlen(suffix)))
-				ck_cmdline = p;
-		}
-next:
-		p = strstr(p+1, name);
-	}
-
-	return ck_cmdline;
-}
-
-static int __init __parse_crashkernel(char *cmdline,
-			     unsigned long long system_ram,
-			     unsigned long long *crash_size,
-			     unsigned long long *crash_base,
-			     const char *suffix)
-{
-	char *first_colon, *first_space;
-	char *ck_cmdline;
-	char *name = "crashkernel=";
-
-	BUG_ON(!crash_size || !crash_base);
-	*crash_size = 0;
-	*crash_base = 0;
-
-	ck_cmdline = get_last_crashkernel(cmdline, name, suffix);
-	if (!ck_cmdline)
-		return -ENOENT;
-
-	ck_cmdline += strlen(name);
-
-	if (suffix)
-		return parse_crashkernel_suffix(ck_cmdline, crash_size,
-				suffix);
-	/*
-	 * if the commandline contains a ':', then that's the extended
-	 * syntax -- if not, it must be the classic syntax
-	 */
-	first_colon = strchr(ck_cmdline, ':');
-	first_space = strchr(ck_cmdline, ' ');
-	if (first_colon && (!first_space || first_colon < first_space))
-		return parse_crashkernel_mem(ck_cmdline, system_ram,
-				crash_size, crash_base);
-
-	return parse_crashkernel_simple(ck_cmdline, crash_size, crash_base);
-}
-
-/*
- * That function is the entry point for command line parsing and should be
- * called from the arch-specific code.
- *
- * If crashkernel=,high|low is supported on architecture, non-NULL values
- * should be passed to parameters 'low_size' and 'high'.
- */
-int __init parse_crashkernel(char *cmdline,
-			     unsigned long long system_ram,
-			     unsigned long long *crash_size,
-			     unsigned long long *crash_base,
-			     unsigned long long *low_size,
-			     bool *high)
-{
-	int ret;
-
-	/* crashkernel=X[@offset] */
-	ret = __parse_crashkernel(cmdline, system_ram, crash_size,
-				crash_base, NULL);
-#ifdef CONFIG_ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
-	/*
-	 * If non-NULL 'high' passed in and no normal crashkernel
-	 * setting detected, try parsing crashkernel=,high|low.
-	 */
-	if (high && ret == -ENOENT) {
-		ret = __parse_crashkernel(cmdline, 0, crash_size,
-				crash_base, suffix_tbl[SUFFIX_HIGH]);
-		if (ret || !*crash_size)
-			return -EINVAL;
-
-		/*
-		 * crashkernel=Y,low can be specified or not, but invalid value
-		 * is not allowed.
-		 */
-		ret = __parse_crashkernel(cmdline, 0, low_size,
-				crash_base, suffix_tbl[SUFFIX_LOW]);
-		if (ret == -ENOENT) {
-			*low_size = DEFAULT_CRASH_KERNEL_LOW_SIZE;
-			ret = 0;
-		} else if (ret) {
-			return ret;
-		}
-
-		*high = true;
-	}
-#endif
-	if (!*crash_size)
-		ret = -EINVAL;
-
-	return ret;
-}
-
-/*
- * Add a dummy early_param handler to mark crashkernel= as a known command line
- * parameter and suppress incorrect warnings in init/main.c.
- */
-static int __init parse_crashkernel_dummy(char *arg)
-{
-	return 0;
-}
-early_param("crashkernel", parse_crashkernel_dummy);
-
-#ifdef CONFIG_ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
-static int __init reserve_crashkernel_low(unsigned long long low_size)
-{
-#ifdef CONFIG_64BIT
-	unsigned long long low_base;
-
-	low_base = memblock_phys_alloc_range(low_size, CRASH_ALIGN, 0, CRASH_ADDR_LOW_MAX);
-	if (!low_base) {
-		pr_err("cannot allocate crashkernel low memory (size:0x%llx).\n", low_size);
-		return -ENOMEM;
-	}
-
-	pr_info("crashkernel low memory reserved: 0x%08llx - 0x%08llx (%lld MB)\n",
-		low_base, low_base + low_size, low_size >> 20);
-
-	crashk_low_res.start = low_base;
-	crashk_low_res.end   = low_base + low_size - 1;
-#endif
-	return 0;
-}
-
-void __init reserve_crashkernel_generic(char *cmdline,
-			     unsigned long long crash_size,
-			     unsigned long long crash_base,
-			     unsigned long long crash_low_size,
-			     bool high)
-{
-	unsigned long long search_end = CRASH_ADDR_LOW_MAX, search_base = 0;
-	bool fixed_base = false;
-
-	/* User specifies base address explicitly. */
-	if (crash_base) {
-		fixed_base = true;
-		search_base = crash_base;
-		search_end = crash_base + crash_size;
-	} else if (high) {
-		search_base = CRASH_ADDR_LOW_MAX;
-		search_end = CRASH_ADDR_HIGH_MAX;
-	}
-
-retry:
-	crash_base = memblock_phys_alloc_range(crash_size, CRASH_ALIGN,
-					       search_base, search_end);
-	if (!crash_base) {
-		/*
-		 * For crashkernel=size[KMG]@offset[KMG], print out failure
-		 * message if can't reserve the specified region.
-		 */
-		if (fixed_base) {
-			pr_warn("crashkernel reservation failed - memory is in use.\n");
-			return;
-		}
-
-		/*
-		 * For crashkernel=size[KMG], if the first attempt was for
-		 * low memory, fall back to high memory, the minimum required
-		 * low memory will be reserved later.
-		 */
-		if (!high && search_end == CRASH_ADDR_LOW_MAX) {
-			search_end = CRASH_ADDR_HIGH_MAX;
-			search_base = CRASH_ADDR_LOW_MAX;
-			crash_low_size = DEFAULT_CRASH_KERNEL_LOW_SIZE;
-			goto retry;
-		}
-
-		/*
-		 * For crashkernel=size[KMG],high, if the first attempt was
-		 * for high memory, fall back to low memory.
-		 */
-		if (high && search_end == CRASH_ADDR_HIGH_MAX) {
-			search_end = CRASH_ADDR_LOW_MAX;
-			search_base = 0;
-			goto retry;
-		}
-		pr_warn("cannot allocate crashkernel (size:0x%llx)\n",
-			crash_size);
-		return;
-	}
-
-	if ((crash_base >= CRASH_ADDR_LOW_MAX) &&
-	     crash_low_size && reserve_crashkernel_low(crash_low_size)) {
-		memblock_phys_free(crash_base, crash_size);
-		return;
-	}
-
-	pr_info("crashkernel reserved: 0x%016llx - 0x%016llx (%lld MB)\n",
-		crash_base, crash_base + crash_size, crash_size >> 20);
-
-	/*
-	 * The crashkernel memory will be removed from the kernel linear
-	 * map. Inform kmemleak so that it won't try to access it.
-	 */
-	kmemleak_ignore_phys(crash_base);
-	if (crashk_low_res.end)
-		kmemleak_ignore_phys(crashk_low_res.start);
-
-	crashk_res.start = crash_base;
-	crashk_res.end = crash_base + crash_size - 1;
-}
-
-static __init int insert_crashkernel_resources(void)
-{
-	if (crashk_res.start < crashk_res.end)
-		insert_resource(&iomem_resource, &crashk_res);
-
-	if (crashk_low_res.start < crashk_low_res.end)
-		insert_resource(&iomem_resource, &crashk_low_res);
-
-	return 0;
-}
-early_initcall(insert_crashkernel_resources);
-#endif
-
 int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
 			  void **addr, unsigned long *sz)
 {
diff --git a/kernel/crash_reserve.c b/kernel/crash_reserve.c
new file mode 100644
index 000000000000..bbb6c3cb00e4
--- /dev/null
+++ b/kernel/crash_reserve.c
@@ -0,0 +1,464 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * crash.c - kernel crash support code.
+ * Copyright (C) 2002-2004 Eric Biederman  <ebiederm@xmission.com>
+ */
+
+#include <linux/buildid.h>
+#include <linux/init.h>
+#include <linux/utsname.h>
+#include <linux/vmalloc.h>
+#include <linux/sizes.h>
+#include <linux/kexec.h>
+#include <linux/memory.h>
+#include <linux/cpuhotplug.h>
+#include <linux/memblock.h>
+#include <linux/kexec.h>
+#include <linux/kmemleak.h>
+
+#include <asm/page.h>
+#include <asm/sections.h>
+
+#include <crypto/sha1.h>
+
+#include "kallsyms_internal.h"
+#include "kexec_internal.h"
+
+/* Location of the reserved area for the crash kernel */
+struct resource crashk_res = {
+	.name  = "Crash kernel",
+	.start = 0,
+	.end   = 0,
+	.flags = IORESOURCE_BUSY | IORESOURCE_SYSTEM_RAM,
+	.desc  = IORES_DESC_CRASH_KERNEL
+};
+struct resource crashk_low_res = {
+	.name  = "Crash kernel",
+	.start = 0,
+	.end   = 0,
+	.flags = IORESOURCE_BUSY | IORESOURCE_SYSTEM_RAM,
+	.desc  = IORES_DESC_CRASH_KERNEL
+};
+
+/*
+ * parsing the "crashkernel" commandline
+ *
+ * this code is intended to be called from architecture specific code
+ */
+
+
+/*
+ * This function parses command lines in the format
+ *
+ *   crashkernel=ramsize-range:size[,...][@offset]
+ *
+ * The function returns 0 on success and -EINVAL on failure.
+ */
+static int __init parse_crashkernel_mem(char *cmdline,
+					unsigned long long system_ram,
+					unsigned long long *crash_size,
+					unsigned long long *crash_base)
+{
+	char *cur = cmdline, *tmp;
+	unsigned long long total_mem = system_ram;
+
+	/*
+	 * Firmware sometimes reserves some memory regions for its own use,
+	 * so the system memory size is less than the actual physical memory
+	 * size. Work around this by rounding up the total size to 128M,
+	 * which is enough for most test cases.
+	 */
+	total_mem = roundup(total_mem, SZ_128M);
+
+	/* for each entry of the comma-separated list */
+	do {
+		unsigned long long start, end = ULLONG_MAX, size;
+
+		/* get the start of the range */
+		start = memparse(cur, &tmp);
+		if (cur == tmp) {
+			pr_warn("crashkernel: Memory value expected\n");
+			return -EINVAL;
+		}
+		cur = tmp;
+		if (*cur != '-') {
+			pr_warn("crashkernel: '-' expected\n");
+			return -EINVAL;
+		}
+		cur++;
+
+		/* if no ':' is here, than we read the end */
+		if (*cur != ':') {
+			end = memparse(cur, &tmp);
+			if (cur == tmp) {
+				pr_warn("crashkernel: Memory value expected\n");
+				return -EINVAL;
+			}
+			cur = tmp;
+			if (end <= start) {
+				pr_warn("crashkernel: end <= start\n");
+				return -EINVAL;
+			}
+		}
+
+		if (*cur != ':') {
+			pr_warn("crashkernel: ':' expected\n");
+			return -EINVAL;
+		}
+		cur++;
+
+		size = memparse(cur, &tmp);
+		if (cur == tmp) {
+			pr_warn("Memory value expected\n");
+			return -EINVAL;
+		}
+		cur = tmp;
+		if (size >= total_mem) {
+			pr_warn("crashkernel: invalid size\n");
+			return -EINVAL;
+		}
+
+		/* match ? */
+		if (total_mem >= start && total_mem < end) {
+			*crash_size = size;
+			break;
+		}
+	} while (*cur++ == ',');
+
+	if (*crash_size > 0) {
+		while (*cur && *cur != ' ' && *cur != '@')
+			cur++;
+		if (*cur == '@') {
+			cur++;
+			*crash_base = memparse(cur, &tmp);
+			if (cur == tmp) {
+				pr_warn("Memory value expected after '@'\n");
+				return -EINVAL;
+			}
+		}
+	} else
+		pr_info("crashkernel size resulted in zero bytes\n");
+
+	return 0;
+}
+
+/*
+ * That function parses "simple" (old) crashkernel command lines like
+ *
+ *	crashkernel=size[@offset]
+ *
+ * It returns 0 on success and -EINVAL on failure.
+ */
+static int __init parse_crashkernel_simple(char *cmdline,
+					   unsigned long long *crash_size,
+					   unsigned long long *crash_base)
+{
+	char *cur = cmdline;
+
+	*crash_size = memparse(cmdline, &cur);
+	if (cmdline == cur) {
+		pr_warn("crashkernel: memory value expected\n");
+		return -EINVAL;
+	}
+
+	if (*cur == '@')
+		*crash_base = memparse(cur+1, &cur);
+	else if (*cur != ' ' && *cur != '\0') {
+		pr_warn("crashkernel: unrecognized char: %c\n", *cur);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+#define SUFFIX_HIGH 0
+#define SUFFIX_LOW  1
+#define SUFFIX_NULL 2
+static __initdata char *suffix_tbl[] = {
+	[SUFFIX_HIGH] = ",high",
+	[SUFFIX_LOW]  = ",low",
+	[SUFFIX_NULL] = NULL,
+};
+
+/*
+ * That function parses "suffix"  crashkernel command lines like
+ *
+ *	crashkernel=size,[high|low]
+ *
+ * It returns 0 on success and -EINVAL on failure.
+ */
+static int __init parse_crashkernel_suffix(char *cmdline,
+					   unsigned long long *crash_size,
+					   const char *suffix)
+{
+	char *cur = cmdline;
+
+	*crash_size = memparse(cmdline, &cur);
+	if (cmdline == cur) {
+		pr_warn("crashkernel: memory value expected\n");
+		return -EINVAL;
+	}
+
+	/* check with suffix */
+	if (strncmp(cur, suffix, strlen(suffix))) {
+		pr_warn("crashkernel: unrecognized char: %c\n", *cur);
+		return -EINVAL;
+	}
+	cur += strlen(suffix);
+	if (*cur != ' ' && *cur != '\0') {
+		pr_warn("crashkernel: unrecognized char: %c\n", *cur);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static __init char *get_last_crashkernel(char *cmdline,
+			     const char *name,
+			     const char *suffix)
+{
+	char *p = cmdline, *ck_cmdline = NULL;
+
+	/* find crashkernel and use the last one if there are more */
+	p = strstr(p, name);
+	while (p) {
+		char *end_p = strchr(p, ' ');
+		char *q;
+
+		if (!end_p)
+			end_p = p + strlen(p);
+
+		if (!suffix) {
+			int i;
+
+			/* skip the one with any known suffix */
+			for (i = 0; suffix_tbl[i]; i++) {
+				q = end_p - strlen(suffix_tbl[i]);
+				if (!strncmp(q, suffix_tbl[i],
+					     strlen(suffix_tbl[i])))
+					goto next;
+			}
+			ck_cmdline = p;
+		} else {
+			q = end_p - strlen(suffix);
+			if (!strncmp(q, suffix, strlen(suffix)))
+				ck_cmdline = p;
+		}
+next:
+		p = strstr(p+1, name);
+	}
+
+	return ck_cmdline;
+}
+
+static int __init __parse_crashkernel(char *cmdline,
+			     unsigned long long system_ram,
+			     unsigned long long *crash_size,
+			     unsigned long long *crash_base,
+			     const char *suffix)
+{
+	char *first_colon, *first_space;
+	char *ck_cmdline;
+	char *name = "crashkernel=";
+
+	BUG_ON(!crash_size || !crash_base);
+	*crash_size = 0;
+	*crash_base = 0;
+
+	ck_cmdline = get_last_crashkernel(cmdline, name, suffix);
+	if (!ck_cmdline)
+		return -ENOENT;
+
+	ck_cmdline += strlen(name);
+
+	if (suffix)
+		return parse_crashkernel_suffix(ck_cmdline, crash_size,
+				suffix);
+	/*
+	 * if the commandline contains a ':', then that's the extended
+	 * syntax -- if not, it must be the classic syntax
+	 */
+	first_colon = strchr(ck_cmdline, ':');
+	first_space = strchr(ck_cmdline, ' ');
+	if (first_colon && (!first_space || first_colon < first_space))
+		return parse_crashkernel_mem(ck_cmdline, system_ram,
+				crash_size, crash_base);
+
+	return parse_crashkernel_simple(ck_cmdline, crash_size, crash_base);
+}
+
+/*
+ * That function is the entry point for command line parsing and should be
+ * called from the arch-specific code.
+ *
+ * If crashkernel=,high|low is supported on architecture, non-NULL values
+ * should be passed to parameters 'low_size' and 'high'.
+ */
+int __init parse_crashkernel(char *cmdline,
+			     unsigned long long system_ram,
+			     unsigned long long *crash_size,
+			     unsigned long long *crash_base,
+			     unsigned long long *low_size,
+			     bool *high)
+{
+	int ret;
+
+	/* crashkernel=X[@offset] */
+	ret = __parse_crashkernel(cmdline, system_ram, crash_size,
+				crash_base, NULL);
+#ifdef CONFIG_ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
+	/*
+	 * If non-NULL 'high' passed in and no normal crashkernel
+	 * setting detected, try parsing crashkernel=,high|low.
+	 */
+	if (high && ret == -ENOENT) {
+		ret = __parse_crashkernel(cmdline, 0, crash_size,
+				crash_base, suffix_tbl[SUFFIX_HIGH]);
+		if (ret || !*crash_size)
+			return -EINVAL;
+
+		/*
+		 * crashkernel=Y,low can be specified or not, but invalid value
+		 * is not allowed.
+		 */
+		ret = __parse_crashkernel(cmdline, 0, low_size,
+				crash_base, suffix_tbl[SUFFIX_LOW]);
+		if (ret == -ENOENT) {
+			*low_size = DEFAULT_CRASH_KERNEL_LOW_SIZE;
+			ret = 0;
+		} else if (ret) {
+			return ret;
+		}
+
+		*high = true;
+	}
+#endif
+	if (!*crash_size)
+		ret = -EINVAL;
+
+	return ret;
+}
+
+/*
+ * Add a dummy early_param handler to mark crashkernel= as a known command line
+ * parameter and suppress incorrect warnings in init/main.c.
+ */
+static int __init parse_crashkernel_dummy(char *arg)
+{
+	return 0;
+}
+early_param("crashkernel", parse_crashkernel_dummy);
+
+#ifdef CONFIG_ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
+static int __init reserve_crashkernel_low(unsigned long long low_size)
+{
+#ifdef CONFIG_64BIT
+	unsigned long long low_base;
+
+	low_base = memblock_phys_alloc_range(low_size, CRASH_ALIGN, 0, CRASH_ADDR_LOW_MAX);
+	if (!low_base) {
+		pr_err("cannot allocate crashkernel low memory (size:0x%llx).\n", low_size);
+		return -ENOMEM;
+	}
+
+	pr_info("crashkernel low memory reserved: 0x%08llx - 0x%08llx (%lld MB)\n",
+		low_base, low_base + low_size, low_size >> 20);
+
+	crashk_low_res.start = low_base;
+	crashk_low_res.end   = low_base + low_size - 1;
+	insert_resource(&iomem_resource, &crashk_low_res);
+#endif
+	return 0;
+}
+
+void __init reserve_crashkernel_generic(char *cmdline,
+			     unsigned long long crash_size,
+			     unsigned long long crash_base,
+			     unsigned long long crash_low_size,
+			     bool high)
+{
+	unsigned long long search_end = CRASH_ADDR_LOW_MAX, search_base = 0;
+	bool fixed_base = false;
+
+	/* User specifies base address explicitly. */
+	if (crash_base) {
+		fixed_base = true;
+		search_base = crash_base;
+		search_end = crash_base + crash_size;
+	} else if (high) {
+		search_base = CRASH_ADDR_LOW_MAX;
+		search_end = CRASH_ADDR_HIGH_MAX;
+	}
+
+retry:
+	crash_base = memblock_phys_alloc_range(crash_size, CRASH_ALIGN,
+					       search_base, search_end);
+	if (!crash_base) {
+		/*
+		 * For crashkernel=size[KMG]@offset[KMG], print out failure
+		 * message if can't reserve the specified region.
+		 */
+		if (fixed_base) {
+			pr_warn("crashkernel reservation failed - memory is in use.\n");
+			return;
+		}
+
+		/*
+		 * For crashkernel=size[KMG], if the first attempt was for
+		 * low memory, fall back to high memory, the minimum required
+		 * low memory will be reserved later.
+		 */
+		if (!high && search_end == CRASH_ADDR_LOW_MAX) {
+			search_end = CRASH_ADDR_HIGH_MAX;
+			search_base = CRASH_ADDR_LOW_MAX;
+			crash_low_size = DEFAULT_CRASH_KERNEL_LOW_SIZE;
+			goto retry;
+		}
+
+		/*
+		 * For crashkernel=size[KMG],high, if the first attempt was
+		 * for high memory, fall back to low memory.
+		 */
+		if (high && search_end == CRASH_ADDR_HIGH_MAX) {
+			search_end = CRASH_ADDR_LOW_MAX;
+			search_base = 0;
+			goto retry;
+		}
+		pr_warn("cannot allocate crashkernel (size:0x%llx)\n",
+			crash_size);
+		return;
+	}
+
+	if ((crash_base >= CRASH_ADDR_LOW_MAX) &&
+	     crash_low_size && reserve_crashkernel_low(crash_low_size)) {
+		memblock_phys_free(crash_base, crash_size);
+		return;
+	}
+
+	pr_info("crashkernel reserved: 0x%016llx - 0x%016llx (%lld MB)\n",
+		crash_base, crash_base + crash_size, crash_size >> 20);
+
+	/*
+	 * The crashkernel memory will be removed from the kernel linear
+	 * map. Inform kmemleak so that it won't try to access it.
+	 */
+	kmemleak_ignore_phys(crash_base);
+	if (crashk_low_res.end)
+		kmemleak_ignore_phys(crashk_low_res.start);
+
+	crashk_res.start = crash_base;
+	crashk_res.end = crash_base + crash_size - 1;
+}
+
+static __init int insert_crashkernel_resources(void)
+{
+	if (crashk_res.start < crashk_res.end)
+		insert_resource(&iomem_resource, &crashk_res);
+
+	if (crashk_low_res.start < crashk_low_res.end)
+		insert_resource(&iomem_resource, &crashk_low_res);
+
+	return 0;
+}
+early_initcall(insert_crashkernel_resources);
+#endif
-- 
2.41.0


