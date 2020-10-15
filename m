Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C8EDC28EC9E
	for <lists+linux-mips@lfdr.de>; Thu, 15 Oct 2020 07:27:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgJOF1Z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 15 Oct 2020 01:27:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725985AbgJOF1Z (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 15 Oct 2020 01:27:25 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27B7FC061755;
        Wed, 14 Oct 2020 22:27:25 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id h4so1238594pjk.0;
        Wed, 14 Oct 2020 22:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=suwn4Ybo5octRzfTXo8Gwd9DEMEokqAoqQQ/uRbhrPE=;
        b=b1kxc0/FM0XcnhSkjp/AVmYqOzjbSXwqbvHG/bwvzY8oysMpUBg7wNKfAN6iCVXeI0
         i7C+mKZRe9ims1zW0zVeWk9Xbwz3rb62ZaWukL69hBZYNTh1K5fqDm99Q2JxAgy01acb
         bVfk52/rxTuzzU/6EzY++qJcb5cFULMTGeofEO877/swhvauY9kbsJam2X98QDoIDXMl
         Z4DRm/FKpnLzp+X+reufd0jpcp5JqHiLAOmuEzExPUS2QHbECsv6GWBsGc78n7Hlux3j
         rH0itX4xij1zrt826BIwY9lpI2eMs064CCdBBcp2r4HjtvpERnETzeUux1T6J60DfpTb
         Gq6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=suwn4Ybo5octRzfTXo8Gwd9DEMEokqAoqQQ/uRbhrPE=;
        b=QmQAxRP/okVmuoRQeyyLdf7bSo7s7R+9ksFD3MAN534KM+lwgaBjfMFsALMILpXfxf
         Pwc+5miboF5mnQlNUti4wRH1bKGtIWtjCkmv4w72r8tVQYYBAga7QorzmJYCxDqKXngM
         u/1+PMJQ8NG5DUd3psPdSv712uX3U6jeNL9J5LvprSbqdXqbBVLfhic5Ndq2j3p5A+W+
         TfN4KQgGLQBp5oCrI3Qn3wgfP+0ESPvZiOv1Z3haAT4NN4/Th0tN5TzYnTf1c/TfFNaE
         ntcFODRVAq7OZCoKKN5NJvaq3ZWOLAbN/3d5wGXSmikMaktkISg+tuuLcX3CEC3VqtEg
         NkKQ==
X-Gm-Message-State: AOAM533mHxf/vY7s1iyfqt5ZMK3xEBOzRzAopqB2By17Dmb6w3ir9tEK
        8O23UZWqRwMhvO31qzAqxdOi+qyOWpQ=
X-Google-Smtp-Source: ABdhPJwSCuwDC/fbWIILvWoz7DaL6bE0i24zwO3oIW6Lh42RR6qBUaiAKx4Xaosxk8MY2KUx7I1KrA==
X-Received: by 2002:a17:90a:be0e:: with SMTP id a14mr2683387pjs.57.1602739644440;
        Wed, 14 Oct 2020 22:27:24 -0700 (PDT)
Received: from guoguo-omen.lan ([240e:379:940:2525:1069:aebf:b411:6781])
        by smtp.gmail.com with ESMTPSA id u25sm1481931pgl.31.2020.10.14.22.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2020 22:27:23 -0700 (PDT)
From:   Chuanhong Guo <gch981213@gmail.com>
To:     linux-mips@vger.kernel.org
Cc:     Chuanhong Guo <gch981213@gmail.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        John Crispin <john@phrozen.org>, linux-kernel@vger.kernel.org
Subject: [PATCH] mips: ralink: mt7621: add zboot debug console
Date:   Thu, 15 Oct 2020 13:26:21 +0800
Message-Id: <20201015052631.138783-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

uartlite0 at 0x1e000c00 is a 16550 compatible uart controller. It's
usually used for debug console and is already configured by u-boot.
Add ZBOOT_UART16550 and related definitions in uart-16550.c for zboot
debug output.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 arch/mips/boot/compressed/uart-16550.c | 6 ++++++
 arch/mips/ralink/Kconfig               | 1 +
 2 files changed, 7 insertions(+)

diff --git a/arch/mips/boot/compressed/uart-16550.c b/arch/mips/boot/compressed/uart-16550.c
index aee8d7b8f091..7122df28967a 100644
--- a/arch/mips/boot/compressed/uart-16550.c
+++ b/arch/mips/boot/compressed/uart-16550.c
@@ -35,6 +35,12 @@
 #define IOTYPE unsigned int
 #endif
 
+#ifdef CONFIG_SOC_MT7621
+#define UART0_BASE  0x1e000c00
+#define PORT(offset) (CKSEG1ADDR(UART0_BASE) + (4 * offset))
+#define IOTYPE unsigned int
+#endif
+
 #ifndef IOTYPE
 #define IOTYPE char
 #endif
diff --git a/arch/mips/ralink/Kconfig b/arch/mips/ralink/Kconfig
index c10d8b233ab1..4c3c6ef330e3 100644
--- a/arch/mips/ralink/Kconfig
+++ b/arch/mips/ralink/Kconfig
@@ -52,6 +52,7 @@ choice
 		select SYS_SUPPORTS_SMP
 		select SYS_SUPPORTS_MIPS_CPS
 		select SYS_SUPPORTS_HIGHMEM
+		select SYS_SUPPORTS_ZBOOT_UART16550
 		select MIPS_GIC
 		select COMMON_CLK
 		select CLKSRC_MIPS_GIC
-- 
2.26.2

