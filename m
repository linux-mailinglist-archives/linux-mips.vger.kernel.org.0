Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 447B5B36D2
	for <lists+linux-mips@lfdr.de>; Mon, 16 Sep 2019 11:07:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731651AbfIPJHP (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Sep 2019 05:07:15 -0400
Received: from elvis.franken.de ([193.175.24.41]:52205 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726541AbfIPJHP (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 16 Sep 2019 05:07:15 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1i9myX-0002mF-00; Mon, 16 Sep 2019 11:07:13 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id E18CDC278F; Mon, 16 Sep 2019 11:07:05 +0200 (CEST)
Date:   Mon, 16 Sep 2019 11:07:05 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH] mips: sgi-ip27: switch from DISCONTIGMEM to SPARSEMEM
Message-ID: <20190916090705.GA5119@alpha.franken.de>
References: <20190905154747.GB3650@rapoport-lnx>
 <20190905233800.0f6b3fb3722cde2f5a88663a@suse.de>
 <20190906130223.GA17704@rapoport-lnx>
 <20190909182242.c1ef9717d14b20212ef75954@suse.de>
 <20190910113243.GA19207@rapoport-lnx>
 <20190911160939.19f776535770d12ff51a2af7@suse.de>
 <20190912105831.GA10677@rapoport-lnx>
 <20190912155539.6151b0811e858455be4c8d86@suse.de>
 <20190912140912.GA13137@alpha.franken.de>
 <20190914104112.GA12045@rapoport-lnx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190914104112.GA12045@rapoport-lnx>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Sep 14, 2019 at 11:41:13AM +0100, Mike Rapoport wrote:
> On Thu, Sep 12, 2019 at 04:09:12PM +0200, Thomas Bogendoerfer wrote:
> > On Thu, Sep 12, 2019 at 03:55:39PM +0200, Thomas Bogendoerfer wrote:
> > > - reserved[0xd]	[0x000000035bff8000-0x000000035bffffff], 0x0000000000008000 bytes flags: 0x0
> > > 
> > > I have no idea which reservation this is, but it's not from one of the
> > > node data.
> > 
> > that's sparsemem's mem_section. And 
> > 
> >  free_bootmem_with_active_regions(node, end_pfn);
> 
> It seems that the call to free_bootmem_with_active_regions() should have
> been removed along with bootmem and it's not needed now.
> 
> Can you please test the below version of the patch?

Patch is good. I've compared bootlogs and output is the same
regarding memblock/memory debug messages.

When this is merged, I'll have a look into using memblock_alloc
for the node memory.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
