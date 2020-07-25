Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 676CA22D548
	for <lists+linux-mips@lfdr.de>; Sat, 25 Jul 2020 07:56:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725941AbgGYF4n (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 25 Jul 2020 01:56:43 -0400
Received: from mail.loongson.cn ([114.242.206.163]:42128 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725825AbgGYF4n (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 25 Jul 2020 01:56:43 -0400
Received: from localhost.cn (unknown [10.10.132.142])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxv9+WyRtfI24AAA--.495S2;
        Sat, 25 Jul 2020 13:56:38 +0800 (CST)
From:   Jinyang He <hejinyang@loongson.cn>
To:     linux-mips@vger.kernel.org
Cc:     Jinyang He <hejinyang@loongson.cn>
Subject: [PATCH] MIPS: Fix unable to reserve memory for Crash kernel
Date:   Sat, 25 Jul 2020 13:56:38 +0800
Message-Id: <1595656598-10859-1-git-send-email-hejinyang@loongson.cn>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxv9+WyRtfI24AAA--.495S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw1fAr17try7tw13Ww1fXrb_yoW8uFWrp3
        4UZw1UKw4kWF4DAa95Aay3uryftwnYka48XFyqqrZYyasYqwnrCr4Yqr1YvF9rtr18Kr17
        XFnFgwnF9wnYyaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkI14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
        6r4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJV
        WxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK6svPMxAI
        w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
        4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUXVWUAwCIc40Y0x0EwIxG
        rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8Jw
        CI42IY6xAIw20EY4v20xvaj40_Zr0_Wr1UMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvE
        x4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUb3rc3UUUUU==
X-CM-SenderInfo: pkhmx0p1dqwqxorr0wxvrqhubq/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use 0 as the align parameter in memblock_find_in_range() is
incorrect when we reserve memory for Crash kernel.

The environment as follows:
[    0.000000] MIPS: machine is loongson,loongson64c-4core-rs780e
...
[    1.951016]     crashkernel=64M@128M

The warning as follows:
[    0.000000] Invalid memory region reserved for crash kernel

And the iomem as follows:
00200000-0effffff : System RAM
  04000000-0484009f : Kernel code
  048400a0-04ad7fff : Kernel data
  04b40000-05c4c6bf : Kernel bss
1a000000-1bffffff : pci@1a000000
...

The align parameter may be finally used by round_down() or round_up().
Like the following call tree:

mips-next: mm/memblock.c

memblock_find_in_range
└── memblock_find_in_range_node
    ├── __memblock_find_range_bottom_up
    │   └── round_up
    └── __memblock_find_range_top_down
        └── round_down
\#define round_up(x, y) ((((x)-1) | __round_mask(x, y))+1)
\#define round_down(x, y) ((x) & ~__round_mask(x, y))
\#define __round_mask(x, y) ((__typeof__(x))((y)-1))

The round_down(or round_up)'s second parameter must be a power of 2.
If the second parameter is 0, it both will return 0.

Use 1 as the parameter to fix the bug and the iomem as follows:
00200000-0effffff : System RAM
  04000000-0484009f : Kernel code
  048400a0-04ad7fff : Kernel data
  04b40000-05c4c6bf : Kernel bss
  08000000-0bffffff : Crash kernel
1a000000-1bffffff : pci@1a000000
...

Signed-off-by: Jinyang He <hejinyang@loongson.cn>
---
 arch/mips/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 7b537fa..588b212 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -497,7 +497,7 @@ static void __init mips_parse_crashkernel(void)
 	if (ret != 0 || crash_size <= 0)
 		return;
 
-	if (!memblock_find_in_range(crash_base, crash_base + crash_size, crash_size, 0)) {
+	if (!memblock_find_in_range(crash_base, crash_base + crash_size, crash_size, 1)) {
 		pr_warn("Invalid memory region reserved for crash kernel\n");
 		return;
 	}
-- 
2.1.0

