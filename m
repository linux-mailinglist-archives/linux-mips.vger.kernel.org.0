Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C3DAB10B6
	for <lists+linux-mips@lfdr.de>; Thu, 12 Sep 2019 16:09:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732389AbfILOJV (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 12 Sep 2019 10:09:21 -0400
Received: from elvis.franken.de ([193.175.24.41]:41051 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732348AbfILOJV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 12 Sep 2019 10:09:21 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1i8Pmh-0003T2-00; Thu, 12 Sep 2019 16:09:19 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 1E80CC278A; Thu, 12 Sep 2019 16:09:12 +0200 (CEST)
Date:   Thu, 12 Sep 2019 16:09:12 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Paul Burton <paul.burton@mips.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>
Subject: Re: [PATCH] mips: sgi-ip27: switch from DISCONTIGMEM to SPARSEMEM
Message-ID: <20190912140912.GA13137@alpha.franken.de>
References: <20190905133251.GA3650@rapoport-lnx>
 <20190905154831.88b7853b47ba7db7bd7626bd@suse.de>
 <20190905154747.GB3650@rapoport-lnx>
 <20190905233800.0f6b3fb3722cde2f5a88663a@suse.de>
 <20190906130223.GA17704@rapoport-lnx>
 <20190909182242.c1ef9717d14b20212ef75954@suse.de>
 <20190910113243.GA19207@rapoport-lnx>
 <20190911160939.19f776535770d12ff51a2af7@suse.de>
 <20190912105831.GA10677@rapoport-lnx>
 <20190912155539.6151b0811e858455be4c8d86@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190912155539.6151b0811e858455be4c8d86@suse.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Sep 12, 2019 at 03:55:39PM +0200, Thomas Bogendoerfer wrote:
> - reserved[0xd]	[0x000000035bff8000-0x000000035bffffff], 0x0000000000008000 bytes flags: 0x0
> 
> I have no idea which reservation this is, but it's not from one of the
> node data.

that's sparsemem's mem_section. And 

 free_bootmem_with_active_regions(node, end_pfn);

on the last node will free this reserved memory, when memory
is added node by node. This explains it.

So when resending the patch add my

Tested-by: Thomas Bogendoerfer <tbogendoerfer@suse.de>

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
