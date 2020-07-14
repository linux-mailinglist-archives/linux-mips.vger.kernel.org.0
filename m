Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CFB121E7E1
	for <lists+linux-mips@lfdr.de>; Tue, 14 Jul 2020 08:08:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725925AbgGNGIB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 14 Jul 2020 02:08:01 -0400
Received: from mail.loongson.cn ([114.242.206.163]:57060 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725778AbgGNGIB (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 14 Jul 2020 02:08:01 -0400
Received: from localhost.loongson.cn (unknown [10.20.42.122])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx7x+4Sw1fRD8EAA--.5360S2;
        Tue, 14 Jul 2020 14:07:53 +0800 (CST)
From:   Guoyun Sun <sunguoyun@loongson.cn>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tiezhu Yang <yangtiezhu@loongson.cn>,
        Sunguoyun <sunguoyun@loongson.cn>
Subject: [PATCH] MIPS: fix vdso different address spaces
Date:   Tue, 14 Jul 2020 14:07:47 +0800
Message-Id: <1594706867-4426-1-git-send-email-sunguoyun@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dx7x+4Sw1fRD8EAA--.5360S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GFy3ZFW8Cr17AFW3GrW7Arb_yoWDtrc_KF
        9FkwsYgr4rtFn7CF1DW34S9Fyjgw4UWry8ursxurnFg39YqrnrKrZF9F13Jw4xZrsF9393
        Kry7uw1UA34xKjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbzxFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
        6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
        A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
        Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
        0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
        2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
        W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l42xK82IYc2Ij64vI
        r41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8Gjc
        xK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0
        cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8V
        AvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7Cj
        xVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbrMaUUUUUU==
X-CM-SenderInfo: 5vxqw3hr1x0qxorr0wxvrqhubq/
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Sunguoyun <sunguoyun@loongson.cn>

sparse report build warning as follows:
arch/mips/vdso/vdso-n32-image.c:13:35:
incorrect type in assignment (different address spaces) @@
expected void *[usertype] vdso @@     got void [noderef] <asn:1> * @@

Reported-by: kernel test robot <lkp@intel.com>

Signed-off-by: Sunguoyun <sunguoyun@loongson.cn>
---
 arch/mips/vdso/genvdso.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/vdso/genvdso.c b/arch/mips/vdso/genvdso.c
index be57b832bbe0..94f9538bc889 100644
--- a/arch/mips/vdso/genvdso.c
+++ b/arch/mips/vdso/genvdso.c
@@ -260,7 +260,7 @@ int main(int argc, char **argv)
 	fprintf(out_file, "	if (vdso_image.size != new_size)\n");
 	fprintf(out_file, "		return -EINVAL;\n");
 	fprintf(out_file, "	current->mm->context.vdso =\n");
-	fprintf(out_file, "	(void __user *)(new_vma->vm_start);\n");
+	fprintf(out_file, "	(void *)(new_vma->vm_start);\n");
 	fprintf(out_file, "	return 0;\n");
 	fprintf(out_file, "}\n");
 
-- 
2.17.1

