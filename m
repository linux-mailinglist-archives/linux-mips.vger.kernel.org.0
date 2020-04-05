Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0AE019E89C
	for <lists+linux-mips@lfdr.de>; Sun,  5 Apr 2020 04:52:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726426AbgDECv2 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 4 Apr 2020 22:51:28 -0400
Received: from mail.kernel.org ([198.145.29.99]:44846 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726410AbgDECv1 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 4 Apr 2020 22:51:27 -0400
Received: from mail.kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C61992072B;
        Sun,  5 Apr 2020 02:51:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586055087;
        bh=pMU5hjfEYql1E5373yITTzoPsv8h4BkUjm9FjPsRF6Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=LeXbzDddUVoAl8jKGJYhcF45v/1x6GoE+kwTC9C8U9qWMkRP4FEUJ8On7moMzd6Pu
         /T1a9RH4RIAoeh2gxqJdKnrWpTRHvz8xVlf250JmP5i2FAk9q6QeJkFcGSUThQEy4Z
         S0KHsYag+QN6BLylqfbKwJFNpqHfFoYISGMfFbE4=
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Subject: [PATCH 5/9] MIPS: Remove redundant CLKDEV_LOOKUP selects
Date:   Sat,  4 Apr 2020 19:51:19 -0700
Message-Id: <20200405025123.154688-6-sboyd@kernel.org>
X-Mailer: git-send-email 2.26.0.292.g33ef6b2f38-goog
In-Reply-To: <20200405025123.154688-1-sboyd@kernel.org>
References: <20200405025123.154688-1-sboyd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The ATH79 config selects COMMON_CLK already, and the COMMON_CLK config
option already selects CLKDEV_LOOKUP, and CLKDEV_LOOKUP already selects
HAVE_CLK so it's redundant to have these selected again.

Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: <linux-mips@vger.kernel.org>
Signed-off-by: Stephen Boyd <sboyd@kernel.org>
---
 arch/mips/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 797d7f1ad5fe..e53a8dd5c19b 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -209,9 +209,7 @@ config ATH79
 	select DMA_NONCOHERENT
 	select GPIOLIB
 	select PINCTRL
-	select HAVE_CLK
 	select COMMON_CLK
-	select CLKDEV_LOOKUP
 	select IRQ_MIPS_CPU
 	select SYS_HAS_CPU_MIPS32_R2
 	select SYS_HAS_EARLY_PRINTK
-- 
Sent by a computer, using git, on the internet

