Return-Path: <linux-mips+bounces-9833-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B346B074AE
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jul 2025 13:25:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEF1F3A82C8
	for <lists+linux-mips@lfdr.de>; Wed, 16 Jul 2025 11:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA6CA2F4310;
	Wed, 16 Jul 2025 11:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TWhACfKy"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3292F3C2A;
	Wed, 16 Jul 2025 11:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752665139; cv=none; b=JVoIhOA4+4K3P/c5kdoMOWqji/bPERXH13glyUHcWF/fFpSk1aOc7ItLzcC09JrdGAcB7QcgsESpP2FqvwX1FAXctXNODEiXQhSYknP+mlzg89KmwQCgXMH3KBcjIVQ5rr2BslVqzKjXUjL+M5cwa8gOBOMYngAKa4f3e2yX8Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752665139; c=relaxed/simple;
	bh=fU7P0kdRGYXi4DlP9jTpt63rE8Tbf8cPi2O5ducVVIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eyEca9OJSmmsRL0bpJqeLsjQsI4sHYN4LRsdKfki/FkIiO/lt0BR7Z7UXswDQceG74pY9mcjMpIHFNy9XU1LTttWlxC9Ar5aE3rkTlcEdsdtBtBeeJwqx9r5cNOS4Y7kTA3XAHt74acu1uFWEHDq3t+JSZMvH2GYyuZ15T+Z1ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TWhACfKy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5A38DC19424;
	Wed, 16 Jul 2025 11:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752665139;
	bh=fU7P0kdRGYXi4DlP9jTpt63rE8Tbf8cPi2O5ducVVIc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=TWhACfKyQ4aqtlLEOhcovW8l1uGcEZ/GPIWc+zL2tfI2W/7ZPTcXeHsdZccZG9sO3
	 KR6g36eQ3LG4gE7xnNX09E7p8PTLqOVIqZydZQ7y4NN9EExSBD4sprYBkQ71KRo2iv
	 0jwWsyS1ruA0px+IqAZ9Yv03y+uWJYBUOueIDRA7+APU6ED/sVoAAq1RkEYpA4u9H2
	 l8XOLQ1R/tDM+t+mDU27ET5YKz378zWdxCDkL4Nmv+ezxdQYPWQy5lBZas2ybV8YNT
	 gsxaZAFdtSWz430suVl71hCATOWHUvEo/oE7KZHvpTPjdtiHnCXJaNOPqac7/aQl5W
	 5F5wxLeCL44/g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50BA7C83F27;
	Wed, 16 Jul 2025 11:25:39 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Date: Wed, 16 Jul 2025 19:25:17 +0800
Subject: [PATCH v3 8/9] MIPS: Unify Loongson1 PRID_REV
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250716-loongson1-arch-v3-8-d160974d696b@gmail.com>
References: <20250716-loongson1-arch-v3-0-d160974d696b@gmail.com>
In-Reply-To: <20250716-loongson1-arch-v3-0-d160974d696b@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Keguang Zhang <keguang.zhang@gmail.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752665136; l=1706;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=gUS5VFP2+HU6UgsUMUAXlQqSqNjhcNxWcW8wuO4vtbs=;
 b=RIqknvnlgePzsVYGaK4A+AUQMqSOzZwjxBZ2GeXqCQWM8Sb9RQSxjMpvVdr4su7gQWLBujpRw
 /oWJGZe1jqzDT1YlKyKNGUWpOQxm86vr2EfKPVwGvQESfg7rtwIXJGs
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



