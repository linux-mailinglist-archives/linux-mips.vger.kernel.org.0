Return-Path: <linux-mips+bounces-12912-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5EFCD1D03C
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 09:05:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DE402307690C
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 08:02:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59F2D37BE99;
	Wed, 14 Jan 2026 08:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="1GWqSl4O";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="RuEHcaus"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BEE379972;
	Wed, 14 Jan 2026 08:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768377716; cv=none; b=kPkYPGEGX/UgBnAvhlSedtF37P2+dvx2LmoPlwRIbz3EAUOofrA1h7A+oMbD/kwU106PHXA1HeW12O3PApu4WvoTTkD/4xziK46nbPs78bbHrrptrLLdMd6y/07THe3XIXz5we1VNzL0elul99n5gfQBdfVwt8p3QZeN1VanM8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768377716; c=relaxed/simple;
	bh=/PGHbFBRbF87mDQ8qVakdB0oSPGR2/opxI5t5u5CZjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Eg8ozVyX5M0sbT3OJ0RaY5IdvvPN30RszoYwI13655fYciBk9XpfaGbbtFk89IVXRsYqAe5IipnJEsvvLecHcNk1Zrx2lEHll661zDcBpaJ8Kvkhj6QBDdI5E4c0adIfWFDhNW99ctwC4N3N57uW8GpajVCCH/8NUMK6LArekJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=1GWqSl4O; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=RuEHcaus; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sVE7UDpBEJQzs6r1E3Q1QZHCQl3Me/v8mkp8raZ1pVU=;
	b=1GWqSl4O8frkZuGBVEYparTPXcEIULuaQAHPdpWQ0EpnZ8DFU6kG76yfTmEL/uFcrqifGB
	qDsG7q88iWJAQj9WaVerLrOIX6uiIlNIczRR5QIMCpoZXn00+Y6nQypzcNK12CduQULJMP
	2cGnMod0mnyeSxq++wou4ZRawxpygSbp9OXO5V0a8pyp7lvXGv9jlueX9Miv4t7Yl7A0JH
	r0EDzhphdhYKgvX8/msd3XVzAhdG2ibo7AsZMqfuDX76IFb5GM4RQdA0x6mOOKOSf5E6Ck
	xtKVaFEWDyWi4lAVPU7Up18IphP4ZcYO+Ns4bK65lN2wYKyTqN9M60nGi/R0tg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377708;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sVE7UDpBEJQzs6r1E3Q1QZHCQl3Me/v8mkp8raZ1pVU=;
	b=RuEHcausFw0WTFmyY09rtvGUsovhmgPHBLrdaFaqIfLg7PS3Nas2PhsrCcboVycDNO0E9Q
	C8OYIy64slBZtJCA==
Date: Wed, 14 Jan 2026 09:01:42 +0100
Subject: [PATCH 10/15] vdso/gettimeofday: Add explicit includes
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260114-vdso-header-cleanups-v1-10-803b80ee97b4@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=905;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=/PGHbFBRbF87mDQ8qVakdB0oSPGR2/opxI5t5u5CZjA=;
 b=cahlVVRYw0sTKZd1PnS4H0fXwsD3uJLNe4aNXSh3zZLPx5OrpUjhanSW/lZKlX6oG5dZD7lyW
 PAfccetFzyVCvZ50oqWEnCHNxcdvr2SPb78dJglEIcSXMNmi34om0W5
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Various used symbols are only visible through transitive includes.
These transitive includes are about to go away.

Explicitly include the necessary headers.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/gettimeofday.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 95df0153f05a..7b3fbae85544 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -3,8 +3,14 @@
  * Generic userspace implementations of gettimeofday() and similar.
  */
 #include <vdso/auxclock.h>
+#include <vdso/clocksource.h>
 #include <vdso/datapage.h>
 #include <vdso/helpers.h>
+#include <vdso/ktime.h>
+#include <vdso/limits.h>
+#include <vdso/math64.h>
+#include <vdso/time32.h>
+#include <vdso/time64.h>
 
 /* Bring in default accessors */
 #include <vdso/vsyscall.h>

-- 
2.52.0


