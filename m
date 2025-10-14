Return-Path: <linux-mips+bounces-11718-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 42125BD9922
	for <lists+linux-mips@lfdr.de>; Tue, 14 Oct 2025 15:09:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E281134D975
	for <lists+linux-mips@lfdr.de>; Tue, 14 Oct 2025 13:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 666BD31577B;
	Tue, 14 Oct 2025 13:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Vzd9X37J";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TWmuMW95"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F2A314B84;
	Tue, 14 Oct 2025 13:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760447157; cv=none; b=rzTG3u9zO9KQ6VW48PcATmTdbdDFiQrxXA0jRDLjkqAEknds+ic54KKEu5mzccYjnqOiNGBjYRF+O2xq+I2YdHNRQnCxjDoIG0UTJr0hO922ydMNXEfRIqhxRptoTPTi1lHZ9SGmEVEQkOLcmIAW+RjEi9W5qKpMjkov1ylY96U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760447157; c=relaxed/simple;
	bh=N71PVC1EfqSrxafXCVGnmlQykhL538a8yG+n3pVRhVs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IR/Ygx7y7h3X8NEmpd2mwL1MOC5pCZ7UOEE203vfE7NHGME5UjuLqRI8KnrewGenYDg2KZYAZGQverNfJdMtzbmmaaZf6zUJehyact4om4coNPBj0mz/2GWSx/FAuGjA13xYtKonG1Zgrg2O6/7GYBRBBUzVSAtG5o7Z6xR6ZEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Vzd9X37J; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TWmuMW95; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760447154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w4aJGDj19pCqGq6Mwbs9/EzztmQNf0JP3Sfp4xrHRjQ=;
	b=Vzd9X37JzWVNDax9xF7gUtygBZfPFaA3gsNq68iYTXU84peT0r3N8MbT2m2gSyuEWOp475
	oR+vVdCmcqytsiwYiC6b/bE6d/82PiwkIPqrAvPK4pLAOLq5oJluEKE4Ej6AWHFXvKRgRP
	cuuYJ9oQ/giOO8oM7d9galUCfWv5BUQogZCB3n0avBH2xCchZEYbEG8Y23WkWP8S9lkqBe
	sXljt99G0QRpZzxPiMEntfQiVi7KL/+ysk3fM+CyHJAHBi3n6B8rskNRKW2kRWW7tRLHFH
	gM4uGdxfzGFPYPXkvPD4Uuaw7fSqO2n2Cw19SsmwKTwwJi8bz96YTPC8Ibjw8w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760447154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w4aJGDj19pCqGq6Mwbs9/EzztmQNf0JP3Sfp4xrHRjQ=;
	b=TWmuMW95i4+CfhBBZ5SlvE9frAHrOqOTHwnuv5oXGcDx7/vcAsqhO3HRTC6MIdlDBbjCEx
	MiSFQwwp28wI7oCQ==
Date: Tue, 14 Oct 2025 15:05:22 +0200
Subject: [PATCH v2 07/10] MIPS: Implement custom CC_CAN_LINK
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251014-kbuild-userprogs-bits-v2-7-faeec46e887a@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760447149; l=1586;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=N71PVC1EfqSrxafXCVGnmlQykhL538a8yG+n3pVRhVs=;
 b=Hqg5+Zs1tdClXCVe2TNzjiX+1s7O2uQEAdV1tuC5lSBxirEybZXF94igzHK2M6GzMASu/egXy
 uBKrmuF+mr3AlBuXbEkMD7e4WRZW54J2F/40AVnKmentil9eMRb4dJa
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The generic CC_CAN_LINK detection does not handle different byte orders.
This may lead to userprogs which are not actually runnable on the target
kernel.

Use architecture-specific logic supporting byte orders instead.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/mips/Kconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index e8683f58fd3e2a43bf9384e1c3c3e454a8e59861..b4f07558ad395eb9bb626a264a2e00fdfbdb7f72 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -4,6 +4,7 @@ config MIPS
 	default y
 	select ARCH_32BIT_OFF_T if !64BIT
 	select ARCH_BINFMT_ELF_STATE if MIPS_FP_SUPPORT
+	select ARCH_HAS_CC_CAN_LINK
 	select ARCH_HAS_CPU_CACHE_ALIASING
 	select ARCH_HAS_CPU_FINALIZE_INIT
 	select ARCH_HAS_CURRENT_STACK_POINTER
@@ -3126,6 +3127,20 @@ config CC_HAS_MNO_BRANCH_LIKELY
 config CC_HAS_BROKEN_INLINE_COMPAT_BRANCH
 	def_bool y if CC_IS_CLANG
 
+config ARCH_CC_CAN_LINK
+	bool
+	default $(cc_can_link_user,-m64 -EL) if 64BIT && CPU_LITTLE_ENDIAN
+	default $(cc_can_link_user,-m64 -EB) if 64BIT && CPU_BIG_ENDIAN
+	default $(cc_can_link_user,-m32 -EL) if CPU_LITTLE_ENDIAN
+	default $(cc_can_link_user,-m32 -EB) if CPU_BIG_ENDIAN
+
+config ARCH_USERFLAGS
+	string
+	default "-m64 -EL" if 64BIT && CPU_LITTLE_ENDIAN
+	default "-m64 -EB" if 64BIT && CPU_BIG_ENDIAN
+	default "-m32 -EL" if CPU_LITTLE_ENDIAN
+	default "-m32 -EB" if CPU_BIG_ENDIAN
+
 menu "Power management options"
 
 config ARCH_HIBERNATION_POSSIBLE

-- 
2.51.0


