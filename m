Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 880213A5FB3
	for <lists+linux-mips@lfdr.de>; Mon, 14 Jun 2021 12:07:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232698AbhFNKJ0 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 14 Jun 2021 06:09:26 -0400
Received: from mail-wr1-f41.google.com ([209.85.221.41]:39624 "EHLO
        mail-wr1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232579AbhFNKJZ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 14 Jun 2021 06:09:25 -0400
Received: by mail-wr1-f41.google.com with SMTP id l2so13919544wrw.6
        for <linux-mips@vger.kernel.org>; Mon, 14 Jun 2021 03:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Eqtg1+fbJlMCohN2MghF9TKMofIxShR1miILFIvbuXo=;
        b=e0Y7mKZdoYtJKEeDyuZvj7ENxmTUBihER3LWNCE8XLt9Hil30abXdzCgxIjPqvj7dp
         7mQy8SMiiej2Gq42xTzkjfxHRFMFfkXU5Ad2lImtRHC6nFGhjHk2ruuWd9ccGG6UMyjH
         R/z/zMGz35ojfz4sZPHOZvxiUcSV1lFMD0E32l0xZdmEP+fqy3W4UBo3WvybQZ0Oaeat
         HifoolPAmhaRxdBtTm+D1FVBaUkSOnU5m3QaazmKQDAP3WapGG8hPB3+A8klXTKHMwpH
         x2x1cnYigFQRasN2CJ4GGIYhjKa/+MVpX7gJ5Qxytgw99bMXQYSKxxHZh3yzXCKGi4t6
         +meg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Eqtg1+fbJlMCohN2MghF9TKMofIxShR1miILFIvbuXo=;
        b=Uq/2B/weV4TqLqbKEi+8bKRLnU+0t1VroZeRQnkxil5hk27SZ+qrtlS13nM6O5X5OW
         Xvo3btAHL3c5h//OlGcSGS74hGfQcAFkckF00nDBBxj4Yn8zv7gMMby4c+Ufjye9kHYm
         pRb5w45D2ipB7KjM3jr1nQ3D0sdjN5UHrpiq4RZ8CnHFBwibKiGLurcjn7QWTt9Cuf5T
         CiEqe3kXpfbDGlCdBk2a4e4rY7gLeCEkJLyOS4Sf13CaswuenNrrGqeKL0JwGCKPIZM7
         /gUIdwXvaaP6UNrmtShIONOQijjF+vdbakOixMwk8vKUakssehFucz9IMrQ0RIEqlahq
         gvxg==
X-Gm-Message-State: AOAM530JJiNs3WC5QcKGjBpSS53TTkICeFgWWNJGf00OEJr47GvtHIdj
        UlSkILqNzYyY82MWcpsHQ78=
X-Google-Smtp-Source: ABdhPJysNfx1zASyvrXkTjCH8eyVnmm0cPa7C9EUPDrPmYYuuxZ6wP2UO8T24YpHdwksQ+JPYP/X9g==
X-Received: by 2002:a5d:48ca:: with SMTP id p10mr17808907wrs.87.1623665181742;
        Mon, 14 Jun 2021 03:06:21 -0700 (PDT)
Received: from localhost.localdomain (98.red-81-38-58.dynamicip.rima-tde.net. [81.38.58.98])
        by smtp.gmail.com with ESMTPSA id k5sm16476566wrv.85.2021.06.14.03.06.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Jun 2021 03:06:21 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linux-staging@lists.linux.dev
Cc:     gregkh@linuxfoundation.org, neil@brown.name,
        linux-mips@vger.kernel.org, tsbogend@alpha.franken.de,
        ilya.lipnitskiy@gmail.com, john@phrozen.org
Subject: [PATCH v2 3/3] staging: mt7621-dts: fix pci address for PCI memory range
Date:   Mon, 14 Jun 2021 12:06:17 +0200
Message-Id: <20210614100617.28753-4-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210614100617.28753-1-sergio.paracuellos@gmail.com>
References: <20210614100617.28753-1-sergio.paracuellos@gmail.com>
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

