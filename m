Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DE3536776C
	for <lists+linux-mips@lfdr.de>; Thu, 22 Apr 2021 04:25:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234306AbhDVCZx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 21 Apr 2021 22:25:53 -0400
Received: from mail.loongson.cn ([114.242.206.163]:44372 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234361AbhDVCZw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 21 Apr 2021 22:25:52 -0400
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxT+5n3oBgwxoMAA--.4114S4;
        Thu, 22 Apr 2021 10:25:05 +0800 (CST)
From:   Youling Tang <tangyouling@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>, Baoquan He <bhe@redhat.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jinyang He <hejinyang@loongson.cn>, kexec@lists.infradead.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] mips: kdump: Capture kernel should be able to see old memories
Date:   Thu, 22 Apr 2021 10:24:32 +0800
Message-Id: <1619058274-6996-3-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1619058274-6996-1-git-send-email-tangyouling@loongson.cn>
References: <1619058274-6996-1-git-send-email-tangyouling@loongson.cn>
X-CM-TRANSID: AQAAf9DxT+5n3oBgwxoMAA--.4114S4
X-Coremail-Antispam: 1UD129KBjvJXoW7ur18Gw4UWryDAFyUAF18Zrb_yoW8XFyrpw
        47A34Fyr48G3WxXayfZFn8urWfXa1kGry7WanrWw4rXr1rZr1xJw40q3ZFgryFqryxtFWq
        gFnYvry09ayvy37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBm14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
        x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0
        owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
        IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
        M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Gr1l42
        xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWU
        GwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI4
        8JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4U
        MIIF0xvE42xK8VAvwI8IcIk0rVW8JVW3JwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I
        8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUnCJmUUUUU
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Huacai Chen <chenhc@lemote.com>

kexec-tools use mem=X@Y to pass usable memories to capture kernel, but
in commit a94e4f24ec836c8984f83959 ("MIPS: init: Drop boot_mem_map") all
BIOS passed memories are removed by early_parse_mem(). I think this is
reasonable for a normal kernel but not for a capture kernel, because a
capture kernel should be able to see all old memories, even though it is
not supposed to use them.

Fixes: a94e4f24ec836c8984f83959 ("MIPS: init: Drop boot_mem_map")
Signed-off-by: Huacai Chen <chenhuacai@kernel.org>
Signed-off-by: Youling Tang <tangyouling@loongson.cn>
---
v2:
- Determine whether it is a capture kernel by judging whether there
  is an "elfcorehdr" parameter in the cmdline.

 arch/mips/kernel/setup.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 9338520..1bc8a9cc 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -352,8 +352,13 @@ static int __init early_parse_mem(char *p)
 	 */
 	if (usermem == 0) {
 		usermem = 1;
-		memblock_remove(memblock_start_of_DRAM(),
-			memblock_end_of_DRAM() - memblock_start_of_DRAM());
+		/*
+		 * During the kdump operation, the old memory should be
+		 * visible to the capture kernel.
+		 */
+		if (!strstr(boot_command_line, "elfcorehdr"))
+			memblock_remove(memblock_start_of_DRAM(),
+				memblock_end_of_DRAM() - memblock_start_of_DRAM());
 	}
 	start = 0;
 	size = memparse(p, &p);
-- 
2.1.0

