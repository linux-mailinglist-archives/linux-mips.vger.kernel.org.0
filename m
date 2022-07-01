Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9C0A563393
	for <lists+linux-mips@lfdr.de>; Fri,  1 Jul 2022 14:41:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232650AbiGAMlX (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 1 Jul 2022 08:41:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235642AbiGAMlV (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 1 Jul 2022 08:41:21 -0400
Received: from mail-m963.mail.126.com (mail-m963.mail.126.com [123.126.96.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 361253CA5D
        for <linux-mips@vger.kernel.org>; Fri,  1 Jul 2022 05:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=QEhRL
        GNGRZyyGSqFMWVtHsWv5oxB8ROiwxjEdB7hE9Y=; b=ayKw1b2MEfsrsiVM+53mM
        PqQ42ro4SaZmWtXTrcOpS1WJmDdai02kbOf0O7XaQCTSXI58P+ndCjl5rZYpKeyP
        jcQSXT2DphBLEHwUFlQH/o+zFdjxM325q+WLmfCh4CXtKe+xDMhKk+d3hVng2jPc
        KYBCbVg1BaA9T0URGN7Zoc=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp8 (Coremail) with SMTP id NORpCgBXpnJp675i7WfoGw--.45395S2;
        Fri, 01 Jul 2022 20:41:13 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     tsbogend@alpha.franken.de, linux-mips@vger.kernel.org,
        windhl@126.com
Subject: [PATCH] mips: cavium-octeon: Fix missing of_node_put() in octeon2_usb_clocks_start
Date:   Fri,  1 Jul 2022 20:41:12 +0800
Message-Id: <20220701124112.237902-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NORpCgBXpnJp675i7WfoGw--.45395S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GrW8ur15ZrWxurWruF45Wrg_yoWDWFcEg3
        4xu347JF4fJa1kCF4vq34agwnFk3s5GrWxWr4kAr1Sq3yYywnxAF98Z3srJF17uFZFvrWr
        JrZxCr43Ca1SvjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRN89NDUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/xtbBGgExF1-HZayOqgAAsI
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

We should call of_node_put() for the reference 'uctl_node' returned by
of_get_parent() which will increase the refcount. Otherwise, there will
be a refcount leak bug.

Signed-off-by: Liang He <windhl@126.com>
---
 arch/mips/cavium-octeon/octeon-platform.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/mips/cavium-octeon/octeon-platform.c b/arch/mips/cavium-octeon/octeon-platform.c
index a994022e32c9..ce05c0dd3acd 100644
--- a/arch/mips/cavium-octeon/octeon-platform.c
+++ b/arch/mips/cavium-octeon/octeon-platform.c
@@ -86,11 +86,12 @@ static void octeon2_usb_clocks_start(struct device *dev)
 					 "refclk-frequency", &clock_rate);
 		if (i) {
 			dev_err(dev, "No UCTL \"refclk-frequency\"\n");
+			of_node_put(uctl_node);
 			goto exit;
 		}
 		i = of_property_read_string(uctl_node,
 					    "refclk-type", &clock_type);
-
+		of_node_put(uctl_node);
 		if (!i && strcmp("crystal", clock_type) == 0)
 			is_crystal_clock = true;
 	}
-- 
2.25.1

