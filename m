Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C200E300269
	for <lists+linux-mips@lfdr.de>; Fri, 22 Jan 2021 13:06:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727746AbhAVMEw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Jan 2021 07:04:52 -0500
Received: from elvis.franken.de ([193.175.24.41]:42476 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727820AbhAVKyi (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 22 Jan 2021 05:54:38 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l2u4i-0006yq-03; Fri, 22 Jan 2021 11:53:56 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 04761C0BF1; Fri, 22 Jan 2021 11:52:25 +0100 (CET)
Date:   Fri, 22 Jan 2021 11:52:25 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Lauri Kasanen <cand@gmx.com>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 2/6 v6] mips: Add N64 machine type
Message-ID: <20210122105225.GF8146@alpha.franken.de>
References: <20210113171123.7c819ee9cb9f07f0a4e80e5a@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113171123.7c819ee9cb9f07f0a4e80e5a@gmx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jan 13, 2021 at 05:11:23PM +0200, Lauri Kasanen wrote:
> Add support for the Nintendo 64.
> 
> Signed-off-by: Lauri Kasanen <cand@gmx.com>
> ---
>  arch/mips/Kbuild.platforms               |   1 +
>  arch/mips/Kconfig                        |  12 +++
>  arch/mips/include/asm/mach-n64/irq.h     |   9 ++
>  arch/mips/include/asm/mach-n64/kmalloc.h |   8 ++
>  arch/mips/n64/Makefile                   |   6 ++
>  arch/mips/n64/Platform                   |   7 ++
>  arch/mips/n64/init.c                     | 164 +++++++++++++++++++++++++++++++
>  arch/mips/n64/irq.c                      |  16 +++
>  8 files changed, 223 insertions(+)
>  create mode 100644 arch/mips/include/asm/mach-n64/irq.h
>  create mode 100644 arch/mips/include/asm/mach-n64/kmalloc.h
>  create mode 100644 arch/mips/n64/Makefile
>  create mode 100644 arch/mips/n64/Platform
>  create mode 100644 arch/mips/n64/init.c
>  create mode 100644 arch/mips/n64/irq.c

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
