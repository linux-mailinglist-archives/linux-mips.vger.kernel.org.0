Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7CBB1C22E7
	for <lists+linux-mips@lfdr.de>; Sat,  2 May 2020 06:25:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbgEBEZz (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 2 May 2020 00:25:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726058AbgEBEZy (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 2 May 2020 00:25:54 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D08E5C061A0C;
        Fri,  1 May 2020 21:25:54 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id r14so2544962pfg.2;
        Fri, 01 May 2020 21:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=kiUp2VuxecaGnL/1oYSuzHIIFHuTpPDWSWLWMhnipIs=;
        b=iav88mJyD4okdvdlrlfIEySidY5usjuh3bgPsJWa7+0nKaQ0q0C7mkHJcK8M2WyjCN
         eZ7TfNwZc7Dsw8UsCsNIcJ+8J3TmgeEHAFmXuhew4uPIS5hf3a/EqOLI4mlodmvoTF5F
         X6KxCi/UR5e2lMWNwr5fe3k592cULvXzQCBgA+A0actihCsfmCsZfE4JKNQ6QNznOmf7
         KIUFqOYJYzesac/VlkBlj25GsPmbIst+E9yEdgXhkYuVB3w+GC4RlAF7mLTBAMZWs6Nh
         Zvk/mNJxPpDt5xTmVVrRAtcazBAh/TQRQW8JIKJ44JhoBEAPsG30cJAjNja29A6km96T
         dXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=kiUp2VuxecaGnL/1oYSuzHIIFHuTpPDWSWLWMhnipIs=;
        b=QT8fE/vR3N/AmK6UFciZIWy9MdsD/EjATJKderEnTOfRDTjESvA1Uft8KZW3bQf2bI
         v/EZiF3wTKq+OhWGg2257GTgWWKd2Rxyp992l++ERUuFZBsQKjZPJlWGVuvM01iKM8dV
         rD/QvrA3Nu+sF6tv7u0nXiQ23ioFMekeg/xwhjEnhgGbFH7IjVb3TYPEJ6xk2hAHRLEt
         Idi4nR3GPZi5UDP3I3cfivTSCXLYLOJdj3SYZrXLPpXch1YKHwODK811NHEt+GJN7EX3
         oGaJkV9DzfuxYyYRK+TCQd83a8HA8BCLxHnIJn/0FO460+DRdiUb0+yvllDGm/gkihsM
         mi5w==
X-Gm-Message-State: AGi0PuZx7y32N8A5KrZoqnyUq0JtuiDkeJ4PcBkOnFMClMyQ6xmruDx8
        D7tiFJi+IAUlLlHgL6+uO7+vSFAL
X-Google-Smtp-Source: APiQypLiFLElTqhkKYwGNcLAdbFzHMCcnD37IX+04dzbqo/uyPZkqZrq1s+SwZIkvCXCr+mHKQiGYw==
X-Received: by 2002:aa7:95b2:: with SMTP id a18mr7616796pfk.91.1588393554216;
        Fri, 01 May 2020 21:25:54 -0700 (PDT)
Received: from localhost.localdomain (unknown-224-80.windriver.com. [147.11.224.80])
        by smtp.gmail.com with ESMTPSA id x13sm3163431pgh.63.2020.05.01.21.25.53
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 May 2020 21:25:53 -0700 (PDT)
From:   Bin Meng <bmeng.cn@gmail.com>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Bin Meng <bin.meng@windriver.com>
Subject: [PATCH] mips: Drop CONFIG_MTD_M25P80 in various defconfig files
Date:   Fri,  1 May 2020 21:25:49 -0700
Message-Id: <1588393549-31371-1-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 1.7.1
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Bin Meng <bin.meng@windriver.com>

Drop CONFIG_MTD_M25P80 that was removed in
commit b35b9a10362d ("mtd: spi-nor: Move m25p80 code in spi-nor.c")

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 arch/mips/configs/ath79_defconfig             | 1 -
 arch/mips/configs/db1xxx_defconfig            | 1 -
 arch/mips/configs/generic/board-ocelot.config | 1 -
 arch/mips/configs/pistachio_defconfig         | 1 -
 arch/mips/configs/rt305x_defconfig            | 1 -
 5 files changed, 5 deletions(-)

diff --git a/arch/mips/configs/ath79_defconfig b/arch/mips/configs/ath79_defconfig
index 3d14d67..96622a2 100644
--- a/arch/mips/configs/ath79_defconfig
+++ b/arch/mips/configs/ath79_defconfig
@@ -46,7 +46,6 @@ CONFIG_MTD_JEDECPROBE=y
 CONFIG_MTD_CFI_AMDSTD=y
 CONFIG_MTD_COMPLEX_MAPPINGS=y
 CONFIG_MTD_PHYSMAP=y
-CONFIG_MTD_M25P80=y
 CONFIG_MTD_SPI_NOR=y
 CONFIG_NETDEVICES=y
 CONFIG_ATH9K=m
diff --git a/arch/mips/configs/db1xxx_defconfig b/arch/mips/configs/db1xxx_defconfig
index e6f3e8e..b8bd663 100644
--- a/arch/mips/configs/db1xxx_defconfig
+++ b/arch/mips/configs/db1xxx_defconfig
@@ -92,7 +92,6 @@ CONFIG_MTD_CFI=y
 CONFIG_MTD_CFI_ADV_OPTIONS=y
 CONFIG_MTD_CFI_AMDSTD=y
 CONFIG_MTD_PHYSMAP=y
-CONFIG_MTD_M25P80=y
 CONFIG_MTD_SST25L=y
 CONFIG_MTD_RAW_NAND=y
 CONFIG_MTD_NAND_ECC_SW_BCH=y
diff --git a/arch/mips/configs/generic/board-ocelot.config b/arch/mips/configs/generic/board-ocelot.config
index 7626f2a..5107095 100644
--- a/arch/mips/configs/generic/board-ocelot.config
+++ b/arch/mips/configs/generic/board-ocelot.config
@@ -9,7 +9,6 @@ CONFIG_GENERIC_PHY=y
 CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_BLOCK=y
-CONFIG_MTD_M25P80=y
 CONFIG_MTD_RAW_NAND=y
 CONFIG_MTD_NAND_PLATFORM=y
 CONFIG_MTD_SPI_NOR=y
diff --git a/arch/mips/configs/pistachio_defconfig b/arch/mips/configs/pistachio_defconfig
index 24e0718..b9adf15 100644
--- a/arch/mips/configs/pistachio_defconfig
+++ b/arch/mips/configs/pistachio_defconfig
@@ -127,7 +127,6 @@ CONFIG_DEBUG_DEVRES=y
 CONFIG_CONNECTOR=y
 CONFIG_MTD=y
 CONFIG_MTD_BLOCK=y
-CONFIG_MTD_M25P80=y
 CONFIG_MTD_SPI_NOR=y
 CONFIG_MTD_UBI=y
 CONFIG_MTD_UBI_BLOCK=y
diff --git a/arch/mips/configs/rt305x_defconfig b/arch/mips/configs/rt305x_defconfig
index 8c2ead5..fec5851 100644
--- a/arch/mips/configs/rt305x_defconfig
+++ b/arch/mips/configs/rt305x_defconfig
@@ -76,7 +76,6 @@ CONFIG_MTD_CFI_AMDSTD=y
 CONFIG_MTD_COMPLEX_MAPPINGS=y
 CONFIG_MTD_PHYSMAP=y
 CONFIG_MTD_PHYSMAP_OF=y
-CONFIG_MTD_M25P80=y
 CONFIG_MTD_SPI_NOR=y
 CONFIG_EEPROM_93CX6=m
 CONFIG_SCSI=y
-- 
2.7.4

