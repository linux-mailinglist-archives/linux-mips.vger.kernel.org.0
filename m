Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD61C3052FE
	for <lists+linux-mips@lfdr.de>; Wed, 27 Jan 2021 07:16:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232904AbhA0GOp (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 Jan 2021 01:14:45 -0500
Received: from mail.loongson.cn ([114.242.206.163]:57610 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235421AbhA0DQ7 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 26 Jan 2021 22:16:59 -0500
Received: from localhost.localdomain (unknown [112.3.197.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxdbwB0hBgpJENAA--.18006S3;
        Wed, 27 Jan 2021 10:37:55 +0800 (CST)
From:   Yanteng Si <siyanteng@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Huacai Chen <chenhuacai@gmail.com>, siyanteng01@gmail.com,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-mips@vger.kernel.org, Yanteng Si <siyanteng@loongson.cn>
Subject: [PATCH v3 2/2] MIPS: mm:remove function __uncached_access()
Date:   Wed, 27 Jan 2021 10:38:06 +0800
Message-Id: <20210127023806.3753812-2-siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210127023806.3753812-1-siyanteng@loongson.cn>
References: <20210127023806.3753812-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxdbwB0hBgpJENAA--.18006S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Gw47Xry8Jry3XF47GF4kWFg_yoW8Jr1Upa
        93A348GFW09w1UXF47A3yUZa1rZasFqa42gay2k348u3Z8Z3W3Xr1rJFy5urZ0qr9a9a17
        Zw1rAryUZF4UAw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUU9C14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
        A2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0
        owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
        IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
        M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCF04k20xvY0x0EwIxGrw
        CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
        14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
        IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxK
        x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
        0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUqAp5UUUUU=
X-CM-SenderInfo: pvl1t0pwhqwqxorr0wxvrqhubq/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

MIPS can now use the default uncached_access like other archs.

Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
---
 arch/mips/mm/cache.c | 8 --------
 drivers/char/mem.c   | 7 -------
 2 files changed, 15 deletions(-)

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

