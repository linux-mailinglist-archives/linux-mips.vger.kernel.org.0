Return-Path: <linux-mips+bounces-982-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A488323F9
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jan 2024 05:03:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A8EBB2125B
	for <lists+linux-mips@lfdr.de>; Fri, 19 Jan 2024 04:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EB7D1C15;
	Fri, 19 Jan 2024 04:03:05 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B88F1186F
	for <linux-mips@vger.kernel.org>; Fri, 19 Jan 2024 04:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705636985; cv=none; b=Uavt3irww0dYuK54GatW10yYI0WNvLFuSluVErtzOkqnVruGq5H+R9RXCKHrDEVpBucHDA+fwX/iT1YMJlyUeN0wnhzdeZDzhdhfe8nQbzPNS3g9uKzbv5nKi1pPId3TxRAwI/2PabaI0ui54Bg+1w9EZ/2sSHChtzJSpnuWJCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705636985; c=relaxed/simple;
	bh=j1Bh/fWKxoqBRnvG/Jkixrdgyjv1AHqNXx/Zwb1aBjg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=stU146HZgiwLCPUygcdXouQRSm8g5ySOFNFNUJmxupPWCoEO8XstcYgnZDaxiLmIYv7WS1sBxJk99Y5kkZjZqmjQ+wAgjBIBga8W+LRzAOoWiRuqTzTfwL5UK/STygcRZBtSt0uIplnYWOSuRPvrZ+9TVCQhi6RIj90wvtN43+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8BxuvB19Kllpu8BAA--.9499S3;
	Fri, 19 Jan 2024 12:03:01 +0800 (CST)
Received: from localhost.localdomain (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Bxb89m9KllexQKAA--.2354S3;
	Fri, 19 Jan 2024 12:03:01 +0800 (CST)
From: Huang Pei <huangpei@loongson.cn>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Bibo Mao <maobibo@loongson.cn>,
	linux-mips@vger.kernel.org,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Paul Burton <paulburton@kernel.org>,
	Li Xuefeng <lixuefeng@loongson.cn>,
	Yang Tiezhu <yangtiezhu@loongson.cn>,
	Gao Juxin <gaojuxin@loongson.cn>,
	Huacai Chen <chenhuacai@loongson.cn>
Subject: [PATCH 1/2] MIPS: reserve exception vector space ONLY ONCE
Date: Fri, 19 Jan 2024 12:02:39 +0800
Message-Id: <20240119040240.392442-2-huangpei@loongson.cn>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240119040240.392442-1-huangpei@loongson.cn>
References: <ZZ29Wr9yfAcqGxrN@alpha.franken.de>
 <20240119040240.392442-1-huangpei@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Bxb89m9KllexQKAA--.2354S3
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj93XoW7KF4Dtw4DWFW5tryUKry3Awc_yoW8AF4fpw
	12kasxKr40kr90vay3Jw1DAr4rXFs7Ww4rK347tr4Sva45Xr13Xwn7tFW3Xry29rWIka4r
	uFn5Z3Zxta1DZwbCm3ZEXasCq-sJn29KB7ZKAUJUUUUr529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUU90b4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r126r13M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v2
	6r4UJVWxJr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12
	xvs2x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r12
	6r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
	vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_
	Jrv_JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42
	IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVj
	vjDU0xZFpf9x07joxRDUUUUU=

"cpu_probe" is called both by BP and APs, but reserving exception vector
(like 0x0-0x1000) called by "cpu_probe" need once and calling on BPs is
too late since memblock is unavailable at that time.

So, reserve exception vector ONLY by BP.

Signed-off-by: Huang Pei <huangpei@loongson.cn>
---
 arch/mips/kernel/cpu-probe.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index b406d8bfb15a..6939d0de2a03 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1581,7 +1581,9 @@ static inline void cpu_probe_broadcom(struct cpuinfo_mips *c, unsigned int cpu)
 			__cpu_name[cpu] = "Broadcom BMIPS4380";
 			set_elf_platform(cpu, "bmips4380");
 			c->options |= MIPS_CPU_RIXI;
-			reserve_exception_space(0x400, VECTORSPACING * 64);
+			if (cpu == 0) {
+				reserve_exception_space(0x400, VECTORSPACING * 64);
+			}
 		} else {
 			c->cputype = CPU_BMIPS4350;
 			__cpu_name[cpu] = "Broadcom BMIPS4350";
@@ -1598,7 +1600,9 @@ static inline void cpu_probe_broadcom(struct cpuinfo_mips *c, unsigned int cpu)
 			__cpu_name[cpu] = "Broadcom BMIPS5000";
 		set_elf_platform(cpu, "bmips5000");
 		c->options |= MIPS_CPU_ULRI | MIPS_CPU_RIXI;
-		reserve_exception_space(0x1000, VECTORSPACING * 64);
+		if (cpu == 0) {
+			reserve_exception_space(0x1000, VECTORSPACING * 64);
+		}
 		break;
 	}
 }
@@ -1992,12 +1996,13 @@ void cpu_probe(void)
 	 */
 	loongson3_cpucfg_synthesize_data(c);
 
+	if (cpu == 0) {
 #ifdef CONFIG_64BIT
-	if (cpu == 0)
 		__ua_limit = ~((1ull << cpu_vmbits) - 1);
 #endif
+		reserve_exception_space(0, 0x1000);
+	}
 
-	reserve_exception_space(0, 0x1000);
 }
 
 void cpu_report(void)
-- 
2.30.2


