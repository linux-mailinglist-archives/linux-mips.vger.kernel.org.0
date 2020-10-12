Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF52928B25A
	for <lists+linux-mips@lfdr.de>; Mon, 12 Oct 2020 12:38:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387646AbgJLKiU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Oct 2020 06:38:20 -0400
Received: from elvis.franken.de ([193.175.24.41]:58432 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387604AbgJLKiT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Oct 2020 06:38:19 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kRvDc-0008KW-08; Mon, 12 Oct 2020 12:38:16 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id E2460C1140; Mon, 12 Oct 2020 12:35:15 +0200 (CEST)
Date:   Mon, 12 Oct 2020 12:35:15 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH v2 2/4 RESEND] MIPS: Loongson64: Clean up numa.c
Message-ID: <20201012103515.GB7953@alpha.franken.de>
References: <1602373674-4579-1-git-send-email-yangtiezhu@loongson.cn>
 <1602373674-4579-3-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1602373674-4579-3-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Oct 11, 2020 at 07:47:52AM +0800, Tiezhu Yang wrote:
> (1) Replace nid_to_addroffset() with nid_to_addrbase() and then remove the
> related useless code.
> 
> (2) Since end_pfn = start_pfn + node_psize, use "node_psize" instead of
> "end_pfn - start_pfn" to avoid the redundant calculation.
> 
> (3) After commit 6fbde6b492df ("MIPS: Loongson64: Move files to the
> top-level directory"), CONFIG_ZONE_DMA32 is always set for Loongson64
> due to MACH_LOONGSON64 selects ZONE_DMA32, so no need to use ifdef any
> more, just remove it.
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> 
> v2: no changes, just add Reviewed-by tag
> 
>  arch/mips/include/asm/mach-loongson64/mmzone.h |  6 +-----
>  arch/mips/loongson64/numa.c                    | 29 +++-----------------------
>  2 files changed, 4 insertions(+), 31 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
