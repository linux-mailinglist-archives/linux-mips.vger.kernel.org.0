Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E9688FBC0
	for <lists+linux-mips@lfdr.de>; Fri, 16 Aug 2019 09:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726884AbfHPHKj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 16 Aug 2019 03:10:39 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:33632 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726425AbfHPHKj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 16 Aug 2019 03:10:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=3Qq7qY/Y+/QokmnypVaIdWNfeKd51C+DAMqy1j/sP20=; b=EUv2id8KF6AVMyId8dBRZWLWJ
        h9SGxV5uCJ9kLyT35rUFDewwEvXSlaXsl5XaHyT/QSXLUVBpYsLKuk4fL649vva/sxEff8l2m3Zll
        GAex6W6DkgNQ7nNswD1rxqBNgzOithIMuZmp3dstghsycmY4JTPkWchBhKfogN2ZJtAJC4Lk/bwtD
        a/d0Q9BmkqFC9iY+87GngVasJtyAREnATxe/6Zm8rftfindKvbcOVr1Dyp8bQATfOuLCXTO15iilO
        liuT1E9JsRApYiZRwDf3zYs6W88Hl8TJ2s7S7Gz4py8h2Y7ewh6NSGjfie8HuI9MZM5JaESBTkkhY
        AXutx8eqw==;
Received: from 089144199030.atnat0008.highway.a1.net ([89.144.199.30] helo=localhost)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hyWND-000653-C4; Fri, 16 Aug 2019 07:10:09 +0000
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
Subject: cleanup the dma_pgprot handling
Date:   Fri, 16 Aug 2019 09:07:48 +0200
Message-Id: <20190816070754.15653-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi all,

this series replaced the arch_dma_mmap_pgprot hooks with the
simpler pgprot_dmacoherent as used by the arm code already and
cleans up various bits around that area.

I'd still like to hear a confirmation from the mips folks how
the write combibe attribute can or can't work with the KSEG1
uncached segment.
