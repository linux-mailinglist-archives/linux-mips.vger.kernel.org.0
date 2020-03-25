Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEF5B192384
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2020 09:58:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727394AbgCYI6z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 25 Mar 2020 04:58:55 -0400
Received: from verein.lst.de ([213.95.11.211]:39791 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727372AbgCYI6z (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 25 Mar 2020 04:58:55 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id C17A268AFE; Wed, 25 Mar 2020 09:58:52 +0100 (CET)
Date:   Wed, 25 Mar 2020 09:58:52 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Fredrik Noring <noring@nocrew.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] MIPS: remove cpu_has_64bit_gp_regs and
 cpu_has_64bit_addresses
Message-ID: <20200325085852.GA23786@lst.de>
References: <20200324161525.754181-1-hch@lst.de> <20200324161525.754181-2-hch@lst.de> <alpine.LFD.2.21.2003250226450.2689954@eddie.linux-mips.org> <20200325083012.GA21605@lst.de> <20200325085524.GA28706@sx9>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200325085524.GA28706@sx9>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 25, 2020 at 09:55:24AM +0100, Fredrik Noring wrote:
> > The only use of cpu_has_64bit_addresses is the choice of the ioremap
> > code base.  Which ioremap code does the R5900 want to use?  If it
> > doesn't match CONFIG_64BIT having a config option for the ioremap
> > implementation seems much more sensible, and can be added with the
> > R5900 patch set (do you have a link to it?).
> 
> I suppose this would be relevant for the n32 ABI, but initially we only
> have o32 for the R5900.

To enable ABIs you'll need Kconfig symbols, cpu_has_64bit_addresses
isn't going to be very useful for that.  Which kinda rather was the
point of this patch - to use the existing Kconfig symbol rather than
two redundant defines that caused a lot weird cargo culting.

> The (slightly outdated) patch series under review
> is available here:
> 
> https://lore.kernel.org/linux-mips/cover.1567326213.git.noring@nocrew.org/T/

You don't happen to have a git tree available somewhere?
