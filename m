Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E860667EAE8
	for <lists+linux-mips@lfdr.de>; Fri, 27 Jan 2023 17:28:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234908AbjA0Q25 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 27 Jan 2023 11:28:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234803AbjA0Q24 (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 27 Jan 2023 11:28:56 -0500
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 98EB621A20
        for <linux-mips@vger.kernel.org>; Fri, 27 Jan 2023 08:28:54 -0800 (PST)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1pLRav-0002kp-00; Fri, 27 Jan 2023 17:28:53 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 8A7D7C261D; Fri, 27 Jan 2023 17:27:13 +0100 (CET)
Date:   Fri, 27 Jan 2023 17:27:13 +0100
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Ladislav Michl <oss-lists@triops.cz>
Cc:     linux-mips@vger.kernel.org
Subject: Re: [PATCH] MIPS: OCTEON: octeon-usb: Consolidate error messages
Message-ID: <20230127162713.GA6090@alpha.franken.de>
References: <Y6MW9Z4uhrqO4ocn@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y6MW9Z4uhrqO4ocn@lenoch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Dec 21, 2022 at 03:23:49PM +0100, Ladislav Michl wrote:
> From: Ladislav Michl <ladis@linux-mips.org>
> 
> Console output currently looks like USB clocks initialized succesfully
> even in case of error. Fix that and use consistently dev_err for fatal
> errors otherwise dev_warn.
> 
> Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
> ---
>  Hi there,
> 
>  this is just cleanup before real work. Just note that even
>  warning says "Invalid UCTL clock rate ..., using 100000000 instead"
>  clock_rate is not set to 100000000. There's also some indentation
>  fixes to be done.
> 
>  However my main concern is unimplemented errata 29206 as noted in
>  OCTEON III CN70XX/CN71XX Known Issues Revision 1.9, released under
>  NDA. You can see its implementation in coreboot here (line 196):
>  https://fossies.org/linux/coreboot/src/vendorcode/cavium/bdk/libbdk-hal/bdk-usb.c
> 
>  Above looks like BSD license. I'll reimplement said errata
>  from scratch, unless someone sees as a problem "Marvell Proprietary
>  and Confidential" documentation is used as source.
> 
>  arch/mips/cavium-octeon/octeon-usb.c | 42 +++++++++++++---------------
>  1 file changed, 20 insertions(+), 22 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
