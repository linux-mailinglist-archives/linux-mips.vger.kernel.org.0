Return-Path: <linux-mips+bounces-5868-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9536F997F12
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 10:14:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52F51283292
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 08:14:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB16C1C9EC4;
	Thu, 10 Oct 2024 07:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="fWbAj6SK";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ksIzw7DM"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2851B86E9;
	Thu, 10 Oct 2024 07:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728543745; cv=none; b=jSXnoHotCf0sD6CGF5QAorbljaPEgWhm8PZFviDjFYKEbNBolkbCcezF+BR2qTNYsUqmJxXe9EGT9P8QvMiCG3rdBhpAH4XdATrx9bt2HSnLn5ITgVURWP7OyLGQ1d9YMUWQu3/6YJ4d5fGEbh6IGDxuy1UttvAV/9gAv40ezBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728543745; c=relaxed/simple;
	bh=u6pUdextyUUiD6HDgNJaE0gAH3sutanC7wWTXNvnTJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B397FywDOcCevaiq6cdxMnDOSVPWJyLVBdNf1kmMLv86zbCO9BrkyGRwzKv1UrSkqUSW4i0D+elHxMucaT0NZNw+t8oasO6AeOY57IaK0roA7w4koYWe8e5TzNummHT1EuzG2JO62asn6zLpA5m89y75HYFItHWfzAjWfU6XKOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=fWbAj6SK; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ksIzw7DM; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J6B4IeG8b5QcjhSj/+p4Domwg1/4XtpjyB0sq6j0/Js=;
	b=fWbAj6SKPmJMSqAA+na8CcrjolRy8rvILXwN2NxnjkEzIbVEB5CYlexodSUjhG/Q8Xm2+4
	aLE//zeul/XMtt1d/zrVwqXDslhmJV0ztaBLNOayxJ+LdmdHQ4690B5+F97s172+Iih41f
	+uTS+I4LcGjdJwpZy12nBkb5UCbzfTCNgfKfpGQf+PMIAP4ej0rtOXR9E2hy1n4SKanLu+
	6uEDB7z7Lio87aSGfEdjEIQU4tKX1asAPwE0HVFgDX/K4EpWRItQrZjbCkwZ/8Jo8tviZt
	q4ZTwa+cJsA1lehTHFk/Ip+YwuAZIFJWbZohxGDOi/x+Avxk9koRe8VT+942Kg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543736;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=J6B4IeG8b5QcjhSj/+p4Domwg1/4XtpjyB0sq6j0/Js=;
	b=ksIzw7DMfxsbzKHYfd2j/mNmq8rqLf2y/uNmpD/tzB9ukTW5uKJuQ2FAIinnIWUrCVEyO3
	UBfqLVYPow0S08CQ==
Date: Thu, 10 Oct 2024 09:01:30 +0200
Subject: [PATCH 28/28] vdso: Rename struct arch_vdso_data to
 arch_vdso_time_data
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241010-vdso-generic-base-v1-28-b64f0842d512@linutronix.de>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
In-Reply-To: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
To: Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Russell King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Nam Cao <namcao@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=7074;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=bmLr9bltMVHizIeVDqLzj2HqsQpWocRWT4+kR/T19ag=;
 b=N3HFGRCOhFBmFayrQto6v2sWiZPZyyxCoZ6rc+97KQn8YQbzqhCmMvQaJzGUe9ZcpAV+Vk3+G
 VNSUB6zxS7JBUKO30Jn44YK6Zc/Ft0AJW8nj8jbQNCMTG/nweeZhxMs
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

From: Nam Cao <namcao@linutronix.de>

The struct arch_vdso_data is only about vdso time data. So rename it to
arch_vdso_time_data to make it obvious.
Non time-related data will be migrated out of these structs soon.

Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/Kconfig                                        |  2 +-
 arch/riscv/Kconfig                                  |  2 +-
 arch/riscv/include/asm/vdso/{data.h => time_data.h} |  8 ++++----
 arch/riscv/kernel/sys_hwprobe.c                     |  2 +-
 arch/riscv/kernel/vdso/hwprobe.c                    |  4 ++--
 arch/s390/Kconfig                                   |  2 +-
 arch/s390/include/asm/vdso/data.h                   | 12 ------------
 arch/s390/include/asm/vdso/time_data.h              | 12 ++++++++++++
 include/vdso/datapage.h                             |  8 ++++----
 9 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 8af374ea1adc245b3aa341314a1dcb51865d03d1..7f1ec327b587c90f02e63edea19ce65c56505b9b 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -1530,7 +1530,7 @@ config HAVE_SPARSE_SYSCALL_NR
 	  entries at 4000, 5000 and 6000 locations. This option turns on syscall
 	  related optimizations for a given architecture.
 
-config ARCH_HAS_VDSO_DATA
+config ARCH_HAS_VDSO_TIME_DATA
 	bool
 
 config HAVE_STATIC_CALL
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 62545946ecf432df5b41e235ba66438cd3743c06..c278280c134f78d5a1f89199bdb85ad362aa5436 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -50,7 +50,7 @@ config RISCV
 	select ARCH_HAS_SYSCALL_WRAPPER
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UBSAN
-	select ARCH_HAS_VDSO_DATA
+	select ARCH_HAS_VDSO_TIME_DATA
 	select ARCH_KEEP_MEMBLOCK if ACPI
 	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE	if 64BIT && MMU
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
diff --git a/arch/riscv/include/asm/vdso/data.h b/arch/riscv/include/asm/vdso/time_data.h
similarity index 71%
rename from arch/riscv/include/asm/vdso/data.h
rename to arch/riscv/include/asm/vdso/time_data.h
index dc2f76f58b7632f0392af6aaf475076203f1a54a..dfa65228999bed41dfd6c5e36cb678e1e055eec8 100644
--- a/arch/riscv/include/asm/vdso/data.h
+++ b/arch/riscv/include/asm/vdso/time_data.h
@@ -1,12 +1,12 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __RISCV_ASM_VDSO_DATA_H
-#define __RISCV_ASM_VDSO_DATA_H
+#ifndef __RISCV_ASM_VDSO_TIME_DATA_H
+#define __RISCV_ASM_VDSO_TIME_DATA_H
 
 #include <linux/types.h>
 #include <vdso/datapage.h>
 #include <asm/hwprobe.h>
 
-struct arch_vdso_data {
+struct arch_vdso_time_data {
 	/* Stash static answers to the hwprobe queries when all CPUs are selected. */
 	__u64 all_cpu_hwprobe_values[RISCV_HWPROBE_MAX_KEY + 1];
 
@@ -14,4 +14,4 @@ struct arch_vdso_data {
 	__u8 homogeneous_cpus;
 };
 
-#endif /* __RISCV_ASM_VDSO_DATA_H */
+#endif /* __RISCV_ASM_VDSO_TIME_DATA_H */
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index cea0ca2bf2a25ecc671e31b141e84c6d1977da25..711a31f27c3d051476dd46afa51e6d33cd2fdffa 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -402,7 +402,7 @@ static int do_riscv_hwprobe(struct riscv_hwprobe __user *pairs,
 static int __init init_hwprobe_vdso_data(void)
 {
 	struct vdso_data *vd = __arch_get_k_vdso_data();
-	struct arch_vdso_data *avd = &vd->arch_data;
+	struct arch_vdso_time_data *avd = &vd->arch_data;
 	u64 id_bitsmash = 0;
 	struct riscv_hwprobe pair;
 	int key;
diff --git a/arch/riscv/kernel/vdso/hwprobe.c b/arch/riscv/kernel/vdso/hwprobe.c
index 1e926e4b5881b6b2c44ec8438870809539f773c5..a158c029344f60c022e7565757ff44df7e3d89e5 100644
--- a/arch/riscv/kernel/vdso/hwprobe.c
+++ b/arch/riscv/kernel/vdso/hwprobe.c
@@ -17,7 +17,7 @@ static int riscv_vdso_get_values(struct riscv_hwprobe *pairs, size_t pair_count,
 				 unsigned int flags)
 {
 	const struct vdso_data *vd = __arch_get_vdso_data();
-	const struct arch_vdso_data *avd = &vd->arch_data;
+	const struct arch_vdso_time_data *avd = &vd->arch_data;
 	bool all_cpus = !cpusetsize && !cpus;
 	struct riscv_hwprobe *p = pairs;
 	struct riscv_hwprobe *end = pairs + pair_count;
@@ -52,7 +52,7 @@ static int riscv_vdso_get_cpus(struct riscv_hwprobe *pairs, size_t pair_count,
 			       unsigned int flags)
 {
 	const struct vdso_data *vd = __arch_get_vdso_data();
-	const struct arch_vdso_data *avd = &vd->arch_data;
+	const struct arch_vdso_time_data *avd = &vd->arch_data;
 	struct riscv_hwprobe *p = pairs;
 	struct riscv_hwprobe *end = pairs + pair_count;
 	unsigned char *c = (unsigned char *)cpus;
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index d339fe4fdedf881fd9224020381a1c7f62998d59..8cdd8359e00c3e383aaf5116f557203b59b065c3 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -88,7 +88,7 @@ config S390
 	select ARCH_HAS_STRICT_MODULE_RWX
 	select ARCH_HAS_SYSCALL_WRAPPER
 	select ARCH_HAS_UBSAN
-	select ARCH_HAS_VDSO_DATA
+	select ARCH_HAS_VDSO_TIME_DATA
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG
 	select ARCH_INLINE_READ_LOCK
 	select ARCH_INLINE_READ_LOCK_BH
diff --git a/arch/s390/include/asm/vdso/data.h b/arch/s390/include/asm/vdso/data.h
deleted file mode 100644
index 0e2b40ef69b049c5e79ab2e31811e1e6e6ef2475..0000000000000000000000000000000000000000
--- a/arch/s390/include/asm/vdso/data.h
+++ /dev/null
@@ -1,12 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __S390_ASM_VDSO_DATA_H
-#define __S390_ASM_VDSO_DATA_H
-
-#include <linux/types.h>
-
-struct arch_vdso_data {
-	__s64 tod_steering_delta;
-	__u64 tod_steering_end;
-};
-
-#endif /* __S390_ASM_VDSO_DATA_H */
diff --git a/arch/s390/include/asm/vdso/time_data.h b/arch/s390/include/asm/vdso/time_data.h
new file mode 100644
index 0000000000000000000000000000000000000000..8a08752422e609d925c87ba5aafd1bbb6fef57e7
--- /dev/null
+++ b/arch/s390/include/asm/vdso/time_data.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __S390_ASM_VDSO_TIME_DATA_H
+#define __S390_ASM_VDSO_TIME_DATA_H
+
+#include <linux/types.h>
+
+struct arch_vdso_time_data {
+	__s64 tod_steering_delta;
+	__u64 tod_steering_end;
+};
+
+#endif /* __S390_ASM_VDSO_TIME_DATA_H */
diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index b85f24cac3f564d8b3c25c6ce86d2527af0e1e0b..d967baa0cd0c65784e38dc4fcd7b9e8273923947 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -19,10 +19,10 @@
 #include <vdso/time32.h>
 #include <vdso/time64.h>
 
-#ifdef CONFIG_ARCH_HAS_VDSO_DATA
-#include <asm/vdso/data.h>
+#ifdef CONFIG_ARCH_HAS_VDSO_TIME_DATA
+#include <asm/vdso/time_data.h>
 #else
-struct arch_vdso_data {};
+struct arch_vdso_time_data {};
 #endif
 
 #define VDSO_BASES	(CLOCK_TAI + 1)
@@ -114,7 +114,7 @@ struct vdso_data {
 	u32			hrtimer_res;
 	u32			__unused;
 
-	struct arch_vdso_data	arch_data;
+	struct arch_vdso_time_data arch_data;
 };
 
 /**

-- 
2.47.0


