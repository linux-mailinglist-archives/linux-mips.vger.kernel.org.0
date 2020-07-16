Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DC65221F5A
	for <lists+linux-mips@lfdr.de>; Thu, 16 Jul 2020 11:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728470AbgGPJD3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Jul 2020 05:03:29 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:7767 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726440AbgGPJD2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Jul 2020 05:03:28 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id A775DAD475FB705B7DF6;
        Thu, 16 Jul 2020 17:03:27 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Thu, 16 Jul 2020 17:03:25 +0800
From:   Qinglang Miao <miaoqinglang@huawei.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        John Crispin <john@phrozen.org>
CC:     <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] mips: Convert to DEFINE_SHOW_ATTRIBUTE
Date:   Thu, 16 Jul 2020 17:07:21 +0800
Message-ID: <20200716090721.14436-1-miaoqinglang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Chen Huang <chenhuang5@huawei.com>

Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.

Signed-off-by: Chen Huang <chenhuang5@huawei.com>
---
 arch/mips/cavium-octeon/oct_ilm.c | 16 +++-------------
 arch/mips/kernel/segment.c        | 14 ++------------
 arch/mips/ralink/bootrom.c        | 14 ++------------
 3 files changed, 7 insertions(+), 37 deletions(-)

diff --git a/arch/mips/cavium-octeon/oct_ilm.c b/arch/mips/cavium-octeon/oct_ilm.c
index 4d91cb8da..10ed6ebdb 100644
--- a/arch/mips/cavium-octeon/oct_ilm.c
+++ b/arch/mips/cavium-octeon/oct_ilm.c
@@ -28,7 +28,7 @@ struct latency_info {
 static struct latency_info li;
 static struct dentry *dir;
 
-static int show_latency(struct seq_file *m, void *v)
+static int oct_ilm_show(struct seq_file *m, void *v)
 {
 	u64 cpuclk, avg, max, min;
 	struct latency_info curr_li = li;
@@ -44,17 +44,7 @@ static int show_latency(struct seq_file *m, void *v)
 	return 0;
 }
 
-static int oct_ilm_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, show_latency, NULL);
-}
-
-static const struct file_operations oct_ilm_ops = {
-	.open = oct_ilm_open,
-	.read_iter = seq_read_iter,
-	.llseek = seq_lseek,
-	.release = single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(oct_ilm);
 
 static int reset_statistics(void *data, u64 value)
 {
@@ -67,7 +57,7 @@ DEFINE_SIMPLE_ATTRIBUTE(reset_statistics_ops, NULL, reset_statistics, "%llu\n");
 static void init_debugfs(void)
 {
 	dir = debugfs_create_dir("oct_ilm", 0);
-	debugfs_create_file("statistics", 0222, dir, NULL, &oct_ilm_ops);
+	debugfs_create_file("statistics", 0222, dir, NULL, &oct_ilm_fops);
 	debugfs_create_file("reset", 0222, dir, NULL, &reset_statistics_ops);
 }
 
diff --git a/arch/mips/kernel/segment.c b/arch/mips/kernel/segment.c
index 9ea0c2e79..778487bf3 100644
--- a/arch/mips/kernel/segment.c
+++ b/arch/mips/kernel/segment.c
@@ -46,7 +46,7 @@ static void build_segment_config(char *str, unsigned int cfg)
 		((cfg & MIPS_SEGCFG_EU) >> MIPS_SEGCFG_EU_SHIFT));
 }
 
-static int show_segments(struct seq_file *m, void *v)
+static int segments_show(struct seq_file *m, void *v)
 {
 	unsigned int segcfg;
 	char str[42];
@@ -81,17 +81,7 @@ static int show_segments(struct seq_file *m, void *v)
 	return 0;
 }
 
-static int segments_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, show_segments, NULL);
-}
-
-static const struct file_operations segments_fops = {
-	.open		= segments_open,
-	.read_iter		= seq_read_iter,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(segments);
 
 static int __init segments_info(void)
 {
diff --git a/arch/mips/ralink/bootrom.c b/arch/mips/ralink/bootrom.c
index bc83a355f..c57fd38fd 100644
--- a/arch/mips/ralink/bootrom.c
+++ b/arch/mips/ralink/bootrom.c
@@ -19,21 +19,11 @@ static int bootrom_show(struct seq_file *s, void *unused)
 	return 0;
 }
 
-static int bootrom_open(struct inode *inode, struct file *file)
-{
-	return single_open(file, bootrom_show, NULL);
-}
-
-static const struct file_operations bootrom_file_ops = {
-	.open		= bootrom_open,
-	.read_iter		= seq_read_iter,
-	.llseek		= seq_lseek,
-	.release	= single_release,
-};
+DEFINE_SHOW_ATTRIBUTE(bootrom);
 
 static int __init bootrom_setup(void)
 {
-	debugfs_create_file("bootrom", 0444, NULL, NULL, &bootrom_file_ops);
+	debugfs_create_file("bootrom", 0444, NULL, NULL, &bootrom_fops);
 	return 0;
 }
 
-- 
2.17.1

