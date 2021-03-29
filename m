Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32A0334CD11
	for <lists+linux-mips@lfdr.de>; Mon, 29 Mar 2021 11:31:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231881AbhC2Jao (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 29 Mar 2021 05:30:44 -0400
Received: from elvis.franken.de ([193.175.24.41]:33837 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231776AbhC2JaX (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 29 Mar 2021 05:30:23 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lQoE1-0003qb-02; Mon, 29 Mar 2021 11:30:21 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 4A2A7C1D90; Mon, 29 Mar 2021 11:25:07 +0200 (CEST)
Date:   Mon, 29 Mar 2021 11:25:07 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Julian Braha <julianbraha@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        fazilyildiran@gmail.com
Subject: Re: [PATCH] arch: mips: fix unmet dependency for DEBUG_INFO
Message-ID: <20210329092507.GB8484@alpha.franken.de>
References: <20210326052033.35001-1-julianbraha@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210326052033.35001-1-julianbraha@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Mar 26, 2021 at 01:20:33AM -0400, Julian Braha wrote:
> When SB1XXX_CORELIS is enabled, COMPILE_TEST is disabled,
> and DEBUG_KERNEL is disabled, Kbuild gives the
> following warning:
> 
> WARNING: unmet direct dependencies detected for DEBUG_INFO
>   Depends on [n]: DEBUG_KERNEL [=n] && !COMPILE_TEST [=n]
>   Selected by [y]:
>   - SB1XXX_CORELIS [=y] && SIBYTE_SB1xxx_SOC [=y] && !COMPILE_TEST [=n]
> 
> This is because SB1XXX_CORELIS selects DEBUG_INFO without
> selecting or depending on DEBUG_KERNEL, despite DEBUG_INFO
> depending on DEBUG_KERNEL.
> 
> Signed-off-by: Julian Braha <julianbraha@gmail.com>
> ---
>  arch/mips/Kconfig.debug | 1 +
>  1 file changed, 1 insertion(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
