Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FFB955428B
	for <lists+linux-mips@lfdr.de>; Wed, 22 Jun 2022 08:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230438AbiFVGIb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 22 Jun 2022 02:08:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230006AbiFVGIa (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 22 Jun 2022 02:08:30 -0400
Received: from mail-m963.mail.126.com (mail-m963.mail.126.com [123.126.96.3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 47A6E13DEF
        for <linux-mips@vger.kernel.org>; Tue, 21 Jun 2022 23:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
        s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=hYvNy
        /a4Zv+KeA6dTEdqqFDOrpDPUBwGBPYMk1Fa7z8=; b=FIGs99KySfH3XNoujfFlQ
        KJTpZG68r+mXZ1unGfuXrdYxeXE1pligGPt28V6cb87bGe7ced2mYrWh2xfaB8Wu
        18Wn6Ck7ijoeGU+eNuE9fOr4NhdJeORfen8cUtrkz+5s7DzF4iB84WvPXfEayIx5
        3RK5iGf2POf9czub19ME6A=
Received: from localhost.localdomain (unknown [124.16.139.61])
        by smtp8 (Coremail) with SMTP id NORpCgC3SofIsbJihfWfGA--.55785S2;
        Wed, 22 Jun 2022 14:08:09 +0800 (CST)
From:   Liang He <windhl@126.com>
To:     tsbogend@alpha.franken.de, geert+renesas@glider.be,
        linux-mips@vger.kernel.org, windhl@126.com
Subject: [PATCH] mips/kernel: Add missing of_node_get()
Date:   Wed, 22 Jun 2022 14:08:07 +0800
Message-Id: <20220622060807.4095040-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NORpCgC3SofIsbJihfWfGA--.55785S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7GFy8uw18Zw1UZF47XF4kXrb_yoW3Xwc_XF
        1I93yxAF4rAF10gayxXw4Sgrn8C345WrZayrn7uFy7t3y5Ar4DJayfurySqrn5ZrZ8tFZ8
        GrsxtFy2kanrtjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRuPfmUUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi2gkoF1uwMQiHSQAAsw
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

In mips_cpc_default_phys_base(), we need to add of_node_get() before
of_find_compatible_node() which will decrease the refcount of its
first arg.

Signed-off-by: Liang He <windhl@126.com>
---
 arch/mips/kernel/mips-cpc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/kernel/mips-cpc.c b/arch/mips/kernel/mips-cpc.c
index 3e386f7e1545..7ba0ae5df882 100644
--- a/arch/mips/kernel/mips-cpc.c
+++ b/arch/mips/kernel/mips-cpc.c
@@ -25,6 +25,7 @@ phys_addr_t __weak mips_cpc_default_phys_base(void)
 	struct resource res;
 	int err;
 
+	of_node_get(of_root);
 	cpc_node = of_find_compatible_node(of_root, NULL, "mti,mips-cpc");
 	if (cpc_node) {
 		err = of_address_to_resource(cpc_node, 0, &res);
-- 
2.25.1

