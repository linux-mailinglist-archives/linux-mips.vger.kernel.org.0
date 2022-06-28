Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84F7F55D176
	for <lists+linux-mips@lfdr.de>; Tue, 28 Jun 2022 15:09:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244563AbiF1C3e (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 27 Jun 2022 22:29:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244848AbiF1C2L (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 27 Jun 2022 22:28:11 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BE1124F3A;
        Mon, 27 Jun 2022 19:26:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id ACFF661934;
        Tue, 28 Jun 2022 02:26:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E19FC341CA;
        Tue, 28 Jun 2022 02:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656383210;
        bh=f8urQyhZfNDI/vhswW1hvS7izR56LtuFpYxvqdIwRGs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rsfhvMCKtPf7wWu1cO0mseI5X+WEjJZhL2k7N+ywFQ7Gri7N27q43tQKOlPPalCHp
         mFUE1A3piQIi1G3Fo8+vUpJoSiYDOWiGMXs8RMoqibh3FDf/SuczixrKeKowXSNnBy
         pNidXoMV+N10ijjko4/u1j7LwUw0Qdlq98ggQH+xhOHffw0cDAwg/qTNZSkp6MdxBj
         sYmJ8WLc6xL2dp9lYkTLqBrxEYJlcAeRcOMoemDSrkzKuGacfe2hkwx8sPwrSgDyB+
         BjbQ/aSqXCtkkLOQ6mIp4npRmxkpdTL7azPjpx+jB9h4YPjSSwYG0Z1/ETagPyrNF8
         lmJY6/+yXePng==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Liang He <windhl@126.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Sasha Levin <sashal@kernel.org>, john@phrozen.org,
        xkernel.wang@foxmail.com, linux-mips@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 14/17] mips: lantiq: xway: Fix refcount leak bug in sysctrl
Date:   Mon, 27 Jun 2022 22:26:12 -0400
Message-Id: <20220628022615.596977-14-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220628022615.596977-1-sashal@kernel.org>
References: <20220628022615.596977-1-sashal@kernel.org>
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

[ Upstream commit 76695592711ef1e215cc24ed3e1cd857d7fc3098 ]

In ltq_soc_init(), of_find_compatible_node() will return a node
pointer with refcount incremented. We should use of_node_put() when
it is not used anymore.

Signed-off-by: Liang He <windhl@126.com>
Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/mips/lantiq/xway/sysctrl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/mips/lantiq/xway/sysctrl.c b/arch/mips/lantiq/xway/sysctrl.c
index 1b1142c7bb85..454f10a8db50 100644
--- a/arch/mips/lantiq/xway/sysctrl.c
+++ b/arch/mips/lantiq/xway/sysctrl.c
@@ -439,6 +439,10 @@ void __init ltq_soc_init(void)
 			of_address_to_resource(np_ebu, 0, &res_ebu))
 		panic("Failed to get core resources");
 
+	of_node_put(np_pmu);
+	of_node_put(np_cgu);
+	of_node_put(np_ebu);
+
 	if (!request_mem_region(res_pmu.start, resource_size(&res_pmu),
 				res_pmu.name) ||
 		!request_mem_region(res_cgu.start, resource_size(&res_cgu),
-- 
2.35.1

