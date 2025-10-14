Return-Path: <linux-mips+bounces-11721-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D5773BD9A04
	for <lists+linux-mips@lfdr.de>; Tue, 14 Oct 2025 15:16:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 60AC75840CB
	for <lists+linux-mips@lfdr.de>; Tue, 14 Oct 2025 13:10:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BE1F316183;
	Tue, 14 Oct 2025 13:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zwMEM9rR";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="W4M1n9ep"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0687A314D32;
	Tue, 14 Oct 2025 13:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760447158; cv=none; b=MlTSqAJtl27cdACnbFL4KoeBevovZYDWV1WYM3vEcE1yFfpW0fbvK6aizjB9ynGMTkmV+/qgqghw61wu0nuKRrKBonDuA/wRImTtOR0shMWf6xDLSPrL5ehSZzv+sEQVQs/4CFu8LahJobhDwGouoep1iaXmY3x6f7Lt9qcpd+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760447158; c=relaxed/simple;
	bh=3tMmqGYPXW1+sizcvYuquIc8pIXvr2WxMOGAl2JNK7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TxjRxlELFT5sWvqZNXY1/nprE25oR3fC5SLUVlAQ85lNeVMy89EPp9i9OaLgqkX9vO6VkOIUdk2YxTY25LdILoneYKOE5fzRhbERMKoZQ9FTkJK350uzYpnURuozFAC9KW3m162m8mSP2bqgfMc05dIuJksAJMHhfxlsi8yNDR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zwMEM9rR; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=W4M1n9ep; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760447155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P3cczBZg1hsuy3VQFI6BicmC+DtK7KqMRuLTbCsjnP4=;
	b=zwMEM9rRsQ90GXTSdrweLrU/7N3K+yghbYemcwg2uPHlqNF4j0cCpvgXjHX+0YTJHZKeOJ
	AV7HOIPkmXmNzu6g0EfsZnhSDogez7ExUFpFIQjBIUmkwgedkM3DGW224OvDuv52AIiZH9
	uKRl9o2EZd7M+RCB5zTZ1f+xyZnAR5GiJLRFHzfR4cP0emlAiibCVqzSAHClyND3Pp/2iM
	yKs65bATUduM7f//XMj8XYH2ahgPRCn5m0VbgHU6FK+5oevGvM7717IdBgoO7SM8ZQYHJC
	HSnF8eolELUmKlBeYbD2mXYIfape+3JtKdL1CAPjIYMe4jiWJN0qV2kseLuxsg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760447155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=P3cczBZg1hsuy3VQFI6BicmC+DtK7KqMRuLTbCsjnP4=;
	b=W4M1n9ep7+/iLbuSo+Li8obSVodl7csZ5v1BhDxO5sXkVBj5QToSOlVQNP3+geRfZJcBNk
	80JSyHmdyZFC2oAA==
Date: Tue, 14 Oct 2025 15:05:25 +0200
Subject: [PATCH v2 10/10] kbuild: simplify CC_CAN_LINK
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251014-kbuild-userprogs-bits-v2-10-faeec46e887a@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760447149; l=1868;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=3tMmqGYPXW1+sizcvYuquIc8pIXvr2WxMOGAl2JNK7w=;
 b=NFH6jl0rxMrCvmdRLauKbjBZxs9geVFFRlVKeBozgXilXJgY1Mju4UC/ys+/hGi5CHjYmw4ka
 Wd0jRrV874oD4xRqVjBpgkRZJoGweQQIsS5fVbRbcN//KQqo62xtX6e
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

All architectures supporting multiple ABIs have been migrated to
ARCH_CC_CAN_LINK. The remaining ones do not require any special flag,
so simplify the logic.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 Makefile     | 11 +++--------
 init/Kconfig |  3 +--
 2 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/Makefile b/Makefile
index 26e5bca534e27034c355939bca4c90db435ecdbd..1b7da9f10b88f1a374ae34477e5621b4dd27c017 100644
--- a/Makefile
+++ b/Makefile
@@ -1137,17 +1137,12 @@ endif
 # Align the architecture of userspace programs with the kernel
 USERFLAGS_FROM_KERNEL := --target=%
 
-ifdef CONFIG_ARCH_USERPROGS_CFLAGS
-KBUILD_USERCFLAGS += $(CONFIG_ARCH_USERFLAGS)
-KBUILD_USERLDFLAGS += $(CONFIG_ARCH_USERFLAGS)
-else
-# If not overridden also inherit the bit size
-USERFLAGS_FROM_KERNEL += -m32 -m64
-endif
-
 KBUILD_USERCFLAGS  += $(filter $(USERFLAGS_FROM_KERNEL), $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
 KBUILD_USERLDFLAGS += $(filter $(USERFLAGS_FROM_KERNEL), $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS))
 
+KBUILD_USERCFLAGS += $(CONFIG_ARCH_USERFLAGS)
+KBUILD_USERLDFLAGS += $(CONFIG_ARCH_USERFLAGS)
+
 # userspace programs are linked via the compiler, use the correct linker
 ifdef CONFIG_CC_IS_CLANG
 KBUILD_USERLDFLAGS += --ld-path=$(LD)
diff --git a/init/Kconfig b/init/Kconfig
index 4a2ae3cfbf26525a60936d9b29a74ef4319ba3a5..a0127598f2f25ffb55dbb8a0691b0aa68138fc69 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -88,8 +88,7 @@ config ARCH_HAS_CC_CAN_LINK
 config CC_CAN_LINK
 	bool
 	default ARCH_CC_CAN_LINK if ARCH_HAS_CC_CAN_LINK
-	default $(cc_can_link_user,$(m64-flag)) if 64BIT
-	default $(cc_can_link_user,$(m32-flag))
+	default $(cc_can_link_user)
 
 # Fixed in GCC 14, 13.3, 12.4 and 11.5
 # https://gcc.gnu.org/bugzilla/show_bug.cgi?id=113921

-- 
2.51.0


