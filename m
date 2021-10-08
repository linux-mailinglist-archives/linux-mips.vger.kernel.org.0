Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED6B4426731
	for <lists+linux-mips@lfdr.de>; Fri,  8 Oct 2021 11:53:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229967AbhJHJzK (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 8 Oct 2021 05:55:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229869AbhJHJzK (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 8 Oct 2021 05:55:10 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAD30C061570;
        Fri,  8 Oct 2021 02:53:14 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id r18so28018991wrg.6;
        Fri, 08 Oct 2021 02:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uj9+OxfyZUIYBVS3coN0oP8CwB3d5MCS18cjbvWyJdY=;
        b=GBeqpTAjEQSxGx0TjU9ypgASF+ct1wnX9YFTj/N5nOPvBogbGRd4P0Zxf+NSRk6+DU
         LTIJxpp3+oQ2y2i8lah9hUuieF6SLyVnxFVEqRCxNCKVmOH9+BRFv85qj5KlvJ3Bw2iV
         edk251OprIdUsJpx1g25RMyW73W7TB8IQUwoxRdqtnCdE/JR4WJIasfvBQ/VJRN1QdIU
         bHFJ9vcc/r7BtgyzTLOeu4dNM49WVpJ8G/J+gHr+tI2hV952iXteEviE1koke2d79N6Z
         nAhb5ILnQ1gbjKwNhGD7CseaaO58MPplf1yh/eNrSrpAqe89D227MchZj7t1AJDeB17W
         GHAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uj9+OxfyZUIYBVS3coN0oP8CwB3d5MCS18cjbvWyJdY=;
        b=xmuvkXtxI3O4g5hL30nGai6kejxpzKQV8GjoPAIsp5oAu/E2oavHnwovAgiUDvCl8q
         +MdyIuGSa3ORYx/D4sb0i6z9Y4slXx9AcoCZiEsaKUlzeJy2YVqkP2QuBl9ZsBh2clm6
         YPW2T5iRS8bF2FJqG5Xgqa38+1LoB4Z6IuqfqyKJLRrdRtZzMbFp0B9g4wDsYlsRGe16
         6AoU8N7VX3CdnQlSfsEZVTjmFMvRw9J+G23uGy/wzrR+TVHBHhPiDZ5TJ7gLw/K7hj5j
         FpCtqRMz10ZM/x3X4xQP+kCsGwGQGo15mVthBSI2UyuLQGkjIXAZTvydyCJpS+9etPtm
         4ePA==
X-Gm-Message-State: AOAM531KuBTswsh67o27Gk8kQnNPWUfM4O8Gmlf0i3Tr3p09cb2wfRvt
        /HEksievedmjbZa27BRui2OgycXdVtE=
X-Google-Smtp-Source: ABdhPJzUv/jKssKsIvUOnoogDe7MYO7BM/G2x1Se2RLTCu7pekj+1ysr+08gp7EhM5qQNRMCyyHrEg==
X-Received: by 2002:a1c:a401:: with SMTP id n1mr2357130wme.162.1633686793204;
        Fri, 08 Oct 2021 02:53:13 -0700 (PDT)
Received: from localhost.localdomain (252.red-83-54-181.dynamicip.rima-tde.net. [83.54.181.252])
        by smtp.gmail.com with ESMTPSA id z8sm707670wrq.16.2021.10.08.02.53.12
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 08 Oct 2021 02:53:12 -0700 (PDT)
From:   Sergio Paracuellos <sergio.paracuellos@gmail.com>
To:     linux-mips@vger.kernel.org
Cc:     gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] MIPS: asm: pci: define arch-specific 'pci_remap_iospace()' dependent on 'CONFIG_PCI_DRIVERS_GENERIC'
Date:   Fri,  8 Oct 2021 11:53:11 +0200
Message-Id: <20211008095311.26475-1-sergio.paracuellos@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Some MIPS defconfigs that don't define 'CONFIG_PCI_DRIVERS_GENERIC' but
define 'CONFIG_PCI_DRIVERS_LEGACY' or none of them, can fail when they are
built since definition for 'pci_remap_iospace' is being done in include
file 'arch/mips/include/asm/pci.h' and the specific function implemented
in 'arch/mips/pci/pci-generic.c'. MIPS PCI drivers that don't use generic
PCI core APIs don't really need 'pci_remap_iospace' to be defined at all.
Hence, change definition for 'pci_remap_iospace' to be dependent on the
preprocessor 'CONFIG_PCI_DRIVERS_GENERIC' definition to avoid possible
build problems.

CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Fixes: 9f76779f2418 ("MIPS: implement architecture-specific 'pci_remap_iospace()'")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
Hi Greg, Thomas, Stephen,

I guess this should also go through the staging-tree.

Thanks in advance for your time.

Best regards,
    Sergio Paracuellos

 arch/mips/include/asm/pci.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/mips/include/asm/pci.h b/arch/mips/include/asm/pci.h
index 35270984a5f0..421231f55935 100644
--- a/arch/mips/include/asm/pci.h
+++ b/arch/mips/include/asm/pci.h
@@ -20,7 +20,9 @@
 #include <linux/list.h>
 #include <linux/of.h>
 
+#ifdef CONFIG_PCI_DRIVERS_GENERIC
 #define pci_remap_iospace pci_remap_iospace
+#endif
 
 #ifdef CONFIG_PCI_DRIVERS_LEGACY
 
-- 
2.33.0

