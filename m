Return-Path: <linux-mips+bounces-9692-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 837EEAFE6F5
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jul 2025 13:07:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55A46189049F
	for <lists+linux-mips@lfdr.de>; Wed,  9 Jul 2025 11:08:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B53728EA55;
	Wed,  9 Jul 2025 11:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ohkrBKpz"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54F1228DF33;
	Wed,  9 Jul 2025 11:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752059248; cv=none; b=PjuiT4QirmWR2iBaIcutMM2WYzw1j5C6ZEnBTOtEm7POSIIXwi2wWm/K1EcNuK28lPNcsOQkElGZRfDqytEJztInvt5lveMF+n8U7gwYjl+zbW01DP1cJna21ixgxG3jFU0gBvzTlvDdjlZ8wKCOr6s5COFWEmKljOiU62zI1LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752059248; c=relaxed/simple;
	bh=fU7P0kdRGYXi4DlP9jTpt63rE8Tbf8cPi2O5ducVVIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U2ofVJF1cHLddERQMacnHQPWyujVw3RJNk7gB6cDXsJCPueF933ItfOKZbdJ/M2bc3YSEm7BEtp79Sokj3BSTz9RGOa8G5jlwIp2DkfU27arObPkFldo6rD76z5ZQb9neSBd4fSzTqju1S6QMd+FPxv+MwpyhCLTsRHuo1tLkwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ohkrBKpz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 00447C19421;
	Wed,  9 Jul 2025 11:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752059248;
	bh=fU7P0kdRGYXi4DlP9jTpt63rE8Tbf8cPi2O5ducVVIc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ohkrBKpz+Y/xg+cq3Xt8X97/9b9TA+wNrwGbi7pchOXVHCLSNhuz4AOgR8duuuBc6
	 kTqGSUx4V3XJybrATUJKG6CpErGPRFy2zfkEroqY6pkF/hXtzw2lIYX7zE1k5XFcrQ
	 0qWr7kvtJyN3wUiWi04Q2ZOtsQH/px8RuI0NxfWP8Ttno/rfEesh7nhIqymN7OLF1h
	 7qPdwMMcpbT/1sbsVRQMesptVckfmQU/04MqeyoEFbRtu3EFMacrguewYtqbvvCt8l
	 T/rc9/AAink8fuGUqpPmwYs+Aca4gDajfLI1z1UQchTm+3LuIa6T0WWYt8eaR21Di1
	 P7250jsXXpHDg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECE0CC83F03;
	Wed,  9 Jul 2025 11:07:27 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Date: Wed, 09 Jul 2025 19:05:59 +0800
Subject: [PATCH v2 8/9] MIPS: Unify Loongson1 PRID_REV
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250709-loongson1-arch-v2-8-bcff6e518c09@gmail.com>
References: <20250709-loongson1-arch-v2-0-bcff6e518c09@gmail.com>
In-Reply-To: <20250709-loongson1-arch-v2-0-bcff6e518c09@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752059245; l=1706;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=gUS5VFP2+HU6UgsUMUAXlQqSqNjhcNxWcW8wuO4vtbs=;
 b=5YLS4SMYr8orsDZy7V/3WCDQ1s6xa3cg/XEeO93cXs4+mrzKYxMDCNiK2izFY7KUMM0UIHHJU
 JrPFZslP2QEDDHqQk2Y0R8levJLXqvRPHMu1rVnufyoHzTbKxLtx9oS
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
Reply-To: keguang.zhang@gmail.com

From: Keguang Zhang <keguang.zhang@gmail.com>

LS1B and LS1C share the same PRID value, so unify them
into a single definition: PRID_REV_LOONGSON1.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
---
 arch/mips/include/asm/cpu.h  | 3 +--
 arch/mips/kernel/cpu-probe.c | 6 +++---
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/mips/include/asm/cpu.h b/arch/mips/include/asm/cpu.h
index ecb9854cb432..4163b22c0a9a 100644
--- a/arch/mips/include/asm/cpu.h
+++ b/arch/mips/include/asm/cpu.h
@@ -248,8 +248,7 @@
 #define PRID_REV_VR4181A		0x0070	/* Same as VR4122 */
 #define PRID_REV_VR4130			0x0080
 #define PRID_REV_34K_V1_0_2		0x0022
-#define PRID_REV_LOONGSON1B		0x0020
-#define PRID_REV_LOONGSON1C		0x0020	/* Same as Loongson-1B */
+#define PRID_REV_LOONGSON1		0x0020
 #define PRID_REV_LOONGSON2E		0x0002
 #define PRID_REV_LOONGSON2F		0x0003
 #define PRID_REV_LOONGSON2K_R1_0	0x0000
diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index af7412549e6e..ca1ab765d4ac 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1286,14 +1286,14 @@ static inline void cpu_probe_legacy(struct cpuinfo_mips *c, unsigned int cpu)
 		set_cpu_asid_mask(c, MIPS_ENTRYHI_ASID);
 		c->writecombine = _CACHE_UNCACHED_ACCELERATED;
 		break;
-	case PRID_IMP_LOONGSON_32:  /* Loongson-1 */
+	case PRID_IMP_LOONGSON_32:
 		decode_configs(c);
 
 		c->cputype = CPU_LOONGSON32;
 
 		switch (c->processor_id & PRID_REV_MASK) {
-		case PRID_REV_LOONGSON1B:
-			__cpu_name[cpu] = "Loongson 1B";
+		case PRID_REV_LOONGSON1:
+			__cpu_name[cpu] = "ICT Loongson-1";
 			break;
 		}
 

-- 
2.43.0



