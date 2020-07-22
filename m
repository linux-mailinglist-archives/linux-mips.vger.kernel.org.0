Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37E392295E6
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jul 2020 12:24:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726821AbgGVKYo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Jul 2020 06:24:44 -0400
Received: from mail.loongson.cn ([114.242.206.163]:57346 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726153AbgGVKYo (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 22 Jul 2020 06:24:44 -0400
Received: from localhost.loongson.cn (unknown [10.10.132.142])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP2TmExhfMTMDAA--.685S2;
        Wed, 22 Jul 2020 18:24:39 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Fix unable to allocate memory for crashkernel
Date:   Wed, 22 Jul 2020 18:24:38 +0800
Message-Id: <1595413478-21269-1-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxP2TmExhfMTMDAA--.685S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Jr4UAw1fGr1UXr43Ar47urg_yoW8Jr13p3
        4UZw4DC3yUWFWDCan5Aas3urWfJwn5Way8XFWUtrWkAas3Jr9rAr4fXF1Y9Fyqqr18K3WY
        qF12gr1kuw1vyFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUySb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
        A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
        jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwV
        C2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
        1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxC2
        0s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI
        0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE
        14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20x
        vaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v2
        6r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x07bOoGdUUUUU=
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use 0 as the align parameter in memblock_find_in_range() is
incorrect when we allocate memory for crashkernel. It's
finally used as by round_down(). Like this call tree:

mm/memblock.c

memblock_find_in_range
└── memblock_find_in_range_node
    ├── __memblock_find_range_bottom_up
    │   └── round_down
    └── __memblock_find_range_top_down
        └── round_down

However, the round_down's second parameter must be a power of 2.
The author mean not align. So change it from 0 to 1.

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/mips/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 7b537fa..588b212 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -497,7 +497,7 @@ static void __init mips_parse_crashkernel(void)
 	if (ret != 0 || crash_size <= 0)
 		return;
 
-	if (!memblock_find_in_range(crash_base, crash_base + crash_size, crash_size, 0)) {
+	if (!memblock_find_in_range(crash_base, crash_base + crash_size, crash_size, 1)) {
 		pr_warn("Invalid memory region reserved for crash kernel\n");
 		return;
 	}
-- 
2.1.0

