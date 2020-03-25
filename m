Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 086121922AE
	for <lists+linux-mips@lfdr.de>; Wed, 25 Mar 2020 09:30:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727346AbgCYIaR (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 25 Mar 2020 04:30:17 -0400
Received: from verein.lst.de ([213.95.11.211]:39651 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727275AbgCYIaR (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 25 Mar 2020 04:30:17 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id A87AE68AFE; Wed, 25 Mar 2020 09:30:13 +0100 (CET)
Date:   Wed, 25 Mar 2020 09:30:12 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     "Maciej W. Rozycki" <macro@linux-mips.org>
Cc:     Christoph Hellwig <hch@lst.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Fredrik Noring <noring@nocrew.org>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/6] MIPS: remove cpu_has_64bit_gp_regs and
 cpu_has_64bit_addresses
Message-ID: <20200325083012.GA21605@lst.de>
References: <20200324161525.754181-1-hch@lst.de> <20200324161525.754181-2-hch@lst.de> <alpine.LFD.2.21.2003250226450.2689954@eddie.linux-mips.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.21.2003250226450.2689954@eddie.linux-mips.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 25, 2020 at 02:36:57AM +0000, Maciej W. Rozycki wrote:
> On Tue, 24 Mar 2020, Christoph Hellwig wrote:
> 
> > Both macros are always identical to CONFIG_64BIT.
> 
>  I think this abstraction makes sense, especially if we want to support 
> 64-bit CPUs that only support 32-bit segments, i.e. MIPS architecture 
> processors whose CP0.Config.AT=1, or legacy MIPS processors that had a 
> similar limitation, such as the R5900 currently under review.

The only use of cpu_has_64bit_addresses is the choice of the ioremap
code base.  Which ioremap code does the R5900 want to use?  If it
doesn't match CONFIG_64BIT having a config option for the ioremap
implementation seems much more sensible, and can be added with the
R5900 patch set (do you have a link to it?).
