Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C192301378
	for <lists+linux-mips@lfdr.de>; Sat, 23 Jan 2021 07:00:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725766AbhAWGAO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 23 Jan 2021 01:00:14 -0500
Received: from mail.loongson.cn ([114.242.206.163]:35300 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725298AbhAWGAN (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 23 Jan 2021 01:00:13 -0500
Received: from localhost.localdomain (unknown [112.3.197.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxlbwuuwtgiekJAA--.12805S2;
        Sat, 23 Jan 2021 13:59:12 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@gmail.com>, siyanteng01@gmail.com,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-mips@vger.kernel.org, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH] MIPS: mm: remove function __uncached_access()
Date:   Sat, 23 Jan 2021 13:59:26 +0800
Message-Id: <20210123055926.4137197-1-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxlbwuuwtgiekJAA--.12805S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uF4UAFW3AFWrXw1ftryxKrg_yoW8Cw1kp3
        93Aa48GFW09w17Xw47A3yUZan3Z3s5t342vFW7C3409wnIv3W7Wr1fJFy5urZ8Xry7Zayx
        Zr48JryUZF4rAw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUyC14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
        6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr
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

Remove unnecessary functions.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 arch/mips/loongson2ef/common/mem.c | 11 -----------
 arch/mips/mm/cache.c               |  8 --------
 drivers/char/mem.c                 |  7 -------
 3 files changed, 26 deletions(-)

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
diff --git a/arch/mips/mm/cache.c b/arch/mips/mm/cache.c
index 23b16bfd97b2..9cfd432d99f6 100644
--- a/arch/mips/mm/cache.c
+++ b/arch/mips/mm/cache.c
@@ -207,11 +207,3 @@ void cpu_cache_init(void)
 
 	setup_protection_map();
 }
-
-int __weak __uncached_access(struct file *file, unsigned long addr)
-{
-	if (file->f_flags & O_DSYNC)
-		return 1;
-
-	return addr >= __pa(high_memory);
-}
diff --git a/drivers/char/mem.c b/drivers/char/mem.c
index 43c871dc7477..869b9f5e8e03 100644
--- a/drivers/char/mem.c
+++ b/drivers/char/mem.c
@@ -291,13 +291,6 @@ static int uncached_access(struct file *file, phys_addr_t addr)
 	 * attribute aliases.
 	 */
 	return !(efi_mem_attributes(addr) & EFI_MEMORY_WB);
-#elif defined(CONFIG_MIPS)
-	{
-		extern int __uncached_access(struct file *file,
-					     unsigned long addr);
-
-		return __uncached_access(file, addr);
-	}
 #else
 	/*
 	 * Accessing memory above the top the kernel knows about or through a
-- 
2.27.0

