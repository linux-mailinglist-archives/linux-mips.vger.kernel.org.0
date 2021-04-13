Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4187A35D7E9
	for <lists+linux-mips@lfdr.de>; Tue, 13 Apr 2021 08:22:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344984AbhDMGW3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Apr 2021 02:22:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344970AbhDMGW1 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 13 Apr 2021 02:22:27 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 025A8C061756;
        Mon, 12 Apr 2021 23:22:08 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id c2so197383plz.0;
        Mon, 12 Apr 2021 23:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZPldXdTQoOP+1TJTBeTgMS9EZqu+drw8h+OQ+VsC7Kw=;
        b=tbCyq37jO+pUK6nJePNYIrHTLb9+rW9bvXJonzy8EIuP7igH3zsV0wQNrJo5I0UWX4
         48KTryRD5uuvma/10NPfHuuVdJ8fTpRTWlwV1gT3QRowqXmH9ds96225zB4qNk5lUGQF
         cDa2LfIE3b8W6eBfyrLb7S6tSGcy29QmCV20BDHD+qgT7K2VguNRsJYxCbXvHgseJT2/
         9Q7pJRn4X+WSIcwsDdK/afgUGTUdVXXDe6QNIzePM1vinzpwjz7srDXs2yAo4JuGaQYQ
         Oc7OFMAfA8182Iuh9e35ZsxoQIpRAXACA0tqa0RcKnBfDyxrMGSW3xoCKdXIoLDAyfhe
         swtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZPldXdTQoOP+1TJTBeTgMS9EZqu+drw8h+OQ+VsC7Kw=;
        b=TnLyF5i4FuHbDyHdFstHN2S/eRJps1BM+ftnzTH43jgmxRqpWtWh5SzwwFjYFT7P2U
         +5kcnBBJXCEg2fEFX01HsGfp2GWIF4cru08MKGJEqKsWLL3iVw3a1h5nRcbOR74nmGyU
         rNgdDZHbvNLyKLZDEjXnsg6kPGaxbz48qbB3xz8A2tHkrg3qcDCh9kJxxvUUhgr3DUqX
         5ejXzkLISVQ9aCkGQbtCtOBUvO8Wy5lzcM82poHh/t7HeGqcoz7K/X5FfnQ6fZGLJ00U
         pczB6NG7tWi4DtdagrfqpJY6Cc8XH5hhTmy1qT2fIQJypoSGPfgU26khty8r4MYIcREQ
         Pedg==
X-Gm-Message-State: AOAM531oIsPbvR08iiHxc2HRussCle0/qaEkMEqvGUaDo9u6Pb+R1LU+
        OxFNOZVi1Pl+rlGn25jl8+XMAZjl+l2YnrVZ
X-Google-Smtp-Source: ABdhPJz+NBHqN5oWHzudEreZd5C8tLZPKwr9I5KlE0vVI/1thn51t0LZuoKO9sBno2ZNotKYh1yI8w==
X-Received: by 2002:a17:90a:1b62:: with SMTP id q89mr3305346pjq.54.1618294927409;
        Mon, 12 Apr 2021 23:22:07 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
        by smtp.gmail.com with ESMTPSA id e190sm11453326pfe.3.2021.04.12.23.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 23:22:07 -0700 (PDT)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>, trivial@kernel.org
Subject: [PATCH 3/8] MIPS: pci-rt3883: trivial: remove unused variable
Date:   Mon, 12 Apr 2021 23:21:41 -0700
Message-Id: <20210413062146.389690-4-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210413062146.389690-1-ilya.lipnitskiy@gmail.com>
References: <20210413062146.389690-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Fixes the following compiler warning:
  warning: unused variable 'flags' [-Wunused-variable]

Fixes: e5067c718b3a ("MIPS: pci-rt3883: Remove odd locking in PCI config space access code")
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: Sergey Ryazanov <ryazanov.s.a@gmail.com>
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

