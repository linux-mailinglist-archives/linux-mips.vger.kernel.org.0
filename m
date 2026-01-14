Return-Path: <linux-mips+bounces-12905-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 54769D1D00F
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 09:04:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5909B30109BF
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 08:01:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A2CC37C0F8;
	Wed, 14 Jan 2026 08:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="R86PWwrt";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BOEEtN5s"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198723126AD;
	Wed, 14 Jan 2026 08:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768377710; cv=none; b=kkdzqxGVb/hF8Kq5nC1T2TxGEnA42+ADQu+S7+rPnIV50yNvsiAenO0jTNXcertJtYx0Jn1HfNtFdxVv4Li4VVkeHuJRkh+zCVTK4Fb20nif0ONGP1K24kNsumSHiFO+0WMS0DbcaJC0W02MBvFpqFtX1onv8Bc7qLzrzvwjIkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768377710; c=relaxed/simple;
	bh=vbsis2SPCTtEZ4XgoR3kowjwtrHTWI5LshY6sBG6vPg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EvFaoR0XB/UP3TaiDijUqPzGPwdl2NMPguKHw/6Ed7DWAjbmIvjpMTawudSvNyCYRDItoJem9uN1Dx95sI7P6TgbyLHA8dNCjavydV29aBom/c99cSXbZwWJS+nLHJ+o8djnnkKgRL7CpufsHCytDmZWl/Fr0zoEygSjMo21IXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=R86PWwrt; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BOEEtN5s; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t+XegyIZZp8VgtWMc/UdNyYxP3JKnwycRhd9Ip+No+I=;
	b=R86PWwrta6wRViX3oe2B+0G7JaG27PSaukjBa6pWWkxgv2OnRsLcsJE57gOMAUPBkZhr53
	o+0j2fF6uHnc4qyyNKRnyFUvgQvUiXfMEezvmdgo54W4GN//xaoccCz/1nME2Kj1SulIqZ
	0ZqcK/0T2Ndk420N2juT+ha5IrLqdVuVsxV8qn9kUlxLzUCjdUOLaAskKOXITxm+g76F6B
	t/MMn/U5wGy14WUVbOtStsjbEkGgV/wzHRWBtikN6wG8r70gAdzSzzxDqwO21ryxgDK0ro
	1dqSknbUVkopn0p903FTTI9PAflkzXUshGKp7J5riIOrpXufC2dC2y1StpfDDw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377704;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t+XegyIZZp8VgtWMc/UdNyYxP3JKnwycRhd9Ip+No+I=;
	b=BOEEtN5s026PkzdcYp/EYq6nREV5zqKoB7nqsnPOdwtDtGMMv9vCxLG9G6oGeUfE/pLU4z
	lKcKfZoJpNyHumAA==
Date: Wed, 14 Jan 2026 09:01:35 +0100
Subject: [PATCH 03/15] ARM: vdso: gettimeofday: Add explicit includes
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260114-vdso-header-cleanups-v1-3-803b80ee97b4@linutronix.de>
References: <20260114-vdso-header-cleanups-v1-0-803b80ee97b4@linutronix.de>
In-Reply-To: <20260114-vdso-header-cleanups-v1-0-803b80ee97b4@linutronix.de>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=899;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=vbsis2SPCTtEZ4XgoR3kowjwtrHTWI5LshY6sBG6vPg=;
 b=KkQopiJj1U5HqPykgIJsIJ8zy8tprX6k7l/rsqIsT6WdWQJRwFyCFccpE7kDW34aD1vM4DG+3
 97uAQRDhS2OCVLwRMwJp0CJXGzCBwsjDe+LzojO2GxppEjNXxlP68sr
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The reference to VDSO_CLOCKMODE_NONE requires vdso/clocksource.h and
'struct old_timespec32' requires vdso/time32.h. Currently these headers
are included transitively, but those transitive inclusions are about to go
away.

Explicitly include the headers.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm/include/asm/vdso/gettimeofday.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/include/asm/vdso/gettimeofday.h b/arch/arm/include/asm/vdso/gettimeofday.h
index 1e9f81639c88..26da5d8621cc 100644
--- a/arch/arm/include/asm/vdso/gettimeofday.h
+++ b/arch/arm/include/asm/vdso/gettimeofday.h
@@ -11,6 +11,8 @@
 #include <asm/errno.h>
 #include <asm/unistd.h>
 #include <asm/vdso/cp15.h>
+#include <vdso/clocksource.h>
+#include <vdso/time32.h>
 #include <uapi/linux/time.h>
 
 #define VDSO_HAS_CLOCK_GETRES		1

-- 
2.52.0


