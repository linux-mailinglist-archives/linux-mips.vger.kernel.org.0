Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E2CD9D077
	for <lists+linux-mips@lfdr.de>; Mon, 26 Aug 2019 15:26:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731931AbfHZN0l (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 26 Aug 2019 09:26:41 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:35416 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727462AbfHZN0Y (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 26 Aug 2019 09:26:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=5slocbe6PQWQPCbfPHRmFcXbh8p3/1KOX8/V8eA6Q9A=; b=XGZ8Ip9YgNINJECHJz0EpvB1OO
        CF0tQSOdOtGd+DlsLVKePoRsKKw8FibPJ1GlcbQ4XTTfhPO14UOWq97tGqa/l2CGe6NuhQxCMNLDs
        4vboyzj7WGVlx0j1m3Ksze8YFKF9g+V9R4D67nO5t6hALNJdFIUN7R+PnWyKgdPpvTVZOY1TnL4yd
        UX8Qh9dJ9hPasEWYLaIRCa83VRw3J9HlPmy/Kf3Oq1alueewLRA95vRaGiI98W/Rm/KPfB3VppqpL
        oN6lVApHwK/Uq0yJZ5tPUGBT/oYSNXTG3lRwIGc3hmVn5jRIW7CV14ISsbAT5tf6WoaE/OnyClLlj
        J4aN/qcQ==;
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i2F0U-0007uY-Cm; Mon, 26 Aug 2019 13:26:02 +0000
From:   Christoph Hellwig <hch@lst.de>
To:     iommu@lists.linux-foundation.org
Cc:     Guan Xuetao <gxt@pku.edu.cn>, Shawn Anastasio <shawn@anastas.io>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] arm-nommu: remove the unused pgprot_dmacoherent define
Date:   Mon, 26 Aug 2019 15:25:49 +0200
Message-Id: <20190826132553.4116-3-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190826132553.4116-1-hch@lst.de>
References: <20190826132553.4116-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm/include/asm/pgtable-nommu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/include/asm/pgtable-nommu.h b/arch/arm/include/asm/pgtable-nommu.h
index 0b1f6799a32e..d0de24f06724 100644
--- a/arch/arm/include/asm/pgtable-nommu.h
+++ b/arch/arm/include/asm/pgtable-nommu.h
@@ -62,7 +62,6 @@ typedef pte_t *pte_addr_t;
  */
 #define pgprot_noncached(prot)	(prot)
 #define pgprot_writecombine(prot) (prot)
-#define pgprot_dmacoherent(prot) (prot)
 #define pgprot_device(prot)	(prot)
 
 
-- 
2.20.1

