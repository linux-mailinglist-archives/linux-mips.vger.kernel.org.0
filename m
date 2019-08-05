Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7B5182578
	for <lists+linux-mips@lfdr.de>; Mon,  5 Aug 2019 21:20:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728831AbfHETUb (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 5 Aug 2019 15:20:31 -0400
Received: from gateway21.websitewelcome.com ([192.185.45.147]:35077 "EHLO
        gateway21.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727460AbfHETUb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 5 Aug 2019 15:20:31 -0400
X-Greylist: delayed 1495 seconds by postgrey-1.27 at vger.kernel.org; Mon, 05 Aug 2019 15:20:30 EDT
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
        by gateway21.websitewelcome.com (Postfix) with ESMTP id 3CE0A400C9265
        for <linux-mips@vger.kernel.org>; Mon,  5 Aug 2019 13:55:35 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id ui8thaPuz2PzOui8theNn5; Mon, 05 Aug 2019 13:55:35 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=4oitkPyzu59yuzJ8cpXBWop1iWqnQ/XBOg9TEqWZEew=; b=c2qOfqJXrRp8mZENbNXd45JsFc
        nzQdoM04/hXlmEi1/JZUWbZHkpbKVujwtKpRFHfmNAt/6tD0ud15VmzcVYx2fclip4mcRfRF5CI3N
        lAUSNO54BG/deJB1A8nj7SNX/1bE+2r/97caxNuaGcgwyJmtA5LekbVqXVt4EWLFQn6uo88urlvRd
        AkRFgDseS05WZV66TL1jSP7lZhY+Jd++oCWzcHgSl5LGpPoy+8cxJ7w7GWHR2hDetNZbDi/gpxV8E
        LXds5y8iTnkVbEEPiBIepY9XzLdn+zD0a3QmHlchoBAa65d71az64ryyjX5QUvSR8CKCjjirMOmKr
        l/o6etQg==;
Received: from [187.192.11.120] (port=37284 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1hui8r-002vrg-QY; Mon, 05 Aug 2019 13:55:33 -0500
Date:   Mon, 5 Aug 2019 13:55:33 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com
Cc:     linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] MIPS: BCM63XX: Mark expected switch fall-through
Message-ID: <20190805185533.GA10551@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 187.192.11.120
X-Source-L: No
X-Exim-ID: 1hui8r-002vrg-QY
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [187.192.11.120]:37284
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 15
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Mark switch cases where we are expecting to fall through.

This patch fixes the following warning (Building: bcm63xx_defconfig mips):

arch/mips/pci/ops-bcm63xx.c: In function ‘bcm63xx_pcie_can_access’:
arch/mips/pci/ops-bcm63xx.c:474:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
   if (PCI_SLOT(devfn) == 0)
      ^
arch/mips/pci/ops-bcm63xx.c:477:2: note: here
  default:
  ^~~~~~~

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 arch/mips/pci/ops-bcm63xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/mips/pci/ops-bcm63xx.c b/arch/mips/pci/ops-bcm63xx.c
index d02eb9d16b55..925c72348fb6 100644
--- a/arch/mips/pci/ops-bcm63xx.c
+++ b/arch/mips/pci/ops-bcm63xx.c
@@ -474,6 +474,7 @@ static int bcm63xx_pcie_can_access(struct pci_bus *bus, int devfn)
 		if (PCI_SLOT(devfn) == 0)
 			return bcm_pcie_readl(PCIE_DLSTATUS_REG)
 					& DLSTATUS_PHYLINKUP;
+		/* else, fall through */
 	default:
 		return false;
 	}
-- 
2.22.0

