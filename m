Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0EA31D2A3B
	for <lists+linux-mips@lfdr.de>; Thu, 10 Oct 2019 15:01:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728339AbfJJNBi convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Thu, 10 Oct 2019 09:01:38 -0400
Received: from mx2.suse.de ([195.135.220.15]:57892 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728274AbfJJNBi (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 10 Oct 2019 09:01:38 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 8B7CEAED6;
        Thu, 10 Oct 2019 13:01:36 +0000 (UTC)
Date:   Thu, 10 Oct 2019 15:01:36 +0200
From:   Thomas Bogendoerfer <tbogendoerfer@suse.de>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: add support for SGI Octane (IP30)
Message-Id: <20191010150136.a30e47b37f8c8aed9e863a5e@suse.de>
In-Reply-To: <20191009184311.GA20261@infradead.org>
References: <20191009155928.3047-1-tbogendoerfer@suse.de>
        <20191009184311.GA20261@infradead.org>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, 9 Oct 2019 11:43:11 -0700
Christoph Hellwig <hch@infradead.org> wrote:

> > +++ b/arch/mips/sgi-ip30/ip30-pci.c
> > @@ -0,0 +1,19 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * ip30-pci.c: misc PCI related helper code for IP30 architecture
> > + */
> > +
> > +#include <asm/pci/bridge.h>
> > +
> > +dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
> > +{
> > +	struct pci_dev *pdev = to_pci_dev(dev);
> > +	struct bridge_controller *bc = BRIDGE_CONTROLLER(pdev->bus);
> > +
> > +	return bc->baddr + paddr;
> > +}
> > +
> > +phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dma_addr)
> > +{
> > +	return dma_addr & ~(0xffUL << 56);
> > +}
> 
> This file is duplicated from ip27.  I think we should aim to share
> it given the common hardware even if it is mostly trivial.

ok, as far as I can anticipate IP35 verion of this functions will be
the same as well. So I'll move both into pci-xtalk-bridge.c in the
next version of the patch.

Thomas.

-- 
SUSE Software Solutions Germany GmbH
HRB 247165 (AG München)
Geschäftsführer: Felix Imendörffer
