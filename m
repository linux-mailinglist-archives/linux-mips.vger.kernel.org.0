Return-Path: <linux-mips+bounces-12916-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D8FD1D054
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 09:07:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 389EF3093504
	for <lists+linux-mips@lfdr.de>; Wed, 14 Jan 2026 08:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDB8037F729;
	Wed, 14 Jan 2026 08:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="R5HC7GTu";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qweOf2NE"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB4A34F47C;
	Wed, 14 Jan 2026 08:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768377721; cv=none; b=VQCRy9fQn2ixqY0qTD/xRrvywKwaqu3kIOfCLAN4A5d+rRN32pWBlcSrotdmjN3ZT9qUO2NGU2tO7qrrzuCv2PREQ6yAN6eh8BvVEbC/6tLFMUoqnUXgABlwtoizUeDxmW1I9J5AUl7dndMQGL0DYYk0qYLGDriXvRBAFCCP038=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768377721; c=relaxed/simple;
	bh=iHRl2iopmVoBePzD44Ct4WnbPDG3Iws20lECSBoN0BQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iFMLhwrYiqKNH3wvOonFxwsBGbQjMJUIMvIKppbnzwL8P6CuaIuMC1w7AyR3S2nRZevJFG8Cj6Ho8gzEzEDsVSx5wa6Djkmzk6doZtVRi/5knyuZRALmUDj7az20J9NujvmABT7n5e46M+l+MTr+XBNtcIwM7z3jc7PyRR6LOMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=R5HC7GTu; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=qweOf2NE; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0kIfhCctwH/PXRTS/l0pyrY0rWJculxYA/h7dmY+/9c=;
	b=R5HC7GTuc259FnQxZrp+F5cNuaIoqy8A+ES/ta60Un2RsZxIod0YLBs/5lvuk/8sCfBcAw
	CwfSEBD9J/oFYWHtkATRmZvTX3DL74gCiBcYV2lYjGZWiwpjPlHt2eUTne1FYso/qCPD3B
	7kCUi53E15QfiWJtVf1YcV775RxLushJo5GH1LVA07p6oq+HrUEkgf9k6TGAq5eVWxggUY
	K00RCb0YrS6j4b503xeAwxfr0XvA4ie2ixgYs+9cWm43F0ayCBsL1C77M/xAWOPRadxM42
	rgTCIbVPVdq7MXLdgHcpTMqflxCfPivR/7vm+TI8rM3yQu0YJzhanbRDkUGlTA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0kIfhCctwH/PXRTS/l0pyrY0rWJculxYA/h7dmY+/9c=;
	b=qweOf2NEn+Fp/jDOE0ObfArk2md0NGD1Z/8dF7nNyaA+uRwgAKPz/pww3+6mAnm7R0MfbP
	G4dmGsbg2zb55qDA==
Date: Wed, 14 Jan 2026 09:01:46 +0100
Subject: [PATCH 14/15] random: vDSO: trim vDSO includes
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260114-vdso-header-cleanups-v1-14-803b80ee97b4@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=674;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=iHRl2iopmVoBePzD44Ct4WnbPDG3Iws20lECSBoN0BQ=;
 b=TVPL39Ltr/bfzoeZIk41jLl3TqbrMhbh4gc6ACjsLk7nBMd2BGcBUreA6Oc23LOS/NZtXPByZ
 OVgpnwljI5sDx8kJaHvSrgE0mqNtbsrGLWjIuxYgBqXYq+noXoe5/IK
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

These includes are not used, remove them.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 drivers/char/random.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index bab03c7c4194..c5122ff33594 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -57,9 +57,7 @@
 #include <crypto/chacha.h>
 #include <crypto/blake2s.h>
 #ifdef CONFIG_VDSO_GETRANDOM
-#include <vdso/getrandom.h>
 #include <vdso/datapage.h>
-#include <vdso/vsyscall.h>
 #endif
 #include <asm/archrandom.h>
 #include <asm/processor.h>

-- 
2.52.0


