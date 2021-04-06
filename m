Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A960E3552BC
	for <lists+linux-mips@lfdr.de>; Tue,  6 Apr 2021 13:51:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343525AbhDFLvU (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 6 Apr 2021 07:51:20 -0400
Received: from elvis.franken.de ([193.175.24.41]:58916 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1343524AbhDFLvU (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 6 Apr 2021 07:51:20 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lTkEe-00062N-00; Tue, 06 Apr 2021 13:51:08 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 639BBC210F; Tue,  6 Apr 2021 13:36:38 +0200 (CEST)
Date:   Tue, 6 Apr 2021 13:36:38 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Marc Zyngier <maz@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-sh@vger.kernel.org, Daniel Mack <daniel@zonque.org>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 6/9] mips: netlogic: Use irq_domain_simple_ops for XLP PIC
Message-ID: <20210406113638.GA8277@alpha.franken.de>
References: <20210406093557.1073423-1-maz@kernel.org>
 <20210406093557.1073423-7-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210406093557.1073423-7-maz@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Apr 06, 2021 at 10:35:54AM +0100, Marc Zyngier wrote:
> Use the generic irq_domain_simple_ops structure instead of
> a home-grown one.
> 
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  arch/mips/netlogic/common/irq.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
