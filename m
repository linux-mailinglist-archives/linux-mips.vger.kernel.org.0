Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D83073918E3
	for <lists+linux-mips@lfdr.de>; Wed, 26 May 2021 15:32:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234104AbhEZNdg (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 26 May 2021 09:33:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234194AbhEZNdd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 26 May 2021 09:33:33 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E59E4C061756;
        Wed, 26 May 2021 06:32:00 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id b15-20020a17090a550fb029015dad75163dso364971pji.0;
        Wed, 26 May 2021 06:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rnhfCchLZDc9lwMhT0TQRY62P4juld204oIgv5PA9GM=;
        b=kxmY6bowaOjF/ClDUyUMMCzy44ovJXU3pIOmbWNgw7P1HWQ8t6nGLlebaYa2vNmp1C
         1fy3+UOk27ZnVJnYPu9xcSVsmXwEaXij1vuBR39+jl3UAIGXZDXsUbwadOXXgKhaI7gS
         ppJRgx9lj/j+DnkT/4Yp3KjYr7BvfznasUs3ss5tD6I+o2IDgLTOVIthEsqzeo1lBzGb
         jy6XpviJ4kVjB0UPUjN/Qvm6AU6qEEKkdu2s+h7kR64CZnUoqupXYI1IEwhihEa1Aceg
         i8zlS9vLibExMC/ckSirtHBR1zWCSFElBtKzmR+CO87+J8HYRlt8LJ5gpm+xSpsdBMhl
         GeZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rnhfCchLZDc9lwMhT0TQRY62P4juld204oIgv5PA9GM=;
        b=onXh9DvMb5EZ7YSDinO21EtzAU1N70SeiZzPWn/bh0Oy15ir4CWhGLWl2fIp8x0yNC
         ji7/AUxnX2XPev1PGQgHUA4RcTP0uX9cc0jh+GlEgmigcV2uzFLjKwEJnkfBbMNQfwBX
         /+rGYxfKGYcgcq5QsoXcbxcCM5GvUYz4NhzykZKswXazanY1nWyd8BkjQiRGZVjlhJi4
         16c5hqzG/phuBBOmq0VO5dj7Y9clmkpE41eBNbapAyG6W8cEjmwwiPhGS6XPeCEqB2wN
         8MAET6LKQ1PKdyct6Gv71IgT/+KRT0lEZs9SQmyJwBHJ/hxjHIL6eoPwzLjOgr4bLcXP
         BdLg==
X-Gm-Message-State: AOAM531j6y1zoBGmumAl5AoAGSegvVZC4BKidYyB0BNhZ02JTqbB8ArQ
        bY2JXq0rvDMnm3fja/ppXaftsmqnBbKbaw==
X-Google-Smtp-Source: ABdhPJzLI2B1hMnagrzaAKYa1sCH2mML4p56TG2WTSr8JE6qPilPHqqr7dbsCqOyOOcx9s6o2bXqQA==
X-Received: by 2002:a17:902:d2c5:b029:f1:c207:b0fd with SMTP id n5-20020a170902d2c5b02900f1c207b0fdmr35025450plc.45.1622035919972;
        Wed, 26 May 2021 06:31:59 -0700 (PDT)
Received: from kelvin-System-Product-Name.lan ([112.45.97.46])
        by smtp.gmail.com with ESMTPSA id a15sm15223088pff.128.2021.05.26.06.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 06:31:59 -0700 (PDT)
From:   Keguang Zhang <keguang.zhang@gmail.com>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Kelvin Cheung <keguang.zhang@gmail.com>
Subject: [PATCH V1 4/4] MIPS: Loongson1B: Enable NAND by default
Date:   Wed, 26 May 2021 21:31:00 +0800
Message-Id: <20210526133100.436048-5-keguang.zhang@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210526133100.436048-1-keguang.zhang@gmail.com>
References: <20210526133100.436048-1-keguang.zhang@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

From: Kelvin Cheung <keguang.zhang@gmail.com>

Update defconfig to enable NAND by default.

Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
---
 arch/mips/configs/loongson1b_defconfig | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/mips/configs/loongson1b_defconfig b/arch/mips/configs/loongson1b_defconfig
index 25e70423e17d..ce5f99bd54b9 100644
--- a/arch/mips/configs/loongson1b_defconfig
+++ b/arch/mips/configs/loongson1b_defconfig
@@ -14,10 +14,12 @@ CONFIG_EXPERT=y
 CONFIG_PERF_EVENTS=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_MACH_LOONGSON32=y
-# CONFIG_SECCOMP is not set
 # CONFIG_SUSPEND is not set
+# CONFIG_SECCOMP is not set
+# CONFIG_GCC_PLUGINS is not set
 CONFIG_MODULES=y
 CONFIG_MODULE_UNLOAD=y
+CONFIG_MODULE_FORCE_UNLOAD=y
 CONFIG_MODVERSIONS=y
 # CONFIG_BLK_DEV_BSG is not set
 # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
@@ -28,9 +30,6 @@ CONFIG_INET=y
 CONFIG_IP_PNP=y
 CONFIG_IP_PNP_DHCP=y
 CONFIG_SYN_COOKIES=y
-# CONFIG_INET_XFRM_MODE_TRANSPORT is not set
-# CONFIG_INET_XFRM_MODE_TUNNEL is not set
-# CONFIG_INET_XFRM_MODE_BEET is not set
 # CONFIG_INET_DIAG is not set
 # CONFIG_IPV6 is not set
 # CONFIG_WIRELESS is not set
@@ -41,6 +40,7 @@ CONFIG_MTD=y
 CONFIG_MTD_CMDLINE_PARTS=y
 CONFIG_MTD_BLOCK=y
 CONFIG_MTD_RAW_NAND=y
+CONFIG_MTD_NAND_LOONGSON1=y
 CONFIG_MTD_UBI=y
 CONFIG_BLK_DEV_LOOP=y
 CONFIG_SCSI=m
@@ -92,6 +92,7 @@ CONFIG_LEDS_TRIGGERS=y
 CONFIG_LEDS_TRIGGER_HEARTBEAT=y
 CONFIG_RTC_CLASS=y
 CONFIG_RTC_DRV_LOONGSON1=y
+CONFIG_DMADEVICES=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_EXT2_FS=y
 CONFIG_EXT2_FS_XATTR=y
@@ -112,12 +113,10 @@ CONFIG_NFS_FS=y
 CONFIG_ROOT_NFS=y
 CONFIG_NLS_CODEPAGE_437=m
 CONFIG_NLS_ISO8859_1=m
-# CONFIG_CRYPTO_ECHAINIV is not set
 # CONFIG_CRYPTO_HW is not set
 CONFIG_DYNAMIC_DEBUG=y
-# CONFIG_ENABLE_MUST_CHECK is not set
-CONFIG_DEBUG_FS=y
 CONFIG_MAGIC_SYSRQ=y
+CONFIG_DEBUG_FS=y
 # CONFIG_SCHED_DEBUG is not set
 # CONFIG_DEBUG_PREEMPT is not set
 # CONFIG_FTRACE is not set
-- 
2.30.2

