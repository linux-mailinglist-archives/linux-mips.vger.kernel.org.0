Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC8913FAB1D
	for <lists+linux-mips@lfdr.de>; Sun, 29 Aug 2021 13:36:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235171AbhH2Lhm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 29 Aug 2021 07:37:42 -0400
Received: from elvis.franken.de ([193.175.24.41]:54440 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234987AbhH2Lhm (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sun, 29 Aug 2021 07:37:42 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mKJ7I-0006Zi-00; Sun, 29 Aug 2021 13:36:48 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id BECD2C086C; Sun, 29 Aug 2021 13:35:12 +0200 (CEST)
Date:   Sun, 29 Aug 2021 13:35:12 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Paul Burton <paulburton@kernel.org>, linux-mips@vger.kernel.org,
        list@opendingux.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: ingenic: Unconditionally enable clock of CPU #0
Message-ID: <20210829113512.GA4573@alpha.franken.de>
References: <20210823173405.153323-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210823173405.153323-1-paul@crapouillou.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Aug 23, 2021 at 06:34:05PM +0100, Paul Cercueil wrote:
> Make sure that the PLL that feeds the CPU won't be stopped while the
> kernel is running.
> 
> This fixes a problem on JZ4760 (and probably others) where under very
> specific conditions, the main PLL would be turned OFF when the kernel
> was shutting down, causing the shutdown process to fail.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  arch/mips/generic/board-ingenic.c | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
