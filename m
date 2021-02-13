Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 987B331AAA1
	for <lists+linux-mips@lfdr.de>; Sat, 13 Feb 2021 10:20:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbhBMJUN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 13 Feb 2021 04:20:13 -0500
Received: from elvis.franken.de ([193.175.24.41]:52743 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229475AbhBMJUM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 13 Feb 2021 04:20:12 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lAr4j-0003E3-01; Sat, 13 Feb 2021 10:18:49 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id B9778C0344; Sat, 13 Feb 2021 10:05:57 +0100 (CET)
Date:   Sat, 13 Feb 2021 10:05:57 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Revert "MIPS: kernel: {ftrace,kgdb}: Set correct
 address limit for cache flushes"
Message-ID: <20210213090557.GB4330@alpha.franken.de>
References: <20210210161615.21228-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210210161615.21228-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Feb 10, 2021 at 05:16:13PM +0100, Thomas Bogendoerfer wrote:
> This reverts commit 6ebda44f366478d1eea180d93154e7d97b591f50.
> 
> All icache flushes in this code paths are done via flush_icache_range(),
> which only uses normal cache instruction. And this is the correct thing
> for EVA mode, too. So no need to do set_fs(KERNEL_DS) here.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/kernel/ftrace.c |  4 ----
>  arch/mips/kernel/kgdb.c   | 18 +-----------------
>  2 files changed, 1 insertion(+), 21 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
