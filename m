Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36489339B90
	for <lists+linux-mips@lfdr.de>; Sat, 13 Mar 2021 04:37:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233129AbhCMDeG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 12 Mar 2021 22:34:06 -0500
Received: from mail-m17635.qiye.163.com ([59.111.176.35]:38060 "EHLO
        mail-m17635.qiye.163.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233156AbhCMDdz (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 12 Mar 2021 22:33:55 -0500
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.231])
        by mail-m17635.qiye.163.com (Hmail) with ESMTPA id ABBB440012F;
        Sat, 13 Mar 2021 11:33:53 +0800 (CST)
From:   Wang Qing <wangqing@vivo.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Wang Qing <wangqing@vivo.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] mips: kernel: use DEFINE_DEBUGFS_ATTRIBUTE with debugfs_create_file_unsafe()
Date:   Sat, 13 Mar 2021 11:33:48 +0800
Message-Id: <1615606429-2568-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
        oVCBIfWUFZGBgZQktNQh8aGEoYVkpNSk5NS01PSEhCSkhVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
        FZT0tIVUpKS0hNSlVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PSI6Cyo5Mz8LPVEBEREhLi05
        Lk8aCxdVSlVKTUpOTUtNT0hPSU9LVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
        SU5KVUxPVUlISllXWQgBWUFJSk5KNwY+
X-HM-Tid: 0a7829a5c826d991kuwsabbb440012f
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

debugfs_create_file_unsafe does not protect the fops handed to it
against file removal. DEFINE_DEBUGFS_ATTRIBUTE makes the fops aware of
the file lifetime and thus protects it against removal.

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 arch/mips/kernel/spinlock_test.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/mips/kernel/spinlock_test.c b/arch/mips/kernel/spinlock_test.c
index ab4e3e1..90f53e0
--- a/arch/mips/kernel/spinlock_test.c
+++ b/arch/mips/kernel/spinlock_test.c
@@ -35,7 +35,7 @@ static int ss_get(void *data, u64 *val)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(fops_ss, ss_get, NULL, "%llu\n");
+DEFINE_DEBUGFS_ATTRIBUTE(fops_ss, ss_get, NULL, "%llu\n");
 
 
 
@@ -114,13 +114,13 @@ static int multi_get(void *data, u64 *val)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(fops_multi, multi_get, NULL, "%llu\n");
+DEFINE_DEBUGFS_ATTRIBUTE(fops_multi, multi_get, NULL, "%llu\n");
 
 static int __init spinlock_test(void)
 {
-	debugfs_create_file("spin_single", S_IRUGO, mips_debugfs_dir, NULL,
+	debugfs_create_file_unsafe("spin_single", S_IRUGO, mips_debugfs_dir, NULL,
 			    &fops_ss);
-	debugfs_create_file("spin_multi", S_IRUGO, mips_debugfs_dir, NULL,
+	debugfs_create_file_unsafe("spin_multi", S_IRUGO, mips_debugfs_dir, NULL,
 			    &fops_multi);
 	return 0;
 }
-- 
2.7.4

