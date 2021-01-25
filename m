Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 938B2303041
	for <lists+linux-mips@lfdr.de>; Tue, 26 Jan 2021 00:36:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732613AbhAYXfB (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 Jan 2021 18:35:01 -0500
Received: from esa3.hgst.iphmx.com ([216.71.153.141]:31536 "EHLO
        esa3.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732754AbhAYXeq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 25 Jan 2021 18:34:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611617685; x=1643153685;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0k5bSmKlMDaTbEC9mr9VlyhcPgLOqERH/sYvhfMb1dM=;
  b=QWPJ4yWfzqFtHnlass7+XdlE2zmKXJvi/1IRE68baHvPoJm/Whml12hT
   QSPIfL4js52IyBl48d4XuAX/PrapAJXPd2HfhYepgBHx1gFDXhacnuIF1
   ETFwyb3KpctYld/XbVl5eal6FF9UcEiKJAgo6Y17lhXrMJowzDXuGPjDz
   4fX5gGgsk0HU1ZUCgopt10U8DfCE1S2DJPAATquz40+43R5JaTfXowWxy
   em2wORS11Nxvyue1nZA5KNSNZwXfRtOiwsY/amaG7rpgJ1ZMaOzMe1EU4
   IXEybD8psTCC1vNISVBFkZZxicFuHb6gYVuBIrfS0QhvVQkyw8aOUow5A
   w==;
IronPort-SDR: 2zDq5lCjnjQ59eHoVKLoc8bS+DT5k38nB1U648wEHzNBFDgBeEwCWPxkmRJA/SA/m+FzAmEFgB
 zDl4Lj8TKnrZcBylvlDBEDuznJZpC1mcSUhSKqX1nZFQgxNgBqWzPQUFYTTIrJHaNAwcChy1mU
 kWEOolu+ndoqy3uTjA6mjbzB0FYT2TfZirbatMXcxmi6ioy6yybU2VhDshUpySgByYJIWwJqZT
 jSaOOOe/IwC7/5AanLZLSx5qjNUPP9LrNOmvh7GW49bhCVASbo/Kscp4K67ydJIEQSXm8hLYLQ
 P2c=
X-IronPort-AV: E=Sophos;i="5.79,374,1602518400"; 
   d="scan'208";a="162741776"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com) ([199.255.45.14])
  by ob1.hgst.iphmx.com with ESMTP; 26 Jan 2021 07:33:22 +0800
IronPort-SDR: YdO9rMxUmp1u3kHtkNALnzFZHdOjqqy9oJSpox7vA+OQJa7uORqblGaqLu8dJpI5gmerm2Niuy
 ovYTvBS3z1Qd1BNFooMz2n9AIz0KmWBlYSXXh48C6y/zGffkwTPeqXZPnntb4EqdPziKUNnFyu
 sVUuMXh0Lu0545rtyF4VTwFvlZLWsz7rFoKwZWE3kx+0/4uHWga47sltRSarRmN77RlNPJsPEt
 FWNjtxlfS+M8FES4tl3GTh33iPh9UeRY4ezX0G230vTzdVf11EN7JSo9kzDNNZ23rgeZr8fR44
 +gcj1qN1O4wTm9/trXswccR6
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 15:17:49 -0800
IronPort-SDR: i7/cMYd+hocFNqXoNg50Q+gNh2mAUaB2Xz9Hk9stP9jTQ17ckpizvgtuG3p2+B/L7fNDjc3Q3c
 7yJjlixVeeRL5GIsDOkNgwBxbCBYrbgKfL11kaFamhL88LU84SuMfCdY3e2OLD0hFTVTv1k7KP
 iHd2QLpDDJT6rD0G/1nBekfkAJjkNMVyXgOuX85CwxRYQ94Vur+25aXYKZQvC+BQ+K2PkbscUb
 q65ZKm6GWdsKTUwk2oQsUOxylzXnAN3xFtNUoXlASpyv6ROcjOWfVpfAmlNjx/EXEL0r9y9XUV
 wI8=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
  by uls-op-cesaip02.wdc.com with ESMTP; 25 Jan 2021 15:33:22 -0800
From:   Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, axboe@kernel.dk,
        linux-block@vger.kernel.org, cand@gmx.com,
        Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Subject: [PATCH 7/9] n64: cosmetics changes
Date:   Mon, 25 Jan 2021 15:32:41 -0800
Message-Id: <20210125233243.5982-8-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210125233243.5982-1-chaitanya.kulkarni@wdc.com>
References: <20210125233243.5982-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Make the variable declaration ascending order and initialize the
variables at the time of declaration when possible.

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Reviewed-by: Lauri Kasanen <cand@gmx.com>
---
 drivers/block/n64cart.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/block/n64cart.c b/drivers/block/n64cart.c
index 7906b5b2f12e..3bfb010402e3 100644
--- a/drivers/block/n64cart.c
+++ b/drivers/block/n64cart.c
@@ -88,10 +88,8 @@ static bool n64cart_do_bvec(struct device *dev, struct bio_vec *bv, u32 pos)
 static blk_qc_t n64cart_submit_bio(struct bio *bio)
 {
 	struct bio_vec bvec;
-	u32 pos;
 	struct bvec_iter iter;
-
-	pos = bio->bi_iter.bi_sector << SECTOR_SHIFT;
+	u32 pos = bio->bi_iter.bi_sector << SECTOR_SHIFT;
 
 	bio_for_each_segment(bvec, bio, iter) {
 		if (!n64cart_do_bvec(dev, &bvec, pos))
@@ -119,8 +117,8 @@ static const struct block_device_operations n64cart_fops = {
 static int __init n64cart_probe(struct platform_device *pdev)
 {
 	int err;
-	struct request_queue *queue;
 	struct gendisk *disk;
+	struct request_queue *queue;
 
 	if (!start || !size) {
 		pr_err("start or size not specified\n");
-- 
2.22.1

