Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B16873D8D7
	for <lists+linux-mips@lfdr.de>; Mon, 26 Jun 2023 09:50:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbjFZHut (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 26 Jun 2023 03:50:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbjFZHur (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 26 Jun 2023 03:50:47 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C6B8E70;
        Mon, 26 Jun 2023 00:50:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CA34360C98;
        Mon, 26 Jun 2023 07:50:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6979DC433C0;
        Mon, 26 Jun 2023 07:50:33 +0000 (UTC)
From:   Huacai Chen <chenhuacai@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhuacai@kernel.org>
Cc:     linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@loongson.cn>, stable@vger.kernel.org,
        Huang Pei <huangpei@loongson.cn>
Subject: [PATCH] MIPS: Loongson: Fix cpu_probe_loongson() again
Date:   Mon, 26 Jun 2023 15:50:14 +0800
Message-Id: <20230626075014.1872632-1-chenhuacai@loongson.cn>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Commit 7db5e9e9e5e6c10d7d ("MIPS: loongson64: fix FTLB configuration")
move decode_configs() from the beginning of cpu_probe_loongson() to the
end in order to fix FTLB configuration. However, it breaks the CPUCFG
decoding because decode_configs() use "c->options = xxxx" rather than
"c->options |= xxxx", all information get from CPUCFG by decode_cpucfg()
is lost.

This causes error when creating a KVM guest on Loongson-3A4000:
Exception Code: 4 not handled @ PC: 0000000087ad5981, inst: 0xcb7a1898 BadVaddr: 0x0 Status: 0x0

Fix this by moving the c->cputype setting to the beginning and moving
decode_configs() after that.

Fixes: 7db5e9e9e5e6c10d7d ("MIPS: loongson64: fix FTLB configuration")
Cc: stable@vger.kernel.org
Cc: Huang Pei <huangpei@loongson.cn>
Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
---
 arch/mips/kernel/cpu-probe.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index e79adcb128e6..b406d8bfb15a 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1677,7 +1677,10 @@ static inline void decode_cpucfg(struct cpuinfo_mips *c)
 
 static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
 {
+	c->cputype = CPU_LOONGSON64;
+
 	/* All Loongson processors covered here define ExcCode 16 as GSExc. */
+	decode_configs(c);
 	c->options |= MIPS_CPU_GSEXCEX;
 
 	switch (c->processor_id & PRID_IMP_MASK) {
@@ -1687,7 +1690,6 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
 		case PRID_REV_LOONGSON2K_R1_1:
 		case PRID_REV_LOONGSON2K_R1_2:
 		case PRID_REV_LOONGSON2K_R1_3:
-			c->cputype = CPU_LOONGSON64;
 			__cpu_name[cpu] = "Loongson-2K";
 			set_elf_platform(cpu, "gs264e");
 			set_isa(c, MIPS_CPU_ISA_M64R2);
@@ -1700,14 +1702,12 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
 		switch (c->processor_id & PRID_REV_MASK) {
 		case PRID_REV_LOONGSON3A_R2_0:
 		case PRID_REV_LOONGSON3A_R2_1:
-			c->cputype = CPU_LOONGSON64;
 			__cpu_name[cpu] = "ICT Loongson-3";
 			set_elf_platform(cpu, "loongson3a");
 			set_isa(c, MIPS_CPU_ISA_M64R2);
 			break;
 		case PRID_REV_LOONGSON3A_R3_0:
 		case PRID_REV_LOONGSON3A_R3_1:
-			c->cputype = CPU_LOONGSON64;
 			__cpu_name[cpu] = "ICT Loongson-3";
 			set_elf_platform(cpu, "loongson3a");
 			set_isa(c, MIPS_CPU_ISA_M64R2);
@@ -1727,7 +1727,6 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
 		c->ases &= ~MIPS_ASE_VZ; /* VZ of Loongson-3A2000/3000 is incomplete */
 		break;
 	case PRID_IMP_LOONGSON_64G:
-		c->cputype = CPU_LOONGSON64;
 		__cpu_name[cpu] = "ICT Loongson-3";
 		set_elf_platform(cpu, "loongson3a");
 		set_isa(c, MIPS_CPU_ISA_M64R2);
@@ -1737,8 +1736,6 @@ static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu)
 		panic("Unknown Loongson Processor ID!");
 		break;
 	}
-
-	decode_configs(c);
 }
 #else
 static inline void cpu_probe_loongson(struct cpuinfo_mips *c, unsigned int cpu) { }
-- 
2.39.3

