Return-Path: <linux-mips+bounces-9122-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DFDCDAC766A
	for <lists+linux-mips@lfdr.de>; Thu, 29 May 2025 05:20:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B87DC1C07A20
	for <lists+linux-mips@lfdr.de>; Thu, 29 May 2025 03:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 770861B4231;
	Thu, 29 May 2025 03:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZtRBxcwp"
X-Original-To: linux-mips@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08A92629C;
	Thu, 29 May 2025 03:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748488808; cv=none; b=Etr9t1DlNI3q69ezZFUgVjov+xFATm41xpiiYu1i8Gqr/aYHS1G0xeieCg5ferOQaYKP5csMkdKnuG6T8If7A5J3J5DlP0q31fp6lbkP/bk1j++8IMUkcDEYvDW4IlyzRJn+l8KX88kV3dpXlucyeaQabAP3nNGYwkUdP/Xv3sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748488808; c=relaxed/simple;
	bh=VKEvfp6iC7Z5lkn1HOTzudAMft5O8PpqayYVCdEGhzE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XIiCxbmIzU1c9mFEhPv1Pyq6HRYkEEfxs+4Ov4BgjYxdybO13Bc0C/WWeXv9wWFxbyHaWN2ZqZz1TDUWbTjB/oDCioL+lB0UeR3j5+DsLVNR2OrdZMaP0eN/ty+lQJWBzIvti055LD+nCprUNEYUMQoWH/wX+jGYymUEfajJyF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ZtRBxcwp; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=0AElKqvWRm7IoRUVy7/Ak68qT2P9h5KzQ2AZhC1p37w=; b=ZtRBxcwpQp79L+NeZLa+GVmXV9
	tNcumsueoJfTbiB+hw5KlrN8msaUMxc4lYKhlw8FqK/LJwbt7tBD6+A0/KLCm+fB4Gm0QngNddXIw
	+AjVr1xGrS+3ucC/wvS1V9/LejuLLyuORExSGuSKB5LzeHrifo82ch5my0DH+F73/REL29Ya7z0x1
	46kXrWiKF4YT9njpbM4hSe4EcgvHbPomj4jxYbe6S5ss057r9cIB425Ii7JTHYKBlqNUM6aAohEHA
	bYx3m0lDOr6zf8SeUozBjibrsWO7XlbfNh4Gbxdf5A6eCYEdEkGg+UzOGuMDJnkqmclCqhYnkFZb2
	OvVAJibw==;
Received: from [50.53.25.54] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKToM-0000000EoIG-0PUa;
	Thu, 29 May 2025 03:20:06 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	linux-mips@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH] MIPS: loongson2ef: lemote-2f: add missing function prototypes
Date: Wed, 28 May 2025 20:20:05 -0700
Message-ID: <20250529032005.4015158-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add several missing function prototypes for lemote-2f to eliminate
build warnings:

arch/mips/loongson2ef/lemote-2f/machtype.c:10:13: warning: no previous prototype for 'mach_prom_init_machtype' [-Wmissing-prototypes]
   10 | void __init mach_prom_init_machtype(void)
arch/mips/loongson2ef/common/machtype.c:34:20: warning: no previous prototype for 'mach_prom_init_machtype' [-Wmissing-prototypes]
   34 | void __weak __init mach_prom_init_machtype(void)
arch/mips/loongson2ef/lemote-2f/pm.c:52:6: warning: no previous prototype for 'setup_wakeup_events' [-Wmissing-prototypes]
   52 | void setup_wakeup_events(void)
arch/mips/loongson2ef/lemote-2f/pm.c:90:5: warning: no previous prototype for 'wakeup_loongson' [-Wmissing-prototypes]
   90 | int wakeup_loongson(void)
arch/mips/loongson2ef/lemote-2f/pm.c:137:13: warning: no previous prototype for 'mach_suspend' [-Wmissing-prototypes]
  137 | void __weak mach_suspend(void)
arch/mips/loongson2ef/lemote-2f/pm.c:142:13: warning: no previous prototype for 'mach_resume' [-Wmissing-prototypes]
  142 | void __weak mach_resume(void)

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-mips@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/include/asm/mach-loongson2ef/loongson.h |    9 +++++++++
 1 file changed, 9 insertions(+)

--- linux-next-20250522.orig/arch/mips/include/asm/mach-loongson2ef/loongson.h
+++ linux-next-20250522/arch/mips/include/asm/mach-loongson2ef/loongson.h
@@ -18,6 +18,9 @@ extern void bonito_irq_init(void);
 extern void mach_prepare_reboot(void);
 extern void mach_prepare_shutdown(void);
 
+/* machine-specific PROM functions */
+extern void __init mach_prom_init_machtype(void);
+
 /* environment arguments from bootloader */
 extern u32 cpu_clock_freq;
 extern u32 memsize, highmemsize;
@@ -45,6 +48,12 @@ extern void __init mach_init_irq(void);
 extern void mach_irq_dispatch(unsigned int pending);
 extern int mach_i8259_irq(void);
 
+/* power management functions */
+extern void setup_wakeup_events(void);
+extern int wakeup_loongson(void);
+extern void __weak mach_suspend(void);
+extern void __weak mach_resume(void);
+
 /* We need this in some places... */
 #define delay() ({		\
 	int x;				\

