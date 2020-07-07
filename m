Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D74CD21693E
	for <lists+linux-mips@lfdr.de>; Tue,  7 Jul 2020 11:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728204AbgGGJjo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 Jul 2020 05:39:44 -0400
Received: from mail.loongson.cn ([114.242.206.163]:54998 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727120AbgGGJjn (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 7 Jul 2020 05:39:43 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr964QgRfBzJRAA--.950S2;
        Tue, 07 Jul 2020 17:39:05 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kees Cook <keescook@chromium.org>,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Juxin Gao <gaojuxin@loongson.cn>
Subject: [PATCH] MIPS: Prevent READ_IMPLIES_EXEC propagation
Date:   Tue,  7 Jul 2020 17:39:01 +0800
Message-Id: <1594114741-26852-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dxr964QgRfBzJRAA--.950S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJry3Ar4ruF4DGw4xtryfXrb_yoW8tr48pF
        ykCa4Dt3yUGryFkas5Z3ykury5JFZxGr429ayxuFWDAanIv3WFvwnayFn0yF15CFsYqa42
        v3sakrnrJF4jkFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
        CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK67AK6r4f
        MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr
        0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0E
        wIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJV
        W8JwCI42IY6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Gr0_Cr1l
        IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUUPl13UUUU
        U==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In the MIPS architecture, we should clear the security-relevant
flag READ_IMPLIES_EXEC in the function SET_PERSONALITY2() of the
file arch/mips/include/asm/elf.h.

Otherwise, with this flag set, PROT_READ implies PROT_EXEC for
mmap to make memory executable that is not safe, because this
condition allows an attacker to simply jump to and execute bytes
that are considered to be just data [1].

In mm/mmap.c:
unsigned long do_mmap(struct file *file, unsigned long addr,
			unsigned long len, unsigned long prot,
			unsigned long flags, vm_flags_t vm_flags,
			unsigned long pgoff, unsigned long *populate,
			struct list_head *uf)
{
	[...]
	if ((prot & PROT_READ) && (current->personality & READ_IMPLIES_EXEC))
		if (!(file && path_noexec(&file->f_path)))
			prot |= PROT_EXEC;
	[...]
}

By the way, x86 and ARM64 have done the similar thing.

After commit 250c22777fe1 ("x86_64: move kernel"), in the file
arch/x86/kernel/process_64.c:
void set_personality_64bit(void)
{
	[...]
	current->personality &= ~READ_IMPLIES_EXEC;
}

After commit 48f99c8ec0b2 ("arm64: Preventing READ_IMPLIES_EXEC
propagation"), in the file arch/arm64/include/asm/elf.h:
#define SET_PERSONALITY(ex)						\
({									\
	clear_thread_flag(TIF_32BIT);					\
	current->personality &= ~READ_IMPLIES_EXEC;			\
})

[1] https://insights.sei.cmu.edu/cert/2014/02/feeling-insecure-blame-your-parent.html

Reported-by: Juxin Gao <gaojuxin@loongson.cn>
Co-developed-by: Juxin Gao <gaojuxin@loongson.cn>
Signed-off-by: Juxin Gao <gaojuxin@loongson.cn>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/mips/include/asm/elf.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/include/asm/elf.h b/arch/mips/include/asm/elf.h
index 5aa29ce..71c7622 100644
--- a/arch/mips/include/asm/elf.h
+++ b/arch/mips/include/asm/elf.h
@@ -410,6 +410,7 @@ do {									\
 	clear_thread_flag(TIF_32BIT_FPREGS);				\
 	clear_thread_flag(TIF_HYBRID_FPREGS);				\
 	clear_thread_flag(TIF_32BIT_ADDR);				\
+	current->personality &= ~READ_IMPLIES_EXEC;			\
 									\
 	if ((ex).e_ident[EI_CLASS] == ELFCLASS32)			\
 		__SET_PERSONALITY32(ex, state);				\
-- 
2.1.0

