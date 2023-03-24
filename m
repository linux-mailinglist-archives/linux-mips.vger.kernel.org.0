Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED3586C7ED9
	for <lists+linux-mips@lfdr.de>; Fri, 24 Mar 2023 14:32:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230399AbjCXNc5 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 24 Mar 2023 09:32:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231572AbjCXNc5 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 24 Mar 2023 09:32:57 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C7BA023A6E
        for <linux-mips@vger.kernel.org>; Fri, 24 Mar 2023 06:32:34 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1pfhWt-0001BF-00; Fri, 24 Mar 2023 14:32:27 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id C8756C1B8C; Fri, 24 Mar 2023 14:30:33 +0100 (CET)
Date:   Fri, 24 Mar 2023 14:30:33 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc:     linux-mips@vger.kernel.org, philmd@linaro.org,
        sergei.shtylyov@gmail.com, aleksander.lobakin@intel.com
Subject: Re: [PATCH v2 01/12] MIPS: Move declaration of bcache ops to cache.c
Message-ID: <20230324133033.GA15949@alpha.franken.de>
References: <20230321104852.25284-1-jiaxun.yang@flygoat.com>
 <20230321104852.25284-2-jiaxun.yang@flygoat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230321104852.25284-2-jiaxun.yang@flygoat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Mar 21, 2023 at 10:48:41AM +0000, Jiaxun Yang wrote:
> bcache is not tied to CPU's cache interface. Just move those
> declaration to cache.c so it can be avaialble to CPU with all
> cache types.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>  arch/mips/mm/c-r4k.c | 14 --------------
>  arch/mips/mm/cache.c | 17 +++++++++++++++++
>  2 files changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/mips/mm/c-r4k.c b/arch/mips/mm/c-r4k.c
> index a549fa98c2f4..fd660d5c5328 100644
> --- a/arch/mips/mm/c-r4k.c
> +++ b/arch/mips/mm/c-r4k.c
> @@ -110,20 +110,6 @@ static unsigned long dcache_size __read_mostly;
>  static unsigned long vcache_size __read_mostly;
>  static unsigned long scache_size __read_mostly;
>  
> -/*
> - * Dummy cache handling routines for machines without boardcaches
> - */
> -static void cache_noop(void) {}

/local/tbogendoerfer/korg/linux/arch/mips/mm/c-r4k.c: In function ‘r4k_blast_dcache_page_setup’:
/local/tbogendoerfer/korg/linux/arch/mips/mm/c-r4k.c:149:35: error: ‘cache_noop’ undeclared (first use in this function)
   r4k_blast_dcache_page = (void *)cache_noop;
                                   ^~~~~~~~~~

looks like you haven't compiled this for other board configs.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
