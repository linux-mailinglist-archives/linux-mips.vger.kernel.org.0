Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9320730304B
	for <lists+linux-mips@lfdr.de>; Tue, 26 Jan 2021 00:36:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732862AbhAYXgZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 Jan 2021 18:36:25 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:31536 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732861AbhAYXgW (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 25 Jan 2021 18:36:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611617781; x=1643153781;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=rPCotImD7rAjKRPI/PLmqgAnxhIjMj15dDdEMuR2BcE=;
  b=fNP8F1yTXKvKVVHZIpPIzhZPYOJ6+XitdUWa/HKQ0sxSro/HY7s4TiFd
   YK56LCGC9BNWZhcW+9NRtxVOin+AamcIzFZrW/L4MOYfJ2fRsLl/11F0u
   QucOEdNqMNTX04q+EQ4hVK5VfXJGe5hv1+Tu5sqngBhScmSz5lnLLLwou
   Hl1OqHRZL1Fe1nt+FDs9qdfMgxoROcoYoZ43QFX2D387GMQxm/tNZzrNo
   eOB9y5fItEvwpkiMUWu4QymWawHEsLDQ8U0fPjT6odx3Tjn2BdgKfvtzO
   LKadT17jzaZfArSFqZrLmVG9makTeRIsOMjBG7kt8kf5hgs0VE4ZbmzIj
   A==;
IronPort-SDR: YyfHHqqaWuZ+LYwmH3evzKfAkinYRv5Y+1ZDkQB7tXIkEkYs6PEfJvz6aXvsWRPbPYwK6LpuAI
 0vqiKsluAvsbSaxud4mSaSVy2aNto00m1xeOLPrj+xQUS07M2/27Le6b17j+/EY3KBfoA21ToE
 2NnyOFV85CfI3R7JShkhnwlrLpr2rG4XwQoBSEmVyHPw5xCO0tz8DUlzf4VfSmBEshCPfkQ2OQ
 Y05Mi8FgJ1QXM6v7tmCwZbeGMdvBp+/BPhM1BtnX5wyhSZRgFepAvGiC+fOkE0x4XJIqK5XUF9
 UIs=
X-IronPort-AV: E=Sophos;i="5.79,374,1602518400"; 
   d="scan'208";a="162741784"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 26 Jan 2021 07:33:27 +0800
IronPort-SDR: VQHJcwFx0m81jq4TVR3Co/BVXy5aHrEiOCyudHd4BS2vpV7U7WwVGD1zD544lUD52zCSKNsdsw
 KAFYJnQ6Lk0YYCkzZJzL7tIViptbZuFzRKRCIKyOPNrYib6DGbjf2WP64T8fxNYDeIC1FjR3kU
 uOaiW1TfxFQeoPSavCVCDWq3mG3cxIyvwGQTYaeELiu4FvLYglwPLZUL+yjQimOH72eRgI1Coi
 1ecj6BkkGAFcEZ3zVXkb89F6jldGls5Myuo9f+oRYfndWn02EhFZBD2p/cIHNaW0Z1vuqk7/My
 81XyiS4+DaPW7RRPFahypyko
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 15:17:54 -0800
IronPort-SDR: gnYazxzyuD7vJI6y65OiQIEOjAoLuxQ7OSOHI8h1EhhMdNXKTyY1kifTRpadVCOKuiSIFW6GG1
 3JFv6cXLZmoGz49u5uYuVG8v+7lD9D7HeAKh6Zpv5m6oBDvL4CHG0mB1KFvGK38pOqvOBEh19j
 wfyEPjJp9DR5ASAKh+DC//7ZVGJgcGDvkjo0RkQsJ9rR7WPZ6XScyLAfD493astmQLYKPJzOrN
 cacd5jF2e0JykNBRFhjD8b09rx8dFpEF5XPSu9ZcSfMhmC58KhO8YPlDF7CR+G/dx9ZWIymwlv
 sYs=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
  by uls-op-cesaip02.wdc.com with ESMTP; 25 Jan 2021 15:33:27 -0800
From:   Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, axboe@kernel.dk,
        linux-block@vger.kernel.org, cand@gmx.com,
        Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Subject: [PATCH 8/9] n64: cleanup n64cart_probe()
Date:   Mon, 25 Jan 2021 15:32:42 -0800
Message-Id: <20210125233243.5982-9-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210125233243.5982-1-chaitanya.kulkarni@wdc.com>
References: <20210125233243.5982-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The goto label fail_queue is needed to cleanup the queue allocation
when devm_platform_ioremap_resource() or alloc_disk() fails, either of
these two functions are not dependent on the queue variable which is
allocated prior to these calls.

Allocate the queue variable after successful alloc_disk(). Return
error directly when devm_platform_ioremap_resource() or alloc_disk()
fail. Remove fail_queue label and a call to the blk_cleanup_queue().

Direct return from these two functions allows us to remove the local
variable err and allocating queue after alloc_disk() allows us to
remove the local variable queue so we use disk->queue directly.

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Reviewed-by: Lauri Kasanen <cand@gmx.com>
---
 drivers/block/n64cart.c | 33 +++++++++++----------------------
 1 file changed, 11 insertions(+), 22 deletions(-)

diff --git a/drivers/block/n64cart.c b/drivers/block/n64cart.c
index 3bfb010402e3..43482d158640 100644
--- a/drivers/block/n64cart.c
+++ b/drivers/block/n64cart.c
@@ -116,9 +116,7 @@ static const struct block_device_operations n64cart_fops = {
  */
 static int __init n64cart_probe(struct platform_device *pdev)
 {
-	int err;
 	struct gendisk *disk;
-	struct request_queue *queue;
 
 	if (!start || !size) {
 		pr_err("start or size not specified\n");
@@ -130,26 +128,21 @@ static int __init n64cart_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	queue = blk_alloc_queue(NUMA_NO_NODE);
-	if (!queue)
-		return -ENOMEM;
-
 	reg_base = devm_platform_ioremap_resource(pdev, 0);
-	if (!reg_base) {
-		err = -EINVAL;
-		goto fail_queue;
-	}
+	if (!reg_base)
+		return -EINVAL;
 
 	disk = alloc_disk(0);
-	if (!disk) {
-		err = -ENOMEM;
-		goto fail_queue;
-	}
+	if (!disk)
+		return -ENOMEM;
+
+	disk->queue = blk_alloc_queue(NUMA_NO_NODE);
+	if (!disk->queue)
+		return -ENOMEM;
 
 	dev = &pdev->dev;
 
 	disk->first_minor = 0;
-	disk->queue = queue;
 	disk->flags = GENHD_FL_NO_PART_SCAN | GENHD_FL_EXT_DEVT;
 	disk->fops = &n64cart_fops;
 	strcpy(disk->disk_name, "n64cart");
@@ -157,19 +150,15 @@ static int __init n64cart_probe(struct platform_device *pdev)
 	set_capacity(disk, size >> SECTOR_SHIFT);
 	set_disk_ro(disk, 1);
 
-	blk_queue_flag_set(QUEUE_FLAG_NONROT, queue);
-	blk_queue_physical_block_size(queue, 4096);
-	blk_queue_logical_block_size(queue, 4096);
+	blk_queue_flag_set(QUEUE_FLAG_NONROT, disk->queue);
+	blk_queue_physical_block_size(disk->queue, 4096);
+	blk_queue_logical_block_size(disk->queue, 4096);
 
 	add_disk(disk);
 
 	pr_info("n64cart: %u kb disk\n", size / 1024);
 
 	return 0;
-fail_queue:
-	blk_cleanup_queue(queue);
-
-	return err;
 }
 
 static struct platform_driver n64cart_driver = {
-- 
2.22.1

