Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CEA535D57F
	for <lists+linux-mips@lfdr.de>; Tue, 13 Apr 2021 04:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241225AbhDMC57 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Apr 2021 22:57:59 -0400
Received: from mail.loongson.cn ([114.242.206.163]:33852 "EHLO loongson.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237380AbhDMC57 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Apr 2021 22:57:59 -0400
Received: from linux.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx78ucCHVgX2IHAA--.14150S2;
        Tue, 13 Apr 2021 10:57:33 +0800 (CST)
From:   Tiezhu Yang <yangtiezhu@loongson.cn>
To:     Jessica Yu <jeyu@kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH RFC] module: Use ARG_MAX as second argument of strndup_user() in load_module()
Date:   Tue, 13 Apr 2021 10:57:31 +0800
Message-Id: <1618282651-14507-1-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
X-CM-TRANSID: AQAAf9Dx78ucCHVgX2IHAA--.14150S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuF15GFWrZFy3WrWDKF17Jrb_yoW5Ww1xpa
        y3Cr95GFs8Wr4rCayIyry09Fyrur45Gr4ag3Z8Cwn5ZFn0vF48AFZa93ZI9FyxGrW8GFy8
        Kryrtr15uF4jkw7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUkl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
        rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
        1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
        6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
        4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r
        1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_
        Gr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
        WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI
        7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
        1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4U
        MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUb1rW7UUUU
        U==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

When update kernel with the latest mips-next, we can not login through a
graphical interface, this is because drm radeon GPU driver does not work,
we can not see the boot message "[drm] radeon kernel modesetting enabled."
through the serial console.

drivers/gpu/drm/radeon/radeon_drv.c
static int __init radeon_module_init(void)
{
	[...]
	DRM_INFO("radeon kernel modesetting enabled.\n");
	[...]
}

I use git bisect to find out the commit 04324f44cb69 ("MIPS: Remove
get_fs/set_fs") is the first bad commit.

I analysis and test the changes in the above first bad commit and then
find out the following obvious difference which leads to the login issue.

arch/mips/include/asm/uaccess.h
static inline long strnlen_user(const char __user *s, long n)
{
	[...]
	if (!access_ok(s, n))
		return -0;
	[...]
}

I use dump_stack() to find out the following call trace:
load_module()
	strndup_user()
		strnlen_user()

load_module() failed in the following error path, we can see that the
second argument of strndup_user() is very big.

static int load_module(struct load_info *info, const char __user *uargs,
		       int flags)
{
	[...]
	mod->args = strndup_user(uargs, ~0UL >> 1);
	if (IS_ERR(mod->args)) {
		err = PTR_ERR(mod->args);
		goto free_arch_cleanup;
	}
	[...]
}

As discussed earlier [1], it seems that just modify the exception check
condition in strnlen_user() to fix load_module() failure, like this:

diff --git a/arch/mips/include/asm/uaccess.h b/arch/mips/include/asm/uaccess.h
index 9e9e3aa..f4fb8ca 100644
--- a/arch/mips/include/asm/uaccess.h
+++ b/arch/mips/include/asm/uaccess.h
@@ -612,8 +612,8 @@ static inline long strnlen_user(const char __user *s, long n)
 {
 	long res;

-	if (!access_ok(s, n))
-		return -0;
+	if (!access_ok(s, 1))
+		return 0;

 	might_fault();
 	__asm__ __volatile__(

At the other hand, I search strndup_user() in the kernel tree, the second
argument of them are almost a macro or a fixed value which is relatively
small, such as PAGE_SIZE, PATH_MAX. So I think maybe we can use ARG_MAX as
second argument of strndup_user() in load_module().

With this patch, the load_module() failure disappered and we can login
normally through a graphical interface.

[1] https://lore.kernel.org/patchwork/patch/1411214/

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 kernel/module.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/module.c b/kernel/module.c
index 3047935..30d320b 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -3998,7 +3998,7 @@ static int load_module(struct load_info *info, const char __user *uargs,
 	flush_module_icache(mod);
 
 	/* Now copy in args */
-	mod->args = strndup_user(uargs, ~0UL >> 1);
+	mod->args = strndup_user(uargs, ARG_MAX);
 	if (IS_ERR(mod->args)) {
 		err = PTR_ERR(mod->args);
 		goto free_arch_cleanup;
-- 
2.1.0

