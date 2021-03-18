Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8FB333FE7F
	for <lists+linux-mips@lfdr.de>; Thu, 18 Mar 2021 06:00:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbhCRE7o (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 18 Mar 2021 00:59:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229803AbhCRE7M (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 18 Mar 2021 00:59:12 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3212BC06174A;
        Wed, 17 Mar 2021 21:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=OntMuyQvezkffkb0S1hX5CzLWQu3ErJ8mOHlHelvuXM=; b=E11zX/nxqWzDMDndJHZBXM4+Ky
        EAZBX95Mc+x7sTK2v8k4wdxoIyEUfJdf1ZVFDsAYmP/P8NE6fvrmySQCpZXbQ2PGSIi7org8Z0N14
        6PJX0PE4Cn7J9jxuud/cIpMA87Rqi0YQ+HUuzF4Dt0lsOP81Bt3zmiPKDCa0nyAMQWwifA5Md8cCm
        BKKihoJJoPc/B3cc0kMIesQpKSJnaAJj9pY0CypHSHWwUUSPzJpsXcYYsA/tCqngFL1KXb2fxwiFu
        mnJ3b6f7VQHKJeZr54PJoLcDBM9jVrTfno9mZpoXnCyU8WGdPkMGqCWE5f98YZmgZlP/KtG+5mZOj
        SFRoar5g==;
Received: from [2001:4bb8:18c:bb3:e1cf:ad2f:7ff7:7a0b] (helo=localhost)
        by casper.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lMkjg-002ZGW-W2; Thu, 18 Mar 2021 04:58:18 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     "David S. Miller" <davem@davemloft.net>,
        Jens Axboe <axboe@kernel.dk>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Richard Henderson <rth@twiddle.net>,
        Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
        Matt Turner <mattst88@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        linux-ide@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 05/10] MIPS: switch workpad_defconfig from legacy IDE to libata
Date:   Thu, 18 Mar 2021 05:57:01 +0100
Message-Id: <20210318045706.200458-6-hch@lst.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210318045706.200458-1-hch@lst.de>
References: <20210318045706.200458-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Use libata instead of the deprecated legacy ide driver in
workpad_defconfig.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/mips/configs/workpad_defconfig | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/mips/configs/workpad_defconfig b/arch/mips/configs/workpad_defconfig
index 891a5f77305da1..4798dc86c9ceaf 100644
--- a/arch/mips/configs/workpad_defconfig
+++ b/arch/mips/configs/workpad_defconfig
@@ -26,9 +26,12 @@ CONFIG_IP_MULTICAST=y
 # CONFIG_IPV6 is not set
 CONFIG_NETWORK_SECMARK=y
 CONFIG_BLK_DEV_RAM=m
-CONFIG_IDE=y
-CONFIG_BLK_DEV_IDECS=m
-CONFIG_IDE_GENERIC=y
+# CONFIG_SCSI_PROC_FS is not set
+# CONFIG_SCSI_LOWLEVEL is not set
+CONFIG_ATA=y
+# CONFIG_ATA_VERBOSE_ERROR is not set
+# CONFIG_ATA_FORCE is not set
+# CONFIG_ATA_BMDMA is not set
 CONFIG_NETDEVICES=y
 CONFIG_PCMCIA_3C574=m
 CONFIG_PCMCIA_3C589=m
-- 
2.30.1

