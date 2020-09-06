Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CBFD25F02C
	for <lists+linux-mips@lfdr.de>; Sun,  6 Sep 2020 21:30:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbgIFTaz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 6 Sep 2020 15:30:55 -0400
Received: from crapouillou.net ([89.234.176.41]:35906 "EHLO crapouillou.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726623AbgIFTay (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 6 Sep 2020 15:30:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1599420591; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=y2/qoY5aq9uuajDol9rdVEk/7JkYe+8OE3f4k4iL/AA=;
        b=Hv3lXfpVEAg+vKMo2Gtv+8JNhZuejVG941fc414L58zwJ6guHtoLy9b28W53xZ6Pd5jOid
        DYGeNwRQF9vspKM/Fa25hcyJw8mmYr07IPQTK0msYJZKWQPOdVLEoIJ35QN/TdUcq3HIHq
        9DvGtwFvISzgrslN2DUyH3ldBRHUKos=
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     "Maciej W . Rozycki" <macro@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Zhou Yanjie <zhouyanjie@wanyeetech.com>, od@zcrc.me,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v3 07/15] MIPS: generic: Init command line with fw_init_cmdline()
Date:   Sun,  6 Sep 2020 21:29:27 +0200
Message-Id: <20200906192935.107086-8-paul@crapouillou.net>
In-Reply-To: <20200906192935.107086-1-paul@crapouillou.net>
References: <20200906192935.107086-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

The function bootcmdline_init() in arch/mips/kernel/setup.c will
populate the boot_command_line string using the parameters hardcoded in
the kernel, and those provided in the devicetree file. Then, it would
append the content of the arcs_cmdline variable, which is filled by the
board's plat_mem_setup() function.

The plat_mem_setup() function for the generic MIPS board would just copy
the current boot_command_line to arcs_cmdline, which is nonsense for two
reasons:
- the result will be appended to the boot_command_line anyway, so all it
  does is duplicate every single parameter on the command line;
- the code did not perform at all what it's supposed to, which is to
  retrieve the parameters passed by the bootloader.

Fix this by calling fw_init_cmdline() in plat_mem_setup(), which will
properly initialize arcs_cmdline to the parameters passed by the
bootloader.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
    v2: New patch
    
    v3: No change

 arch/mips/generic/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/generic/init.c b/arch/mips/generic/init.c
index 805d0135a9f4..029f47ea390c 100644
--- a/arch/mips/generic/init.c
+++ b/arch/mips/generic/init.c
@@ -106,7 +106,7 @@ void __init plat_mem_setup(void)
 	if (mach && mach->fixup_fdt)
 		fdt = mach->fixup_fdt(fdt, mach_match_data);
 
-	strlcpy(arcs_cmdline, boot_command_line, COMMAND_LINE_SIZE);
+	fw_init_cmdline();
 	__dt_setup_arch((void *)fdt);
 }
 
-- 
2.28.0

