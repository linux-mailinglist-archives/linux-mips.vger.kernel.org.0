Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0851648ACF
	for <lists+linux-mips@lfdr.de>; Fri,  9 Dec 2022 23:42:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbiLIWmj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 9 Dec 2022 17:42:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229512AbiLIWmj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 9 Dec 2022 17:42:39 -0500
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4A1A06267
        for <linux-mips@vger.kernel.org>; Fri,  9 Dec 2022 14:42:36 -0800 (PST)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1p3m4f-0005PX-01; Fri, 09 Dec 2022 23:42:33 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 0D0D2C2491; Fri,  9 Dec 2022 23:41:58 +0100 (CET)
Date:   Fri, 9 Dec 2022 23:41:57 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Ladislav Michl <oss-lists@triops.cz>
Cc:     linux-mips@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>
Subject: Re: [PATCH] MIPS: OCTEON: warn only once if deprecated link status
 is being used
Message-ID: <20221209224157.GB4928@alpha.franken.de>
References: <Y5HJxeWqJFK0oWyS@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5HJxeWqJFK0oWyS@lenoch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Thu, Dec 08, 2022 at 12:25:57PM +0100, Ladislav Michl wrote:
> From: Ladislav Michl <ladis@linux-mips.org>
> 
> Avoid flooding kernel log with warnings.
> 
> Fixes: 2c0756d306c2 ("MIPS: OCTEON: warn if deprecated link status is being used")
> Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
> ---
>  arch/mips/cavium-octeon/executive/cvmx-helper-board.c | 2 +-
>  arch/mips/cavium-octeon/executive/cvmx-helper.c       | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
