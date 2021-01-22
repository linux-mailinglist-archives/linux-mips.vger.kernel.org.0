Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C48F33001E0
	for <lists+linux-mips@lfdr.de>; Fri, 22 Jan 2021 12:46:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727396AbhAVLpw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Jan 2021 06:45:52 -0500
Received: from mx2.suse.de ([195.135.220.15]:33734 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727200AbhAVLpl (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 22 Jan 2021 06:45:41 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id B81C4AB9F;
        Fri, 22 Jan 2021 11:44:52 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: vpe: Remove vpe_getcwd
Date:   Fri, 22 Jan 2021 12:44:49 +0100
Message-Id: <20210122114449.19423-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

I couldn't find any user of the dubious vpe_getcwd so far. So remove it and
get rid of another set_fs(KERNEL_DS).

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 arch/mips/include/asm/vpe.h |  3 ---
 arch/mips/kernel/vpe.c      | 33 ---------------------------------
 2 files changed, 36 deletions(-)

diff --git a/arch/mips/include/asm/vpe.h b/arch/mips/include/asm/vpe.h
index 80e70dbd1f64..baa949a744cb 100644
--- a/arch/mips/include/asm/vpe.h
+++ b/arch/mips/include/asm/vpe.h
@@ -26,7 +26,6 @@
 #endif
 
 #define MAX_VPES 16
-#define VPE_PATH_MAX 256
 
 static inline int aprp_cpu_index(void)
 {
@@ -62,7 +61,6 @@ struct vpe {
 	unsigned long len;
 	char *pbuffer;
 	unsigned long plen;
-	char cwd[VPE_PATH_MAX];
 
 	unsigned long __start;
 
@@ -111,7 +109,6 @@ extern const struct file_operations vpe_fops;
 int vpe_notify(int index, struct vpe_notifications *notify);
 
 void *vpe_get_shared(int index);
-char *vpe_getcwd(int index);
 
 struct vpe *get_vpe(int minor);
 struct tc *get_tc(int index);
diff --git a/arch/mips/kernel/vpe.c b/arch/mips/kernel/vpe.c
index d0d832ab3d3b..13294972707b 100644
--- a/arch/mips/kernel/vpe.c
+++ b/arch/mips/kernel/vpe.c
@@ -746,28 +746,12 @@ static int vpe_elfload(struct vpe *v)
 	return 0;
 }
 
-static int getcwd(char *buff, int size)
-{
-	mm_segment_t old_fs;
-	int ret;
-
-	old_fs = get_fs();
-	set_fs(KERNEL_DS);
-
-	ret = sys_getcwd(buff, size);
-
-	set_fs(old_fs);
-
-	return ret;
-}
-
 /* checks VPE is unused and gets ready to load program	*/
 static int vpe_open(struct inode *inode, struct file *filp)
 {
 	enum vpe_state state;
 	struct vpe_notifications *notifier;
 	struct vpe *v;
-	int ret;
 
 	if (VPE_MODULE_MINOR != iminor(inode)) {
 		/* assume only 1 device at the moment. */
@@ -803,12 +787,6 @@ static int vpe_open(struct inode *inode, struct file *filp)
 	v->plen = P_SIZE;
 	v->load_addr = NULL;
 	v->len = 0;
-
-	v->cwd[0] = 0;
-	ret = getcwd(v->cwd, VPE_PATH_MAX);
-	if (ret < 0)
-		pr_warn("VPE loader: open, getcwd returned %d\n", ret);
-
 	v->shared_ptr = NULL;
 	v->__start = 0;
 
@@ -915,17 +893,6 @@ int vpe_notify(int index, struct vpe_notifications *notify)
 }
 EXPORT_SYMBOL(vpe_notify);
 
-char *vpe_getcwd(int index)
-{
-	struct vpe *v = get_vpe(index);
-
-	if (v == NULL)
-		return NULL;
-
-	return v->cwd;
-}
-EXPORT_SYMBOL(vpe_getcwd);
-
 module_init(vpe_module_init);
 module_exit(vpe_module_exit);
 MODULE_DESCRIPTION("MIPS VPE Loader");
-- 
2.29.2

