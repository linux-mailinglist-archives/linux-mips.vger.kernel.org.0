Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 439EE35EB4A
	for <lists+linux-mips@lfdr.de>; Wed, 14 Apr 2021 05:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233145AbhDNDNr (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Apr 2021 23:13:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233034AbhDNDNl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 13 Apr 2021 23:13:41 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D8A7C061342;
        Tue, 13 Apr 2021 20:12:55 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id t22so13435617pgu.0;
        Tue, 13 Apr 2021 20:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FzDdk9WeLMndWaHg27kx8Y0bv03vlpf64XRRJIexZMY=;
        b=rMs12k1nN+9e46i1SN3FTw6/fW7UBNLrwg7B118XsAMSgU3NzY7IA+tu6CFwtZ31Xz
         M+x0fLC8aFh8KQFQSRznIoc9dmFQQWBATHNyjg0UGj8sRVISXabi+fX3+yqHnqF8XqWH
         uudQgJ3XKJqP6DF/QVc5BjgLW22qhzxlqKvF1/BHyQVQLnxFp5AK+D/gZZkRZMAd1S9y
         EtfV/PK3ckVtPp0BUn8/xlFPwhKpHl7cV7Y9oGRaO1TxV5SOky1WGbqAxh207VK/xiFJ
         RzhVFQN7W67R3UDXZEphNpSH2FCjnVFnNVVs0y7sgvA6FKFi8H1/mDklhDlDn6yTRkfl
         Hs5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FzDdk9WeLMndWaHg27kx8Y0bv03vlpf64XRRJIexZMY=;
        b=cymhaLj1AT1sMYnbD/3RXUhIZoWe7Ab93x4GFiLiIzKWIrs3YMfKAdaCORwESTuQm7
         YhFK5mc4k/BYSLtKYeoBeiMibrRaHb+84ccV7cbRKeOPromrMZj34jID9qg7GrtTZEJ9
         +GlX2uPAvaSi7N2OeQ9haP4HJFjoh+FceaVGHEqHuJpdeR8HzpoUw3CuntuTuVlgM0R1
         bis40dZwTOSG/QqTwy2qhjPwmw4bnSIfc6g0CZohgl8l46VD1CKIAA0nkqkh1MCBfW2n
         p1s+1JIIqYy1Zc0Nzd79cilbpADjwFAf0xY7QImr5N17ieyqXPHuva0ouLsnBJeuRdMh
         7F0A==
X-Gm-Message-State: AOAM533DoU6vxCSc2eSwyzG4GgmDvT0Hu9T0SXG8VgsJC1gqu/vx0Fgu
        RuVja3jXAbyPExQiRjWdAnM=
X-Google-Smtp-Source: ABdhPJyKwOauVqaLgQWQi0pDSZOjy4RYyiyQGjz1v2Rb8nArW4Ji3qLqoJyrCQm/6AlAOiGdAy12JQ==
X-Received: by 2002:a63:3485:: with SMTP id b127mr34879352pga.168.1618369975322;
        Tue, 13 Apr 2021 20:12:55 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
        by smtp.gmail.com with ESMTPSA id d17sm13971605pfo.117.2021.04.13.20.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 20:12:54 -0700 (PDT)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sergey Ryazanov <ryazanov.s.a@gmail.com>
Cc:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2 7/8] MIPS: pci-legacy: remove busn_resource field
Date:   Tue, 13 Apr 2021 20:12:39 -0700
Message-Id: <20210414031240.313852-8-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210414031240.313852-1-ilya.lipnitskiy@gmail.com>
References: <20210414031240.313852-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

No drivers set the busn_resource field in the pci_controller struct.
Commit 7ee214b540d9 ("MIPS: PCI: Remove unused busn_offset") almost
removed it over 3 years ago. Remove it for good to free up memory and
eliminate messages like:
  pci_bus 0000:00: root bus resource [??? 0x00000000 flags 0x0]

Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>
---
 arch/mips/include/asm/pci.h | 1 -
 arch/mips/pci/pci-legacy.c  | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/mips/include/asm/pci.h b/arch/mips/include/asm/pci.h
index 6f48649201c5..9ffc8192adae 100644
--- a/arch/mips/include/asm/pci.h
+++ b/arch/mips/include/asm/pci.h
@@ -38,7 +38,6 @@ struct pci_controller {
 	struct resource *io_resource;
 	unsigned long io_offset;
 	unsigned long io_map_base;
-	struct resource *busn_resource;
 
 #ifndef CONFIG_PCI_DOMAINS_GENERIC
 	unsigned int index;
diff --git a/arch/mips/pci/pci-legacy.c b/arch/mips/pci/pci-legacy.c
index ec3f52ade72d..78c22987bef0 100644
--- a/arch/mips/pci/pci-legacy.c
+++ b/arch/mips/pci/pci-legacy.c
@@ -89,7 +89,6 @@ static void pcibios_scanbus(struct pci_controller *hose)
 				hose->mem_resource, hose->mem_offset);
 	pci_add_resource_offset(&resources,
 				hose->io_resource, hose->io_offset);
-	pci_add_resource(&resources, hose->busn_resource);
 	list_splice_init(&resources, &bridge->windows);
 	bridge->dev.parent = NULL;
 	bridge->sysdata = hose;
-- 
2.31.1

