Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 59943473060
	for <lists+linux-mips@lfdr.de>; Mon, 13 Dec 2021 16:26:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236047AbhLMP0H (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 13 Dec 2021 10:26:07 -0500
Received: from elvis.franken.de ([193.175.24.41]:44965 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230072AbhLMP0H (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 13 Dec 2021 10:26:07 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mwnDJ-0007NN-01; Mon, 13 Dec 2021 16:26:05 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 8F980C068C; Mon, 13 Dec 2021 16:25:48 +0100 (CET)
Date:   Mon, 13 Dec 2021 16:25:48 +0100
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
Subject: Re: [PATCH 1/2] MIPS: rework local_t operation on MIPS64
Message-ID: <20211213152548.GB16371@alpha.franken.de>
References: <20211206061944.21323-1-huangpei@loongson.cn>
 <20211206061944.21323-2-huangpei@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206061944.21323-2-huangpei@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Dec 06, 2021 at 02:19:43PM +0800, Huang Pei wrote:
> +. use "daddu/dsubu" for long int on MIPS64 instead of "addu/subu"
> 
> +. remove "asm/war.h" since R10000_LLSC_WAR became a config option
> 
> +. clean up
> 
> Fixes: 7232311ef14c ("local_t: mips extension")
> Suggested-by:  Maciej W. Rozycki <macro@orcam.me.uk>
> Signed-off-by: Huang Pei <huangpei@loongson.cn>

please split this into at least two patches. One which just fixes
the bug and then do the cleanups.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
