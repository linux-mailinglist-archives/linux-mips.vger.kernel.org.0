Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADD22363FE9
	for <lists+linux-mips@lfdr.de>; Mon, 19 Apr 2021 12:51:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231387AbhDSKvl (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Apr 2021 06:51:41 -0400
Received: from mail.loongson.cn ([114.242.206.163]:60926 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230013AbhDSKvl (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 19 Apr 2021 06:51:41 -0400
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx7+6CYH1gAlwKAA--.1828S2;
        Mon, 19 Apr 2021 18:50:42 +0800 (CST)
From:   Youling Tang <tangyouling@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jinyang He <hejinyang@loongson.cn>
Subject: [PATCH] MIPS: Fix cmdline "mem=" parameter parsing
Date:   Mon, 19 Apr 2021 18:50:25 +0800
Message-Id: <1618829425-11873-1-git-send-email-tangyouling@loongson.cn>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx7+6CYH1gAlwKAA--.1828S2
X-Coremail-Antispam: 1UD129KBjvJXoWruw47uw45KFyUCFWDWw43GFg_yoW8Jr1rpw
        47C3sYkr4Dury7uw4rA395uw45Xas3XFW7XFW2vws5Aan0qFy8Ar4FqF1YvFyjvrWkt3Wj
        qF1qvr4UuanrCFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
        0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
        jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
        1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8twCF
        04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r
        18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vI
        r41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr
        1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF
        0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU-6pPUUUUU=
X-CM-SenderInfo: 5wdqw5prxox03j6o00pqjv00gofq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

This problem may only occur on NUMA platforms. When machine start with the
"mem=" parameter on Loongson64, it cannot boot. When parsing the "mem="
parameter, first remove all RAM, and then add memory through memblock_add(),
which causes the newly added memory to be located on MAX_NUMNODES.

The solution is to add the current "mem=" parameter range to the memory area
of the corresponding node, instead of adding all of it to the MAX_NUMNODES
node area. Get the node number corresponding to the "mem=" parameter range
through pa_to_nid(), and then add it to the corresponding node through
memblock_add_node().

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
Signed-off-by: Youling Tang <tangyouling@loongson.cn>
---
 arch/mips/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 279be01..b86e241 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -359,7 +359,7 @@ static int __init early_parse_mem(char *p)
 	if (*p == '@')
 		start = memparse(p + 1, &p);
 
-	memblock_add(start, size);
+	memblock_add_node(start, size, pa_to_nid(start));
 
 	return 0;
 }
-- 
2.1.0

