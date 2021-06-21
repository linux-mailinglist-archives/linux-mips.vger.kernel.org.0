Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5E4E3AE687
	for <lists+linux-mips@lfdr.de>; Mon, 21 Jun 2021 11:54:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbhFUJ4Z (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 21 Jun 2021 05:56:25 -0400
Received: from elvis.franken.de ([193.175.24.41]:40941 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229651AbhFUJ4Z (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 21 Jun 2021 05:56:25 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lvGd7-000490-02; Mon, 21 Jun 2021 11:54:09 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id ECFC2C071C; Mon, 21 Jun 2021 11:46:31 +0200 (CEST)
Date:   Mon, 21 Jun 2021 11:46:31 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huang Pei <huangpei@loongson.cn>
Cc:     ambrosehua@gmail.com, Bibo Mao <maobibo@loongson.cn>,
        linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Jinyang He <hejinyang@loongson.cn>
Subject: Re: [PATCH] MIPS: add PMD table accounting into MIPS'pmd_alloc_one
Message-ID: <20210621094631.GC4425@alpha.franken.de>
References: <20210611070946.302901-1-huangpei@loongson.cn>
 <20210611070946.302901-2-huangpei@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210611070946.302901-2-huangpei@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jun 11, 2021 at 03:09:46PM +0800, Huang Pei wrote:
> This fixes Page Table accounting bug.
> 
> MIPS is the ONLY arch just defining __HAVE_ARCH_PMD_ALLOC_ONE alone.
> Since commit b2b29d6d011944 (mm: account PMD tables like PTE tables),
> "pmd_free" in asm-generic with PMD table accounting and "pmd_alloc_one"
> in MIPS without PMD table accounting causes PageTable accounting number
> negative, which read by global_zone_page_state(), always returns 0.
> 
> Signed-off-by: Huang Pei <huangpei@loongson.cn>
> ---
>  arch/mips/include/asm/pgalloc.h | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
