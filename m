Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4603265A36
	for <lists+linux-mips@lfdr.de>; Fri, 11 Sep 2020 09:14:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725601AbgIKHOf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 11 Sep 2020 03:14:35 -0400
Received: from verein.lst.de ([213.95.11.211]:35803 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725468AbgIKHOe (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 11 Sep 2020 03:14:34 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 016DC68BFE; Fri, 11 Sep 2020 09:14:29 +0200 (CEST)
Date:   Fri, 11 Sep 2020 09:14:29 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Christoph Hellwig <hch@lst.de>, Tony Luck <tony.luck@intel.com>,
        Fenghua Yu <fenghua.yu@intel.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        iommu@lists.linux-foundation.org, Tomasz Figa <tfiga@chromium.org>,
        Joerg Roedel <joro@8bytes.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH 09/12] dma-direct: remove __dma_to_phys
Message-ID: <20200911071429.GE22394@lst.de>
References: <20200908164758.3177341-1-hch@lst.de> <20200908164758.3177341-10-hch@lst.de> <5d797c06-401d-62b1-f144-ea6e9a5144dd@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d797c06-401d-62b1-f144-ea6e9a5144dd@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Sep 10, 2020 at 02:26:03PM +0100, Robin Murphy wrote:
> On 2020-09-08 17:47, Christoph Hellwig wrote:
>> There is no harm in just always clearing the SME encryption bit, while
>> significantly simplifying the interface.
>
> After a 10-minute diversion into "but hang on, force_dma_unencrypted() is 
> meaningful on PPC and S390 too..." before realising that it all does just 
> come back to __sme_clr(), which is indeed a no-op for everyone other than 
> AMD, any simplification of this mess is indeed welcome :)
>
> Unless I've massively misunderstood how SME is supposed to work,

Exactly.  This weird encryption bit in AMD SME causes all kinds of harm,
and I'm glad no one picked it up.  I've also been wondering if we
should change the interface to explicit set/clear the bit, but I'll
leave that for another pass as fixing up the SME interfaces would turn
into a massive disgression.
