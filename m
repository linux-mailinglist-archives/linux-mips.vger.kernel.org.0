Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 827493D8BA9
	for <lists+linux-mips@lfdr.de>; Wed, 28 Jul 2021 12:26:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231504AbhG1K0S (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 28 Jul 2021 06:26:18 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:52686
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229574AbhG1K0R (ORCPT
        <rfc822;linux-mips@vger.kernel.org>);
        Wed, 28 Jul 2021 06:26:17 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id C49E13F32F;
        Wed, 28 Jul 2021 10:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627467974;
        bh=RzFO0WvxXjGz6K02P8hc8WjBrShTRvNxHsMes42WDWA=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=V35G4kXwPgcaICMLJz8EqKIbR/HJ6Megt927S7f3dYO9prJmBXboiO8tdXxvbvrAs
         Lv8dHjB21kw7JPywxiagv6LMDyTy6FyM9BZtGAUpjYzGs5UuJyo+J6EYAprJv03POp
         hjKftKHMgV+0eCQRl9Wo3qGeeM2dCPkzpfUyXjUtNUIf2f59ZgMz/mXSvmB5TEHNLC
         XWUaEXlbVPJAp72XDgKgZzLRCHYZjv8h49KLpNwsg7yxUfnznpvc9lzi6HGvLEYQyD
         TXsZZYPgtbUmlzXcGrqt46wWVPksf5teQ0bQLwdxwZH0qkmyo0Zd4i4nvXo9806eEc
         PGYg6zLAaYeqA==
From:   Colin King <colin.king@canonical.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: Alchemy: Fix spelling contraction "cant" -> "can't"
Date:   Wed, 28 Jul 2021 11:26:12 +0100
Message-Id: <20210728102612.171012-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

There is a spelling mistake in a pr_warn message. Fix it.

Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 arch/mips/alchemy/devboards/db1200.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/alchemy/devboards/db1200.c b/arch/mips/alchemy/devboards/db1200.c
index 421d651433b6..1864eb935ca5 100644
--- a/arch/mips/alchemy/devboards/db1200.c
+++ b/arch/mips/alchemy/devboards/db1200.c
@@ -835,7 +835,7 @@ int __init db1200_dev_setup(void)
 	if (!IS_ERR(c)) {
 		pfc = clk_round_rate(c, 50000000);
 		if ((pfc < 1) || (abs(50000000 - pfc) > 2500000))
-			pr_warn("DB1200: cant get I2C close to 50MHz\n");
+			pr_warn("DB1200: can't get I2C close to 50MHz\n");
 		else
 			clk_set_rate(c, pfc);
 		clk_prepare_enable(c);
-- 
2.31.1

