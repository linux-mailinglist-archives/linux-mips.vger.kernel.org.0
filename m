Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EABEE3E11A4
	for <lists+linux-mips@lfdr.de>; Thu,  5 Aug 2021 11:52:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234746AbhHEJwd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 5 Aug 2021 05:52:33 -0400
Received: from elvis.franken.de ([193.175.24.41]:47052 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233324AbhHEJwd (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 5 Aug 2021 05:52:33 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mBa2s-0006CN-00; Thu, 05 Aug 2021 11:52:10 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id DC062C052F; Thu,  5 Aug 2021 11:46:46 +0200 (CEST)
Date:   Thu, 5 Aug 2021 11:46:46 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huang Pei <huangpei@loongson.cn>
Cc:     ambrosehua@gmail.com, Bibo Mao <maobibo@loongson.cn>,
        linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Jinyang He <hejinyang@loongson.cn>,
        Joshua Kinard <kumba@gentoo.org>
Subject: Re: [PATCH] MIPS: check return value of pgtable_pmd_page_ctor
Message-ID: <20210805094646.GA6665@alpha.franken.de>
References: <20210721093045.2474837-1-huangpei@loongson.cn>
 <20210721093045.2474837-2-huangpei@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210721093045.2474837-2-huangpei@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jul 21, 2021 at 05:30:45PM +0800, Huang Pei wrote:
> +. According to Documentation/vm/split_page_table_lock, handle failure
> of pgtable_pmd_page_ctor
> 
> +. Use GFP_KERNEL_ACCOUNT instead of GFP_KERNEL|__GFP_ACCOUNT
> 
> +. Adjust coding style
> 
> Fixes: ed914d48b6a1 ("MIPS: add PMD table accounting into MIPS')
> Reported-by: Joshua Kinard <kumba@gentoo.org>
> Signed-off-by: Huang Pei <huangpei@loongson.cn>
> ---
>  arch/mips/include/asm/pgalloc.h | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
