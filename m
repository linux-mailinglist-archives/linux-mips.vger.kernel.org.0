Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 895E31ACDE7
	for <lists+linux-mips@lfdr.de>; Thu, 16 Apr 2020 18:41:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727807AbgDPQlt (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 16 Apr 2020 12:41:49 -0400
Received: from elvis.franken.de ([193.175.24.41]:42212 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731646AbgDPQlf (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 16 Apr 2020 12:41:35 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1jP7Zy-0001kl-04; Thu, 16 Apr 2020 18:41:30 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 10BFCC0144; Thu, 16 Apr 2020 18:40:16 +0200 (CEST)
Date:   Thu, 16 Apr 2020 18:40:16 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     sboyd@kernel.org, jiaxun.yang@flygoat.com,
        linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, chenhc@lemote.com,
        Paul Burton <paulburton@kernel.org>, mturquette@baylibre.com
Subject: Re: [PATCH] mips: loongsoon2ef: remove private clk api
Message-ID: <20200416164016.GE24743@alpha.franken.de>
References: <20200409064416.83340-1-sboyd@kernel.org>
 <20200409090228.2241176-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200409090228.2241176-1-arnd@arndb.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Apr 09, 2020 at 11:02:28AM +0200, Arnd Bergmann wrote:
> As platforms are moving to COMMON_CLK in general, loongson2ef
> stuck out as something that has a private implementation but
> does not actually use it except for setting the frequency of
> the CPU itself from the loongson2_cpufreq driver.
> 
> Change that driver to call the register setting function directly
> and remove the rest of the stub implementation.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/mips/include/asm/clock.h                 | 49 ----------
>  .../include/asm/mach-loongson2ef/loongson.h   |  1 +
>  arch/mips/loongson2ef/Kconfig                 |  1 -
>  arch/mips/loongson2ef/lemote-2f/clock.c       | 98 +------------------
>  arch/mips/loongson64/smp.c                    |  1 -
>  drivers/cpufreq/loongson2_cpufreq.c           | 22 +----
>  6 files changed, 8 insertions(+), 164 deletions(-)
>  delete mode 100644 arch/mips/include/asm/clock.h

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
