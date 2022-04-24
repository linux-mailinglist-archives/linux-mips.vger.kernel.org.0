Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B3BEA50CE7B
	for <lists+linux-mips@lfdr.de>; Sun, 24 Apr 2022 04:35:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237715AbiDXCie (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 23 Apr 2022 22:38:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235794AbiDXCid (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 23 Apr 2022 22:38:33 -0400
Received: from loongson.cn (mail.loongson.cn [114.242.206.163])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C92A123BD3
        for <linux-mips@vger.kernel.org>; Sat, 23 Apr 2022 19:35:29 -0700 (PDT)
Received: from localhost.localdomain (unknown [113.200.148.30])
        by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxjxBrt2RidRIvAA--.30985S3;
        Sun, 24 Apr 2022 10:35:26 +0800 (CST)
From:   Hui Li <lihui@loongson.cn>
To:     Simon Horman <horms@verge.net.au>
Cc:     Eric Biederman <ebiederm@xmission.com>, kexec@lists.infradead.org,
        linux-mips@vger.kernel.org
Subject: [PATCH v2 1/2] kexec-tools: mips: Add CONFIG_LOONGSON option.
Date:   Sun, 24 Apr 2022 10:35:22 +0800
Message-Id: <20220424023523.16869-2-lihui@loongson.cn>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220424023523.16869-1-lihui@loongson.cn>
References: <20220424023523.16869-1-lihui@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxjxBrt2RidRIvAA--.30985S3
X-Coremail-Antispam: 1UD129KBjvJXoW7KF4DWrWrury3WFWxtr15twb_yoW8WrWkpF
        yayanrurW8W3WrKr4fJFWUWr1Yg39Ika42kF47Wry7Wa45Ja4rXrWaqa9xXry7Zr4fAFW0
        9F95Grn8KF4xAw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUB2b7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
        0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
        8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_Jrv_JF4l8cAvFVAK0II2c7xJM28CjxkF
        64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcV
        CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2
        jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4
        CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvj
        eVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCY02Avz4vE14v_Gr1l42xK82IYc2
        Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
        6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0x
        vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE
        42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
        kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUqSdyUUUUU
X-CM-SenderInfo: 5olk3xo6or00hjvr0hdfq/
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Under the mips architecture,PAGE_OFFSE is defined as 0xa800000000000000ULL.
But now loongson and many cpu's PAGE_OFFSET use 0xFFFFFFFF80000000ULL 
in kernel.so. add a --with-loongson option to distinguish PAGE_OFFSET 
between different platforms under mips.

Signed-off-by: Hui Li <lihui@loongson.cn>
---
 configure.ac                     | 5 +++++
 kexec/arch/mips/crashdump-mips.h | 6 +++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index cf8e8a2..26bfbcd 100644
--- a/configure.ac
+++ b/configure.ac
@@ -111,6 +111,11 @@ AC_ARG_WITH([booke],
 		AC_DEFINE(CONFIG_BOOKE,1,
 			[Define to build for BookE]))
 
+AC_ARG_WITH([loongson],
+		AC_HELP_STRING([--with-loongson],[build for loongson]),
+		AC_DEFINE(CONFIG_LOONGSON,1,
+			[Define to build for LoongsoN]))
+
 dnl ---Programs
 dnl To specify a different compiler, just 'export CC=/path/to/compiler'
 if test "${build}" != "${host}" ; then
diff --git a/kexec/arch/mips/crashdump-mips.h b/kexec/arch/mips/crashdump-mips.h
index 7edd859..d53c696 100644
--- a/kexec/arch/mips/crashdump-mips.h
+++ b/kexec/arch/mips/crashdump-mips.h
@@ -5,7 +5,11 @@ struct kexec_info;
 int load_crashdump_segments(struct kexec_info *info, char *mod_cmdline,
 				unsigned long max_addr, unsigned long min_base);
 #ifdef __mips64
-#define PAGE_OFFSET	0xa800000000000000ULL
+#ifdef CONFIG_LOONGSON
+#define PAGE_OFFSET 0xFFFFFFFF80000000ULL
+#else
+#define PAGE_OFFSET 0xa800000000000000ULL
+#endif
 #define MAXMEM		0
 #else
 #define PAGE_OFFSET	0x80000000
-- 
2.20.1

