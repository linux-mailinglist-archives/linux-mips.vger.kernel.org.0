Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A96CB28B256
	for <lists+linux-mips@lfdr.de>; Mon, 12 Oct 2020 12:38:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387614AbgJLKiS (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Oct 2020 06:38:18 -0400
Received: from elvis.franken.de ([193.175.24.41]:58413 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387463AbgJLKiS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Oct 2020 06:38:18 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kRvDc-0008KW-03; Mon, 12 Oct 2020 12:38:16 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 4A5A5C1140; Mon, 12 Oct 2020 12:30:21 +0200 (CEST)
Date:   Mon, 12 Oct 2020 12:30:21 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] MIPS: cpu-probe: introduce exclusive R3k CPU probe
Message-ID: <20201012103021.GC7765@alpha.franken.de>
References: <20201008213327.11603-1-tsbogend@alpha.franken.de>
 <20201008213327.11603-2-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201008213327.11603-2-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Oct 08, 2020 at 11:33:26PM +0200, Thomas Bogendoerfer wrote:
> Running a kernel on a R3k of machine definitly will never see one of
> the newer CPU cores. And since R3k system usually are low on memory
> we could save quite some kbytes:
> 
>    text	   data	    bss	    dec	    hex	filename
>   15070	     88	     32	  15190	   3b56	arch/mips/kernel/cpu-probe.o
>     844	      4	     16	    864	    360	arch/mips/kernel/cpu-r3k-probe.o
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/kernel/Makefile        |   8 +-
>  arch/mips/kernel/cpu-r3k-probe.c | 171 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 178 insertions(+), 1 deletion(-)
>  create mode 100644 arch/mips/kernel/cpu-r3k-probe.c

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
