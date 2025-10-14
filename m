Return-Path: <linux-mips+bounces-11720-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C289BD999D
	for <lists+linux-mips@lfdr.de>; Tue, 14 Oct 2025 15:13:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08EF019A53D5
	for <lists+linux-mips@lfdr.de>; Tue, 14 Oct 2025 13:10:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BADC315D48;
	Tue, 14 Oct 2025 13:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JhNZzK88";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="shg+bvHX"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9CD5314D24;
	Tue, 14 Oct 2025 13:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760447158; cv=none; b=DY4oW0AVJo9w6nMVXZWvstclWdojTN0b52Ss0yedycDHO4rOB/twJVJnGaFqD/L0IbSznolrdWLQ19ee+qhJf2sKesx9BSxuqQ6gNGzesU/DzPgnCEHn8Cp6pvcfnCbZTaCYBxwcnqnucZ+U9aaBBLvyiSlcVSR5Af9QMppXoSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760447158; c=relaxed/simple;
	bh=dZCLaMpAGc/1vu8ptZyeXWxEiiNKEOUd3NRQEXSEOPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Iycyc0az+rF0oDh15+5FOltwfC1v7/sIVeJvBs0j0kmlH5QKeJCOyh2iYZMmfvnXjgYzZ4iiPLfsVb/Yu1wHrUQDrnpSOdMaojciSCl5FMbSW6hDGxBm95semLULRnJPGEyhuGSzVvhnxRuB10dtXoVY+fotdMHeoNwZjEBZG00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JhNZzK88; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=shg+bvHX; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760447155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5DVnR5cKH1ysJgeyzhsfqmBnURn+edrPqy5/eKSQF/k=;
	b=JhNZzK88e25jp9GotNrIPt/vZZKb0VKNvXHuMydCbEqd1+HpUDRgpkeBu66g8l0nmzb5hj
	bJq7M5ewwEwCvoaLib81c2KVP2JXH18KAShW7IVI9vzPyYKeLzPHuQcnCLcuJ3JXd78+cb
	lUY4MTBSosdoQvzUYAb5icb+K1r5HG4pqLz9oI4bzhBVdZOIowUafsrp3TYAiTbpnnpYfU
	6qg49Q1Ays+clhKO56SqYcYh+OfTyryQT4RpjMe1QyOMPNBfLHRmczaPjLut258n2GT8QC
	+N+DKr68mMlHetmPxxPyjf2o5shGkZUkfBqZ9jlR19UUKQxhn11F/G4GGxOBVg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760447155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5DVnR5cKH1ysJgeyzhsfqmBnURn+edrPqy5/eKSQF/k=;
	b=shg+bvHXD8MmVzyiF3EMIesqOVARExahkoJZzsvujW5lTkfMY5VPtwGaJNav+nBBAaMzPo
	USexF86fUhIfXgDQ==
Date: Tue, 14 Oct 2025 15:05:24 +0200
Subject: [PATCH v2 09/10] sparc: Implement custom CC_CAN_LINK
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251014-kbuild-userprogs-bits-v2-9-faeec46e887a@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760447149; l=1096;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=dZCLaMpAGc/1vu8ptZyeXWxEiiNKEOUd3NRQEXSEOPk=;
 b=a1zArIcpsRzC1FZdasb8JGHUsoGoDAycc57M/S3ZNlxKRnq+Q21DHxSr8+hyt3/JppSgvNfcQ
 bxfFr7HMBuiCdP85ZG5aIqZqJw+JMdqAIBzuwcyKTmbOBLIvkFoAKI5
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The generic CC_CAN_LINK detection does not work for all architectures.
To make it clearer how the detection works on SPARC create an
architecture-specific variant.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/sparc/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
index a630d373e6453c745ab8bf58fc5622cf0edaf4c9..68b553a47d039da4368a2de30168aaf80a941148 100644
--- a/arch/sparc/Kconfig
+++ b/arch/sparc/Kconfig
@@ -13,6 +13,7 @@ config 64BIT
 config SPARC
 	bool
 	default y
+	select ARCH_HAS_CC_CAN_LINK
 	select ARCH_HAS_CPU_CACHE_ALIASING
 	select ARCH_HAS_DMA_OPS
 	select ARCH_MIGHT_HAVE_PC_PARPORT if SPARC64 && PCI
@@ -475,4 +476,14 @@ config COMPAT
 	select ARCH_WANT_OLD_COMPAT_IPC
 	select COMPAT_OLD_SIGACTION
 
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
 source "drivers/sbus/char/Kconfig"

-- 
2.51.0


