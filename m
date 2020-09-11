Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98C11265A0A
	for <lists+linux-mips@lfdr.de>; Fri, 11 Sep 2020 09:07:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725554AbgIKHHi (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 11 Sep 2020 03:07:38 -0400
Received: from verein.lst.de ([213.95.11.211]:35740 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725535AbgIKHHc (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 11 Sep 2020 03:07:32 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 6D8E568B02; Fri, 11 Sep 2020 09:07:30 +0200 (CEST)
Date:   Fri, 11 Sep 2020 09:07:30 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Hillf Danton <hdanton@sina.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 03/12] MIPS/jazzdma: decouple from dma-direct
Message-ID: <20200911070730.GA22394@lst.de>
References: <20200908164758.3177341-1-hch@lst.de> <20200910141233.10768-1-hdanton@sina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910141233.10768-1-hdanton@sina.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Sep 10, 2020 at 10:12:33PM +0800, Hillf Danton wrote:
> 
> On Tue,  8 Sep 2020 18:47:49 +0200 Christoph Hellwig wrote:
> > 
> > The jazzdma ops implement support for a very basic IOMMU.  Thus we really
> > should not use the dma-direct code that takes physical address limits
> > into account.  This survived through the great MIPS DMA ops cleanup mostly
> > because I was lazy, but now it is time to fully split the implementations.
> 
> A minor change in behavior, do we need to clear the dma buf as the
> dma-direct code does?

Yes, I've fixed this up.
