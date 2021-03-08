Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57F08330A8A
	for <lists+linux-mips@lfdr.de>; Mon,  8 Mar 2021 10:51:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230439AbhCHJuu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 8 Mar 2021 04:50:50 -0500
Received: from elvis.franken.de ([193.175.24.41]:57382 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230455AbhCHJuT (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 8 Mar 2021 04:50:19 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lJCWn-0002nE-00; Mon, 08 Mar 2021 10:50:17 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 96E91C1214; Mon,  8 Mar 2021 10:49:47 +0100 (CET)
Date:   Mon, 8 Mar 2021 10:49:47 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     Qing Zhang <zhangqing@loongson.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] MIPS: Loongson64: Move loongson_system_configuration
 to loongson.h
Message-ID: <20210308094947.GA4924@alpha.franken.de>
References: <20210304110057.22144-1-zhangqing@loongson.cn>
 <20210304110057.22144-3-zhangqing@loongson.cn>
 <20210306080337.GC4744@alpha.franken.de>
 <d1072504-514b-4be0-85ba-69a6d885de58@www.fastmail.com>
 <20210306095308.GA5751@alpha.franken.de>
 <3a5481f9-d1d5-4439-9679-ad7615ba8009@www.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a5481f9-d1d5-4439-9679-ad7615ba8009@www.fastmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sat, Mar 06, 2021 at 06:55:41PM +0800, Jiaxun Yang wrote:
> 
> 
> On Sat, Mar 6, 2021, at 5:53 PM, Thomas Bogendoerfer wrote:
> [...]
> > Just to understand you, you want
> > 
> > arch/mips/include/asm/loongson/2ef
> > arch/mips/include/asm/loongson/32
> > arch/mips/include/asm/loongson/64
> 
> Yeah it looks reasonable but from my point of view doing these movement
> brings no actual benefit :-(

oh it does for sure. There will no more build errors for non loogson
configs for things like

#include <loongson_regs.h>

because it will not work for loongson either. And it will be clear,
which of the 3 loongson.h is used. Which then gives chances for even
more cleanups.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
