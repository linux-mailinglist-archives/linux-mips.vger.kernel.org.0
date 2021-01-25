Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF066303051
	for <lists+linux-mips@lfdr.de>; Tue, 26 Jan 2021 00:37:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732650AbhAYXgr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 Jan 2021 18:36:47 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:31658 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732878AbhAYXgh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 25 Jan 2021 18:36:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611617796; x=1643153796;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CppnLNFdDfx1rBWN4d8ngNiQ+nl+NvmcK/8f1AWUUzU=;
  b=ZwRBGpcoeNjZofjLya9MkoYQaMqR4a2V7VK4W1SyAye4gpnSPIr8PPSC
   /9kKfDdJI6arTX0WhZa3AxjOC4jDpr8fe1swbGClzsn/gruzxgqeobMa7
   MbDdV6MmqPBNaZucIAcZE30unlsh3UKjooo/XooSSzcdfIoXuBdRWfIBQ
   9UGAQsApJcG5TAoqI7O9f6Jes49M1Yr7K6re+/fIqGu9w7clqzDs1UpCw
   L+LvC5KWrTt+GxiHrz/1V+zB5I+JKbw+3+8Z/zdtWm2iKFFGIayZfseR5
   u7lofw+tFwe5x8XICi/QpyI2YhZj23++g7gQUOPN5ezPbA+2flBH8bBhx
   Q==;
IronPort-SDR: cVvqNKDDJ8GJ4tyOtqxkN3IYm2+vrGQpR/j1OUbeb4bH1IU9NGTKlDpb/qR/T5iPBE55Vqyto9
 xQAbsQ/z9CgJIbesPg8hU33oMNohqrNtLT90AWrkl5IJ7dG2mE9/ctl7HMMLViizF4gbGEnrq5
 tWLtPIX/0Xkh2bMrIE9rZLPBn/tkiStsd7BlkQ9iEQc1rxK4jF04D+t0EptrE3UmQdBn0wXTOE
 KeGXymNE+kOqnCF57qhrcdVWxXfz70I0CZVMuEvlR6BFgBlgeHIBGV5zo1u/a2XlsHw+3+NtBi
 /VA=
X-IronPort-AV: E=Sophos;i="5.79,374,1602518400"; 
   d="scan'208";a="162741787"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 26 Jan 2021 07:33:32 +0800
IronPort-SDR: zUGvYLqzkArXk8NI+57/DPuPlcu+a8U36b7Lkkqa1yOXM20DxcE2xF2/GlLlzCvY6g7NzdCufU
 YpBGQE7lrAaCI5eEt1LdZqZx5hc0I5Louk55JzXyr5ujcWfBUNohRmgU0mPwBDsNOlX2mNJp1p
 rNVc2Rwo9KzVTCuycUFJtE9A6flDKDPLcdYIUoayiz6UjMEd3535a2aM6DSYGJfSdWKTqc4221
 ksaAHhnIjWAA3eT9+tlAHHHFgyILC7rpYqLnmORCEDQZwS1r5SZYFjEfltWbKgz/x63rSUbmJ5
 GbhSJebraviC+4Vulc2aBFg/
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 15:17:59 -0800
IronPort-SDR: xE02mVV0/lnc7WFzb1tdGlLAjo63FILGTAmOCBz1cYBWPXP+HcOiX67J4oOSUhTN9WyIih0CSX
 h/zWzIE5F4XCEclSBCSiAsPx9NWyzOIR7QqRU8cEu09v8/JaGbJUMgQay7XWAHwnG4WlmUtgKx
 cWtVhZdjLlblxUpYNi0nSq+pWmxAlJWzmmE9SrT2bQ05JBKxIyIqYij2JPLoYx1y9rGBWUpsi0
 q4afLyWaX8XaMmGxZpOs1r0pqxZnyR/Z/xyjtT5hmcNeJq9vB6vLViMaIVHO2Grnz/fBhJpQ2u
 v/Q=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
  by uls-op-cesaip02.wdc.com with ESMTP; 25 Jan 2021 15:33:32 -0800
From:   Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, axboe@kernel.dk,
        linux-block@vger.kernel.org, cand@gmx.com,
        Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Subject: [PATCH 9/9] n64: store dev instance into disk private data
Date:   Mon, 25 Jan 2021 15:32:43 -0800
Message-Id: <20210125233243.5982-10-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210125233243.5982-1-chaitanya.kulkarni@wdc.com>
References: <20210125233243.5982-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The device instance is declared globally. Remove global variable & use
the disk->private_data to store the device instance in the
n64cart_probe() and get the same instance from bio->bi_disk->private
data in n64cart_submit_bio.

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Reviewed-by: Lauri Kasanen <cand@gmx.com>
---
 drivers/block/n64cart.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/block/n64cart.c b/drivers/block/n64cart.c
index 43482d158640..47bdf324e962 100644
--- a/drivers/block/n64cart.c
+++ b/drivers/block/n64cart.c
@@ -30,7 +30,6 @@ enum {
 #define MIN_ALIGNMENT		8
 
 static u32 __iomem *reg_base;
-static struct device *dev;
 
 static unsigned int start;
 module_param(start, uint, 0);
@@ -89,6 +88,7 @@ static blk_qc_t n64cart_submit_bio(struct bio *bio)
 {
 	struct bio_vec bvec;
 	struct bvec_iter iter;
+	struct device *dev = bio->bi_disk->private_data;
 	u32 pos = bio->bi_iter.bi_sector << SECTOR_SHIFT;
 
 	bio_for_each_segment(bvec, bio, iter) {
@@ -140,11 +140,10 @@ static int __init n64cart_probe(struct platform_device *pdev)
 	if (!disk->queue)
 		return -ENOMEM;
 
-	dev = &pdev->dev;
-
 	disk->first_minor = 0;
 	disk->flags = GENHD_FL_NO_PART_SCAN | GENHD_FL_EXT_DEVT;
 	disk->fops = &n64cart_fops;
+	disk->private_data = &pdev->dev;
 	strcpy(disk->disk_name, "n64cart");
 
 	set_capacity(disk, size >> SECTOR_SHIFT);
-- 
2.22.1

