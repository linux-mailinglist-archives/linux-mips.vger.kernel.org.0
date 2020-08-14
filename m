Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC432442ED
	for <lists+linux-mips@lfdr.de>; Fri, 14 Aug 2020 04:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgHNCId (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 13 Aug 2020 22:08:33 -0400
Received: from mail.loongson.cn ([114.242.206.163]:57514 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726522AbgHNCId (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 13 Aug 2020 22:08:33 -0400
Received: from bogon.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj8cP8jVfdbUIAA--.30S2;
        Fri, 14 Aug 2020 10:08:16 +0800 (CST)
From:   Zejiang Tang <tangzejiang@loongson.cn>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: ftrace: Remove redundant #ifdef CONFIG_DYNAMIC_FTRAC
Date:   Fri, 14 Aug 2020 10:08:15 +0800
Message-Id: <1597370895-5412-1-git-send-email-tangzejiang@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dxj8cP8jVfdbUIAA--.30S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Gry3uryxKr47tw43Xry5urg_yoW3JFb_Xr
        12vw40kryrCw1v9398X3yrX345CwsIgrZ3u3WDurWYva90yw45XFW7Jwn8Wrn0va1kZFs8
        ZwnxWryDJayayjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbc8YjsxI4VW3JwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM2
        8CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0
        cI8IcVCY1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwV
        C2z280aVCY1x0267AKxVWxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
        F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F
        4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_Gr1l42xK
        82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGw
        C20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48J
        MIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMI
        IF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY
        6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxU4zuWDUUUU
X-CM-SenderInfo: pwdqw6phmlt03j6o00pqjv00gofq/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

There exists redundant #ifdef CONFIG_DYNAMIC_FTRAC in ftrace.c, remove it.

Signed-off-by: Zejiang Tang <tangzejiang@loongson.cn>
---
 arch/mips/kernel/ftrace.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/mips/kernel/ftrace.c b/arch/mips/kernel/ftrace.c
index 2625232..f57e68f 100644
--- a/arch/mips/kernel/ftrace.c
+++ b/arch/mips/kernel/ftrace.c
@@ -37,10 +37,6 @@ void arch_ftrace_update_code(int command)
 	ftrace_modify_all_code(command);
 }
 
-#endif
-
-#ifdef CONFIG_DYNAMIC_FTRACE
-
 #define JAL 0x0c000000		/* jump & link: ip --> ra, jump to target */
 #define ADDR_MASK 0x03ffffff	/*  op_code|addr : 31...26|25 ....0 */
 #define JUMP_RANGE_MASK ((1UL << 28) - 1)
-- 
2.1.0

