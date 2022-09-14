Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44B3F5B84B1
	for <lists+linux-mips@lfdr.de>; Wed, 14 Sep 2022 11:15:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231208AbiINJPP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 14 Sep 2022 05:15:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231570AbiINJNp (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 14 Sep 2022 05:13:45 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AB8A79690;
        Wed, 14 Sep 2022 02:06:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5D3B5619EF;
        Wed, 14 Sep 2022 09:05:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98EE3C433C1;
        Wed, 14 Sep 2022 09:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1663146337;
        bh=a66UEtPnwUYc8uQfQS1XmGr0kvvD1Rh32I5QpKZu9TY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=n39MEz9Y3jgLKScyOwQXa3Dbc8RQVoHUJl9aJrn6VxU9x3bVMUsYWlrDZ4BeNwJ1d
         W456jdXDHnM+rvJUXWGfoJ3mVUiWQTojCFM5KBABSFFAf0nWiU5BDY7NgaP+elfR4g
         4xL5AsQaG8JeanSuLYrmHSyFPTKoSJJ7Ee1eB27ZbyQfh/XoofJklOBpuPIF7HidDH
         1cbi9x2VGppGndbQEE+wb0y+2vZqAnFAvI396ObAKZCAXjepYl/v9k6jptD5e3L44W
         fB288SXi7vrxzy+RB1qYYwKCbO77UzgtkbImXGYalP2gqsBTHff9m09fyUA52lCc95
         4xJh683twTNgA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Alexander Sverdlin <alexander.sverdlin@nokia.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Sasha Levin <sashal@kernel.org>, maz@kernel.org,
        rikard.falkeborn@gmail.com, Julia.Lawall@inria.fr,
        mark.rutland@arm.com, samuel@sholland.org,
        linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 7/8] MIPS: OCTEON: irq: Fix octeon_irq_force_ciu_mapping()
Date:   Wed, 14 Sep 2022 05:05:11 -0400
Message-Id: <20220914090514.471614-7-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220914090514.471614-1-sashal@kernel.org>
References: <20220914090514.471614-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Alexander Sverdlin <alexander.sverdlin@nokia.com>

[ Upstream commit ba912afbd611d3a5f22af247721a071ad1d5b9e0 ]

For irq_domain_associate() to work the virq descriptor has to be
pre-allocated in advance. Otherwise the following happens:

WARNING: CPU: 0 PID: 0 at .../kernel/irq/irqdomain.c:527 irq_domain_associate+0x298/0x2e8
error: virq128 is not allocated
Modules linked in:
CPU: 0 PID: 0 Comm: swapper/0 Not tainted 4.19.78-... #1
        ...
Call Trace:
[<ffffffff801344c4>] show_stack+0x9c/0x130
[<ffffffff80769550>] dump_stack+0x90/0xd0
[<ffffffff801576d0>] __warn+0x118/0x130
[<ffffffff80157734>] warn_slowpath_fmt+0x4c/0x70
[<ffffffff801b83c0>] irq_domain_associate+0x298/0x2e8
[<ffffffff80a43bb8>] octeon_irq_init_ciu+0x4c8/0x53c
[<ffffffff80a76cbc>] of_irq_init+0x1e0/0x388
[<ffffffff80a452cc>] init_IRQ+0x4c/0xf4
[<ffffffff80a3cc00>] start_kernel+0x404/0x698

Use irq_alloc_desc_at() to avoid the above problem.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@nokia.com>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/cavium-octeon/octeon-irq.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/mips/cavium-octeon/octeon-irq.c b/arch/mips/cavium-octeon/octeon-irq.c
index a27b3d70393f7..657e626cc41eb 100644
--- a/arch/mips/cavium-octeon/octeon-irq.c
+++ b/arch/mips/cavium-octeon/octeon-irq.c
@@ -127,6 +127,16 @@ static void octeon_irq_free_cd(struct irq_domain *d, unsigned int irq)
 static int octeon_irq_force_ciu_mapping(struct irq_domain *domain,
 					int irq, int line, int bit)
 {
+	struct device_node *of_node;
+	int ret;
+
+	of_node = irq_domain_get_of_node(domain);
+	if (!of_node)
+		return -EINVAL;
+	ret = irq_alloc_desc_at(irq, of_node_to_nid(of_node));
+	if (ret < 0)
+		return ret;
+
 	return irq_domain_associate(domain, irq, line << 6 | bit);
 }
 
-- 
2.35.1

