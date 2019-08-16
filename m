Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 091598FC3B
	for <lists+linux-mips@lfdr.de>; Fri, 16 Aug 2019 09:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726139AbfHPHXi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Aug 2019 03:23:38 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:46960 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726166AbfHPHXi (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Aug 2019 03:23:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=V5Zw49kQPZrMPdAV7XGYxZ4KnGSn0pXrZQuwIbjovPc=; b=cYrzgGcooFyvmagoHDTahcizcr
        ulAhAjBwfwJ77g7fjQVCrejwUPdW3+451tmr4XYxlVX8GxKY6cn3W8XzSqaVepJUUvLLtSTSTGMS2
        D6pUyCdbRYLrAnYboEv/JXnpSBpVixFIvWgyIfF5md8ZZXHK3JZ1uZkdsSR/CUj+a7OAuiX/QKZ4f
        IxilPeoBwYRLMyeTi9CQjAPYTO5lWlcHXkdKE5px7Tm0Z5Uv09MdQjAqWuzskLMQWZVz71rZHpeY5
        mK5d/REaLrxG8p8FjuCzLwlM5I1DLEWp0Hs1N6GdEsdYKhkTSq8vu8t5mK7Hc4pyUMSFWtRpfVilP
        iCSS6GWw==;
Received: from 089144199030.atnat0008.highway.a1.net ([89.144.199.30] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hyWa8-0003qQ-O9; Fri, 16 Aug 2019 07:23:29 +0000
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
Subject: [PATCH 6/6] arm64: document the choice of page attributes for pgprot_dmacoherent
Date:   Fri, 16 Aug 2019 09:07:54 +0200
Message-Id: <20190816070754.15653-7-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190816070754.15653-1-hch@lst.de>
References: <20190816070754.15653-1-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Based on an email from Will Deacon.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/arm64/include/asm/pgtable.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 6700371227d1..6ff221d9a631 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -435,6 +435,14 @@ static inline pmd_t pmd_mkdevmap(pmd_t pmd)
 	__pgprot_modify(prot, PTE_ATTRINDX_MASK, PTE_ATTRINDX(MT_NORMAL_NC) | PTE_PXN | PTE_UXN)
 #define pgprot_device(prot) \
 	__pgprot_modify(prot, PTE_ATTRINDX_MASK, PTE_ATTRINDX(MT_DEVICE_nGnRE) | PTE_PXN | PTE_UXN)
+/*
+ * DMA allocations for non-coherent devices use what the Arm architecture calls
+ * "Normal non-cacheable" memory, which permits speculation, unaligned accesses
+ * and merging of writes.  This is different from "Strongly Ordered" memory
+ * which is intended for MMIO and thus forbids speculation, preserves access
+ * size, requires strict alignment and also forces write responses to come from
+ * the endpoint.
+ */
 #define pgprot_dmacoherent(prot) \
 	__pgprot_modify(prot, PTE_ATTRINDX_MASK, \
 			PTE_ATTRINDX(MT_NORMAL_NC) | PTE_PXN | PTE_UXN)
-- 
2.20.1

