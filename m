Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57982B380E
	for <lists+linux-mips@lfdr.de>; Mon, 16 Sep 2019 12:27:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726084AbfIPK1a (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Sep 2019 06:27:30 -0400
Received: from elvis.franken.de ([193.175.24.41]:52286 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725850AbfIPK1a (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 16 Sep 2019 06:27:30 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1i9oEA-00079F-00; Mon, 16 Sep 2019 12:27:26 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D578CC2792; Mon, 16 Sep 2019 12:07:10 +0200 (CEST)
Date:   Mon, 16 Sep 2019 12:07:10 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH] mips: sgi-ip27: switch from DISCONTIGMEM to SPARSEMEM
Message-ID: <20190916100710.GA5838@alpha.franken.de>
References: <20190906130223.GA17704@rapoport-lnx>
 <20190909182242.c1ef9717d14b20212ef75954@suse.de>
 <20190910113243.GA19207@rapoport-lnx>
 <20190911160939.19f776535770d12ff51a2af7@suse.de>
 <20190912105831.GA10677@rapoport-lnx>
 <20190912155539.6151b0811e858455be4c8d86@suse.de>
 <20190912140912.GA13137@alpha.franken.de>
 <20190914104112.GA12045@rapoport-lnx>
 <20190916090705.GA5119@alpha.franken.de>
 <20190916095233.GB5196@rapoport-lnx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190916095233.GB5196@rapoport-lnx>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Sep 16, 2019 at 12:52:35PM +0300, Mike Rapoport wrote:
> On Mon, Sep 16, 2019 at 11:07:05AM +0200, Thomas Bogendoerfer wrote:
> > Patch is good. I've compared bootlogs and output is the same
> > regarding memblock/memory debug messages.
> 
> Can I add your co-developed+signed-off then?

yes :-)

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
