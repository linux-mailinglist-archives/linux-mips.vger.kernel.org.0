Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5C05303053
	for <lists+linux-mips@lfdr.de>; Tue, 26 Jan 2021 00:37:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732728AbhAYXhU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 Jan 2021 18:37:20 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:5580 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732706AbhAYXhE (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 25 Jan 2021 18:37:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611617824; x=1643153824;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VVy/lgGRMlIuhUP/DqeEb03EWvoZ5UbBH4eS8ECqgU0=;
  b=hzCViwAJLIqDUxoYY1NGnbCGihhIwNCneAcGCehHcQSOyYDHqvHdlcsw
   ePNQDmII8iXOabZlUHZC0/WV1GHLKSALS4zLThw3xwKjnmub3I6nkm7US
   CEuxfcCoPxG5hr8NwuCAwSR5cRdjCPmZz3LmCLB8HguBQIvedrEpM6ov8
   0iQ4yqKSImeKAw/k7tekjeVnI83lgRlmKC6gUmj4UnmIu/WwNYSLX5/9l
   FYkE8yqImt6bKGzviHY6ArlhJYWB2IcmvzxtGrBaWa2vadufqNiEdH5Wo
   n92K1jIGaQUycG8vo94C+cJKslQNrxm+2MKb6F3ZAzASrb6wMXF57E+YC
   w==;
IronPort-SDR: rGU2dM2huKiRkU+glDxBCreton4E8nA1o758FnPyR1Ho6jTv66OosdwULIhkLt3AK/TLankrTS
 2M4KEMHKXaZ2WvAPjtvRwQnTvPuzbbCruGDM0LtDJUF17oJ/jxoPJPlXwXYXxBwSM4YibK3jta
 K/w+Ab2XPIXrtpxqbr/C74W5Ycpg5iNeWxcuhVm82CXl6DBYAk1l3dfKdZlX5RSPlajruMnXIq
 WB4q9RNLBBwXP7UV7ZHnvoNMivczI9eSd79CMFQnrZF69hN4kHG/vyjDP50XYUMyT+Y8exENgb
 6PI=
X-IronPort-AV: E=Sophos;i="5.79,374,1602518400"; 
   d="scan'208";a="159472164"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 26 Jan 2021 07:33:12 +0800
IronPort-SDR: CqpwEKKyU/8bJ7mJa7AcarwyfGRcsz+VwefEFYN80KxwvzWlaw3tgxWCr76IV1qkdpfbM8Oycx
 eh+bJ/miOmFeF+0VNE/dKIAxUzO9Unf0M26ZVb7CfLdOKmaWybt6pf+uuYb4EIRLg8q8JKvko1
 H2OA+YuvdfgK0MCwZLnoND0cFp7nTeIpirXeak3CIXoOZ1GXHlZe9R+Fvc89HyAuWgLogECRuh
 XYCOCzF4rOb3+AFUdJs0aT0i4twnKWwIFpSlTRR+R5I9+B49Vq0qfLgIE3EVw2cHgcnh+5WEck
 Hv/UyFWRanftsJlwmXxO9HBN
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 15:15:39 -0800
IronPort-SDR: oWhdoet6Gh4qVwfcNiWGteoSOHuS0kWtUkuFcLEbgHYuSnjHhSTXeTuUQSIzpt1S6o35nKfDt5
 3c+PYzpijP7nirBawu5iVAL3zOc7CGrB5ZmdOMvqOmmChcmRNWPN6pSoIFtzhc/Zi+YWr0MI2O
 0vjvu+YlnJoMBm09BYFEko8YkVZnvYUnwxdbHwZ/pFJwP3jmuqAsZ5mcmdSVsCSZWl/tt67zzr
 vc6qhrJ/QNym6RjsNEIXQXoy/Y2MQ6AH0aX7hAnctBj0lH/qv+1LPoGDd3X5a2WzzY/zAnYBiU
 cHI=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
  by uls-op-cesaip02.wdc.com with ESMTP; 25 Jan 2021 15:33:11 -0800
From:   Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, axboe@kernel.dk,
        linux-block@vger.kernel.org, cand@gmx.com,
        Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Subject: [PATCH 5/9] n64: use sector SECTOR_SHIFT instead 512
Date:   Mon, 25 Jan 2021 15:32:39 -0800
Message-Id: <20210125233243.5982-6-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210125233243.5982-1-chaitanya.kulkarni@wdc.com>
References: <20210125233243.5982-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Instead of using magic numbers use SECTOR_SHIFT to get the number of
sectors from the size.

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Reviewed-by: Lauri Kasanen <cand@gmx.com>
---
 drivers/block/n64cart.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/block/n64cart.c b/drivers/block/n64cart.c
index 620f9e080d5d..c83a6af5a718 100644
--- a/drivers/block/n64cart.c
+++ b/drivers/block/n64cart.c
@@ -157,7 +157,7 @@ static int __init n64cart_probe(struct platform_device *pdev)
 	disk->fops = &n64cart_fops;
 	strcpy(disk->disk_name, "n64cart");
 
-	set_capacity(disk, size / 512);
+	set_capacity(disk, size >> SECTOR_SHIFT);
 	set_disk_ro(disk, 1);
 
 	blk_queue_flag_set(QUEUE_FLAG_NONROT, queue);
-- 
2.22.1

