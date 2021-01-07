Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DA622ED45E
	for <lists+linux-mips@lfdr.de>; Thu,  7 Jan 2021 17:31:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728142AbhAGQaC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 7 Jan 2021 11:30:02 -0500
Received: from elvis.franken.de ([193.175.24.41]:34741 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727994AbhAGQ3q (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 7 Jan 2021 11:29:46 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kxY9o-0000Mi-06; Thu, 07 Jan 2021 17:29:04 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 7721AC080E; Thu,  7 Jan 2021 17:28:32 +0100 (CET)
Date:   Thu, 7 Jan 2021 17:28:32 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-mips@vger.kernel.org, Yanteng Si <siyanteng01@gmail.com>
Subject: Re: [PATCH] MIPS: init: move externs to header file
Message-ID: <20210107162832.GG11882@alpha.franken.de>
References: <20210107030645.1844215-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210107030645.1844215-1-siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Jan 07, 2021 at 11:06:45AM +0800, Yanteng Si wrote:
>     This commit fixes the following checkpatch warnings:
> 
>     WARNING: externs should be avoided in .c files
> 
>     This is a warning for placing declarations in a ".c" file.
>     This fix removes the declaration in ".c" and adds it to
>     the common header file.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  arch/mips/include/asm/traps.h       | 1 +
>  arch/mips/loongson2ef/common/init.c | 1 -
>  arch/mips/loongson64/init.c         | 1 -
>  arch/mips/mti-malta/malta-init.c    | 1 -
>  arch/mips/pistachio/init.c          | 1 -
>  5 files changed, 1 insertion(+), 4 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
