Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1BE84D17AD
	for <lists+linux-mips@lfdr.de>; Wed,  9 Oct 2019 20:43:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730490AbfJISnO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 9 Oct 2019 14:43:14 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:33612 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728804AbfJISnO (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 9 Oct 2019 14:43:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=4IINCFeaSJyuK///5d+ZVyEn9IR5HdVzFzHth3rJj94=; b=WNndJd8iEM1zprft3l27wvIsf
        meIaoWTsmNDuGLgQZJ7VOmwlYs9l8Y1l8AkowGTHRJ1VfNpJvUVIZfCkr4gTvDcWTooV5KloG0czV
        x8sXo2VRYn+K/fsyIGfoYSX34WcnneGFkDIIG6yaoEu5MR2I9dRjPw/JO25DXmGmTWQAxnPvfC0+R
        ttVYbv7tLrm4gjTz3+MswMTyJ6zryiXjew9wDj4pLpJ2TLdVEeaTP6Ewjzbkv+QIxPaswGm2bUCwv
        0S0axOq7ytdUaKGF1vbwUoJYlF8Uj0LF3NA/+KmQ/oBi80MtmKf/IGBRw1CqlYvo85ERvDgXD1/Zu
        q92iUrevg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.92.2 #3 (Red Hat Linux))
        id 1iIGvX-0001tD-Ee; Wed, 09 Oct 2019 18:43:11 +0000
Date:   Wed, 9 Oct 2019 11:43:11 -0700
From:   Christoph Hellwig <hch@infradead.org>
To:     Thomas Bogendoerfer <tbogendoerfer@suse.de>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: add support for SGI Octane (IP30)
Message-ID: <20191009184311.GA20261@infradead.org>
References: <20191009155928.3047-1-tbogendoerfer@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191009155928.3047-1-tbogendoerfer@suse.de>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

> +++ b/arch/mips/sgi-ip30/ip30-pci.c
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * ip30-pci.c: misc PCI related helper code for IP30 architecture
> + */
> +
> +#include <asm/pci/bridge.h>
> +
> +dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
> +{
> +	struct pci_dev *pdev = to_pci_dev(dev);
> +	struct bridge_controller *bc = BRIDGE_CONTROLLER(pdev->bus);
> +
> +	return bc->baddr + paddr;
> +}
> +
> +phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dma_addr)
> +{
> +	return dma_addr & ~(0xffUL << 56);
> +}

This file is duplicated from ip27.  I think we should aim to share
it given the common hardware even if it is mostly trivial.
