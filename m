Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 762D7318844
	for <lists+linux-mips@lfdr.de>; Thu, 11 Feb 2021 11:36:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229559AbhBKKfC (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 11 Feb 2021 05:35:02 -0500
Received: from elvis.franken.de ([193.175.24.41]:44677 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230138AbhBKKbm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 11 Feb 2021 05:31:42 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lA9FS-0005LQ-00; Thu, 11 Feb 2021 11:30:58 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 0D5B9C0E41; Thu, 11 Feb 2021 11:20:08 +0100 (CET)
Date:   Thu, 11 Feb 2021 11:20:07 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Kees Cook <keescook@chromium.org>
Cc:     linux-kernel@vger.kernel.org, Joe Perches <joe@perches.com>,
        Jinyang He <hejinyang@loongson.cn>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Liangliang Huang <huanglllzu@gmail.com>,
        linux-mips@vger.kernel.org
Subject: Re: [PATCH] mips: Replace lkml.org links with lore
Message-ID: <20210211102007.GA7985@alpha.franken.de>
References: <20210210235025.3072842-1-keescook@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210210235025.3072842-1-keescook@chromium.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Feb 10, 2021 at 03:50:25PM -0800, Kees Cook wrote:
> As started by commit 05a5f51ca566 ("Documentation: Replace lkml.org
> links with lore"), replace lkml.org links with lore to better use a
> single source that's more likely to stay available long-term.
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
> This patch may make more sense if this entire comment and the related
> code is fixed instead (gcc 3.x has been quite retired...)
> ---
>  arch/mips/include/asm/page.h | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
