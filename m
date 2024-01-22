Return-Path: <linux-mips+bounces-1034-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B779835C54
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jan 2024 09:09:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D272AB26D0D
	for <lists+linux-mips@lfdr.de>; Mon, 22 Jan 2024 08:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B201E555;
	Mon, 22 Jan 2024 08:09:00 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 585C518C38
	for <linux-mips@vger.kernel.org>; Mon, 22 Jan 2024 08:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.242.206.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705910940; cv=none; b=rnM3zAIwxBnKd/QdB1/lqXWwISqAq+trxE1Bsda9FNo+lL8RfWbAGzG0ZM+OiLTp9EW4Sqvy0fg4dt6B8tjo+87sAndoHIsuaBtzlb+jopYXlVYIn11auYQgNcrDmC6Ek9yBSqH+GmQx16mlzQrDNGbmoktUhSfPuGtEc1LtoBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705910940; c=relaxed/simple;
	bh=5JFTophZV6eHu0i7KuvQ4XKNF04Mlt7nzBh1f8P4rns=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h9Xz6veM0VXQ71mI0cavzEJx3qdzgHkcBnieyQdF7UlY+kBNDWmW/LYRTmuPRBMsnfQsqCHkX9WBaaE8haNbhd2mqvUWbf5tLDryVb2fHi8HHmlCGypvVE7LVTynuEwc2r/xtOnoIeW76L109fVKBFuj2HIbZIZFXWij1Q9myG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn; spf=pass smtp.mailfrom=loongson.cn; arc=none smtp.client-ip=114.242.206.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=loongson.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loongson.cn
Received: from loongson.cn (unknown [111.9.175.10])
	by gateway (Coremail) with SMTP id _____8CxXOmWIq5lKXIDAA--.3954S3;
	Mon, 22 Jan 2024 16:08:54 +0800 (CST)
Received: from localhost.localdomain (unknown [111.9.175.10])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxEOWKIq5llCsRAA--.5616S3;
	Mon, 22 Jan 2024 16:08:53 +0800 (CST)
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
Date: Mon, 22 Jan 2024 16:08:33 +0800
Message-Id: <20240122080834.8251-2-huangpei@loongson.cn>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240122080834.8251-1-huangpei@loongson.cn>
References: <ZZ29Wr9yfAcqGxrN@alpha.franken.de>
 <20240122080834.8251-1-huangpei@loongson.cn>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:AQAAf8DxEOWKIq5llCsRAA--.5616S3
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoW7GF4UXFWxWF1xGr13Jw4fZwc_yoWDtFg_A3
	Z2yw10gr4FqrnIvF1UWFW5CFyY9FWrGF1ku3WDGrZIkr45A3Z8Jw4UWwn0qrn8WrsYkwsx
	Z343Jrs7Ka13KosvyTuYvTs0mTUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb3AYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jrv_JF1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	WxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AK
	xVW8Jr0_Cr1UM2kKe7AKxVWUXVWUAwAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07
	AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
	AVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
	AKI48JMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v2
	6r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIx
	AIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIev
	Ja73UjIFyTuYvjxUc0eHDUUUU

"cpu_probe" is called both by BP and APs, but reserving exception vector
(like 0x0-0x1000) called by "cpu_probe" need once and calling on APs is
too late since memblock is unavailable at that time.

So, reserve exception vector ONLY by BP.

Suggested-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Huang Pei <huangpei@loongson.cn>
---
 arch/mips/kernel/traps.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 246c6a6b0261..5b778995d448 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -2007,7 +2007,13 @@ unsigned long vi_handlers[64];
 
 void reserve_exception_space(phys_addr_t addr, unsigned long size)
 {
-	memblock_reserve(addr, size);
+	/*
+	 * reserve exception space on CPUs other than CPU0
+	 * is too late, since memblock is unavailable when APs
+	 * up
+	 */
+	if (smp_processor_id() == 0)
+		memblock_reserve(addr, size);
 }
 
 void __init *set_except_vector(int n, void *addr)
-- 
2.30.2


