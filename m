Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3C10E28B266
	for <lists+linux-mips@lfdr.de>; Mon, 12 Oct 2020 12:38:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387669AbgJLKik (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 12 Oct 2020 06:38:40 -0400
Received: from elvis.franken.de ([193.175.24.41]:58417 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387569AbgJLKiS (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 12 Oct 2020 06:38:18 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kRvDc-0008KW-06; Mon, 12 Oct 2020 12:38:16 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 39336C1140; Mon, 12 Oct 2020 12:31:43 +0200 (CEST)
Date:   Mon, 12 Oct 2020 12:31:43 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: cpu-probe: remove MIPS_CPU_BP_GHIST option bit
Message-ID: <20201012103143.GF7765@alpha.franken.de>
References: <20201009122649.85490-1-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201009122649.85490-1-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Oct 09, 2020 at 02:26:48PM +0200, Thomas Bogendoerfer wrote:
> MIPS_CPU_BP_GHIST is only set two times and more or less immediately
> used in cpu-probe.c itself. Remove this option to make room in options
> word.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/include/asm/cpu-features.h                      |  3 ---
>  arch/mips/include/asm/cpu.h                               |  1 -
>  arch/mips/include/asm/mach-au1x00/cpu-feature-overrides.h |  1 -
>  arch/mips/kernel/cpu-probe.c                              | 10 ++++------
>  4 files changed, 4 insertions(+), 11 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
