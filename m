Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36F78300268
	for <lists+linux-mips@lfdr.de>; Fri, 22 Jan 2021 13:06:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727894AbhAVMEm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 22 Jan 2021 07:04:42 -0500
Received: from elvis.franken.de ([193.175.24.41]:42479 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727821AbhAVKyi (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 22 Jan 2021 05:54:38 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l2u4i-0006yq-02; Fri, 22 Jan 2021 11:53:56 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 39392C0BF1; Fri, 22 Jan 2021 11:51:55 +0100 (CET)
Date:   Fri, 22 Jan 2021 11:51:55 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Lauri Kasanen <cand@gmx.com>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH 1/6 v6] Revert "MIPS: Remove unused R4300 CPU support"
Message-ID: <20210122105155.GE8146@alpha.franken.de>
References: <20210113171007.27fe6b22bf30839c74023e50@gmx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113171007.27fe6b22bf30839c74023e50@gmx.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jan 13, 2021 at 05:10:07PM +0200, Lauri Kasanen wrote:
> This reverts commit f9065b54d437c4660e3d974ad9ce5188c068cd76.
> 
> We're adding Nintendo 64 support, so the VR4300 is no longer unused.
> 
> Signed-off-by: Lauri Kasanen <cand@gmx.com>
> ---
>  arch/mips/Kconfig                | 12 ++++++++++++
>  arch/mips/Makefile               |  1 +
>  arch/mips/include/asm/cpu-type.h |  5 +++++
>  arch/mips/include/asm/cpu.h      |  2 +-
>  arch/mips/include/asm/vermagic.h |  2 ++
>  arch/mips/kernel/cpu-probe.c     |  9 +++++++++
>  arch/mips/kernel/idle.c          |  1 +
>  arch/mips/mm/c-r4k.c             |  1 +
>  arch/mips/mm/tlbex.c             |  1 +
>  9 files changed, 33 insertions(+), 1 deletion(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
