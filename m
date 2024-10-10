Return-Path: <linux-mips+bounces-5863-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C17E2997F03
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 10:13:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4135FB217A0
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 08:13:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFACA1C7B8F;
	Thu, 10 Oct 2024 07:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2DTRy1A1";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="IV/lmQLC"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C981C68B4;
	Thu, 10 Oct 2024 07:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728543740; cv=none; b=Dc4CnXfscRct27Lf6qMSaJ+Q/wM5KfeiM436ygNPg1M9SWhpdJAg/gQrSpQuDaz7vlu0hKzbR2VHr2Gat7Z1tHwgvKv2T9gZaw6CG1AVKLQ9E2ycS/3R5hfH+Gp7iB3LFSqOjxm57DplDMhefPOZKpe+HE5Z1x2Q/xT0PLy7/qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728543740; c=relaxed/simple;
	bh=HfYxZYn096ZmYlxVv66aK8g/TgQVVJxm5uuInCFA/Ag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fp4fx7QpMRM+Eaua+SKKgymNbLWVWmFlxdSBzTtmU0cUfHg9LCSBAc6mJRw/nKNUF0LwEUGsBpnlUB1ZbS0G7HQCTQtmnzkIT1ZrjClutrZOdtdQjUrG79MUQKNUjYPO7VD5AO6ULtdnX4z/WdiAZcAnGMpwnUNLwXfv3fu8uAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2DTRy1A1; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=IV/lmQLC; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H3pxKJZa6Dz9N7KL0fbqaL5NdHUudM6Tn8tfqCrpw3A=;
	b=2DTRy1A1Cjt3N6qDqe5K0BoAWO29rvBuX3lWT/Kmdq6y6DUlcu+o5N8xMasJzUVFMAo323
	UCWJxZJB7uVwh7vYgi3rL2c0aF10kiV40gO86n/FY/Gs6ELFI+WXw7034+C6fvjVBU9+Km
	6cUj/yfxOGAwsXhHSJ2qvlw1ok88sEREx8RQhGYFJOIsTdYbYDwaEVkcsxgTzLpxI+TDis
	xeE+Yt3rVnUBreZ8INH6EZmxAjW4tIgl5jkaqNfISJLN0D4il65wDYfLb8f+yqiR/btJX7
	U8AKYv47UGDAMFlRmMSXU4DnS4ffmBoiLEGkqWweLFrxuGgKyqZ62pR70p4NYA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H3pxKJZa6Dz9N7KL0fbqaL5NdHUudM6Tn8tfqCrpw3A=;
	b=IV/lmQLC+tb6/qwPperJNfOrXaHrcDq0MS4XMYW93SesVIBdhcL1FpwRI9clUaqYuSppji
	GOyanx7CMHQtKaDQ==
Date: Thu, 10 Oct 2024 09:01:25 +0200
Subject: [PATCH 23/28] powerpc/pseries/lparcfg: Fix printing of
 system_active_processors
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241010-vdso-generic-base-v1-23-b64f0842d512@linutronix.de>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
In-Reply-To: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
To: Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Russell King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=1056;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=HfYxZYn096ZmYlxVv66aK8g/TgQVVJxm5uuInCFA/Ag=;
 b=oZA7lqIB0ZYZamYJTdMLiIdxhQ9YAXkJRqSzP0DH/sWgj/BV0RrnPmuB+2EWqY1XHIcr4xxVG
 83Z3yTTuW7NAeyn0FiM1R3/kFvm4xnMGIAGj4qfIF/57BcVneBBZgVP
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

When printing the information "system_active_processors", the variable
partition_potential_processors is used instead of
partition_active_processors. The wrong value is displayed.

Use partition_active_processors instead.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/powerpc/platforms/pseries/lparcfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
index 62da20f9700a974200c05a9d5de908746f2f151d..acc640fccca17b54c42eca1a242b37ad4299f685 100644
--- a/arch/powerpc/platforms/pseries/lparcfg.c
+++ b/arch/powerpc/platforms/pseries/lparcfg.c
@@ -553,7 +553,7 @@ static int pseries_lparcfg_data(struct seq_file *m, void *v)
 	} else {		/* non SPLPAR case */
 
 		seq_printf(m, "system_active_processors=%d\n",
-			   partition_potential_processors);
+			   partition_active_processors);
 
 		seq_printf(m, "system_potential_processors=%d\n",
 			   partition_potential_processors);

-- 
2.47.0


