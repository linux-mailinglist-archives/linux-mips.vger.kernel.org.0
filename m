Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 152231BF845
	for <lists+linux-mips@lfdr.de>; Thu, 30 Apr 2020 14:37:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbgD3MhC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 30 Apr 2020 08:37:02 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39842 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726053AbgD3MhC (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 30 Apr 2020 08:37:02 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx395Ixqpeb0kuAA--.29S2;
        Thu, 30 Apr 2020 20:36:25 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH] MIPS: tools: Show result for loongson3-llsc-check
Date:   Thu, 30 Apr 2020 20:36:24 +0800
Message-Id: <1588250184-18730-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dx395Ixqpeb0kuAA--.29S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZryxKw4kAw17Kw48Xr43ZFb_yoWDtFX_J3
        s2g348GryfXrW2kaykury8XFZ7Wa4xZ3W7uanrZr17Wa4Yyr13XFW0yrZ8KF17Cw1jyF4f
        Ar48ur1xAr4I9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbcxFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
        Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_Xr1l
        42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
        WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAK
        I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
        4UMIIF0xvE42xK8VAvwI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAI
        cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjVOJ5UUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

It is better to show the result before loongson3-llsc-check exit,
otherwise we can see nothing if the return status is EXIT_SUCCESS,
it seems confusing.

E.g. without this patch:

[loongson@localhost tools]$ ./loongson3-llsc-check ../../../vmlinux
[loongson@localhost tools]$

With this patch:

[loongson@localhost tools]$ ./loongson3-llsc-check ../../../vmlinux
loongson3-llsc-check returns success
[loongson@localhost tools]$

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/tools/loongson3-llsc-check.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/tools/loongson3-llsc-check.c b/arch/mips/tools/loongson3-llsc-check.c
index 0ebddd0..facd016 100644
--- a/arch/mips/tools/loongson3-llsc-check.c
+++ b/arch/mips/tools/loongson3-llsc-check.c
@@ -303,5 +303,7 @@ int main(int argc, char *argv[])
 out_close:
 	close(vmlinux_fd);
 out_ret:
+	fprintf(stdout, "loongson3-llsc-check %s\n",
+		status ? "returns failure" : "returns success");
 	return status;
 }
-- 
2.1.0

