Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 872C03902B4
	for <lists+linux-mips@lfdr.de>; Tue, 25 May 2021 15:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233351AbhEYNsO (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 25 May 2021 09:48:14 -0400
Received: from elvis.franken.de ([193.175.24.41]:48740 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233184AbhEYNsO (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 25 May 2021 09:48:14 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1llXO3-00079x-01; Tue, 25 May 2021 15:46:23 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 84971C1109; Tue, 25 May 2021 15:39:25 +0200 (CEST)
Date:   Tue, 25 May 2021 15:39:25 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        Manuel Lauss <manuel.lauss@googlemail.com>,
        Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH] MIPS: alchemy: xxs1500: add gpio-au1000.h header file
Message-ID: <20210525133925.GB11166@alpha.franken.de>
References: <20210517000108.26015-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210517000108.26015-1-rdunlap@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, May 16, 2021 at 05:01:08PM -0700, Randy Dunlap wrote:
> board-xxs1500.c references 2 functions without declaring them, so add
> the header file to placate the build.
> 
> ../arch/mips/alchemy/board-xxs1500.c: In function 'board_setup':
> ../arch/mips/alchemy/board-xxs1500.c:56:2: error: implicit declaration of function 'alchemy_gpio1_input_enable' [-Werror=implicit-function-declaration]
>    56 |  alchemy_gpio1_input_enable();
> ../arch/mips/alchemy/board-xxs1500.c:57:2: error: implicit declaration of function 'alchemy_gpio2_enable'; did you mean 'alchemy_uart_enable'? [-Werror=implicit-function-declaration]
>    57 |  alchemy_gpio2_enable();
> 
> Fixes: 8e026910fcd4 ("MIPS: Alchemy: merge GPR/MTX-1/XXS1500 board code into single files")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
> Cc: Manuel Lauss <manuel.lauss@googlemail.com>
> Cc: Ralf Baechle <ralf@linux-mips.org>
> ---
>  arch/mips/alchemy/board-xxs1500.c |    1 +
>  1 file changed, 1 insertion(+)

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
