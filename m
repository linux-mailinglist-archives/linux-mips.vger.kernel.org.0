Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 835FC382223
	for <lists+linux-mips@lfdr.de>; Mon, 17 May 2021 02:01:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234661AbhEQAC0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 16 May 2021 20:02:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234603AbhEQACZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 16 May 2021 20:02:25 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A859CC061573;
        Sun, 16 May 2021 17:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=5N5TZIB7JJZreCRW9HvNKNO9Wl72I2WwD3P3vzvDcW4=; b=sNSxULF17bZQDjtBgEa8JU4qlw
        0+Gv1/U2e8pggmDmPj0u0H0y9Gq6lDFE3yUZ1Qs2tGP5yRTbxIP2sWCMaYPXddHnMKxr0PnTZRV/U
        T608j5ZxnLY5cemAvZ8Ux2qCWCvhBYp/UD3nBiL+BmG7rAalk2u3XHAP2YOCbt3WO8N2TDYTnpyDI
        g2QCM3RlYghwIFcW+koJ19UlcEfGly8xaLdR93WoAnp+VQbJ/thdfC96MLUFbGYbWqy+KFyWwpQeJ
        TGNhZmd1TRC2PhN+zXBGnaMrq89DmJ7L/ekWfBUE1DM9M0mutW9IPS2CVHQ2kVGFaALWD2zuT3lWe
        dCukbpug==;
Received: from [2601:1c0:6280:3f0::7376] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1liQh2-00DMzd-Th; Mon, 17 May 2021 00:01:09 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org,
        Manuel Lauss <manuel.lauss@googlemail.com>,
        Ralf Baechle <ralf@linux-mips.org>
Subject: [PATCH] MIPS: alchemy: xxs1500: add gpio-au1000.h header file
Date:   Sun, 16 May 2021 17:01:08 -0700
Message-Id: <20210517000108.26015-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

board-xxs1500.c references 2 functions without declaring them, so add
the header file to placate the build.

../arch/mips/alchemy/board-xxs1500.c: In function 'board_setup':
../arch/mips/alchemy/board-xxs1500.c:56:2: error: implicit declaration of function 'alchemy_gpio1_input_enable' [-Werror=implicit-function-declaration]
   56 |  alchemy_gpio1_input_enable();
../arch/mips/alchemy/board-xxs1500.c:57:2: error: implicit declaration of function 'alchemy_gpio2_enable'; did you mean 'alchemy_uart_enable'? [-Werror=implicit-function-declaration]
   57 |  alchemy_gpio2_enable();

Fixes: 8e026910fcd4 ("MIPS: Alchemy: merge GPR/MTX-1/XXS1500 board code into single files")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org
Cc: Manuel Lauss <manuel.lauss@googlemail.com>
Cc: Ralf Baechle <ralf@linux-mips.org>
---
 arch/mips/alchemy/board-xxs1500.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20210514.orig/arch/mips/alchemy/board-xxs1500.c
+++ linux-next-20210514/arch/mips/alchemy/board-xxs1500.c
@@ -18,6 +18,7 @@
 #include <asm/reboot.h>
 #include <asm/setup.h>
 #include <asm/mach-au1x00/au1000.h>
+#include <asm/mach-au1x00/gpio-au1000.h>
 #include <prom.h>
 
 const char *get_system_type(void)
