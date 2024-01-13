Return-Path: <linux-mips+bounces-924-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C45E282CB20
	for <lists+linux-mips@lfdr.de>; Sat, 13 Jan 2024 10:56:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BFFD61C2181E
	for <lists+linux-mips@lfdr.de>; Sat, 13 Jan 2024 09:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB3DF12E67;
	Sat, 13 Jan 2024 09:55:59 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF19A15C9
	for <linux-mips@vger.kernel.org>; Sat, 13 Jan 2024 09:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8AxzegmXqJlG8cEAA--.5466S3;
	Sat, 13 Jan 2024 17:55:50 +0800 (CST)
Received: from localhost.localdomain (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8Dx+4YOXqJlpoQYAA--.930S3;
	Sat, 13 Jan 2024 17:55:49 +0800 (CST)
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
Subject: [PATCH 1/3] MIPS: adjust exception vector space revervation
Date: Sat, 13 Jan 2024 17:55:07 +0800
Message-Id: <20240113095509.178697-2-huangpei@loongson.cn>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240113095509.178697-1-huangpei@loongson.cn>
References: <ZZ29Wr9yfAcqGxrN@alpha.franken.de>
 <20240113095509.178697-1-huangpei@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8Dx+4YOXqJlpoQYAA--.930S3
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7JFy5CrWrur43JFWxXr13GFX_yoWktwc_Aw
	n2qws7Gr4Utw4Y9w1Ut3WfG3yYk393KrWUZ3ZrGa4av3y5Jr15tan0ga45ZFn3G3WkZrWr
	Cw1YkFZFk3W2qosvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUbVAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aVCY1x0267AKxVW8
	JVW8Jr1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2
	x26I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1D
	McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr4
	1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1l4IxYO2xFxVAFwI0_Jrv_
	JF1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
	CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0
	I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
	8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU
	0xZFpf9x07j5xhLUUUUU=

MIPS R2+ use CP0_Ebase to setup a new exception vector space, instead
of using 0x0-0x1000, so it is unnecessary to reserve 0x0-0x1000 for
MIPS R2+. If this range is not within valid memoryblock.memory range,
memory initialization with CONFIG_DEFERRED_STRUCT_PAGE_INIT failed on
3A1000+(3A1000+ needs other machine-specific fix ) after 61167ad5fecd
("mm: pass nid to reserve_bootmem_region()")

Call reserve_exception_space(0,0x1000) only ONCE whether UP or SMP.

Signed-off-by: Huang Pei <huangpei@loongson.cn>
---
 arch/mips/kernel/cpu-probe.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/cpu-probe.c b/arch/mips/kernel/cpu-probe.c
index b406d8bfb15a..3da35e20d70d 100644
--- a/arch/mips/kernel/cpu-probe.c
+++ b/arch/mips/kernel/cpu-probe.c
@@ -1992,12 +1992,14 @@ void cpu_probe(void)
 	 */
 	loongson3_cpucfg_synthesize_data(c);
 
+	if (cpu == 0) {
 #ifdef CONFIG_64BIT
-	if (cpu == 0)
 		__ua_limit = ~((1ull << cpu_vmbits) - 1);
 #endif
+		if(!cpu_has_mips_r2_r6)
+			reserve_exception_space(0, 0x1000);
+	}
 
-	reserve_exception_space(0, 0x1000);
 }
 
 void cpu_report(void)
-- 
2.30.2


