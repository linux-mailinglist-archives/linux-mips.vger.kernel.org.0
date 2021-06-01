Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E9F1397097
	for <lists+linux-mips@lfdr.de>; Tue,  1 Jun 2021 11:51:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230288AbhFAJxh (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 1 Jun 2021 05:53:37 -0400
Received: from elvis.franken.de ([193.175.24.41]:59986 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229538AbhFAJxh (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 1 Jun 2021 05:53:37 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lo13y-0001KW-02; Tue, 01 Jun 2021 11:51:54 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id BF767C1B8C; Tue,  1 Jun 2021 11:47:53 +0200 (CEST)
Date:   Tue, 1 Jun 2021 11:47:53 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexander Lobakin <alobakin@pm.me>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 1/2] mips: syscalls: define syscall offsets directly in
 <asm/unistd.h>
Message-ID: <20210601094753.GC6961@alpha.franken.de>
References: <20210528034615.2157002-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528034615.2157002-1-masahiroy@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, May 28, 2021 at 12:46:14PM +0900, Masahiro Yamada wrote:
> There is no good reason to generate the syscall offset macros by
> scripting since they are not derived from the syscall tables.
> 
> Define __NR_*_Linux macros directly in arch/mips/include/asm/unistd.h,
> and clean up the Makefile and the shell script.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  arch/mips/include/asm/unistd.h         | 4 ++++
>  arch/mips/kernel/syscalls/Makefile     | 6 +-----
>  arch/mips/kernel/syscalls/syscallnr.sh | 2 --
>  3 files changed, 5 insertions(+), 7 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
