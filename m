Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A5A9873B88B
	for <lists+linux-mips@lfdr.de>; Fri, 23 Jun 2023 15:16:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231336AbjFWNQm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 23 Jun 2023 09:16:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230264AbjFWNQl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 23 Jun 2023 09:16:41 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 43165213A;
        Fri, 23 Jun 2023 06:16:40 -0700 (PDT)
Received: from uucp by elvis.franken.de with local-rmail (Exim 3.36 #1)
        id 1qCgeU-0002sr-00; Fri, 23 Jun 2023 15:16:38 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id CBFB2C03C3; Fri, 23 Jun 2023 15:15:20 +0200 (CEST)
Date:   Fri, 23 Jun 2023 15:15:20 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Ladislav Michl <oss-lists@triops.cz>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-usb@vger.kernel.org, linux-mips@vger.kernel.org
Subject: Re: [PATCH 08/11] usb: dwc3: Move Octeon glue code from arch/mips
Message-ID: <20230623131520.GF11636@alpha.franken.de>
References: <ZJC165p0Mj4jHcBh@lenoch>
 <ZJC3LLpUlatnLdnv@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZJC3LLpUlatnLdnv@lenoch>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Mon, Jun 19, 2023 at 10:14:36PM +0200, Ladislav Michl wrote:
> From: Ladislav Michl <ladis@linux-mips.org>
> 
> Octeon DWC3 glue code now compiles on all platforms, so move
> it to drivers/usb/dwc3. No functional changes.
> 
> Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
> ---
>  arch/mips/cavium-octeon/Makefile                         | 1 -
>  drivers/usb/dwc3/Kconfig                                 | 9 +++++++++
>  drivers/usb/dwc3/Makefile                                | 1 +
>  .../octeon-usb.c => drivers/usb/dwc3/dwc3-octeon.c       | 0
>  4 files changed, 10 insertions(+), 1 deletion(-)
>  rename arch/mips/cavium-octeon/octeon-usb.c => drivers/usb/dwc3/dwc3-octeon.c (100%)

Acked-By: Thomas Bogendoerfer <tsbogend@alpha.franken.de>

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
