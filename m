Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82AF61BE982
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2020 23:06:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726929AbgD2VG4 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 29 Apr 2020 17:06:56 -0400
Received: from elvis.franken.de ([193.175.24.41]:60847 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726921AbgD2VGz (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 29 Apr 2020 17:06:55 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jTtuv-0005Q3-07; Wed, 29 Apr 2020 23:06:53 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id C9A13C0355; Wed, 29 Apr 2020 23:06:27 +0200 (CEST)
Date:   Wed, 29 Apr 2020 23:06:27 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Paul Cercueil <paul@crapouillou.net>
Cc:     Rob Herring <robh+dt@kernel.org>, od@zcrc.me,
        =?utf-8?B?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>,
        devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 13/13] MIPS: ingenic: Drop obsolete code, merge the rest
 in setup.c
Message-ID: <20200429210627.GH24583@alpha.franken.de>
References: <20200413152633.198301-1-paul@crapouillou.net>
 <20200413152633.198301-13-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200413152633.198301-13-paul@crapouillou.net>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Apr 13, 2020 at 05:26:33PM +0200, Paul Cercueil wrote:
> Drop a bootload of 10-years-old dirty code, that is not used anymore, as
> it has been replaced with clean code over the ages.
> 
> Merge the very few bits left inside setup.c, so that everything is clean
> and tidy now.
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  arch/mips/include/asm/mach-jz4740/base.h  |  27 -----
>  arch/mips/include/asm/mach-jz4740/dma.h   |  23 ----
>  arch/mips/include/asm/mach-jz4740/irq.h   |  45 +-------
>  arch/mips/include/asm/mach-jz4740/timer.h | 126 ----------------------
>  arch/mips/jz4740/Makefile                 |   7 +-
>  arch/mips/jz4740/pm.c                     |  34 ------
>  arch/mips/jz4740/prom.c                   |  19 ----
>  arch/mips/jz4740/reset.c                  |  24 -----
>  arch/mips/jz4740/reset.h                  |   7 --
>  arch/mips/jz4740/setup.c                  |  63 ++++++++++-
>  arch/mips/jz4740/time.c                   |  17 ---
>  arch/mips/jz4740/timer.c                  |  42 --------
>  12 files changed, 61 insertions(+), 373 deletions(-)
>  delete mode 100644 arch/mips/include/asm/mach-jz4740/base.h
>  delete mode 100644 arch/mips/include/asm/mach-jz4740/dma.h
>  delete mode 100644 arch/mips/include/asm/mach-jz4740/timer.h
>  delete mode 100644 arch/mips/jz4740/pm.c
>  delete mode 100644 arch/mips/jz4740/prom.c
>  delete mode 100644 arch/mips/jz4740/reset.c
>  delete mode 100644 arch/mips/jz4740/reset.h
>  delete mode 100644 arch/mips/jz4740/time.c
>  delete mode 100644 arch/mips/jz4740/timer.c

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
