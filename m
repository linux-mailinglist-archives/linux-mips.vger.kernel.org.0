Return-Path: <linux-mips+bounces-11714-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A2401BD9964
	for <lists+linux-mips@lfdr.de>; Tue, 14 Oct 2025 15:12:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21E4A1889AE4
	for <lists+linux-mips@lfdr.de>; Tue, 14 Oct 2025 13:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 989F3313E39;
	Tue, 14 Oct 2025 13:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Zv1lZI9b";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wlzUTHbK"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F8B314A7D;
	Tue, 14 Oct 2025 13:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760447155; cv=none; b=h2uUnssRGuk0aEW+cF3ANKDI+Iq+QyuEzdZh7Z5FsJ6mIrUU4DuEo9yaNWFe+Zcdztnh9Y9c5wJfjJykHzM6NPs/4DIUjd+tr/afbXWJ7h90/ganxh/E84POektC3GSKwAQhCyj+E+r7+I1ah1Bpu6R8T5F9zGKes1RKaXF+jIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760447155; c=relaxed/simple;
	bh=6NbAT/c8dhOFpg7qjR2b49v4+fnBDinUJpp942RcUVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B6ei+pHKOzJDJhPRhCHA3h3wtQL/pCz0qgfiNQ9m96v+RUdMwJf6ZBoruIVvYdWzlnJme3Fjtud4D+6Oj2RTJS8ds6nhIBUfJYdofo3CAJP1RRAQ2YZyRqLm/Gfu7PsyyBdrQTraoZbH74fNsbK1F6aUYzDlRwwIILG+a05DTvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Zv1lZI9b; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wlzUTHbK; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760447151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n5aEmOCiKWRV28QcYO8TDotRByeakPNFwzaXoHbD41M=;
	b=Zv1lZI9bfmZPDvEM4JRusAAq2cBllhjidSUvA9XtE2Ueq5UmZZWoyNyW3QP9Qq2LayLz1t
	EOWUw+ekjm1ZI3ivepNtxpPBhZK8KcSHVObBXN8SFRalX+yoW4vn8kBLzLxHl43jlA5/JR
	1cLBjhlv73q773FIXCEdaE0azr9ONjKk13E8obTJ4zcG5LQqWtpuNTp0Zuas7VZs90NPPm
	8+v68iVr3yOcA4456vKPsS22IsjrtUPvwZ0j24GKJzyN2MrGZim+zAMuiVw7AO6CNPzuqp
	pgTkEA//CML0qSQlX0o6HpofqTPJvZXMG2eV2+DEd1WV7uGiKp7N6MaJZTr1mQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760447151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n5aEmOCiKWRV28QcYO8TDotRByeakPNFwzaXoHbD41M=;
	b=wlzUTHbKokvyVpwrlS1pfBwevlVj/x9vf+ARON0OWsvmjFoXR1E5gzzyiFmLYG7aT3wHf2
	LnIQbss7Iiy91mBw==
Date: Tue, 14 Oct 2025 15:05:18 +0200
Subject: [PATCH v2 03/10] kbuild: allow architectures to override
 CC_CAN_LINK
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251014-kbuild-userprogs-bits-v2-3-faeec46e887a@linutronix.de>
References: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
In-Reply-To: <20251014-kbuild-userprogs-bits-v2-0-faeec46e887a@linutronix.de>
To: Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, Nicolas Schier <nsc@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Masahiro Yamada <masahiroy@kernel.org>, linux-riscv@lists.infradead.org, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760447149; l=2247;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=6NbAT/c8dhOFpg7qjR2b49v4+fnBDinUJpp942RcUVs=;
 b=+axK+KClVFQLPqY2xQIV6Z1Guh/4xXDQBrACtf2w9ctXvFPO+pdPmvsWesaDbNln2fhCMBlvB
 WgGXUgtUQ07ACaBUqVkclPsSnd9imwvXGgtXlpBCgUj8Xxa/luTj8dE
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The generic test for CC_CAN_LINK assumes that all architectures use -m32
and -m64 to switch between 32-bit and 64-bit compilation. This is overly
simplistic. Architectures may use other flags (-mabi, -m31, etc.) or may
also require byte order handling (-mlittle-endian, -EL). Expressing all
of the different possibilities will be very complicated and brittle.
Instead allow architectures to supply their own logic which will be
easy to understand and evolve.

Both the boolean ARCH_HAS_CC_CAN_LINK and the string ARCH_USERFLAGS need
to be implemented as kconfig does not allow the reuse of string options.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 Makefile     | 13 +++++++++++--
 init/Kconfig |  4 ++++
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 17cfa11ca7163aa3297101ceb3c9e85f4878f12d..26e5bca534e27034c355939bca4c90db435ecdbd 100644
--- a/Makefile
+++ b/Makefile
@@ -1134,8 +1134,17 @@ ifneq ($(CONFIG_ARCH_VMLINUX_NEEDS_RELOCS),)
 LDFLAGS_vmlinux	+= --emit-relocs --discard-none
 endif
 
-# Align the bit size of userspace programs with the kernel
-USERFLAGS_FROM_KERNEL := -m32 -m64 --target=%
+# Align the architecture of userspace programs with the kernel
+USERFLAGS_FROM_KERNEL := --target=%
+
+ifdef CONFIG_ARCH_USERPROGS_CFLAGS
+KBUILD_USERCFLAGS += $(CONFIG_ARCH_USERFLAGS)
+KBUILD_USERLDFLAGS += $(CONFIG_ARCH_USERFLAGS)
+else
+# If not overridden also inherit the bit size
+USERFLAGS_FROM_KERNEL += -m32 -m64
+endif
+
 KBUILD_USERCFLAGS  += $(filter $(USERFLAGS_FROM_KERNEL), $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
 KBUILD_USERLDFLAGS += $(filter $(USERFLAGS_FROM_KERNEL), $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
 
diff --git a/init/Kconfig b/init/Kconfig
index 7b722e714d5c5a0580467914b226dc0700ec0797..4a2ae3cfbf26525a60936d9b29a74ef4319ba3a5 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -82,8 +82,12 @@ config RUSTC_LLVM_VERSION
 	int
 	default $(rustc-llvm-version)
 
+config ARCH_HAS_CC_CAN_LINK
+	bool
+
 config CC_CAN_LINK
 	bool
+	default ARCH_CC_CAN_LINK if ARCH_HAS_CC_CAN_LINK
 	default $(cc_can_link_user,$(m64-flag)) if 64BIT
 	default $(cc_can_link_user,$(m32-flag))
 

-- 
2.51.0


