Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3573977405B
	for <lists+linux-mips@lfdr.de>; Tue,  8 Aug 2023 19:02:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233303AbjHHRCZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 8 Aug 2023 13:02:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51474 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232927AbjHHRBb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Tue, 8 Aug 2023 13:01:31 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87F6DAAF2;
        Tue,  8 Aug 2023 09:01:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C132762484;
        Tue,  8 Aug 2023 10:45:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D497AC433C7;
        Tue,  8 Aug 2023 10:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1691491509;
        bh=6c+LvhZKfn4xLs8pROMMCTZCY+xcMxiFe16JPuh9KJc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=OK4b3vk/YmQJP6JOaVzTCBwnZS8Ryqqh48V/vOGs5TDSQxCvHiENiPgxWIWgbLXY7
         ZQkyP+FNx4P5U5oSTg0k9JyEX6XtXcoBKgdI4hd9H2jJ2DlFe/bmwfzMFp06BBh6I4
         XG+ZJvLgxv7etWHULcMzKpFegKGZJtUW2E22K98w=
Date:   Tue, 8 Aug 2023 12:45:06 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Ladislav Michl <oss-lists@triops.cz>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
        lkft-triage@lists.linaro.org, Thinh.Nguyen@synopsys.com,
        Arnd Bergmann <arnd@arndb.de>,
        Anders Roxell <anders.roxell@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH] usb: dwc3: dwc3-octeon: Verify clock divider
Message-ID: <2023080840-visible-chess-ab8b@gregkh>
References: <ZNIM7tlBNdHFzXZG@lenoch>
 <2023080830-wincing-goldmine-def9@gregkh>
 <ZNIbNj4Orr7PEqY9@lenoch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZNIbNj4Orr7PEqY9@lenoch>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Tue, Aug 08, 2023 at 12:38:46PM +0200, Ladislav Michl wrote:
> On Tue, Aug 08, 2023 at 12:00:42PM +0200, Greg Kroah-Hartman wrote:
> > On Tue, Aug 08, 2023 at 11:37:50AM +0200, Ladislav Michl wrote:
> > > From: Ladislav Michl <ladis@linux-mips.org>
> > > 
> > > Although valid USB clock divider will be calculated for all valid
> > > Octeon core frequencies, make code formally correct limiting
> > > divider not to be greater that 7 so it fits into H_CLKDIV_SEL
> > > field.
> > > 
> > > Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
> > > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > > Closes: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230808/testrun/18882876/suite/build/test/gcc-8-cavium_octeon_defconfig/log
> > > ---
> > >  Greg, if you want to resent whole serie, just drop me a note.
> > >  Otherwise, this patch is meant to be applied on to of it.
> > 
> > On top of what series?
> 
> I'm sorry, "[PATCH v5 0/7] Cleanup Octeon DWC3 glue code".
> In your usb-next, last patch of serie is:
> d9216d3ef538 ("usb: dwc3: dwc3-octeon: Add SPDX header and copyright")

I already took that series, so this is fine, I don't want to revert that
and have to add it all back :)

thanks,

greg k-h
