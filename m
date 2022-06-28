Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9AB3655D0AC
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jun 2022 15:08:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243625AbiF1CVf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Jun 2022 22:21:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243548AbiF1CVC (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Jun 2022 22:21:02 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98A2524958;
        Mon, 27 Jun 2022 19:20:43 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 43C1CB818E4;
        Tue, 28 Jun 2022 02:20:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 240BEC34115;
        Tue, 28 Jun 2022 02:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656382841;
        bh=AcjC1jjE+jTG9hEhE6UMQJwpk9S501pZki2orxkU38E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CBhhBwCUBDrUT31LWSAgthk9aSgbY0vfndqo7/LWpcz62MjGLb/IUe0yPWqS7AsRZ
         Z4HQWDQVYFdA8+L9bvmyPXcCUeTje+wn8NCtXJ5fArzxyrFTq0AK0EJDwxC56O2xRG
         vyvuw1129XQgnE/hcVNESnkABAkVhpk5UFRiHG62LZxoHZwRsp9cUNPjW+3lifKwvp
         aYTjUTKobdFbG/056Gfy35c9+0mmWOWOacVbo36kkyXFpuhtIO4duEsN61sc1oIFUo
         QJkIfX21XC6sCvcO1is9aX9hRj898ZsdE2irALSBV83wtAaDlH0GilBiwF9B9PEXg0
         QFlh8vU2T3sKw==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Liang He <windhl@126.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Sasha Levin <sashal@kernel.org>, john@phrozen.org,
        linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 5.18 46/53] mips: lantiq: Add missing of_node_put() in irq.c
Date:   Mon, 27 Jun 2022 22:18:32 -0400
Message-Id: <20220628021839.594423-46-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628021839.594423-1-sashal@kernel.org>
References: <20220628021839.594423-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Liang He <windhl@126.com>

[ Upstream commit 3748d2185ac4c2c6f80989672253aad909ecaf95 ]

In icu_of_init(), of_find_compatible_node() will return a node
pointer with refcount incremented. We should use of_node_put()
when it is not used anymore.

Signed-off-by: Liang He <windhl@126.com>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/lantiq/irq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/lantiq/irq.c b/arch/mips/lantiq/irq.c
index b732495f138a..20622bf0a9b3 100644
--- a/arch/mips/lantiq/irq.c
+++ b/arch/mips/lantiq/irq.c
@@ -408,6 +408,7 @@ int __init icu_of_init(struct device_node *node, struct device_node *parent)
 		if (!ltq_eiu_membase)
 			panic("Failed to remap eiu memory");
 	}
+	of_node_put(eiu_node);
 
 	return 0;
 }
-- 
2.35.1

