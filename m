Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C11F1A2F56
	for <lists+linux-mips@lfdr.de>; Thu,  9 Apr 2020 08:45:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgDIGoU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 9 Apr 2020 02:44:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:38004 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726642AbgDIGoU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 9 Apr 2020 02:44:20 -0400
Received: from mail.kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 39B612137B;
        Thu,  9 Apr 2020 06:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586414660;
        bh=pMU5hjfEYql1E5373yITTzoPsv8h4BkUjm9FjPsRF6Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=t0ObWNqNYbBXcHNBmJ/VZBKiqi28Ia1JFPwGr9kBh+HZtyjk3fhb5Z1CesnasvObu
         aVmgLMeQHo752wkkefR5vmjBi27R+JANWJY81WaV1aH/KBLL7PMTVUTwbHVBg9rZY4
         Jxh9+Zkdhpm48Q6/oGsHZwgNHJA07djaHgcup4dM=
From:   Stephen Boyd <sboyd@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org
Subject: [PATCH v2 05/10] MIPS: Remove redundant CLKDEV_LOOKUP selects
Date:   Wed,  8 Apr 2020 23:44:11 -0700
Message-Id: <20200409064416.83340-6-sboyd@kernel.org>
X-Mailer: git-send-email 2.26.0.292.g33ef6b2f38-goog
In-Reply-To: <20200409064416.83340-1-sboyd@kernel.org>
References: <20200409064416.83340-1-sboyd@kernel.org>
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

