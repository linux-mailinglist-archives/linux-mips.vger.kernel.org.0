Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6840D2C3A81
	for <lists+linux-mips@lfdr.de>; Wed, 25 Nov 2020 09:09:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726325AbgKYIIu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 25 Nov 2020 03:08:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727837AbgKYIIs (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 25 Nov 2020 03:08:48 -0500
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3E6FC0613D4
        for <linux-mips@vger.kernel.org>; Wed, 25 Nov 2020 00:08:47 -0800 (PST)
Received: by mail-pl1-x642.google.com with SMTP id t18so742217plo.0
        for <linux-mips@vger.kernel.org>; Wed, 25 Nov 2020 00:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wistron-corp-partner-google-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=gQ+v++jpPeKhNq44GEfnnAm5hy7WJGRSg9tzpqA2KfY=;
        b=hXgsf852urRyBG1R5ZHpCAQ6Y/TodbGiJ1iRvxUsPAXm+zMVtfagLMbg+c99Gw4RuL
         HKQ+n4UcpGgO6ohvXllkC+7uYPqIFJQ6E0YQF6DbG54KhcdJqnLGR/aNaw7cSYbdc9en
         wzW+gKmUO7EcXuPzYnT9zBAKbk8vhKxMvsOl5RewYYhONbVpFArRs8O0gGrBz5CNrTXh
         qwgcabkEp95+9H2DTOiwX9rtn/UTRmNbnc4mPQuLPTcyRQ6N+VLI+PP+3jlysNFPBygs
         EG7hDIdoBIhhCqxnqOFaO/1MvYPow1/Fqkv9i9Xdb3/X/1sli6cKMgdDNFCZiB6s6SMf
         WajA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=gQ+v++jpPeKhNq44GEfnnAm5hy7WJGRSg9tzpqA2KfY=;
        b=dIv0ZhqVCkRk9/+aTG+Vf5xchpff07CjBFQQMlvY7wpoUpJTAsyETsxlNugFZGEtPS
         +T+GIEfV+r8c49llXw7sCGSZbCRGtPshvzJJI9sK01cto96X1+vBVKBQxHGeoV/t7Ptl
         IfySUT07s8z1NESmVkmfjukfLzz28tnPoYMgovCtK+dNsJgccY13uXS/+kH80bXA9VMn
         RBb5phILHnoDlZoOUKRH5xKBUOgy3Opzs3smMOec73r+EZE3vV4QRJ+yrivu9AnKhT0w
         XLAuPUW0maiJcuNstTfAi8VyEMQ17hb49jVnGKsgzhTLgcRdUqvRqOEO/mP0qeYPWJnY
         +1lg==
X-Gm-Message-State: AOAM5309CalxGZlap4qhwxvq7Jihdm+LxOqCUNfOVCrUNRzXXWLixqur
        eHinJerMSumbFWkQcA1IuBZ7nQ==
X-Google-Smtp-Source: ABdhPJycPixCy3rn8V7123KHIZgOKq+wu3+oeF2BUaPMfl1EDug/xqXZV7Sxk74QonwskKwqS28UpQ==
X-Received: by 2002:a17:902:468:b029:d5:ad3c:cf52 with SMTP id 95-20020a1709020468b02900d5ad3ccf52mr2104211ple.7.1606291727490;
        Wed, 25 Nov 2020 00:08:47 -0800 (PST)
Received: from localhost.localdomain (61-220-206-157.HINET-IP.hinet.net. [61.220.206.157])
        by smtp.gmail.com with ESMTPSA id h16sm1219682pfo.185.2020.11.25.00.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 00:08:47 -0800 (PST)
From:   Mark Hsieh <mark_hsieh@wistron.corp-partner.google.com>
To:     tsbogend@alpha.franken.de
Cc:     mark_hsieh@wistron.com, christian@brauner.io,
        linux-mips@vger.kernel.org,
        Mark Hsieh <mark_hsieh@wistron.corp-partner.google.com>
Subject: [PATCH] nvme-pci: disable write zeros support on specific SSDs
Date:   Wed, 25 Nov 2020 16:08:43 +0800
Message-Id: <20201125080843.11285-1-mark_hsieh@wistron.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Like commit 5611ec2b9814 ("nvme-pci: prevent SK hynix PC400 from using
Write Zeroes command"), Samsung, Phison and Kingston have the same issue:
[ 6305.633887] blk_update_request: operation not supported error, dev nvme0n1, sector 340812032 op 0x9:(WRITE_ZEROES) flags 0x0 phys_seg 0 prio class 0

So also disable Write Zeroes command on Samsung, Phison and Kingston.

Signed-off-by: Mark Hsieh <mark_hsieh@wistron.corp-partner.google.com>
---
 drivers/nvme/host/pci.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index 0578ff253c47..ceedb5dcb54c 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -3202,6 +3202,12 @@ static const struct pci_device_id nvme_id_table[] = {
 		.driver_data = NVME_QUIRK_DISABLE_WRITE_ZEROES, },
 	{ PCI_DEVICE(0x15b7, 0x2001),   /*  Sandisk Skyhawk */
 		.driver_data = NVME_QUIRK_DISABLE_WRITE_ZEROES, },
+	{ PCI_DEVICE(0x144d, 0xa809),   /* Samsung 128HBHQ and 256HAJD */
+		.driver_data = NVME_QUIRK_DISABLE_WRITE_ZEROES, },
+	{ PCI_DEVICE(0x1987, 0x5013),   /* Phison PS5013 E13 */
+		.driver_data = NVME_QUIRK_DISABLE_WRITE_ZEROES, },
+	{ PCI_DEVICE(0x2646, 0x500d),   /* Kingston OM3PDP3256B-AH 256G */
+		.driver_data = NVME_QUIRK_DISABLE_WRITE_ZEROES, },
 	{ PCI_DEVICE(PCI_VENDOR_ID_APPLE, 0x2001),
 		.driver_data = NVME_QUIRK_SINGLE_VECTOR },
 	{ PCI_DEVICE(PCI_VENDOR_ID_APPLE, 0x2003) },
-- 
2.17.1

