Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FBEE2B48EB
	for <lists+linux-mips@lfdr.de>; Mon, 16 Nov 2020 16:15:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730348AbgKPPO7 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 16 Nov 2020 10:14:59 -0500
Received: from elvis.franken.de ([193.175.24.41]:35501 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730791AbgKPPO7 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Mon, 16 Nov 2020 10:14:59 -0500
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1kegDV-00032x-00; Mon, 16 Nov 2020 16:14:53 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 01066C01DE; Mon, 16 Nov 2020 16:14:41 +0100 (CET)
Date:   Mon, 16 Nov 2020 16:14:41 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Tiezhu Yang <yangtiezhu@loongson.cn>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
        Xuefeng Li <lixuefeng@loongson.cn>
Subject: Re: [RFC PATCH v2] MIPS: Kconfig: Select ARCH_WANT_FRAME_POINTERS
Message-ID: <20201116151441.GA10686@alpha.franken.de>
References: <1605520506-26733-1-git-send-email-yangtiezhu@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1605520506-26733-1-git-send-email-yangtiezhu@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Nov 16, 2020 at 05:55:06PM +0800, Tiezhu Yang wrote:
> Select ARCH_WANT_FRAME_POINTERS to fix the following build error under
> CONFIG_DEBUG_ATOMIC_SLEEP:
> 
>   CC      arch/mips/kernel/signal.o
> {standard input}: Assembler messages:
> {standard input}:1775: Error: Unable to parse register name $fp
> scripts/Makefile.build:283: recipe for target 'arch/mips/kernel/signal.o' failed
> make[2]: *** [arch/mips/kernel/signal.o] Error 1
> scripts/Makefile.build:500: recipe for target 'arch/mips/kernel' failed
> make[1]: *** [arch/mips/kernel] Error 2
> Makefile:1799: recipe for target 'arch/mips' failed
> make: *** [arch/mips] Error 2

I don't see this error and to me it looks strange to fix that with
enablding frame pointers... What gcc is this ?

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
