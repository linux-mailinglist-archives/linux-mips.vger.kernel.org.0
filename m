Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2EFE303046
	for <lists+linux-mips@lfdr.de>; Tue, 26 Jan 2021 00:36:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732756AbhAYXfV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 25 Jan 2021 18:35:21 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:5580 "EHLO
        esa6.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732913AbhAYXej (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 25 Jan 2021 18:34:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1611617679; x=1643153679;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Lq+Okxl3S0+ZzfUmJqwSdxWxDX6euQesnVDFdpzNkYc=;
  b=F/R6vZCZX2bxkTgq1hg9NQB2PGZThgs3ms2x4BEOaJRX86jy5bVI7L9S
   jtsZKqPFhKJLsjxMtV0VV6zFV3IcyA4C70rvWR4bePcJrC+6dr51kuz7J
   bmyOLn5+Wf1bfPEVMQ/tAe+dbNpt+zLdz7+ohcT47fMfsFRFzoemCmzpq
   SXPc5wDyNP+g+DVcsn7tML4O8mLp36bzPlTWmaa1pbNJakj4rbgW9N2BG
   NK61TCRcqvcOnKhvL7w48gZvFEoPqzjtIq0o0BL3eG/u0PJhEg+qQ6bsl
   H8QztMAMPsRUanJvemXitjGDQ5WYc5o3i/m40DRRpFyU7j0OF1/k5p8TD
   g==;
IronPort-SDR: WZnOysLRWdZ/8Iai+rfa0ugk/GGRIS65uYQeSyuvr/TgFXPuHw6XTTNjdPrCVyopPd0ZJTtz6V
 siMC2N6nLxUTdD3P3QQzGDAv+Ekcqy+elFu4o54t+XtwQRrN1TmCSJqA8y2abKgsUBzOScwj9M
 uUPjBvFZCiqSU/9psAiz0Cq6+L8NoDISJANC1wJFZ56m1hotPlRXu1qwxIArSVmqU899QjJZtc
 LE2/Q2y5oIA/vFGXgj/M96lDPIE9N8hnaZXjWA58Ywaydv4jE93AVNEuBrYyDllcFJDXQJIPkN
 YJE=
X-IronPort-AV: E=Sophos;i="5.79,374,1602518400"; 
   d="scan'208";a="159472146"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com) ([199.255.45.15])
  by ob1.hgst.iphmx.com with ESMTP; 26 Jan 2021 07:32:50 +0800
IronPort-SDR: HJr4c4HFO0S3fPHrqjA232p3wABtmewJ2I1IyCSqm+eUY9bnjmY4GOz91IyDwsJC79UjyB7LJk
 Kvs0DIf+XHmwYuM/k9XLnuRviEPo7tolP1dN2CtVGYnz7GuHbs48N/FspvpUf8OB7NieJBWY7x
 olpQN6FyMZnyq8E45ZyORmtpnRjV2a1d9bkeALzEekA752fkZzbfy82H8z178Qgx4DXctA9ixl
 TI7XXrHisJGhtbEvAwyLvwNgBGoAwIj+GMtczmZWJ352Q54HMHX9weFXyo9gF1lNpYGCEnctt6
 ZQmXIzjPEZOErUlmk5sOzG18
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
  by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2021 15:15:17 -0800
IronPort-SDR: 6r1N4OgNjwfs/47sjUscH0fEuDfb4rPU7oQh6vecOxKfn/NvAX36oBYWIHVBP9XeOk9i4wRFOG
 OsOYqj1PWr/JzFN5AnLit1JrusMPRBtvUKPNsl991nN5yl7efQ0j+YiDJFBFjfJRDr9/TF0wIF
 YS9rXV51a4F/HAmgoqcufAYqbswJaTCajU/07zTyFAY9fpz5RKIESFOmY3fosx0FzGiGzHjkCq
 GxDJ1LHWVkq/xLRkEqN3auKp95OpN19DWGRC/iEGmf4a+wmLgcJOMnK0Fy0A62Yjv3Xe2Pdn81
 +ls=
WDCIronportException: Internal
Received: from vm.labspan.wdc.com (HELO vm.sc.wdc.com) ([10.6.137.102])
  by uls-op-cesaip02.wdc.com with ESMTP; 25 Jan 2021 15:32:50 -0800
From:   Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
To:     linux-mips@vger.kernel.org
Cc:     tsbogend@alpha.franken.de, axboe@kernel.dk,
        linux-block@vger.kernel.org, cand@gmx.com,
        Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Subject: [PATCH 1/9] n64: use pr_fmt to avoid duplicate string
Date:   Mon, 25 Jan 2021 15:32:35 -0800
Message-Id: <20210125233243.5982-2-chaitanya.kulkarni@wdc.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20210125233243.5982-1-chaitanya.kulkarni@wdc.com>
References: <20210125233243.5982-1-chaitanya.kulkarni@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Instead of repeating the n64cart string all over the module use pr_fmt
macro and remove the duplicate string. Also, replace and with or in the
one of the error message.

Signed-off-by: Chaitanya Kulkarni <chaitanya.kulkarni@wdc.com>
Reviewed-by: Lauri Kasanen <cand@gmx.com>
---
 drivers/block/n64cart.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/block/n64cart.c b/drivers/block/n64cart.c
index e76722acba46..8c7c9249071b 100644
--- a/drivers/block/n64cart.c
+++ b/drivers/block/n64cart.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2021 Lauri Kasanen
  */
 
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 #include <linux/bitops.h>
 #include <linux/blkdev.h>
 #include <linux/dma-mapping.h>
@@ -117,12 +118,12 @@ static int __init n64cart_probe(struct platform_device *pdev)
 	struct gendisk *disk;
 
 	if (!start || !size) {
-		pr_err("n64cart: start and size not specified\n");
+		pr_err("start or size not specified\n");
 		return -ENODEV;
 	}
 
 	if (size & 4095) {
-		pr_err("n64cart: size must be a multiple of 4K\n");
+		pr_err("size must be a multiple of 4K\n");
 		return -ENODEV;
 	}
 
-- 
2.22.1

