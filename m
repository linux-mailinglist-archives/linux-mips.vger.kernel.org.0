Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A34D3065CA
	for <lists+linux-mips@lfdr.de>; Wed, 27 Jan 2021 22:13:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233968AbhA0VMd (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 27 Jan 2021 16:12:33 -0500
Received: from elvis.franken.de ([193.175.24.41]:60509 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233905AbhA0VLw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 27 Jan 2021 16:11:52 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1l4s5l-0003cQ-05; Wed, 27 Jan 2021 22:11:09 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 9C4DFC0AAF; Wed, 27 Jan 2021 22:07:57 +0100 (CET)
Date:   Wed, 27 Jan 2021 22:07:57 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>,
        Alexander Potapenko <glider@google.com>
Subject: Re: [PATCH] MIPS: Fix inline asm input/output type mismatch in
 checksum.h used with Clang
Message-ID: <20210127210757.GF21002@alpha.franken.de>
References: <1611722507-12017-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1611722507-12017-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Jan 27, 2021 at 12:41:47PM +0800, Tiezhu Yang wrote:
> Fix the following build error when make M=samples/bpf used with Clang:
> 
>   CLANG-bpf  samples/bpf/sockex2_kern.o
> In file included from samples/bpf/sockex2_kern.c:7:
> In file included from ./include/uapi/linux/if_tunnel.h:7:
> In file included from ./include/linux/ip.h:16:
> In file included from ./include/linux/skbuff.h:28:
> In file included from ./include/net/checksum.h:22:
> ./arch/mips/include/asm/checksum.h:161:9: error: unsupported inline asm: input with type 'unsigned long' matching output with type '__wsum' (aka 'unsigned int')
>         : "0" ((__force unsigned long)daddr),
>                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 1 error generated.
> 
> This is a known issue on MIPS [1], the changed code can be compiled
> successfully by both GCC and Clang.
> 
> [1] https://lore.kernel.org/linux-mips/CAG_fn=W0JHf8QyUX==+rQMp8PoULHrsQCa9Htffws31ga8k-iw@mail.gmail.com/
> 
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> ---
>  arch/mips/include/asm/checksum.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
