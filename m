Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5E2139D06A
	for <lists+linux-mips@lfdr.de>; Mon, 26 Aug 2019 15:26:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730956AbfHZN0N (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 26 Aug 2019 09:26:13 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:34756 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727462AbfHZN0N (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 26 Aug 2019 09:26:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=rPETQGaDckDZVtLIzvt1M3lT8jH23GiXzU9sIDOMY7g=; b=ReaDf4JWYplq41pCVxv3bXWp9
        Cuu9gd7GPo3H6qUuEWvSd5ZvsQHizunWLcCUeE8CF+GtlIilI/apIO1wxGBB+LaGLJZAQUkUaBoAo
        zmpjQYEG8cdwaZFqo2ylFhNQmkwvT+AMaXw9ZNVs/tFFbFm6/3UBeKTX8hn0VATipq7Xx8tNjA3UI
        l5XG2kAplfYXzqIOKj2/IEGK9yN0XLFtYiWDTl97XrK5Ps4QX/d9ikTqgbM6DwEDW55o+CQkN8bgW
        5ZaZNFN9NKK/kpK+1fI2S7dWlLlkPcR97byuTnosY9xRA6TACMW510W7cX+bte91+aQ/100y1A4FA
        4Sw+IQLQA==;
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1i2F0O-0007u5-36; Mon, 26 Aug 2019 13:25:56 +0000
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
Subject: cleanup the dma_pgprot handling v2
Date:   Mon, 26 Aug 2019 15:25:47 +0200
Message-Id: <20190826132553.4116-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi all,

this series replaces the arch_dma_mmap_pgprot hooks with the
simpler pgprot_dmacoherent as used by the arm code already and
cleans up various bits around that area.

Changes since v1:
 - improve the new arm64 comment
 - keep the special DMA_ATTR_WRITE_COMBINE handling for mips and
   document it
