Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86071485144
	for <lists+linux-mips@lfdr.de>; Wed,  5 Jan 2022 11:42:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239473AbiAEKmd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 Jan 2022 05:42:33 -0500
Received: from elvis.franken.de ([193.175.24.41]:58471 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239466AbiAEKmb (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 5 Jan 2022 05:42:31 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1n53kT-0007Hx-01; Wed, 05 Jan 2022 11:42:29 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 9A00CC0E31; Wed,  5 Jan 2022 11:35:23 +0100 (CET)
Date:   Wed, 5 Jan 2022 11:35:23 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huang Pei <huangpei@loongson.cn>
Cc:     ambrosehua@gmail.com, Bibo Mao <maobibo@loongson.cn>,
        linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>,
        "Maciej W . Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCH 3/4] MIPS: rework local_t operation on MIPS64
Message-ID: <20220105103523.GB7009@alpha.franken.de>
References: <20211215084500.24444-1-huangpei@loongson.cn>
 <20211215084500.24444-4-huangpei@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211215084500.24444-4-huangpei@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Dec 15, 2021 at 04:44:59PM +0800, Huang Pei wrote:
> +. remove "asm/war.h" since R10000_LLSC_WAR became a config option
> 
> +. clean up
> 
> Suggested-by:  Maciej W. Rozycki <macro@orcam.me.uk>
> Signed-off-by: Huang Pei <huangpei@loongson.cn>
> ---
>  arch/mips/include/asm/asm.h   | 18 ++++++++++
>  arch/mips/include/asm/local.h | 62 +++++++++--------------------------
>  2 files changed, 33 insertions(+), 47 deletions(-)

applied to mips-next adapted to the changed first patch.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
