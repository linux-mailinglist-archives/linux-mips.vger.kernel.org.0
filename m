Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB9AA317261
	for <lists+linux-mips@lfdr.de>; Wed, 10 Feb 2021 22:31:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233199AbhBJVbU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 10 Feb 2021 16:31:20 -0500
Received: from elvis.franken.de ([193.175.24.41]:41107 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233450AbhBJVab (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 10 Feb 2021 16:30:31 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l9x3M-0005Sj-00; Wed, 10 Feb 2021 22:29:40 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 3F92CC0E40; Wed, 10 Feb 2021 22:19:08 +0100 (CET)
Date:   Wed, 10 Feb 2021 22:19:08 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Christoph Hellwig <hch@infradead.org>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Revert "MIPS: kernel: {ftrace,kgdb}: Set correct
 address limit for cache flushes"
Message-ID: <20210210211908.GA11311@alpha.franken.de>
References: <20210210161615.21228-1-tsbogend@alpha.franken.de>
 <20210210191100.GB2208287@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210210191100.GB2208287@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Feb 10, 2021 at 07:11:00PM +0000, Christoph Hellwig wrote:
> On Wed, Feb 10, 2021 at 05:16:13PM +0100, Thomas Bogendoerfer wrote:
> > This reverts commit 6ebda44f366478d1eea180d93154e7d97b591f50.
> > 
> > All icache flushes in this code paths are done via flush_icache_range(),
> > which only uses normal cache instruction. And this is the correct thing
> > for EVA mode, too. So no need to do set_fs(KERNEL_DS) here.
> > 
> > Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> 
> Looks good,
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> 
> ... it might be time to kill off the remaining set_fs() users in mips
> code as well ...

I already have patches for that. Still needs some cleaning and testing
before sending/applying it.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
