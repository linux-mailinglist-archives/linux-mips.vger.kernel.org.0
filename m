Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBE606D76FD
	for <lists+linux-mips@lfdr.de>; Wed,  5 Apr 2023 10:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237508AbjDEIdf (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 5 Apr 2023 04:33:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236934AbjDEIdd (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 5 Apr 2023 04:33:33 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C01082713;
        Wed,  5 Apr 2023 01:33:32 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1pjyaC-0007rR-02; Wed, 05 Apr 2023 10:33:32 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 0A071C2424; Wed,  5 Apr 2023 10:30:29 +0200 (CEST)
Date:   Wed, 5 Apr 2023 10:30:28 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] MIPS: mm: Remove local_cache_flush_page
Message-ID: <20230405083028.GC6145@alpha.franken.de>
References: <20230403094113.6056-1-tsbogend@alpha.franken.de>
 <20230403094113.6056-3-tsbogend@alpha.franken.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230403094113.6056-3-tsbogend@alpha.franken.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-0.7 required=5.0 tests=RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Apr 03, 2023 at 11:41:12AM +0200, Thomas Bogendoerfer wrote:
> After ide.h is gone, there are no users of local_cache_flush_page() left.
> 
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/include/asm/cacheflush.h | 1 -
>  arch/mips/mm/c-r3k.c               | 5 -----
>  arch/mips/mm/c-r4k.c               | 3 ---
>  arch/mips/mm/cache.c               | 2 --
>  4 files changed, 11 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
