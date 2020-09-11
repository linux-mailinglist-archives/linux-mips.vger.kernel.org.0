Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E771D265A4E
	for <lists+linux-mips@lfdr.de>; Fri, 11 Sep 2020 09:18:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725792AbgIKHR5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 11 Sep 2020 03:17:57 -0400
Received: from verein.lst.de ([213.95.11.211]:35824 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725536AbgIKHR4 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 11 Sep 2020 03:17:56 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 1376068B02; Fri, 11 Sep 2020 09:17:52 +0200 (CEST)
Date:   Fri, 11 Sep 2020 09:17:51 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Christoph Hellwig <hch@lst.de>, Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        iommu@lists.linux-foundation.org, Tomasz Figa <tfiga@chromium.org>,
        Joerg Roedel <joro@8bytes.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH 12/12] dma-mapping: move the
 dma_declare_coherent_memory documentation
Message-ID: <20200911071751.GG22394@lst.de>
References: <20200908164758.3177341-1-hch@lst.de> <20200908164758.3177341-13-hch@lst.de> <07c51b70-fb7d-cf44-b5c3-54e3148c11ae@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <07c51b70-fb7d-cf44-b5c3-54e3148c11ae@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Sep 10, 2020 at 02:51:47PM +0100, Robin Murphy wrote:
> On 2020-09-08 17:47, Christoph Hellwig wrote:
>> dma_declare_coherent_memory should not be in a DMA API guide aimed
>> at driver writers (that is consumers of the API).  Move it to a comment
>> near the function instead.
>
> I still think there might be an occasional valid use for device-local 
> memory outside the scope of platform code without the driver having to go 
> full ZONE_DEVICE/HMM/TTM, e.g. with stuff like PCIe-based FPGA prototyping 
> cards, but the kind of driver I'm imagining for that case would never be 
> upstream anyway (if it were even written, rather than just using hard-coded 
> hacks), so meh.

And I'm not sure this would be the right interface for it.  E.g. NVMe
has the concept of a Controller Memory buffer (and a similar persistent
variant not supported by Linux), where the device can do this local DMA
(in a completely broken way that relies on correlating addresses seen
by the device and those by the host, but that's another disgression).
But that memory obviously can also be addresses by other devices using
PCIe P2P transactions which would also be useful for any HMM-ish devices,
so we'd need to expose it as P2P memory anyay..
