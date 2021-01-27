Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E1D73052FF
	for <lists+linux-mips@lfdr.de>; Wed, 27 Jan 2021 07:16:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233000AbhA0GOs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 Jan 2021 01:14:48 -0500
Received: from mail.loongson.cn ([114.242.206.163]:57612 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235420AbhA0DQ7 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 26 Jan 2021 22:16:59 -0500
Received: from localhost.localdomain (unknown [112.3.197.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxdbwB0hBgpJENAA--.18006S2;
        Wed, 27 Jan 2021 10:37:54 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@gmail.com>, siyanteng01@gmail.com,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-mips@vger.kernel.org, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v3 1/2] MIPS: loongson2ef: remove function __uncached_access()
Date:   Wed, 27 Jan 2021 10:38:05 +0800
Message-Id: <20210127023806.3753812-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxdbwB0hBgpJENAA--.18006S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKw1xuw4rJw18Kr17Zr17GFg_yoWfurX_XF
        W2yw18CrsayF1fKa47Wr1rGay2q34qqFnxuF1kArs3Jas0yF4fJFWUXryfWrn8Xr1a9F4f
        Gw48Gr17Cw47tjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbzkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
        Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
        1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
        6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
        0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxAIw28IcxkI7VAK
        I48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7
        xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xII
        jxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw2
        0EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF
        7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU0xZFpf9x0JUdHUDUUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

we no longer need the MESA workaround (which shouldn't be there in
the first place, IMHO)

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 arch/mips/loongson2ef/common/mem.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/mips/loongson2ef/common/mem.c b/arch/mips/loongson2ef/common/mem.c
index 057d58bb470e..fceb3ee47eb0 100644
--- a/arch/mips/loongson2ef/common/mem.c
+++ b/arch/mips/loongson2ef/common/mem.c
@@ -41,14 +41,3 @@ void __init prom_init_memory(void)
 		memblock_add(LOONGSON_HIGHMEM_START, highmemsize << 20);
 #endif /* !CONFIG_64BIT */
 }
-
-/* override of arch/mips/mm/cache.c: __uncached_access */
-int __uncached_access(struct file *file, unsigned long addr)
-{
-	if (file->f_flags & O_DSYNC)
-		return 1;
-
-	return addr >= __pa(high_memory) ||
-		((addr >= LOONGSON_MMIO_MEM_START) &&
-		 (addr < LOONGSON_MMIO_MEM_END));
-}
-- 
2.27.0

