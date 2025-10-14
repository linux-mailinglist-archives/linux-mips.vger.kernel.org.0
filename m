Return-Path: <linux-mips+bounces-11717-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F732BD99DF
	for <lists+linux-mips@lfdr.de>; Tue, 14 Oct 2025 15:14:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00936582F79
	for <lists+linux-mips@lfdr.de>; Tue, 14 Oct 2025 13:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BDFE315764;
	Tue, 14 Oct 2025 13:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VKcGupTm";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BPouXKjv"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CF9C314B78;
	Tue, 14 Oct 2025 13:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760447157; cv=none; b=Y4MbZ777514tP4V6869BOa+HlgzbG2T3xUslkq+M9IM30XzdKZA0uodYqcQT9uPZAaS3B6HjnR7DCitPcX3NFi4SpbQWjvvDVil1YLb2bW25lw7cvsV2Cu37t6LgdGxBOGacXFTfYmBVfY2fes98gjx4S9iwwC50/EKF71clvMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760447157; c=relaxed/simple;
	bh=XzQW4/Bu5moeHZMAHvqFvXBlWcd696K9WDlakbG7iS8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u/LkwrV+Yo5qqf86eJ5hVSk6GMmL6Xw8KOHQw+oQzjJk09iPENHzaDqykj5a4x4QRTDlh/WMdijucLwifr1DUmLlGUcofrJdURPPWRXIh28n0E9lYcUABnFcpNy5WUihQjeGM5KrpEe75y5DRHM1tuYeVUns8ZQI7ftM438jC8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VKcGupTm; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BPouXKjv; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760447153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Jz/fSQ4w2Bn/x6vZR3CdwbYNIGEPKCgvqF2C3xKpfE=;
	b=VKcGupTmWHcLI7Z0F1GJxSKy3HSwtCoEQeb3y3K5GW3tZ3MbEDvktdbAmdZTn+uH1bg0U2
	8h4vhGrWqe38UOZfS2U0a3uu3vCKfGG8Q0PpdxY8IqXdPepPVyHpTeW2ODz2NhN4a47v5H
	w2HA0YBUpXONsWbx/w0WyVCks2VkXQYUKS0zVJY9j53UV6RtdWVlwjecCk6jlGdvpnPXss
	Fa7s1H3Kp/Fwosf+mJH1mNTuNYDtbUPvRrFCvp5xDIL6qiKsOdYirrovpEG8frLO3SSDcp
	aNpv/Ts+hnVhhoqgkUPks10emA9sNZ1crjnWsJb8l+ee7LqwXgW9PEGY31oONg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760447153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Jz/fSQ4w2Bn/x6vZR3CdwbYNIGEPKCgvqF2C3xKpfE=;
	b=BPouXKjvuvb+fmaL4NwW0ji9XzPT4qC/zULrhT4erndSmssrS+FBVwoL8r5nMAE7LPOaHo
	LwxtHqhKCr7Nk2DA==
Date: Tue, 14 Oct 2025 15:05:21 +0200
Subject: [PATCH v2 06/10] powerpc: Implement custom CC_CAN_LINK
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251014-kbuild-userprogs-bits-v2-6-faeec46e887a@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760447149; l=1653;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=XzQW4/Bu5moeHZMAHvqFvXBlWcd696K9WDlakbG7iS8=;
 b=iMDR0xOl/X2IGC7IEBYdKs5yuoYP5wjW2LSP8Krtgl2eaP0yhU5aS9qhWhGPYYr0+eb0mEveO
 gg/4WcsNrUBDV10e4SbmIWsMoaYJ+4oJo37KgaWlBCNQAPq/+4MetS8
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The generic CC_CAN_LINK detection does not handle different byte orders.
This may lead to userprogs which are not actually runnable on the target
kernel.

Use architecture-specific logic supporting byte orders instead.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/powerpc/Kconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index e24f4d88885ae52e77fcb523040e8d31f167571f..c6887a2b97530b9c5b8c34dd0baa3ef8548cb43d 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -127,6 +127,7 @@ config PPC
 	select ARCH_DMA_DEFAULT_COHERENT	if !NOT_COHERENT_CACHE
 	select ARCH_ENABLE_MEMORY_HOTPLUG
 	select ARCH_ENABLE_MEMORY_HOTREMOVE
+	select ARCH_HAS_CC_CAN_LINK
 	select ARCH_HAS_COPY_MC			if PPC64
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL
@@ -1341,6 +1342,20 @@ endif
 config PPC_LIB_RHEAP
 	bool
 
+config ARCH_CC_CAN_LINK
+	bool
+	default $(cc_can_link_user,-m64 -mlittle-endian) if 64BIT && CPU_LITTLE_ENDIAN
+	default $(cc_can_link_user,-m64 -mbig-endian) if 64BIT && CPU_BIG_ENDIAN
+	default $(cc_can_link_user,-m32 -mlittle-endian) if CPU_LITTLE_ENDIAN
+	default $(cc_can_link_user,-m32 -mbig-endian) if CPU_BIG_ENDIAN
+
+config ARCH_USERFLAGS
+	string
+	default "-m64 -mlittle-endian" if 64BIT && CPU_LITTLE_ENDIAN
+	default "-m64 -mbig-endian" if 64BIT && CPU_BIG_ENDIAN
+	default "-m32 -mlittle-endian" if CPU_LITTLE_ENDIAN
+	default "-m32 -mbig-endian" if CPU_BIG_ENDIAN
+
 source "arch/powerpc/kvm/Kconfig"
 
 source "kernel/livepatch/Kconfig"

-- 
2.51.0


