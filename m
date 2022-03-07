Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C22844CFE4B
	for <lists+linux-mips@lfdr.de>; Mon,  7 Mar 2022 13:25:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242130AbiCGM0T (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 7 Mar 2022 07:26:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242132AbiCGM0T (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 7 Mar 2022 07:26:19 -0500
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 158E180924;
        Mon,  7 Mar 2022 04:25:25 -0800 (PST)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1nRCQS-00072o-03; Mon, 07 Mar 2022 13:25:20 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id C86BDC1280; Mon,  7 Mar 2022 13:21:17 +0100 (CET)
Date:   Mon, 7 Mar 2022 13:21:17 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MIPS: Sanitise Cavium switch cases in TLB handler
 synthesizers
Message-ID: <20220307122117.GD14422@alpha.franken.de>
References: <alpine.DEB.2.21.2203042044580.47558@angie.orcam.me.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2203042044580.47558@angie.orcam.me.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_NONE,T_SCC_BODY_TEXT_LINE,T_SPF_HELO_PERMERROR autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Fri, Mar 04, 2022 at 09:13:11PM +0000, Maciej W. Rozycki wrote:
> It makes no sense to fall through to `break'.  Therefore reorder the 
> switch statements so as to have the Cavium cases first, followed by the 
> default case, which improves readability and pacifies code analysis 
> tools.  No change in semantics, assembly produced is exactly the same.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Fixes: bc431d2153cc ("MIPS: Fix fall-through warnings for Clang")
> ---
>  arch/mips/mm/tlbex.c |   23 ++++++++++-------------
>  1 file changed, 10 insertions(+), 13 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
