Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E21053A5972
	for <lists+linux-mips@lfdr.de>; Sun, 13 Jun 2021 17:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231913AbhFMP7p (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 13 Jun 2021 11:59:45 -0400
Received: from mail-wm1-f49.google.com ([209.85.128.49]:50783 "EHLO
        mail-wm1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231844AbhFMP7p (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 13 Jun 2021 11:59:45 -0400
Received: by mail-wm1-f49.google.com with SMTP id d184so10700350wmd.0
        for <linux-mips@vger.kernel.org>; Sun, 13 Jun 2021 08:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Eqtg1+fbJlMCohN2MghF9TKMofIxShR1miILFIvbuXo=;
        b=aqnqVbgEFUWxR+Qy9iGlYx07qrJgGmTJBGXNYQ9iIgruAXAEAkZx1UHaDqBgicpgXb
         vt2SQ968igKkZpV7Hc1E+A3dAYR80r4Suq9VXb6ujVG4Cr6l4KZooRNMMo6OUx9pz6m2
         LyanJ9UOp3ca/ZUhbMPYuvCbbM6BF3FVYv+nzwXBcGCA87Wn+8ocxQKkaDsV1zLET22E
         StCsuM224y/ul5f6sONBV1Sh2E7UN/jtAgcqgS1X2w0AqwntW0fo4hxz6PjiH5QGfNsC
         onXpzXvwfhDUrASBT1mERg6PfGLUIJm/ycUMr6fGFppPB11EJ4ydjV3er+5UEl+N6xcV
         xQjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Eqtg1+fbJlMCohN2MghF9TKMofIxShR1miILFIvbuXo=;
        b=R5w25qcTOz5CrCfMl9+angMjUUR79cv6MPmJ9yESGIAHMV4mCnLKU7ae0waiPx/rW4
         g14Bi+1bgEybyCXX7KzCH3ibEwT/ykBftVMDvgXkkqjhhL6LbXKe/td7zMu6YilQXVmD
         mpkdWvdCXQOp2xDsHpHAYlPKOyU8CI3tCV6vtg8gP4swJ+KwvVq1mgKXGcmlDqm9bH2M
         W1Z3woC8eN3dmlvKMdRkZQfIUT5mwYhOGZrPYjLwXQ+OYeJ9YgpzvZXTALZROj+mXVQt
         0YnSwPFt1d8TWlS2cJG19IjeljZrPu2WclPAp/L9/tYrHttzbjeQNcA1IJ3qF3ApqePX
         qO4Q==
X-Gm-Message-State: AOAM5304W6WDPMu/5ZG7Gb3QLkDG/4CxzjQTmStouYVv1hYOP17oy+st
        aP7MN3zhf05v6PH6tD/pfqo=
X-Google-Smtp-Source: ABdhPJzn6deyzLma154OGI+jhNI78UihPVmufIOcMJ+81krmmS3QJ7Vy6g6K15b1LShq71g8il7fVA==
X-Received: by 2002:a1c:a484:: with SMTP id n126mr28984602wme.34.1623599788241;
        Sun, 13 Jun 2021 08:56:28 -0700 (PDT)
Received: from localhost.localdomain (98.red-81-38-58.dynamicip.rima-tde.net. [81.38.58.98])
        by smtp.gmail.com with ESMTPSA id g17sm17539746wrh.72.2021.06.13.08.56.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 13 Jun 2021 08:56:27 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linux-staging@lists.linux.dev
Cc:     gregkh@linuxfoundation.org, neil@brown.name,
        linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        ilya.lipnitskiy@gmail.com, john@phrozen.org
Subject: [PATCH 3/3] staging: mt7621-dts: fix pci address for PCI memory range
Date:   Sun, 13 Jun 2021 17:56:23 +0200
Message-Id: <20210613155623.17233-4-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210613155623.17233-1-sergio.paracuellos@gmail.com>
References: <20210613155623.17233-1-sergio.paracuellos@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Driver code call 'devm_of_pci_get_host_bridge_resources'
to get resources and properly fill 'bridge->windows' and
'bridge->dma_ranges'. After parsing the ranges and store
as resources, at the end it makes a call to pci function
'pci_add_resource_offset' to set the offset for the
memory resource. To calculate offset, resource start address
subtracts pci address of the range. MT7621 does not need
any offset for the memory resource. Moreover, setting an
offset got into 'WARN_ON' calls from pci devices driver code.
Until now memory range pci_addr was being '0x00000000' and
res->start is '0x60000000' but becase pci controller driver
was manually setting resources and adding them using pci function
'pci_add_resource' where a zero is passed as offset, things
was properly working. Since PCI_IOBASE is defined now for
ralink we don't set nothing manually anymore so we have to
properly fix PCI address for this range to make things work
and the new pci address must be set to '0x60000000'. Doing
in this way the subtract result obtain zero as offset
and pci device driver code properly works.

Fixes: d59578da2bb8 ("staging: mt7621-dts: add dts files")
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-dts/mt7621.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/mt7621-dts/mt7621.dtsi b/drivers/staging/mt7621-dts/mt7621.dtsi
index ecfe2f2cf75a..f15ea61851b2 100644
--- a/drivers/staging/mt7621-dts/mt7621.dtsi
+++ b/drivers/staging/mt7621-dts/mt7621.dtsi
@@ -489,7 +489,7 @@ pcie: pcie@1e140000 {
 
 		device_type = "pci";
 
-		ranges = <0x02000000 0 0x00000000 0x60000000 0 0x10000000>, /* pci memory */
+		ranges = <0x02000000 0 0x60000000 0x60000000 0 0x10000000>, /* pci memory */
 			 <0x01000000 0 0x00000000 0x1e160000 0 0x00010000>; /* io space */
 
 		#interrupt-cells = <1>;
-- 
2.25.1

