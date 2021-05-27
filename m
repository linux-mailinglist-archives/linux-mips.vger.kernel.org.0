Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3681E392CF3
	for <lists+linux-mips@lfdr.de>; Thu, 27 May 2021 13:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234099AbhE0LqM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 27 May 2021 07:46:12 -0400
Received: from elvis.franken.de ([193.175.24.41]:51718 "EHLO elvis.franken.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234107AbhE0LqK (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Thu, 27 May 2021 07:46:10 -0400
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1lmERH-0007z5-00; Thu, 27 May 2021 13:44:35 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id D8538C1149; Thu, 27 May 2021 13:44:09 +0200 (CEST)
Date:   Thu, 27 May 2021 13:44:09 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Huacai Chen <chenhuacai@loongson.cn>
Cc:     linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] MIPS: Loongson64: Remove a "set but not used" variable
Message-ID: <20210527114409.GG9210@alpha.franken.de>
References: <20210514103217.2051315-1-chenhuacai@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210514103217.2051315-1-chenhuacai@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, May 14, 2021 at 06:32:17PM +0800, Huacai Chen wrote:
> This fix build warning:
> 
>    arch/mips/loongson64/env.c: In function 'prom_init_env':
> >> arch/mips/loongson64/env.c:50:14: warning: variable 'device' set but not used [-Wunused-but-set-variable]
>       50 |  u16 vendor, device;
>          |              ^~~~~~
>    {standard input}: Assembler messages:
>    {standard input}:788: Error: found '(', expected: ')'
>    {standard input}:788: Error: found '(', expected: ')'
>    {standard input}:788: Error: non-constant expression in ".if" statement
>    {standard input}:788: Error: junk at end of line, first unrecognized character is `('
>    {standard input}:801: Error: found '(', expected: ')'
>    {standard input}:801: Error: found '(', expected: ')'
>    {standard input}:801: Error: non-constant expression in ".if" statement
>    {standard input}:801: Error: junk at end of line, first unrecognized character is `('
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>  arch/mips/loongson64/env.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
