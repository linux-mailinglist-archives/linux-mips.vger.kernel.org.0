Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 778493281BA
	for <lists+linux-mips@lfdr.de>; Mon,  1 Mar 2021 16:05:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236874AbhCAPEN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 1 Mar 2021 10:04:13 -0500
Received: from elvis.franken.de ([193.175.24.41]:33727 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236879AbhCAPEA (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 1 Mar 2021 10:04:00 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lGk4s-00041h-02; Mon, 01 Mar 2021 16:03:18 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id C01C2C03C2; Mon,  1 Mar 2021 15:50:46 +0100 (CET)
Date:   Mon, 1 Mar 2021 15:50:46 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     =?iso-8859-1?Q?=C1lvaro_Fern=E1ndez?= Rojas <noltari@gmail.com>
Cc:     jonas.gorski@gmail.com, Florian Fainelli <f.fainelli@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mips: smp-bmips: fix CPU mappings
Message-ID: <20210301145046.GE11261@alpha.franken.de>
References: <20210223124817.26486-1-noltari@gmail.com>
 <20210224073336.32265-1-noltari@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210224073336.32265-1-noltari@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Feb 24, 2021 at 08:33:36AM +0100, Álvaro Fernández Rojas wrote:
> When booting bmips with SMP enabled on a BCM6358 running on CPU #1 instead of
> CPU #0, the current CPU mapping code produces the following:
> - smp_processor_id(): 0
> - cpu_logical_map(0): 1
> - cpu_number_map(0): 1
> 
> This is because SMP isn't supported on BCM6358 since it has a shared TLB, so
> it is disabled and max_cpus is decreased from 2 to 1.
> 
> Signed-off-by: Álvaro Fernández Rojas <noltari@gmail.com>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
>  v2: Fix duplicated line
> 
>  arch/mips/kernel/smp-bmips.c | 27 +++++++++++++++++----------
>  1 file changed, 17 insertions(+), 10 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
