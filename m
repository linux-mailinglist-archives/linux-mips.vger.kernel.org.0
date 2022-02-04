Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 475894A9476
	for <lists+linux-mips@lfdr.de>; Fri,  4 Feb 2022 08:22:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350100AbiBDHWF (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Feb 2022 02:22:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237760AbiBDHWB (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 4 Feb 2022 02:22:01 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19BBEC061714;
        Thu,  3 Feb 2022 23:22:01 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id r131so135882wma.1;
        Thu, 03 Feb 2022 23:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p6DGI5sVIhhj3OfLgZuXsgd+zv/1jmTBmFJHvIA+N+Q=;
        b=G98XBVlzBs42R1W1bzlN3A9pjwssWOb+icktgcrKOi4tEu2yfPSEJC6RZCh3TbyXOI
         qDtQJsT+yY+a6VxueTToxwT70fegCf9gkjkWYKZP3yU1iNAY95Sv3YKRINgcDw78O7da
         6hdExCMTFLyqi05R2i583VgeoYB+p/ZEDn3HJU2D/zaHWgIi8DcUtgjmPtCbBMCvhDQ0
         mpuHGvF8qYA6Fk7jVodLcCTampRGP/AiemBYCjFX61cdWUpUppVT+d0FOQMQoINaYwPV
         tM7zIFuemqrUe+K4o9vEC3QdMPr6hLBGQ9E9ke3pydbr38Crk+VhrhxrmpP50XVIX+12
         JUOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p6DGI5sVIhhj3OfLgZuXsgd+zv/1jmTBmFJHvIA+N+Q=;
        b=lUKoNIJ6sskE+eNdmdooVSe7L4GIa6hBmqnNF2i0AaFL+GO7k/9gpLs4cwyDz35GUM
         N26yMBJfcL6n8Vw9A5SjMxcofsk2gW3g1ilqpTnWX5cnMyt8LrCD+nTCpxYv/wWepnHh
         rI/y3ylwdtIDt28+hQspxd21U1Ub0UkzVHpDXdbMnLJs2zvcvHpO8mI0Xt0JsVWJjGDs
         pujbEbYUUy0y61bNJET0oGy3eoysWNG+bcjOGSeu6QmSFIwbDapwuEAAdEqO08v5d3Ch
         wvVe8LRJOjkt89wMYzXITEQ3ndlvwh+MvjH2NWC0KOeLrBTEVvvz69Ef89gALSiWBHrk
         J+JQ==
X-Gm-Message-State: AOAM532qAvV09C9YYnuhNTqg5UTFvUeNeeWzmY+HNf+siqaYdxJNQPJ+
        zeZzU8ASpqzZ6eBB54/vKEo=
X-Google-Smtp-Source: ABdhPJz+NGiTp+ixvIXLo1LDOKLYuGdbU3PtRrPqFiRJw1ay9KncCecOk2c0SucPFOnZG9cwkC/7TQ==
X-Received: by 2002:a05:600c:3641:: with SMTP id y1mr1090297wmq.44.1643959319580;
        Thu, 03 Feb 2022 23:21:59 -0800 (PST)
Received: from hp-power-15.promwad.corp (mm-89-21-212-37.vitebsk.dynamic.pppoe.byfly.by. [37.212.21.89])
        by smtp.gmail.com with ESMTPSA id c13sm1096524wrv.24.2022.02.03.23.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Feb 2022 23:21:59 -0800 (PST)
From:   Siarhei Volkau <lis8215@gmail.com>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-mips@vger.kernel.org,
        linux-clk@vger.kernel.org, Siarhei Volkau <lis8215@gmail.com>
Subject: [PATCH v2 1/1] clk: jz4725b: fix mmc0 clock gating
Date:   Fri,  4 Feb 2022 10:21:41 +0300
Message-Id: <20220204072141.542909-2-lis8215@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220204072141.542909-1-lis8215@gmail.com>
References: <ZFOR6R.SY2BLN8DYNHG3@crapouillou.net>
 <20220204072141.542909-1-lis8215@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The mmc0 clock gate bit was mistakenly assigned to "i2s" clock.
You can find that the same bit is assigned to "mmc0" too.
It leads to mmc0 hang for a long time after any sound activity
also it  prevented PM_SLEEP to work properly.
I guess it was introduced by copy-paste from jz4740 driver
where it is really controls I2S clock gate.

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

