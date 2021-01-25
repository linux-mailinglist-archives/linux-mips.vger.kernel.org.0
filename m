Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7BACC303043
	for <lists+linux-mips@lfdr.de>; Tue, 26 Jan 2021 00:36:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732539AbhAYXfL (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 Jan 2021 18:35:11 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:42755 "EHLO
        esa2.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732634AbhAYXeq (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 25 Jan 2021 18:34:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611617692; x=1643153692;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Uxp6EwTgU3uwmdxB7GLUpGFxLslWIIrZ8nm7dltbi2M=;
  b=ZlcrccaEx1sh+TxMNU4Oc4tJQwDO0qblVuzLvfCCQ6tFouS5i9yC/BOi
   xCmqnm8uKxnONvqdZPQIFzJddoXOMOVuz01W7eBUeSu16/o1nka7feYSX
   f8xMcQzkhLeXVHNNGRc5oSg7xkTpjYh2JCnhVcmWuqgbu1W5oRilxW7dD
   9zimFJqpInRsdYSf0nLcTYnqhHgsiUW64gC7+rSmUdd90+4pLalZ422e2
   1jAhW3CQyX9DF/VG6CEypVqPAvCMzV9lUHJoa6wkN4y3m4oPJyd3HzGIf
   Zcuu4bWawFi1SHloS6G6oVW+turOBc2YipmirIxxUW+dDjIAm5Yl+NE33
   g==;
IronPort-SDR: QrR21EVqiUHRyOj7CtZ7A/NuLXEKY/6py31hzfYzuqr32vx0cTpNBo4/oXj9l4BdlvEZ0AtDGt
 lwREqB2fy260krMVn54dXyaucMs5b7jj8DobxlMA6obw4UcYWPancLPJsbTS3WBJ0X5CKjzyEF
 MWL8oLIRMJoaR+ik0cgG9Z5jISZZa1ukQ3qXy3KPplZcEQ2LghPoF7YfBJM9oj0k1LlbbkJXmK
 0E7+Ci8BKsDkXzEWQbf+x5XROn+rXWz/syYyENp+HLLo1ZQK+/2xxLDpyvQjZhk86Q4vmTpqma
 DbY=
X-IronPort-AV: E=Sophos;i="5.79,374,1602518400"; 
   d="scan'208";a="262307387"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 26 Jan 2021 07:52:56 +0800
IronPort-SDR: +KFYK71zOOqJO/kv5pLrRZs/wcZgZ7mzgTUhtyq/hGGVmv7Q1W3VBGMs3r5+T8PGvkq+yylo9i
 RhK2L2lezrJ03gznrWzeFnPFyo++K7rUILjBBm3ynZIJgqwBsuNBli0VmE7tvCE2/lZ1w3pCKp
 R1e+oIDfsImRajTFJtegxCDAeC+pElQDn57iIWoEVbEAXtJLKbmimXuWVt3qlAr0Wd1gDBtoME
 f8RmvpcFPXamNgs4ayPNbVRSr1x74ObcV9ar04MkfDOeXThMZ9sQmapXx6Y32pxZf+RV5t1A5M
 uaUdzm/mGqX8nuzMtzMx0tkj
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 15:15:44 -0800
IronPort-SDR: hnUaIIauLc93vVOvot/Xt8Pb7COrHUEV6foA8wF4+MlI3x0xmtcmM0UrfrQXVCkRR8RPRK/+f+
 uWTOm/P2y5NYDbedNNvuJZmmrNhPt9yxcN4FRD1+39H7JmdnXi7RwgcGtiHgiKFqVBps61ByqN
 As6/r/EG1lWLCLfBHrIxjwotgtSdMM/36erVjs1+5h4Isjh2q6EbUWklxH8i0aMmTO6Luu2Ixq
 jP3WgIcJXjLTtHhuQMzmgi97WzLIATyXhgoYQjnjdWoSXbz4KGmXZ90kAQAHtRJZpSBlfBMw9D
 QCo=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
  by uls-op-cesaip02.wdc.com with ESMTP; 25 Jan 2021 15:33:17 -0800
From:   Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, axboe@kernel.dk,
        linux-block@vger.kernel.org, cand@gmx.com,
        Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Subject: [PATCH 6/9] n64: remove curly brackets
Date:   Mon, 25 Jan 2021 15:32:40 -0800
Message-Id: <20210125233243.5982-7-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210125233243.5982-1-chaitanya.kulkarni@wdc.com>
References: <20210125233243.5982-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Remove extra braces for the if which has only single statement.

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Reviewed-by: Lauri Kasanen <cand@gmx.com>
---
 drivers/block/n64cart.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/block/n64cart.c b/drivers/block/n64cart.c
index c83a6af5a718..7906b5b2f12e 100644
--- a/drivers/block/n64cart.c
+++ b/drivers/block/n64cart.c
@@ -133,9 +133,8 @@ static int __init n64cart_probe(struct platform_device *pdev)
 	}
 
 	queue = blk_alloc_queue(NUMA_NO_NODE);
-	if (!queue) {
+	if (!queue)
 		return -ENOMEM;
-	}
 
 	reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (!reg_base) {
-- 
2.22.1

