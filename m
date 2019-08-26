Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 13F859D073
	for <lists+linux-mips@lfdr.de>; Mon, 26 Aug 2019 15:26:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732383AbfHZN0Z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 26 Aug 2019 09:26:25 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:35474 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732377AbfHZN0Y (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 26 Aug 2019 09:26:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
        :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
        :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=B1hiIfQ+IMMoK0UwnaPA+7E8zI516MBjiIdUjTMmRXQ=; b=fMe7aSwVdVuFHzkDJPu42O11Zj
        TBtavI5OasUn5QBVUMb/kxVtMA/fmVJ0XUXCosf6ZhZBvj9PLbh+knag2U84iwvNjKO7zSSmKh25Q
        9DJ9sB+wbdfzSJQslXxnxmtv5GBMgpHMskVXsYV0SD9r5oVagLXN1bRpY82B66HbPrOWY3bw1q6Fi
        ahkWOi9xKrGYlpi4WiJfOPgiP0qnRIeJTE7tvjbbon20xoE0TPB7iq4flXYOFsu8o+j3x47eOuc6d
        5JCNtNJBohtl83en+5OEK9KPqmnI314j42yxDaBvRji6FH/um/PtUNU0CvcUCXcmdIVtVF9XceAra
        cz66i6fA==;
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i2F0e-0007xw-57; Mon, 26 Aug 2019 13:26:12 +0000
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
        linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 5/6] arm64: document the choice of page attributes for pgprot_dmacoherent
Date:   Mon, 26 Aug 2019 15:25:52 +0200
Message-Id: <20190826132553.4116-6-hch@lst.de>
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

Based on an email from Will Deacon.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: Will Deacon <will@kernel.org>
Acked-by: Mark Rutland <mark.rutland@arm.com>
---
 arch/arm64/include/asm/pgtable.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 6700371227d1..fd40fb05eb51 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -435,6 +435,14 @@ static inline pmd_t pmd_mkdevmap(pmd_t pmd)
 	__pgprot_modify(prot, PTE_ATTRINDX_MASK, PTE_ATTRINDX(MT_NORMAL_NC) | PTE_PXN | PTE_UXN)
 #define pgprot_device(prot) \
 	__pgprot_modify(prot, PTE_ATTRINDX_MASK, PTE_ATTRINDX(MT_DEVICE_nGnRE) | PTE_PXN | PTE_UXN)
+/*
+ * DMA allocations for non-coherent devices use what the Arm architecture calls
+ * "Normal non-cacheable" memory, which permits speculation, unaligned accesses
+ * and merging of writes.  This is different from "Device-nGnR[nE]" memory which
+ * is intended for MMIO and thus forbids speculation, preserves access size,
+ * requires strict alignment and can also force write responses to come from the
+ * endpoint.
+ */
 #define pgprot_dmacoherent(prot) \
 	__pgprot_modify(prot, PTE_ATTRINDX_MASK, \
 			PTE_ATTRINDX(MT_NORMAL_NC) | PTE_PXN | PTE_UXN)
-- 
2.20.1

