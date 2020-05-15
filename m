Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FEFB1D4403
	for <lists+linux-mips@lfdr.de>; Fri, 15 May 2020 05:23:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727847AbgEODXL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 14 May 2020 23:23:11 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46354 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727117AbgEODXL (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 14 May 2020 23:23:11 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx32gaC75ehPA0AA--.47S3;
        Fri, 15 May 2020 11:23:06 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v2 2/2] MIPS: Fix build errors under CONFIG_HAVE_STD_PC_SERIAL_PORT
Date:   Fri, 15 May 2020 11:23:05 +0800
Message-Id: <1589512985-27419-2-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1589512985-27419-1-git-send-email-yangtiezhu@loongson.cn>
References: <1589512985-27419-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx32gaC75ehPA0AA--.47S3
X-Coremail-Antispam: 1UD129KBjvJXoW7KryUGryUWr4UKw4kAr1DZFb_yoW8uF18pr
        yDC3WkGr4j9r4Dta9Fy34v9rWUZw15W3yjvasrCws7Aas0qryDAFs7XFn0vryIgrWjk3WY
        gF12qr429w4kZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUBv14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
        x26xkF7I0E14v26r1I6r4UM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
        Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
        8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Cr1j6rxd
        M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
        v20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
        F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8GwCF04
        k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18
        MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr4
        1lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l
        IxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r4j6F4UMIIF0xvEx4
        A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUY-eOUUUUU=
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When CONFIG_HAVE_STD_PC_SERIAL_PORT is set, include linux/module.h to fix
the following build errors:

  CC      arch/mips/kernel/8250-platform.o
arch/mips/kernel/8250-platform.c:42:1: error: data definition has no type or storage class [-Werror]
 module_init(uart8250_init);
 ^
arch/mips/kernel/8250-platform.c:42:1: error: type defaults to ‘int’ in declaration of ‘module_init’ [-Werror=implicit-int]
arch/mips/kernel/8250-platform.c:42:1: error: parameter names (without types) in function declaration [-Werror]
arch/mips/kernel/8250-platform.c:44:15: error: expected declaration specifiers or ‘...’ before string constant
 MODULE_AUTHOR("Ralf Baechle <ralf@linux-mips.org>");
               ^
arch/mips/kernel/8250-platform.c:45:16: error: expected declaration specifiers or ‘...’ before string constant
 MODULE_LICENSE("GPL");
                ^
arch/mips/kernel/8250-platform.c:46:20: error: expected declaration specifiers or ‘...’ before string constant
 MODULE_DESCRIPTION("Generic 8250 UART probe driver");
                    ^
arch/mips/kernel/8250-platform.c:37:81: error: ‘uart8250_init’ defined but not used [-Werror=unused-function]
 static int __init uart8250_init(void)
                                                                                 ^
cc1: all warnings being treated as errors
scripts/Makefile.build:267: recipe for target 'arch/mips/kernel/8250-platform.o' failed
make[2]: *** [arch/mips/kernel/8250-platform.o] Error 1

Fixes: 848484e2c412 ("mips: remove needless include of module.h from core kernel files.")
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---

v2:
  - No changes

 arch/mips/kernel/8250-platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/kernel/8250-platform.c b/arch/mips/kernel/8250-platform.c
index 5c6b2ab..cbf3fe2 100644
--- a/arch/mips/kernel/8250-platform.c
+++ b/arch/mips/kernel/8250-platform.c
@@ -5,6 +5,7 @@
  *
  * Copyright (C) 2007 Ralf Baechle (ralf@linux-mips.org)
  */
+#include <linux/module.h>
 #include <linux/init.h>
 #include <linux/serial_8250.h>
 
-- 
2.1.0

