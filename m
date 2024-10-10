Return-Path: <linux-mips+bounces-5864-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E3250997F00
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 10:13:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FEA4287AF6
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2024 08:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 972491C8FC7;
	Thu, 10 Oct 2024 07:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OsPDoj04";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uZQ0blBW"
X-Original-To: linux-mips@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D708E1C6F6B;
	Thu, 10 Oct 2024 07:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728543741; cv=none; b=FMRrdQoGgV0YNY5mFiNKT0+9ekT7sEybhdJLJkWMe8Y2W6n254y7R0dX1FztuZwU/mprB7Xq4q16J9WYpSfRNUYwf1uIO/QysVxGtYs3eEImpZr5T4pcHJgkbpOR8iWmbBp22egx+A6fyBm51teSmhAmkApptcVSa1IB3r4byqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728543741; c=relaxed/simple;
	bh=xl8NslvwmgdUlYXKqMSBkSIGo+Q6/TRE4tpTp6tPB6g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JmfAqAH3yOFzoImBMDwb37H2x5UzYwP905OfQ9X6/WmJDQOivfnNTZcDDETLAjDjAuR1wxOsmYC5SAsjI67kGL3qiz7G+f85+X+ASLsPXdls0YJIyjx6bzENcmWO30jxtnd6kx3LMqDdBw0ASu2q3EpLNKXiyndxaQtuNqVO7Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OsPDoj04; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=uZQ0blBW; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LP0hk2FuVWMkIH2lJtKmZQH6c1LDdfDQst6rCNa4pzU=;
	b=OsPDoj04Z4RSZNlsLV888deerj4w+hB2Ln35SeNDjwL7sNeyYHjNN2Lzl8ME+keSBorRON
	3Ea/C8rmiBf/B3NDxRRsVjvO1fNDiWPmj8/UfvYa/uIPgo1B9ckMhEaDqb0OSqR83WCqZg
	BEq7UWOFJGyXZyiT/fI1tH8AoHR2Of18EGKoXEFM1Txke+ntHd7/AXNUQ8USw9wCkzzCYa
	9R2Uunlf/zn+dtWEUrwRK9APM7O5JwfbEkPx/OJJ5gY41VFWBKJdRt0qbRQkAWPbdnDp89
	AKrY9GEaMohgJe/N7gZmJBbs9zQwLcg/O+4AsDbUcDWgHbIN/pKUwGgfGKGWnA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LP0hk2FuVWMkIH2lJtKmZQH6c1LDdfDQst6rCNa4pzU=;
	b=uZQ0blBW9HT2ulSu6F1O3z7gz72EApU+rDi5lIMk2OHLEbZEv1p3LQYxwNCByu6BpYIV2f
	k0UV01jPmr6yXIBQ==
Date: Thu, 10 Oct 2024 09:01:26 +0200
Subject: [PATCH 24/28] powerpc/pseries/lparcfg: Use num_possible_cpus() for
 potential processors
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241010-vdso-generic-base-v1-24-b64f0842d512@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=1399;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=xl8NslvwmgdUlYXKqMSBkSIGo+Q6/TRE4tpTp6tPB6g=;
 b=i8N6VHR2dbk5BpKAW6jdHV8EjNkjT4udcZOMDwp1LfatWcSVkcJxtoTEMbI/wewMKiZ4UKRoS
 eQdEKwsbAlmCVbvp6A79N8+6Eo28lxI4ZbMuDyNT+01NBDCPxLLJAX4
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The systemcfg processorCount variable tracks currently online variables,
not possible ones, so the stored value is wrong.
The code preferably tries to use the ibm,lrdr-capacity field 4 which
"represents the maximum number of processors that the guest can have."
Switch from processorCount to the better matching num_possible_cpus().

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/powerpc/platforms/pseries/lparcfg.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
index acc640fccca17b54c42eca1a242b37ad4299f685..cc22924f159f50416130f2dcd8f9d0ba0dc0973f 100644
--- a/arch/powerpc/platforms/pseries/lparcfg.c
+++ b/arch/powerpc/platforms/pseries/lparcfg.c
@@ -29,7 +29,6 @@
 #include <asm/firmware.h>
 #include <asm/rtas.h>
 #include <asm/time.h>
-#include <asm/vdso_datapage.h>
 #include <asm/vio.h>
 #include <asm/mmu.h>
 #include <asm/machdep.h>
@@ -530,7 +529,7 @@ static int pseries_lparcfg_data(struct seq_file *m, void *v)
 		lrdrp = of_get_property(rtas_node, "ibm,lrdr-capacity", NULL);
 
 	if (lrdrp == NULL) {
-		partition_potential_processors = vdso_data->processorCount;
+		partition_potential_processors = num_possible_cpus();
 	} else {
 		partition_potential_processors = be32_to_cpup(lrdrp + 4);
 	}

-- 
2.47.0


