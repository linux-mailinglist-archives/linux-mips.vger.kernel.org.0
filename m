Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD6901D112C
	for <lists+linux-mips@lfdr.de>; Wed, 13 May 2020 13:21:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732858AbgEMLVZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 13 May 2020 07:21:25 -0400
Received: from elvis.franken.de ([193.175.24.41]:52007 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732841AbgEMLVZ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Wed, 13 May 2020 07:21:25 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jYpRu-000588-01; Wed, 13 May 2020 13:21:18 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 67175C0482; Wed, 13 May 2020 13:19:07 +0200 (CEST)
Date:   Wed, 13 May 2020 13:19:07 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Hauke Mehrtens <hauke@hauke-m.de>,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        "Maciej W. Rozycki" <macro@linux-mips.org>,
        Paul Burton <paulburton@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>,
        John Crispin <john@phrozen.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Huacai Chen <chenhc@lemote.com>,
        James Hartley <james.hartley@sondrel.com>,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] MIPS: Only include the platform file needed
Message-ID: <20200513111907.GB7151@alpha.franken.de>
References: <20200509230150.24466-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200509230150.24466-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, May 10, 2020 at 01:01:47AM +0200, Thomas Bogendoerfer wrote:
> Instead of including all Platform files, we simply include the
> needed one and avoid clashes with makefile variables.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/Kbuild.platforms       | 73 +++++++++++++++++++++-------------------
>  arch/mips/alchemy/Platform       |  3 --
>  arch/mips/ar7/Platform           |  1 -
>  arch/mips/ath25/Platform         |  1 -
>  arch/mips/ath79/Platform         |  1 -
>  arch/mips/bcm47xx/Platform       |  1 -
>  arch/mips/bcm63xx/Platform       |  1 -
>  arch/mips/bmips/Platform         |  1 -
>  arch/mips/cavium-octeon/Platform |  1 -
>  arch/mips/cobalt/Platform        |  1 -
>  arch/mips/dec/Platform           |  1 -
>  arch/mips/generic/Platform       |  1 -
>  arch/mips/jazz/Platform          |  1 -
>  arch/mips/jz4740/Platform        |  1 -
>  arch/mips/lantiq/Platform        |  1 -
>  arch/mips/loongson2ef/Platform   |  1 -
>  arch/mips/loongson32/Platform    |  1 -
>  arch/mips/loongson64/Platform    |  1 -
>  arch/mips/mti-malta/Platform     |  1 -
>  arch/mips/netlogic/Platform      |  1 -
>  arch/mips/paravirt/Platform      |  1 -
>  arch/mips/pic32/Platform         |  1 -
>  arch/mips/pistachio/Platform     |  1 -
>  arch/mips/pnx833x/Platform       |  1 -
>  arch/mips/rb532/Platform         |  1 -
>  arch/mips/sgi-ip22/Platform      |  2 --
>  arch/mips/sgi-ip27/Platform      |  3 --
>  arch/mips/sgi-ip30/Platform      |  3 --
>  arch/mips/sgi-ip32/Platform      |  1 -
>  arch/mips/sibyte/Platform        |  4 ---
>  arch/mips/sni/Platform           |  1 -
>  arch/mips/txx9/Platform          |  3 --
>  32 files changed, 39 insertions(+), 77 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
