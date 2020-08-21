Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6601D24CFEE
	for <lists+linux-mips@lfdr.de>; Fri, 21 Aug 2020 09:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728048AbgHUHuN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 21 Aug 2020 03:50:13 -0400
Received: from elvis.franken.de ([193.175.24.41]:54235 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725908AbgHUHuM (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 21 Aug 2020 03:50:12 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1k91oP-00079q-00; Fri, 21 Aug 2020 09:50:09 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D9FBCC0D76; Fri, 21 Aug 2020 09:46:25 +0200 (CEST)
Date:   Fri, 21 Aug 2020 09:46:25 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Robert Richter <rric@kernel.org>, Huacai Chen <chenhc@lemote.com>,
        Liangliang Huang <huanglllzu@gmail.com>,
        oprofile-list@lists.sf.net, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: op_model_mipsxx: Fix non-executable code bug
Message-ID: <20200821074625.GA8336@alpha.franken.de>
References: <20200819045813.GA24181@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200819045813.GA24181@embeddedor>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Aug 18, 2020 at 11:58:13PM -0500, Gustavo A. R. Silva wrote:
> The fallthrough pseudo-keyword is being wrongly used and is causing
> the non-executable code error below:
> 
> arch/mips/oprofile/op_model_mipsxx.c: In function ‘mipsxx_perfcount_handler’:
> ./include/linux/compiler_attributes.h:214:41: warning: statement will never be executed [-Wswitch-unreachable]
>  # define fallthrough                    __attribute__((__fallthrough__))
>                                          ^
> arch/mips/oprofile/op_model_mipsxx.c:248:2: note: in expansion of macro ‘fallthrough’
>   fallthrough;       \
>   ^~~~~~~~~~~
> arch/mips/oprofile/op_model_mipsxx.c:258:2: note: in expansion of macro ‘HANDLE_COUNTER’
>   HANDLE_COUNTER(3)
>   ^~~~~~~~~~~~~~
> 
> Fix this by placing the fallthrough macro at the proper place.
> 
> Fixes: c9b029903466 ("MIPS: Use fallthrough for arch/mips")
> Cc: stable@vger.kernel.org
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> ---
>  arch/mips/oprofile/op_model_mipsxx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
