Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C142528B265
	for <lists+linux-mips@lfdr.de>; Mon, 12 Oct 2020 12:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387725AbgJLKil (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Oct 2020 06:38:41 -0400
Received: from elvis.franken.de ([193.175.24.41]:58410 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387558AbgJLKiS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Oct 2020 06:38:18 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kRvDc-0008KW-02; Mon, 12 Oct 2020 12:38:16 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id A6A13C1140; Mon, 12 Oct 2020 12:30:00 +0200 (CEST)
Date:   Mon, 12 Oct 2020 12:30:00 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] MIPS: cpu-probe: move fpu probing/handling into
 its own file
Message-ID: <20201012103000.GB7765@alpha.franken.de>
References: <20201008213327.11603-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201008213327.11603-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Oct 08, 2020 at 11:33:25PM +0200, Thomas Bogendoerfer wrote:
> cpu-probe.c has grown when supporting more and more CPUs and there
> are use cases where probing for all the CPUs isn't useful like
> running on a R3k system. But still the fpu handling is nearly
> the same. For sharing put the fpu code into it's own file.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
> Changes in v2:
> 	removed #ifdef CONFIG_MIPS_FP_SUPPORT in fpu-probe.c
> 	added include fpu-probe.h in fpu-proble.c
> 
> 
>  arch/mips/kernel/Makefile    |   1 +
>  arch/mips/kernel/cpu-probe.c | 326 +------------------------------------------
>  arch/mips/kernel/fpu-probe.c | 319 ++++++++++++++++++++++++++++++++++++++++++
>  arch/mips/kernel/fpu-probe.h |  40 ++++++
>  4 files changed, 362 insertions(+), 324 deletions(-)
>  create mode 100644 arch/mips/kernel/fpu-probe.c
>  create mode 100644 arch/mips/kernel/fpu-probe.h

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
