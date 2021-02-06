Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ECB3311D52
	for <lists+linux-mips@lfdr.de>; Sat,  6 Feb 2021 14:10:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbhBFNJs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 6 Feb 2021 08:09:48 -0500
Received: from alln-iport-4.cisco.com ([173.37.142.91]:11133 "EHLO
        alln-iport-4.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbhBFNJj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 6 Feb 2021 08:09:39 -0500
X-Greylist: delayed 545 seconds by postgrey-1.27 at vger.kernel.org; Sat, 06 Feb 2021 08:09:38 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=1668; q=dns/txt; s=iport;
  t=1612616978; x=1613826578;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=N4oMQ2G7Ex1ON1n93ujw9PeeJlVrRzyTku1hxe8J0Ag=;
  b=lMv0T4Xi0mGxwsreEf32hbOx1FP7Anmancd7FLzIkuBYXnqlatk0C9LA
   q5juxEuqqVRQRvUEtHFGzqyhwRglh2Y3PSZ/VtdQhW4rFke4kmmXFRpxN
   qfRMBvfFo/VuCCUacOZ8XhKr1un1Hi6dbnOmuaryWgaY4ME1sUttGummz
   M=;
X-IronPort-AV: E=Sophos;i="5.81,157,1610409600"; 
   d="scan'208";a="642413507"
Received: from alln-core-10.cisco.com ([173.36.13.132])
  by alln-iport-4.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 06 Feb 2021 12:59:48 +0000
Received: from sjc-ads-2883.cisco.com (sjc-ads-2883.cisco.com [171.70.33.62])
        by alln-core-10.cisco.com (8.15.2/8.15.2) with ESMTPS id 116CxmaJ023883
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Sat, 6 Feb 2021 12:59:48 GMT
Received: by sjc-ads-2883.cisco.com (Postfix, from userid 725528)
        id 0BC50CC1251; Sat,  6 Feb 2021 04:59:48 -0800 (PST)
From:   Ivan Khoronzhuk <ikhoronz@cisco.com>
To:     linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        linux-kernel@vger.kernel.org
Cc:     yangtiezhu@loongson.cn, rppt@kernel.org, ivan.khoronzhuk@gmail.com,
        Ivan Khoronzhuk <ikhoronz@cisco.com>
Subject: [PATCH] mips: kernel: setup: fix crash kernel resource allocation
Date:   Sat,  6 Feb 2021 12:59:40 +0000
Message-Id: <20210206125940.111766-1-ikhoronz@cisco.com>
X-Mailer: git-send-email 2.23.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.70.33.62, sjc-ads-2883.cisco.com
X-Outbound-Node: alln-core-10.cisco.com
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In order to avoid crash kernel corruption, its memory is reserved
early in memblock and as result, in time when resources are inited
it's not present in memblock.memory, so crash kernel memory is out
of ranges listed with for_each_mem_range(). To avoid it and still
keep memory reserved lets reseve it out of loop by inserting it in
iomem_resource.

Fixes: a94e4f24ec83 ("MIPS: init: Drop boot_mem_map")
Signed-off-by: Ivan Khoronzhuk <ikhoronz@cisco.com>
---
Based on linux-next/master

 arch/mips/kernel/setup.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/mips/kernel/setup.c b/arch/mips/kernel/setup.c
index 3785c72bc3bc..25e376ef2f2a 100644
--- a/arch/mips/kernel/setup.c
+++ b/arch/mips/kernel/setup.c
@@ -473,14 +473,15 @@ static void __init mips_parse_crashkernel(void)
 	crashk_res.end	 = crash_base + crash_size - 1;
 }
 
-static void __init request_crashkernel(struct resource *res)
+static void __init request_crashkernel(void)
 {
 	int ret;
 
 	if (crashk_res.start == crashk_res.end)
 		return;
 
-	ret = request_resource(res, &crashk_res);
+	/* The crashk resource shoud be located in normal mem */
+	ret = insert_resource(&iomem_resource, &crashk_res);
 	if (!ret)
 		pr_info("Reserving %ldMB of memory at %ldMB for crashkernel\n",
 			(unsigned long)(resource_size(&crashk_res) >> 20),
@@ -734,8 +735,9 @@ static void __init resource_init(void)
 		request_resource(res, &code_resource);
 		request_resource(res, &data_resource);
 		request_resource(res, &bss_resource);
-		request_crashkernel(res);
 	}
+
+	request_crashkernel();
 }
 
 #ifdef CONFIG_SMP
-- 
2.23.1

