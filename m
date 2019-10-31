Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57B5BEAAE0
	for <lists+linux-mips@lfdr.de>; Thu, 31 Oct 2019 08:11:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbfJaHL3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 31 Oct 2019 03:11:29 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51935 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726575AbfJaHL3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 31 Oct 2019 03:11:29 -0400
Received: by mail-wm1-f67.google.com with SMTP id q70so4685438wme.1
        for <linux-mips@vger.kernel.org>; Thu, 31 Oct 2019 00:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TivsPEvFm4qaUB9G8rwk9q9OWD+p6K0607BhqzKZ9ao=;
        b=JsRXkfs5o1eLmugUj28pSX6G/htlIQ7Hp/s1L2qJjBJjK65w3nT8uBRGPwv8/HHPOk
         yC+48R7XvNH4OTyRHC+vee8SuW6v57dfMWE9EtKymjO/qnByXV50mmvXh1Q8zot85al6
         /e/rze/mtV7LuRSPG+eINlO+k3z7p485TYjty2iqdXfHbe8iJLyxrPM7cF7um/3iA8LW
         dGQiR0Pzytv2Dc5wxMHtqE0ddn3NC9M4Tm2DxwtkB/HhkQW8oiCSG1Cs7PRopXlJS1Uw
         PK4GzhAE6IjBT/3gjzvaTfv0VaF6DU1rUVEbBhq4Re7Gmw28XL2+Ei4Ql7qbA///HE6u
         /NjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TivsPEvFm4qaUB9G8rwk9q9OWD+p6K0607BhqzKZ9ao=;
        b=hS/mbY78npPIyuye8KIpP3UnG7C0XICxxjT+U8cTaj/tfVfsl6q+/oESGr02Jab3OI
         ERIMr/Gp8BFgPlJbm9SLysUdafvmRqOUzqxs+OddHl2z83Km8LS9RlMO+rlKEqZJDnQZ
         3N1H1i2OwQi8MD9zF0LG9BBqTGgh+KFr6zQKU4OtAfgJ3Fc4uedboX84YDghlxSckJgL
         /K2yOqaBXpQ08DQaxqzNRPeiXZZI/K20dH/MJhLwkes291zWr9tyV45ghEzDGQr7BEVj
         UeUoqPjA5kwoXEKaIMmFY5kd1+FK5bKjiNbsVgnnFnW2piJ/S7I/g4Yr5vFO2cxrKxYT
         KlDg==
X-Gm-Message-State: APjAAAXK3/e0RfcSBVQV2FT++Vp05zJToFnMV07nKCqHRI28vJZSq/ja
        u3qDi1FIFna9ga7P2BHhtsH77gkp
X-Google-Smtp-Source: APXvYqweaMbtGaXotdr/RYUkmx5DkW1g/Qcrkt+Mdsunto9kE0y14/vhalFsAovIMcTkMnzXXuDWpQ==
X-Received: by 2002:a7b:c011:: with SMTP id c17mr3583645wmb.95.1572505886745;
        Thu, 31 Oct 2019 00:11:26 -0700 (PDT)
Received: from localhost.localdomain (212.red-81-37-113.dynamicip.rima-tde.net. [81.37.113.212])
        by smtp.gmail.com with ESMTPSA id v128sm3466115wmb.14.2019.10.31.00.11.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 31 Oct 2019 00:11:26 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     Hauke Mehrtens <hauke@hauke-m.de>,
        Paul Burton <paul.burton@mips.com>, ralf@linux-mips.org,
        jhogan@kernel.org, john@phrozen.org, NeilBrown <neil@brown.name>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-mips@vger.kernel.org
Subject: [PATCH RESEND] MIPS: ralink: enable PCI support only if driver for mt7621 SoC is selected
Date:   Thu, 31 Oct 2019 08:11:24 +0100
Message-Id: <20191031071124.22102-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.19.1
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
Cc: Paul Burton <paul.burton@mips.com>
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

