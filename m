Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F7C435D7EF
	for <lists+linux-mips@lfdr.de>; Tue, 13 Apr 2021 08:22:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344996AbhDMGWc (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 13 Apr 2021 02:22:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344983AbhDMGW3 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 13 Apr 2021 02:22:29 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03670C061574;
        Mon, 12 Apr 2021 23:22:10 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id u7so5836112plr.6;
        Mon, 12 Apr 2021 23:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FzDdk9WeLMndWaHg27kx8Y0bv03vlpf64XRRJIexZMY=;
        b=acaWyW4KuwBaMok4UBB3mMF/7fsG3Dm+1yBQ2PgYywhsKIOBLbJM/vmMz6WtDUyrNO
         QE5kTrudQU4fJA4VTJ/esU59zGS5uYmQjVKYaSwjBbVO70BGWsoJDrvK3ba9K8LMwXKq
         bny7hy/KCqZtQnhIWMSO5706uDUF0vn96MVircjvLl0ZnpJmnLHW6AkncxcR2OWhr28r
         UYVC8LAhMNb2PsR4uGeHqP3gepPnshXEeirDgK7Ok87zBYzX4H+RBNtO4IiqA9Lpqa5J
         Oz5a2H8QK7ogfqEKvRrbk/lxnMnhdluVbHfGIeYMILswZIz5V1/tlNSPS3kHA727Hotk
         T/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FzDdk9WeLMndWaHg27kx8Y0bv03vlpf64XRRJIexZMY=;
        b=rGauQ7VIv3zpdR8L4hgwQLrI5sfmXmsKBhn0Or15EDOH0VVbC0Nfnf9ROwLjqwQe25
         OR83hfHTtQNOoexJ7HnGMS1Om5nM5h+ZVv8KXi1b50LxB0/+XKWfNG392UaJW6Ngk5Hj
         Kt/rSLkjDD5S2Be8woRDqG2x5g2LSEZhYFEfGkzpuMTDJSqlkjRucMRsipeHAjRUZtxu
         o2dJSHWViCQ+Z3hA1jm0e/SM8aSoaQXdChT5/xpCU+ZFtDfHGB0Sxa/+jRqQF1C11ILb
         yZSBUDwETiwuj49QLzgyrRv9ia25MH6ii1wIktlyou+Cpfxtu04DtmOmih7BxsVTbAoR
         RC9Q==
X-Gm-Message-State: AOAM530upSqoJSBqNVaHl+OlF7KhDQfExaBrvQXo3Ma41LfJ39oYgtPK
        iFlctq+tJ6Bj++nzW+C9eYk=
X-Google-Smtp-Source: ABdhPJxDyHtOlfdWoQKHS1hCF810J2AfDNrXfRXlyn3c3XsfpvjJT3I/1vnf8S81uOP6QmQYVWOEDw==
X-Received: by 2002:a17:902:6b8c:b029:ea:f54f:c330 with SMTP id p12-20020a1709026b8cb02900eaf54fc330mr9502135plk.10.1618294929613;
        Mon, 12 Apr 2021 23:22:09 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
        by smtp.gmail.com with ESMTPSA id e190sm11453326pfe.3.2021.04.12.23.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 23:22:09 -0700 (PDT)
From:   Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 7/8] MIPS: pci-legacy: remove busn_resource field
Date:   Mon, 12 Apr 2021 23:21:45 -0700
Message-Id: <20210413062146.389690-8-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210413062146.389690-1-ilya.lipnitskiy@gmail.com>
References: <20210413062146.389690-1-ilya.lipnitskiy@gmail.com>
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

