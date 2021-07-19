Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FE4A3CD3DB
	for <lists+linux-mips@lfdr.de>; Mon, 19 Jul 2021 13:28:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236462AbhGSKrW (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 19 Jul 2021 06:47:22 -0400
Received: from elvis.franken.de ([193.175.24.41]:39635 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236076AbhGSKrV (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 19 Jul 2021 06:47:21 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1m5RRE-0008KT-01; Mon, 19 Jul 2021 13:27:56 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id ECB0FC0EF6; Mon, 19 Jul 2021 13:27:38 +0200 (CEST)
Date:   Mon, 19 Jul 2021 13:27:38 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= 
        <zhouyanjie@wanyeetech.com>
Cc:     paul@crapouillou.net, paulburton@kernel.org,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        maoxiaochuan@loongson.cn, f.fainelli@gmail.com, git@xen0n.name,
        chenhuacai@kernel.org, cand@gmx.com, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com
Subject: Re: [PATCH v2] MIPS: Ingenic: Add system type for new Ingenic SoCs.
Message-ID: <20210719112738.GB7434@alpha.franken.de>
References: <1626368227-119499-1-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1626368227-119499-1-git-send-email-zhouyanjie@wanyeetech.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Jul 16, 2021 at 12:57:07AM +0800, 周琰杰 (Zhou Yanjie) wrote:
> Add JZ4730, JZ4750, JZ4755, JZ4760, JZ4760B, X2000H, and X2100 system
> type for cat /proc/cpuinfo to give out JZ4730, JZ4750, JZ4755, JZ4760,
> JZ4760B, X2000H, and X2100.
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> Reviewed-by: Paul Cercueil <paul@crapouillou.net>
> ---
> 
> Notes:
>     v1->v2:
>     1.Add system type for JZ4750 and JZ4755 as Paul Cercueil's suggestion.
>     2.Add Paul Cercueil's Reviewed-by.
> 
>  arch/mips/generic/board-ingenic.c | 21 +++++++++++++++++++++
>  arch/mips/include/asm/bootinfo.h  |  3 +++
>  arch/mips/include/asm/cpu.h       |  4 ++--
>  3 files changed, 26 insertions(+), 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
