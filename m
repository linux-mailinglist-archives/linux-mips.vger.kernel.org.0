Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D5474323A5
	for <lists+linux-mips@lfdr.de>; Mon, 18 Oct 2021 18:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233408AbhJRQUw (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 18 Oct 2021 12:20:52 -0400
Received: from elvis.franken.de ([193.175.24.41]:55139 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232871AbhJRQUw (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 18 Oct 2021 12:20:52 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1mcVLT-0008Tz-00; Mon, 18 Oct 2021 18:18:39 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 29C8CC249F; Mon, 18 Oct 2021 18:16:58 +0200 (CEST)
Date:   Mon, 18 Oct 2021 18:16:58 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Bart Van Assche <bvanassche@acm.org>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: sni: Fix the build
Message-ID: <20211018161658.GA16375@alpha.franken.de>
References: <20211012222312.3782068-1-bvanassche@acm.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211012222312.3782068-1-bvanassche@acm.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Oct 12, 2021 at 03:23:12PM -0700, Bart Van Assche wrote:
> This patch fixes the following gcc 10 build error:
> 
> arch/mips/sni/time.c: In function ‘a20r_set_periodic’:
> arch/mips/sni/time.c:15:26: error: unsigned conversion from ‘int’ to ‘u8’ {aka ‘volatile unsigned char’} changes value from ‘576’ to ‘64’ [-Werror=overflow]
>    15 | #define SNI_COUNTER0_DIV ((SNI_CLOCK_TICK_RATE / SNI_COUNTER2_DIV) / HZ)
>       |                          ^
> arch/mips/sni/time.c:21:45: note: in expansion of macro ‘SNI_COUNTER0_DIV’
>    21 |  *(volatile u8 *)(A20R_PT_CLOCK_BASE + 0) = SNI_COUNTER0_DIV;
>       |                                             ^~~~~~~~~~~~~~~~
> 
> Cc: linux-mips@vger.kernel.org
> Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> ---
>  arch/mips/sni/time.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
