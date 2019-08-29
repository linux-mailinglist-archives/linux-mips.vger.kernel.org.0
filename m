Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A22DAA1F1B
	for <lists+linux-mips@lfdr.de>; Thu, 29 Aug 2019 17:28:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbfH2P2W (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 29 Aug 2019 11:28:22 -0400
Received: from verein.lst.de ([213.95.11.211]:47223 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727294AbfH2P2W (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 29 Aug 2019 11:28:22 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id C63D5227A81; Thu, 29 Aug 2019 17:28:16 +0200 (CEST)
Date:   Thu, 29 Aug 2019 17:28:16 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     iommu@lists.linux-foundation.org
Cc:     Shawn Anastasio <shawn@anastas.io>, Will Deacon <will@kernel.org>,
        linux-m68k@lists.linux-m68k.org, Guan Xuetao <gxt@pku.edu.cn>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Russell King <linux@armlinux.org.uk>,
        linux-mips@vger.kernel.org, Paul Burton <paul.burton@mips.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        James Hogan <jhogan@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: cleanup the dma_pgprot handling v2
Message-ID: <20190829152816.GA20232@lst.de>
References: <20190826132553.4116-1-hch@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190826132553.4116-1-hch@lst.de>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

I've pulled this into the dma-mapping for-next tree now.
