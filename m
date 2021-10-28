Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24D1143E29F
	for <lists+linux-mips@lfdr.de>; Thu, 28 Oct 2021 15:51:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230380AbhJ1NxZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 Oct 2021 09:53:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:44350 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230429AbhJ1NxJ (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 28 Oct 2021 09:53:09 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0D07B61038;
        Thu, 28 Oct 2021 13:50:43 +0000 (UTC)
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1mg5nl-002Dih-0o; Thu, 28 Oct 2021 14:50:41 +0100
MIME-Version: 1.0
Date:   Thu, 28 Oct 2021 14:50:40 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Naresh Kamboju <naresh.kamboju@linaro.org>
Cc:     Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-mips@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        lkft-triage@lists.linaro.org
Subject: Re: mips: irq.c:114:19: error: unused variable 'desc'
 [-Werror=unused-variable]
In-Reply-To: <CA+G9fYtQCd4V9Y=qEGZeQw17TRNG1p_g9MKtYaWVo8QPua-Cug@mail.gmail.com>
References: <CA+G9fYtQCd4V9Y=qEGZeQw17TRNG1p_g9MKtYaWVo8QPua-Cug@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <c65bccca4fa1345e18942ff66675296d@kernel.org>
X-Sender: maz@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: naresh.kamboju@linaro.org, linux-next@vger.kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, mark.rutland@arm.com, tsbogend@alpha.franken.de, tglx@linutronix.de, sfr@canb.auug.org.au, lkft-triage@lists.linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2021-10-28 12:47, Naresh Kamboju wrote:
> Regression found on mips gcc-10 built with defconfig
> Following build warnings / errors reported on linux next 20211027.
> 
> The bisect tool pointing to the following commit
> The first bad commit:
> 
> commit 4cb6f4df976b288aa02bbb658d38e73d34d8231f
>   irq: mips: simplify do_domain_IRQ()
> 
> metadata:
>     git_describe: next-20211027
>     git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>     git_short_log: ae5179317e79 (\"Add linux-next specific files for 
> 20211027\")
>     target_arch: mips
>     toolchain: gcc-10
> 
> build error :
> --------------
> <stdin>:1559:2: warning: #warning syscall futex_waitv not implemented 
> [-Wcpp]
> arch/mips/kernel/irq.c: In function 'do_domain_IRQ':
> arch/mips/kernel/irq.c:114:19: error: unused variable 'desc'
> [-Werror=unused-variable]
>   struct irq_desc *desc;
>                    ^~~~
> cc1: all warnings being treated as errors
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Already fixed as of 20211028095652.3503790-1-siyanteng@loongson.cn

         M.
-- 
Jazz is not dead. It just smells funny...
