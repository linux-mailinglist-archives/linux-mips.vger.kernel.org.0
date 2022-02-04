Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 12F8B4A9393
	for <lists+linux-mips@lfdr.de>; Fri,  4 Feb 2022 06:26:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240534AbiBDF04 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Feb 2022 00:26:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233178AbiBDF04 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 4 Feb 2022 00:26:56 -0500
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0E78C061714;
        Thu,  3 Feb 2022 21:26:55 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id r17so115731wrr.6;
        Thu, 03 Feb 2022 21:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5y7CbqGo9tGcy98gqczYaj1VNL+GY8hZtR1pfedVKY4=;
        b=Kmgt21gfkk8N69FNAi+HcjscEITKuhQsGqNqOum0w/Qb5lIrj43c6O03l0mMT5n2B7
         El4OmcgpXB39jWvURJzja+VcwTC8sLx+Sh6oDH/EIXjwfSHMicV15/5Wi3VyVuIfhnP2
         DJkyAnapYnDBe/9fVD3esDE/dTv4lFi8Dfu0IQGfOrGw29AGYve9DFhPB3QrtOH1rs/c
         oJUSOfqQpbShr7xtNTUEGdGSW/LllmNFe8Wvs3fi1QUpj+0ePseg3Ga+Sjg7n6CRUDLB
         6KnHwin3UjRJZAzx4cdvvOZl12Q+7hvJMVBp6Jup0wEupX/MKHH3J4T0I59UNhZwnq2T
         Y7CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5y7CbqGo9tGcy98gqczYaj1VNL+GY8hZtR1pfedVKY4=;
        b=j8snA3aQc9S74NvTpU9mSGtg+ktShKNH0l2b+PK909ABxAZrckVCYdJ7HefXtG0Hil
         v49wTWh9rSQ7ltp8XWR4XKlt4ULxnK7s2VxW2XhTqQyqI41H9M0bDuRAFZhDUiUA47P5
         UrL6L+/y/7Myka2bBMFA+VX9tWEv1T6r0gcubL2YqJ6jaH20Nket3kt3o/cTQM7l9lVf
         lf3uBGP2ped25aChWD37PouTZW+IVMPSGDgf31fUWHy61Mg/dDrRLrQG9U26O4maCyw8
         ReWYqBsa+qOEWgtwBlnO9ev0iGvG5jrxSnalqxKOrANqhvA4dX2mRCKj4sNZsH1G939W
         iKAw==
X-Gm-Message-State: AOAM532rzmrA3GQoX27wGsGOypcWDZfZZI4sZ8ajrmASFsSsUT0qHXcd
        fg+YDPPfIJaoCQGtiRj0beE=
X-Google-Smtp-Source: ABdhPJyCrgMKRq0AbGn238VPtgoy6ZQxEp7l+FoQsj37GiJjjCu8y5jUO8EYPC0NbnWo/KlJiAszsg==
X-Received: by 2002:a05:6000:1861:: with SMTP id d1mr988966wri.92.1643952414529;
        Thu, 03 Feb 2022 21:26:54 -0800 (PST)
Received: from hp-power-15.promwad.corp (mm-89-21-212-37.vitebsk.dynamic.pppoe.byfly.by. [37.212.21.89])
        by smtp.gmail.com with ESMTPSA id n5sm588145wmq.43.2022.02.03.21.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 21:26:54 -0800 (PST)
From:   Siarhei Volkau <lis8215@gmail.com>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-mips@vger.kernel.org,
        linux-clk@vger.kernel.org, Siarhei Volkau <lis8215@gmail.com>
Subject: [PATCH 1/1] clk: jz4725b: fix mmc0 clock gating
Date:   Fri,  4 Feb 2022 08:26:41 +0300
Message-Id: <20220204052641.538970-2-lis8215@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220204052641.538970-1-lis8215@gmail.com>
References: <20220204052641.538970-1-lis8215@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Signed-off-by: Siarhei Volkau <lis8215@gmail.com>
Tested-by: Siarhei Volkau <lis8215@gmail.com>
---
 drivers/clk/ingenic/jz4725b-cgu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/ingenic/jz4725b-cgu.c b/drivers/clk/ingenic/jz4725b-cgu.c
index 744d136..15d6179 100644
--- a/drivers/clk/ingenic/jz4725b-cgu.c
+++ b/drivers/clk/ingenic/jz4725b-cgu.c
@@ -139,11 +139,10 @@ static const struct ingenic_cgu_clk_info jz4725b_cgu_clocks[] = {
 	},
 
 	[JZ4725B_CLK_I2S] = {
-		"i2s", CGU_CLK_MUX | CGU_CLK_DIV | CGU_CLK_GATE,
+		"i2s", CGU_CLK_MUX | CGU_CLK_DIV,
 		.parents = { JZ4725B_CLK_EXT, JZ4725B_CLK_PLL_HALF, -1, -1 },
 		.mux = { CGU_REG_CPCCR, 31, 1 },
 		.div = { CGU_REG_I2SCDR, 0, 1, 9, -1, -1, -1 },
-		.gate = { CGU_REG_CLKGR, 6 },
 	},
 
 	[JZ4725B_CLK_SPI] = {
-- 
2.35.1

