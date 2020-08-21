Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6529324CF3E
	for <lists+linux-mips@lfdr.de>; Fri, 21 Aug 2020 09:23:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727956AbgHUHX5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Aug 2020 03:23:57 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46528 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726548AbgHUHX4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 21 Aug 2020 03:23:56 -0400
Received: from localhost.localdomain (unknown [222.209.8.90])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP997dj9fGgoMAA--.14754S2;
        Fri, 21 Aug 2020 15:23:47 +0800 (CST)
From:   Huang Pei <huangpei@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        ambrosehua@gmail.com
Cc:     Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Fuxin Zhang <zhangfx@lemote.com>,
        Huacai Chen <chenhc@lemote.com>, linux-mips@vger.kernel.org
Subject: [PATCH 1/3] MIPS: add missing MSACSR and upper MSA initialization
Date:   Fri, 21 Aug 2020 15:23:27 +0800
Message-Id: <20200821072329.18006-1-huangpei@loongson.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: AQAAf9DxP997dj9fGgoMAA--.14754S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtw15uw4kJry5GF4DuF1UAwb_yoWfJFbEkr
        1xAw1kKr15Zw1qq39F9395WFyFqws8WF4fu3Z7KFZ0ka98Gr4rAr4Duas0qrn3WrsYkrsa
        vr9xCr1vkanrKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbzxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
        Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
        Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
        I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
        4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxG
        rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
        vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
        x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
        xKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x02
        67AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbXdbUUUUUU==
X-CM-SenderInfo: xkxd0whshlqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

own_fp_inatomic() does not restore/initialize MSACSR and upper MSA regs, so
MSACSR and MSA upper regs's value from previous task on current cpu can leak
into current task and cause unpredictable behavior when MSA context not
initialized.

Signed-off-by: Huang Pei <huangpei@loongson.cn>
---
 arch/mips/kernel/traps.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/kernel/traps.c b/arch/mips/kernel/traps.c
index 38aa07ccdbcc..99a8f1b7b522 100644
--- a/arch/mips/kernel/traps.c
+++ b/arch/mips/kernel/traps.c
@@ -1287,6 +1287,8 @@ static int enable_restore_fp_context(int msa)
 		err = own_fpu_inatomic(1);
 		if (msa && !err) {
 			enable_msa();
+			write_msa_csr(current->thread.fpu.msacsr);
+			init_msa_upper();
 			set_thread_flag(TIF_USEDMSA);
 			set_thread_flag(TIF_MSA_CTX_LIVE);
 		}
-- 
2.17.1

