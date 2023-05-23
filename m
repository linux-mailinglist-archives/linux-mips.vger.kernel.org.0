Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD45870D893
	for <lists+linux-mips@lfdr.de>; Tue, 23 May 2023 11:13:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236140AbjEWJNy (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 23 May 2023 05:13:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236134AbjEWJNx (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 23 May 2023 05:13:53 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 50FD5132
        for <linux-mips@vger.kernel.org>; Tue, 23 May 2023 02:13:45 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1q1O5K-0007MY-01; Tue, 23 May 2023 11:13:38 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id C2883C02E6; Tue, 23 May 2023 11:06:11 +0200 (CEST)
Date:   Tue, 23 May 2023 11:06:11 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Manuel Lauss <manuel.lauss@gmail.com>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: unhide PATA_PLATFORM
Message-ID: <20230523090611.GB9484@alpha.franken.de>
References: <20230509185744.413302-1-manuel.lauss@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230509185744.413302-1-manuel.lauss@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, May 09, 2023 at 08:57:44PM +0200, Manuel Lauss wrote:
> Alchemy DB1200/DB1300 boards can use the pata_platform driver.
> Unhide the config entry in all of MIPS.
> 
> Signed-off-by: Manuel Lauss <manuel.lauss@gmail.com>
> ---
>  arch/mips/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
> index c2f5498d207f..675a8660cb85 100644
> --- a/arch/mips/Kconfig
> +++ b/arch/mips/Kconfig
> @@ -79,6 +79,7 @@ config MIPS
>  	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION
>  	select HAVE_MOD_ARCH_SPECIFIC
>  	select HAVE_NMI
> +	select HAVE_PATA_PLATFORM
>  	select HAVE_PERF_EVENTS
>  	select HAVE_PERF_REGS
>  	select HAVE_PERF_USER_STACK_DUMP
> -- 
> 2.40.1

applied to mips-fixes.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
