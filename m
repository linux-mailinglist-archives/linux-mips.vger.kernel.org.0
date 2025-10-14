Return-Path: <linux-mips+bounces-11715-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 888CFBD99D3
	for <lists+linux-mips@lfdr.de>; Tue, 14 Oct 2025 15:14:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 70AF5581EAA
	for <lists+linux-mips@lfdr.de>; Tue, 14 Oct 2025 13:09:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 277A5314D05;
	Tue, 14 Oct 2025 13:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kDPkhNZF";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zLHxkSgW"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1656314A92;
	Tue, 14 Oct 2025 13:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760447156; cv=none; b=e6fUZXwEVc+/tVxhIRbVEcGKPIne95RRP5+4hnc11jzcU8YlxVO03oPtqD7lfMJDg/hS8FH/W1gR2PKN/DIovP5sodjwS6U6UAo85ZrHTNpP0D+4V96zsmzZpC7WhXhAS6mqkqT9DLanmB+4/597o5TRbkw5MCy12TtE5aywC3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760447156; c=relaxed/simple;
	bh=3lgCYGIMr6BqeDPz9pKFvSa3Tpv/XYmPh2f36Wz3/Vw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eRey6rhZhc3FhwnniWBTiR0FzW4qlUg/3pG+1cNFB6q7pzVeCLoqsre7vQMlI3bsJ8R4cnmh+21uB1miiYCdwwXjLByATIS3PNnDFNk+VJpL6hRU/cq+NLADYtt/aLQrHrmYrJY/iQD0gC5TyXeu74woJ/W18Z+vtpdi6GAwIrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kDPkhNZF; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zLHxkSgW; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760447152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PtEMzaRgOB8kquDpZ2oJC8rCzxEI2hYSKcXXX4oBQqw=;
	b=kDPkhNZFnKiPIKn2BfUt5pn59Sg5Gn1PrDHdDcLkuN3BevIr2tumGBieAbhxD2f4hflub8
	e8SRmhJs4vtIcfp9qgaSlijd6Ih1iAbrv0BJWxfaa2XZb15CS5jFUHKZ+yrK8Id2JM78x1
	95G9tQO2AKOpfPjX/yMBkhWiLEe8Ehyul3lz9yUe15jV/Z/q+EI6Xgu6I5jGxMhWOi5JO+
	GYy3ovjSpa7MZ++Prynre1P1J+cvYl12KJGCvDwZx2HN8axJYv6DZPE3VJqP8X0RusNIWY
	fpQUWrS8hmvkUupggb1ITeEYpa/KHeYd5EqoYqt7zeSKYXCey/nDz2gPSKF7/g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760447152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PtEMzaRgOB8kquDpZ2oJC8rCzxEI2hYSKcXXX4oBQqw=;
	b=zLHxkSgWSjdbKEzJflQ9dcKDaS7KCBMSUJheUled3tqTF+w6qHzcAxxo3/aGtH3oj+wwIC
	hNdsXlaXlufgbEBw==
Date: Tue, 14 Oct 2025 15:05:19 +0200
Subject: [PATCH v2 04/10] riscv: Implement custom CC_CAN_LINK
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251014-kbuild-userprogs-bits-v2-4-faeec46e887a@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760447149; l=1258;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=3lgCYGIMr6BqeDPz9pKFvSa3Tpv/XYmPh2f36Wz3/Vw=;
 b=ljrpmNZOQUkLMN+En8m+6y2KVlfRnUR20ZZD26p+acX5QP7AVUU4yWipMMpv+SjAnIDnFb0Qx
 WUXs2N/Eo+MCXvns+nHls5Gg7cVspWXWzbvjHF5Wo72H4v/yRtTle/C
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The generic CC_CAN_LINK detection relies on -m32/-m64 compiler flags.
These are not supported by riscv compilers.

Use architecture-specific logic using -mabi instead.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/riscv/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0c6038dc5dfd529e1fe623f6bc2729a388b33fde..1faf6e6ec87d1417b4e3213ad54053439c87e331 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -25,6 +25,7 @@ config RISCV
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select ARCH_HAS_BINFMT_FLAT
+	select ARCH_HAS_CC_CAN_LINK
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL if MMU
 	select ARCH_HAS_DEBUG_VM_PGTABLE
@@ -1335,6 +1336,16 @@ config PORTABLE
 config ARCH_PROC_KCORE_TEXT
 	def_bool y
 
+config ARCH_CC_CAN_LINK
+	bool
+	default $(cc_can_link_user,-mabi=lp64d) if 64BIT
+	default $(cc_can_link_user,-mabi=ilp32d)
+
+config ARCH_USERFLAGS
+	string
+	default "-mabi=lp64d" if 64BIT
+	default "-mabi=ilp32d"
+
 menu "Power management options"
 
 source "kernel/power/Kconfig"

-- 
2.51.0


