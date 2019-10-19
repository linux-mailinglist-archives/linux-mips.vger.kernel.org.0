Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 441C5DD74D
	for <lists+linux-mips@lfdr.de>; Sat, 19 Oct 2019 10:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727800AbfJSIMi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 19 Oct 2019 04:12:38 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44588 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbfJSIMi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 19 Oct 2019 04:12:38 -0400
Received: by mail-wr1-f68.google.com with SMTP id z9so8490193wrl.11
        for <linux-mips@vger.kernel.org>; Sat, 19 Oct 2019 01:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X0uxe9pE/RDI6F5O6Gfln4I3zLHnZX8cjgLjUWy62TA=;
        b=qM4AfRWOXVT82dGKx9dKoAbTypTR/pTMMUi/sguMd3BJEwx4miZj3q/V/4sCAk05aC
         GXkJKMbMNYDV+aqsXv2hLJHvLmdZcHWrwGPdRBd61efszFdCs0ZQyNqOdQsyUTKGJueE
         6BMaJeR2NIJN/ZotlVnuSvtmAz6IipqiJvMN3+1aDpHwpMnpk0590st7ixTeRX88D61K
         EhUlYbfbr62rvDzfTyh/pSKG6qITvbWCPvbVry8344Ar2yz9iVKi6eTwPls8Sf4hdgdF
         INEi259r0JrHicruISJCx94vYUfYm5icwau0vkg0SDkVPv4WuBQYM0VSuM0vRtc9MGRs
         5CGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X0uxe9pE/RDI6F5O6Gfln4I3zLHnZX8cjgLjUWy62TA=;
        b=UNe3rV4oaIOBLfPOuTmIohkMrZt0AbSjDZaZYke1ZImOhLVbzcuCerc8wBHSCO4Ih5
         gGLUb7xZOVxlGyGdAsJ6/xulQc8+jG+QEq0hh3kVgqo0OSWC9EsAgQHTckXbOC6TAVaD
         xJXVXTd+Mox6YDLTiVdGX7Gn4iWhEyGAJIUmtLlJnngwcdyXeXSLmzZGrvc5TqcdfWy0
         AkjS5WGbRxIVUpfLZBr2m27097lldBuqkADCuHEPWxGrcO1Kf0hk9zDaiNlhKJUPakMH
         CpW89NDgm1LFEhXz2YVebmXMQ1FmDWgiDxrwN7vW92Svktv//qbJuC3GIQ5P8WgHHwA+
         dixA==
X-Gm-Message-State: APjAAAUsyDEdq6/jhHgDn9Nnh1h7uIu3L/eOsVP4y/9UDqPFmfABwSGg
        /lLcI5+zwOyxKie31M5LJhM=
X-Google-Smtp-Source: APXvYqzVY1Po1tRUwUMrv9OLNzWRMig/9A46vGQsky0opcJDZQODqo/mL05/GoF+8lqa8O7AIXx6wQ==
X-Received: by 2002:adf:f342:: with SMTP id e2mr11695037wrp.61.1571472756293;
        Sat, 19 Oct 2019 01:12:36 -0700 (PDT)
Received: from localhost.localdomain (212.red-81-37-113.dynamicip.rima-tde.net. [81.37.113.212])
        by smtp.gmail.com with ESMTPSA id a3sm7531947wmc.3.2019.10.19.01.12.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 19 Oct 2019 01:12:35 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     Hauke Mehrtens <hauke@hauke-m.de>, ralf@linux-mips.org,
        jhogan@kernel.org, john@phrozen.org, NeilBrown <neil@brown.name>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-mips@vger.kernel.org
Subject: [PATCH] MIPS: ralink: enable PCI support only if driver for mt7621 SoC is selected
Date:   Sat, 19 Oct 2019 10:12:33 +0200
Message-Id: <20191019081233.7337-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <87v9sopd5f.fsf@notabene.neil.brown.name>
References: <87v9sopd5f.fsf@notabene.neil.brown.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Some versions of SoC MT7621 have three PCI express hosts. Some boards
make use of those PCI through the staging driver mt7621-pci. Recently
PCI support has been removed from MT7621 Soc kernel configuration due
to a build error. This makes imposible to compile staging driver and
produces a regression for gnubee based boards. Enable support for PCI
again but enable it only if staging mt7621-pci driver is selected.

Fixes: c4d48cf5e2f0 ("MIPS: ralink: deactivate PCI support for SOC_MT7621")

Cc: Hauke Mehrtens <hauke@hauke-m.de>
Cc: ralf@linux-mips.org
Cc: jhogan@kernel.org
Cc: john@phrozen.org
Cc: NeilBrown <neil@brown.name>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-mips@vger.kernel.org
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/ralink/Kconfig           | 1 +
 drivers/staging/mt7621-pci/Kconfig | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/ralink/Kconfig b/arch/mips/ralink/Kconfig
index 1434fa60f3db..94e9ce994494 100644
--- a/arch/mips/ralink/Kconfig
+++ b/arch/mips/ralink/Kconfig
@@ -51,6 +51,7 @@ choice
 		select MIPS_GIC
 		select COMMON_CLK
 		select CLKSRC_MIPS_GIC
+		select HAVE_PCI if PCI_MT7621
 endchoice
 
 choice
diff --git a/drivers/staging/mt7621-pci/Kconfig b/drivers/staging/mt7621-pci/Kconfig
index af928b75a940..ce58042f2f21 100644
--- a/drivers/staging/mt7621-pci/Kconfig
+++ b/drivers/staging/mt7621-pci/Kconfig
@@ -2,7 +2,6 @@
 config PCI_MT7621
 	tristate "MediaTek MT7621 PCI Controller"
 	depends on RALINK
-	depends on PCI
 	select PCI_DRIVERS_GENERIC
 	help
 	  This selects a driver for the MediaTek MT7621 PCI Controller.
-- 
2.19.1

