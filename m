Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2836C2C63BC
	for <lists+linux-mips@lfdr.de>; Fri, 27 Nov 2020 12:16:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725989AbgK0LQ1 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 27 Nov 2020 06:16:27 -0500
Received: from elvis.franken.de ([193.175.24.41]:32954 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725889AbgK0LQ1 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 27 Nov 2020 06:16:27 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kibjk-00082H-00; Fri, 27 Nov 2020 12:16:24 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 62120C02A6; Fri, 27 Nov 2020 11:34:12 +0100 (CET)
Date:   Fri, 27 Nov 2020 11:34:12 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jinyang He <hejinyang@loongson.cn>
Cc:     Huacai Chen <chenhc@lemote.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Loongson64: Fix up reserving kernel memory range
Message-ID: <20201127103412.GA6518@alpha.franken.de>
References: <1606299062-7427-1-git-send-email-hejinyang@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1606299062-7427-1-git-send-email-hejinyang@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Nov 25, 2020 at 06:11:02PM +0800, Jinyang He wrote:
> Reserve memory from &_text to &_end. Otherwise if kernel address
> was modified, the memory range of start_pfn to kernel_start_pfn
> would be reserved. Then we could not use this range.
> 
> Signed-off-by: Jinyang He <hejinyang@loongson.cn>
> ---
>  arch/mips/loongson64/numa.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
