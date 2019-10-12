Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAED5D4B5E
	for <lists+linux-mips@lfdr.de>; Sat, 12 Oct 2019 02:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726521AbfJLAds (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 11 Oct 2019 20:33:48 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:59150 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726269AbfJLAds (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 11 Oct 2019 20:33:48 -0400
Received: from [192.168.1.13] (c-76-114-240-162.hsd1.md.comcast.net [76.114.240.162])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: kumba)
        by smtp.gentoo.org (Postfix) with ESMTPSA id 3DB9F34BBE2;
        Sat, 12 Oct 2019 00:33:46 +0000 (UTC)
Subject: Re: [PATCH] MIPS: add support for SGI Octane (IP30)
To:     Christoph Hellwig <hch@infradead.org>,
        Thomas Bogendoerfer <tbogendoerfer@suse.de>
Cc:     Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191009155928.3047-1-tbogendoerfer@suse.de>
 <20191009184311.GA20261@infradead.org>
From:   Joshua Kinard <kumba@gentoo.org>
Openpgp: preference=signencrypt
Message-ID: <5c6ab720-218a-14aa-9112-a12b88b63bc2@gentoo.org>
Date:   Fri, 11 Oct 2019 20:33:43 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191009184311.GA20261@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10/9/2019 14:43, Christoph Hellwig wrote:
>> +++ b/arch/mips/sgi-ip30/ip30-pci.c
>> @@ -0,0 +1,19 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * ip30-pci.c: misc PCI related helper code for IP30 architecture
>> + */
>> +
>> +#include <asm/pci/bridge.h>
>> +
>> +dma_addr_t __phys_to_dma(struct device *dev, phys_addr_t paddr)
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(dev);
>> +	struct bridge_controller *bc = BRIDGE_CONTROLLER(pdev->bus);
>> +
>> +	return bc->baddr + paddr;
>> +}
>> +
>> +phys_addr_t __dma_to_phys(struct device *dev, dma_addr_t dma_addr)
>> +{
>> +	return dma_addr & ~(0xffUL << 56);
>> +}
> 
> This file is duplicated from ip27.  I think we should aim to share
> it given the common hardware even if it is mostly trivial.
> 

It's possible that we may need to add an IP30-specific WAR here eventually.
 OpenBSD code has this to say about BRIDGE on IP30 systems:

http://bxr.su/OpenBSD/sys/arch/sgi/sgi/ip30_machdep.c

144    /*
145     * Register DMA-reachable memory constraints.
146     * The xbridge(4) is limited to a 31-bit region (its IOMMU features
147     * are too restricted to be of use).
148     */
149    dma_constraint.ucr_low = 0;
150    dma_constraint.ucr_high = (1UL << 31) - 1;

I never figured out how in Linux one does something equivalent.  I knew it
needed to be done in the older dma-coherence.h file, and now in the newer
__phys_to_dma() function here.  This is, if memory recalls correctly,
because >2GB RAM in Octane causes issues w/ BRIDGE DMA access.

OpenBSD applies this same limit to IP27, but I have a sneaking suspicion
that it's strictly an IP30 hardware bug, because my Onyx2 has 8GB of RAM and
it usually boots fine on its own.  Pop more than 2GB into an Octane, though,
and, if it boots at all, disk or network I/O will usually bus error it at
some point.

-- 
Joshua Kinard
Gentoo/MIPS
kumba@gentoo.org
rsa6144/5C63F4E3F5C6C943 2015-04-27
177C 1972 1FB8 F254 BAD0 3E72 5C63 F4E3 F5C6 C943

"The past tempts us, the present confuses us, the future frightens us.  And
our lives slip away, moment by moment, lost in that vast, terrible in-between."

--Emperor Turhan, Centauri Republic
