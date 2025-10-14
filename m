Return-Path: <linux-mips+bounces-11716-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F015BD99EE
	for <lists+linux-mips@lfdr.de>; Tue, 14 Oct 2025 15:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 750CD3E5F28
	for <lists+linux-mips@lfdr.de>; Tue, 14 Oct 2025 13:09:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48732315760;
	Tue, 14 Oct 2025 13:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Cdzz+KJz";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BwzlN2uX"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D095314B79;
	Tue, 14 Oct 2025 13:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760447157; cv=none; b=OQ+98VFXuQelDbIwTpwvTclkVa5gCBOSewtuw2Ldo9IJ0+UVQh0/TF8DyFbttqpeBUrd2oI74TKbvaBhGwMTR49EgSDsfhHxG+L54VrDxGKnYnJkDaJOjIqJsqv7b4VrKJ9xViqcFYuEjNroN6LucUy1ACJ3ijZrNrd+6q/BgTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760447157; c=relaxed/simple;
	bh=C5yzpCLqrEUvmfCc9tgMT4vkB0PmGsIVmeRJ/wm+ukg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GwOJoRW+WdxMlCiiotw4/ckW2xeTWxiZA71kWYF6zLC/ep1rP6TEMh5yqRno9HGm+OixPNvRAtNUmLBGyFnbZYGYDZ1b+/e1FbXd/HIGe7kmLvPh7wyznTQq6GjHevZ8XxLcNuhBdhGbhz20Pg4yfc3eQW1SMKgvyPR8sgORYvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Cdzz+KJz; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BwzlN2uX; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760447153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0CYU5O26JQub+yqWqbpQg+oK8k+3uTAokj7TeaLTkvI=;
	b=Cdzz+KJzTSoATXV5Ljvowdfgd+hQ49C2HiCspOUMSbLN4Y/KVwHbpcJlPKJDrYKwBpV1Cl
	nl8yCfx9g0blauWEMvgfadUL1Xs67s2WkQmzFvJzw9Skl6Se6lLax4sHGzAsfb26klKK4r
	1BR7dCS9II5sV9DxZS2LrinYR6AYT+BArKduD/fSTt/Rp2tk85LB4DGeGNLC0+s3ZjHIEu
	COxW7QHALQxTwh7TIVAWN9EATLtrOBhFbB2fenbToNZVXr9gPZ2uc6XeCAsm5sSbnusf+D
	IkBXOvaPA9/tEih0RaZgPFGhQsTs/IhEkpHFcxJdnU0UXlm4UHC30/jqEm0elg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760447153;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0CYU5O26JQub+yqWqbpQg+oK8k+3uTAokj7TeaLTkvI=;
	b=BwzlN2uXPCg/X47u0Uh4Y8N28ll/JnhCE8duJmS0jRH2zsnGwBT82W4JCx3IH8lzXaM7kD
	xkxDEF1BudBfnOCA==
Date: Tue, 14 Oct 2025 15:05:20 +0200
Subject: [PATCH v2 05/10] s390: Implement custom CC_CAN_LINK
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251014-kbuild-userprogs-bits-v2-5-faeec46e887a@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760447149; l=1192;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=C5yzpCLqrEUvmfCc9tgMT4vkB0PmGsIVmeRJ/wm+ukg=;
 b=6KMNxZohvV8U55EvTgd5gt+n+aQ06tzHiTyepjAkWCXf3bRHfASgeYcybxotqxOnkE219kD9n
 3f3fejzuvHFChDTTBo0UVdS4/IrKpsCny3q6UyLNz4mbPAvOrT8AK4d
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The generic CC_CAN_LINK detection relies on -m32/-m64 compiler flags.
s390 uses -m31 instead of -m32.

Use architecture-specific logic using -m31/-m64 instead.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/s390/Kconfig | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index c4145672ca342a656eece10704706d4b12ff9fd6..77ea17537fa2f938aee1fce0053a48853b1ce638 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -82,6 +82,7 @@ config S390
 	select ARCH_ENABLE_MEMORY_HOTREMOVE
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
+	select ARCH_HAS_CC_CAN_LINK
 	select ARCH_HAS_CPU_FINALIZE_INIT
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL
@@ -290,6 +291,16 @@ config PGTABLE_LEVELS
 
 source "kernel/livepatch/Kconfig"
 
+config ARCH_CC_CAN_LINK
+	bool
+	default $(cc_can_link_user,-m64) if 64BIT
+	default $(cc_can_link_user,-m31)
+
+config ARCH_USERFLAGS
+	string
+	default "-m64" if 64BIT
+	default "-m31"
+
 config ARCH_SUPPORTS_KEXEC
 	def_bool y
 

-- 
2.51.0


