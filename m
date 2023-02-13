Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28D9869433F
	for <lists+linux-mips@lfdr.de>; Mon, 13 Feb 2023 11:43:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230280AbjBMKnd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Feb 2023 05:43:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230043AbjBMKnX (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 13 Feb 2023 05:43:23 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84C2815C99;
        Mon, 13 Feb 2023 02:43:20 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 0D6FEB8109E;
        Mon, 13 Feb 2023 10:43:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31AB3C4322C;
        Mon, 13 Feb 2023 10:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676284997;
        bh=g/DpJ6yqRzfoadiSwGWD2YQN47sUT9bIGP4aY7Lvgjw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=glMpyAhkAbJ7h3BBqwb4f0ARTML3lseUBAkZZzPKsbr28Bv99r2ki1DZ3qh9FvAWD
         rthsWhwZVcwcniOAAT+MwV051VFqlSuYzcmjbcCGUn797bfROURDGQWQg1ZWdw/Bat
         w73nIBC7EfTy3BqUtqjlsOyYRNIrI4RexCrZOvch5o5Hue+ZXwheJWtgIdYs9DNeas
         FixwYWxG4aix2o1/KrVZoLWcrHDB+u9hwqkGXsT4IYJtZkhNGxaRwSsTSmUMrC6FRy
         xAcaTew4Ao5zm+Sd2BhdgVCWZYayJwALmb1AfT1AcFkHR/A3i6hAEtFhKoHmeDOcxS
         mgxVvkVzBonYQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan+linaro@kernel.org>)
        id 1pRWJc-0004Wx-8b; Mon, 13 Feb 2023 11:44:08 +0100
From:   Johan Hovold <johan+linaro@kernel.org>
To:     Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
Cc:     x86@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Subject: [PATCH v6 15/20] irqchip/gic-v2m: Use irq_domain_create_hierarchy()
Date:   Mon, 13 Feb 2023 11:42:57 +0100
Message-Id: <20230213104302.17307-16-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213104302.17307-1-johan+linaro@kernel.org>
References: <20230213104302.17307-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use the irq_domain_create_hierarchy() helper to create the hierarchical
domain, which both serves as documentation and avoids poking at
irqdomain internals.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>
Tested-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/irqchip/irq-gic-v2m.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v2m.c b/drivers/irqchip/irq-gic-v2m.c
index f4d7eeb13951..f1e75b35a52a 100644
--- a/drivers/irqchip/irq-gic-v2m.c
+++ b/drivers/irqchip/irq-gic-v2m.c
@@ -287,15 +287,14 @@ static __init int gicv2m_allocate_domains(struct irq_domain *parent)
 	if (!v2m)
 		return 0;
 
-	inner_domain = irq_domain_create_tree(v2m->fwnode,
-					      &gicv2m_domain_ops, v2m);
+	inner_domain = irq_domain_create_hierarchy(parent, 0, 0, v2m->fwnode,
+						   &gicv2m_domain_ops, v2m);
 	if (!inner_domain) {
 		pr_err("Failed to create GICv2m domain\n");
 		return -ENOMEM;
 	}
 
 	irq_domain_update_bus_token(inner_domain, DOMAIN_BUS_NEXUS);
-	inner_domain->parent = parent;
 	pci_domain = pci_msi_create_irq_domain(v2m->fwnode,
 					       &gicv2m_msi_domain_info,
 					       inner_domain);
-- 
2.39.1

