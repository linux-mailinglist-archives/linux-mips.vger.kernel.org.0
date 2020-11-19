Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8CC472B92E8
	for <lists+linux-mips@lfdr.de>; Thu, 19 Nov 2020 13:59:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727379AbgKSMza (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 19 Nov 2020 07:55:30 -0500
Received: from elvis.franken.de ([193.175.24.41]:43165 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727216AbgKSMz3 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 19 Nov 2020 07:55:29 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kfjTD-00054t-00; Thu, 19 Nov 2020 13:55:27 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 1A6C5C020B; Thu, 19 Nov 2020 13:53:14 +0100 (CET)
Date:   Thu, 19 Nov 2020 13:53:14 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [PATCH 0/2] Clean up and fix up cpu_cache_init()
Message-ID: <20201119125314.GA6314@alpha.franken.de>
References: <1605772381-25535-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1605772381-25535-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Nov 19, 2020 at 03:52:59PM +0800, Tiezhu Yang wrote:
> Tiezhu Yang (2):
>   MIPS: Remove cpu_has_6k_cache and cpu_has_8k_cache in cpu_cache_init()
>   MIPS: Loongson64: Fix wrong scache size when execute lscpu
> 
>  arch/mips/include/asm/cpu-features.h |  2 --
>  arch/mips/mm/c-r4k.c                 | 10 ++++------
>  arch/mips/mm/cache.c                 | 10 ----------
>  3 files changed, 4 insertions(+), 18 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
