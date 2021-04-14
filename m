Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E57AF35EB4B
	for <lists+linux-mips@lfdr.de>; Wed, 14 Apr 2021 05:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232953AbhDNDNr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Apr 2021 23:13:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232956AbhDNDNh (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 13 Apr 2021 23:13:37 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CB06C06138C;
        Tue, 13 Apr 2021 20:12:52 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id i190so12775619pfc.12;
        Tue, 13 Apr 2021 20:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=gB2Y5Ee6tQXNfuASCG1AntUHngSRzeeF+IbJPgKxOeg=;
        b=c6DzTECGFr2NKizGLEiVq3XztDMAij+0ddzvSLicuH0cwo3bLFksnk7dJ9gHEY5qAG
         dbGJb9bvvV7IyHHqkibbIZ7+DgG5K0H4ZKfAFbHYin65ZY5zsfI192gfMEwazIHGiHSm
         AUaHdkYzFg+JX4KfvKn/mkxVjRcSPx/0s/dyJOyPcN4ipLFpkCY5Sf4n8yKDmItWURL+
         NKbv0ARen7sCVelX5J2rl8cp0YWlMZQEL2WULxqOhU57fPqzCBYxnLcHVENrUmXlY0YV
         9dD3iho3FwzJreVeujM+G8rIT5E4LiNoTShFHu0xzhefD5SrEronjKlS2nDSNtzlKQMK
         5Xog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gB2Y5Ee6tQXNfuASCG1AntUHngSRzeeF+IbJPgKxOeg=;
        b=RRklsg5VFYr7kXJ7QWh8QK746BTvEy0Z0Y6y4/e3QY9PrgWtN0x3GNSZQYMkx0oZop
         guFdluLHyBhLeT+SzbtPhHpH0tl2RcaKhEbyr2fY5NIDlvbAN4c9PX5n7oXX8lGMgIle
         w8J1XQBsqyKEEnRPdS5fW8/7lnjFS64nMbJisKn2nzBIIqojNn7czGvGmPzlaUDVrKKn
         gpwWfSj/N7jVaE78k/4GxMzOtROBPadJhOaS1p5mxNW8qjM+PaRrl/VX5BM7QDnJr+j4
         VKpc4fGC4jx0QrsNAZEPospZoyd/bDMS6mOkIME0LGchnM8MYRT49WZIMaf1FPHU2C5z
         aIpA==
X-Gm-Message-State: AOAM533X47VgzzP4xfL5DvP2aJHNacVn77Yu2Vq285BlTIbwaiu2Kmhq
        Pl82C1xWqCl+maGN2kJum2A=
X-Google-Smtp-Source: ABdhPJx6GWTyrDQfMDM638g0cQJcm6ON9JFBJQ9QZDEXA/05YCgDY/LrH8zX5dsFz6ULc+OjeB9wyg==
X-Received: by 2002:aa7:8a47:0:b029:24e:22de:de6a with SMTP id n7-20020aa78a470000b029024e22dede6amr10821817pfa.20.1618369971998;
        Tue, 13 Apr 2021 20:12:51 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
        by smtp.gmail.com with ESMTPSA id d17sm13971605pfo.117.2021.04.13.20.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 20:12:51 -0700 (PDT)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>
Cc:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, trivial@kernel.org
Subject: [PATCH v2 3/8] MIPS: pci-rt3883: trivial: remove unused variable
Date:   Tue, 13 Apr 2021 20:12:35 -0700
Message-Id: <20210414031240.313852-4-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210414031240.313852-1-ilya.lipnitskiy@gmail.com>
References: <20210414031240.313852-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Fixes the following compiler warning:
  warning: unused variable 'flags' [-Wunused-variable]

Fixes: e5067c718b3a ("MIPS: pci-rt3883: Remove odd locking in PCI config space access code")
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Acked-by: Sergey Ryazanov <ryazanov.s.a@gmail.com>
Cc: trivial@kernel.org
---
 arch/mips/pci/pci-rt3883.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/mips/pci/pci-rt3883.c b/arch/mips/pci/pci-rt3883.c
index 0ac6346026d0..e422f78db5bc 100644
--- a/arch/mips/pci/pci-rt3883.c
+++ b/arch/mips/pci/pci-rt3883.c
@@ -100,7 +100,6 @@ static u32 rt3883_pci_read_cfg32(struct rt3883_pci_controller *rpc,
 			       unsigned bus, unsigned slot,
 			       unsigned func, unsigned reg)
 {
-	unsigned long flags;
 	u32 address;
 	u32 ret;
 
@@ -116,7 +115,6 @@ static void rt3883_pci_write_cfg32(struct rt3883_pci_controller *rpc,
 				 unsigned bus, unsigned slot,
 				 unsigned func, unsigned reg, u32 val)
 {
-	unsigned long flags;
 	u32 address;
 
 	address = rt3883_pci_get_cfgaddr(bus, slot, func, reg);
@@ -229,7 +227,6 @@ static int rt3883_pci_config_read(struct pci_bus *bus, unsigned int devfn,
 				  int where, int size, u32 *val)
 {
 	struct rt3883_pci_controller *rpc;
-	unsigned long flags;
 	u32 address;
 	u32 data;
 
@@ -263,7 +260,6 @@ static int rt3883_pci_config_write(struct pci_bus *bus, unsigned int devfn,
 				   int where, int size, u32 val)
 {
 	struct rt3883_pci_controller *rpc;
-	unsigned long flags;
 	u32 address;
 	u32 data;
 
-- 
2.31.1

