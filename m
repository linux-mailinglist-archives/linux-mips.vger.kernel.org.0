Return-Path: <linux-mips+bounces-11719-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 303BEBD99F7
	for <lists+linux-mips@lfdr.de>; Tue, 14 Oct 2025 15:15:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C9A2583982
	for <lists+linux-mips@lfdr.de>; Tue, 14 Oct 2025 13:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43358315D32;
	Tue, 14 Oct 2025 13:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="toZTeHZe";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FpLM2FIx"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EDB2314D14;
	Tue, 14 Oct 2025 13:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760447158; cv=none; b=Q3z9tC6GX1+AST3WJItoATuIn0Kyh2uCzH+u+NKaEkZRTWRI4034HDfMmdbIHGacZ4t97c2JSexD7pESPReX/o8XRQkPAnp4kaR31M32WkJw10Y37jZrgZtC/7CyrpMqxIDzVNHqG+jxkYadKWZN388DKdMKOTuPYOebXc5czt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760447158; c=relaxed/simple;
	bh=b6y5QGf5n/DoFSSYq7Ft561zy3R7m1YixtDRRPC4Syk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oEwaAUxOqsIKy1Gm+Z0cF0/0RivQqBl9c9ZwhSO2Jdc75QC9mMpMwge0fRDbYOhYO2ZIqlUgFUDlDcdzbUt+kP8pJmxLIaSvkrRun+QQnGmll3rLg7FJAv/ilvrL5JO7KFSkvDgn74CyNQYXLk4pOp5qXu16HDCwKhdYTp5i1VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=toZTeHZe; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FpLM2FIx; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760447154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/ZtOYvzpIdd5rLNd2E6ncSSFN/khjvYbV63TeavHrvw=;
	b=toZTeHZe1uNjGasrKJzCw6aRjpZ0C4FjxOgf9/0KgK/6vuqPpjSuKY8pi+AlgZxcL6swRy
	gOENcZJv/3PR89wwogqpdZv+lmpci6bHbGRzvHqAR3++S9m2+RTKjniq3b8tO0QKubLcxl
	tFHW4ODlDTHBdB3n123fRMtazhGmb7f3VwyOsp7lvdlFQzRL2hNN0BTMWOHNAzjKKuI3lV
	GJWFeiRFUcvqCMGx+IZj2svBi4ifDeN2pd0O9n+JMu2/mJPzso3CCIvMc7dFNGYjR9NNzx
	hx0ycsNzzhLVpxb5oUuzJZ/hw7Nk5Ubi9y3fDQ2UxfceKUkDgWPT6+kqsIhLfg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760447154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/ZtOYvzpIdd5rLNd2E6ncSSFN/khjvYbV63TeavHrvw=;
	b=FpLM2FIx9lrBLiAi7rZaKk9FxVWGfANDCuRfpLNEQaxOZ4jrMhHLjZzj7y1UkktQxNo626
	7RN/FMNDE+jb/eCA==
Date: Tue, 14 Oct 2025 15:05:23 +0200
Subject: [PATCH v2 08/10] x86/Kconfig: Implement custom CC_CAN_LINK
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251014-kbuild-userprogs-bits-v2-8-faeec46e887a@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760447149; l=1290;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=b6y5QGf5n/DoFSSYq7Ft561zy3R7m1YixtDRRPC4Syk=;
 b=+vm1vR0r4FMZsBIpxV3QN+K0oPDB9pgEvBhAhkeTZXmgDTN7eahpL0dYrQ0dL6ILzr02HF2Zf
 XPjaMmqydtlDwVhKaxupXaW4qFJpS0EQZgzEo/MYf61/Wk9vqQb5nXq
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The generic CC_CAN_LINK detection does not work for all architectures.
To make it clearer how the detection works on x86 create an
architecture-specific variant.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/x86/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index fa3b616af03a2d50eaf5f922bc8cd4e08a284045..a98675cd01c0c27e2a5716fb6d051416ddcc956f 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -73,6 +73,7 @@ config X86
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if (PGTABLE_LEVELS > 2) && (X86_64 || X86_PAE)
 	select ARCH_ENABLE_THP_MIGRATION if X86_64 && TRANSPARENT_HUGEPAGE
 	select ARCH_HAS_ACPI_TABLE_UPGRADE	if ACPI
+	select ARCH_HAS_CC_CAN_LINK
 	select ARCH_HAS_CPU_ATTACK_VECTORS	if CPU_MITIGATIONS
 	select ARCH_HAS_CACHE_LINE_SIZE
 	select ARCH_HAS_CPU_CACHE_INVALIDATE_MEMREGION
@@ -3171,6 +3172,16 @@ config HAVE_ATOMIC_IOMAP
 	def_bool y
 	depends on X86_32
 
+config ARCH_CC_CAN_LINK
+	bool
+	default $(cc_can_link_user,-m64) if 64BIT
+	default $(cc_can_link_user,-m32)
+
+config ARCH_USERFLAGS
+	string
+	default "-m64" if 64BIT
+	default "-m32"
+
 source "arch/x86/kvm/Kconfig"
 
 source "arch/x86/Kconfig.cpufeatures"

-- 
2.51.0


