Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1683D73CAF4
	for <lists+linux-mips@lfdr.de>; Sat, 24 Jun 2023 15:04:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbjFXNEZ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Jun 2023 09:04:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjFXNEY (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 24 Jun 2023 09:04:24 -0400
Received: from h1.cmg2.smtp.forpsi.com (h1.cmg2.smtp.forpsi.com [81.2.195.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD3E3F3
        for <linux-mips@vger.kernel.org>; Sat, 24 Jun 2023 06:04:20 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id D2w4qsQhCv5uID2w6quZLq; Sat, 24 Jun 2023 15:04:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1687611858; bh=A8Qf65Rob09U35oGENSWDKjvcQjFxw6Jr7EPtXZ0RBs=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=ddhgenzM9l5OX3VPJHJHnjXam1iTTPHItMmcnb1nzdS49b+PiY9FUzxmQ7qqSsPRv
         8twLuDnQgujybwJQ7j9EmTNgm71tIg1O7K+voRaNLx4pkPGHcnUnyFbPZtomGLI4R4
         7GB0lDmrln18PC2Ql7RZ+RzzramRbjxDStmf85zhsrSJDtRba/wV1tmeUerLMovaly
         WaHEkao40VDR9pymw/FKcNiGX7+v47uHh2UpAliOjdtTC9F/IiMyO8kFwM5C3PcuWY
         a3AXXSzfuiKRRfxvzJXEDVf8gvIleG6gJy4m41s1sm8qY9khc9+KUDc147ez8/b5Gq
         WVwc9aPoiE3Og==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1687611858; bh=A8Qf65Rob09U35oGENSWDKjvcQjFxw6Jr7EPtXZ0RBs=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=ddhgenzM9l5OX3VPJHJHnjXam1iTTPHItMmcnb1nzdS49b+PiY9FUzxmQ7qqSsPRv
         8twLuDnQgujybwJQ7j9EmTNgm71tIg1O7K+voRaNLx4pkPGHcnUnyFbPZtomGLI4R4
         7GB0lDmrln18PC2Ql7RZ+RzzramRbjxDStmf85zhsrSJDtRba/wV1tmeUerLMovaly
         WaHEkao40VDR9pymw/FKcNiGX7+v47uHh2UpAliOjdtTC9F/IiMyO8kFwM5C3PcuWY
         a3AXXSzfuiKRRfxvzJXEDVf8gvIleG6gJy4m41s1sm8qY9khc9+KUDc147ez8/b5Gq
         WVwc9aPoiE3Og==
Date:   Sat, 24 Jun 2023 15:04:16 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 00/11] Cleanup Octeon DWC3 glue code
Message-ID: <ZJbp0P5fYkvTLN5g@lenoch>
References: <ZJC165p0Mj4jHcBh@lenoch>
 <20230622230149.4wpvtlpsu7473txr@synopsys.com>
 <ZJVQUzVW+NzCgH7i@lenoch>
 <20230623232420.vfvkqkcee5jrrkmo@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230623232420.vfvkqkcee5jrrkmo@synopsys.com>
X-CMAE-Envelope: MS4wfOY9Vg2wt24jzn69gegLtgwCyOhJpUAcjTsDrgSrenZBywKfuBRP9r8Citz+FhztjMyh2WYzeSQAyaOLWN2TpFn7nY6DtpnIp+tGw84MGRlGvGWxS5qp
 gi2i8ALgyVzdiDxeKt8vVl1Cpb/Sl1s4BENivLS7x9YmL7U200Etyj+Z7YtU4T/VcQwq07SjLEHFECx0g9fHObTfO0mQuMAII7tTNvJuRnaNVffJAwc8lVmQ
 lJk/SAOIXs3qocBd/etP0w==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On Fri, Jun 23, 2023 at 11:24:24PM +0000, Thinh Nguyen wrote:
> On Fri, Jun 23, 2023, Ladislav Michl wrote:
> > Hi,
> > 
> > On Thu, Jun 22, 2023 at 11:01:54PM +0000, Thinh Nguyen wrote:
> > > Hi,
> > [snip]
> > > Please use get_maintainer.pl to get all the proper maintainers to review
> > > the changes.
> > 
> > That's what I did. Thomas, MIPS maintainer is reading linux-mips list,
> > Greg is reading linux-usb list, you were the one who receives changes,
> > hence all patcheset was sent to you in a hope you provide some comments
> > about actual code changes.
> 
> I can take a look at the changes. However, the patches were sent
> directly To: me for patches related MIPS and no one else except the
> linux-usb linux-mips (without Thomas), which doesn't look right.
> 
> I'm not familiar with the MIPS subsystem, but typically for the USB
> mailing list, we capture all the emails generated from get_maintainer.pl
> and include them To: and Cc: should they need attention to the changes.
> Often we filter our emails based on whether it's directed toward us, at
> least I do that. Also, we can't be sure if everyone still subscribes to
> the corresponding mailing list.

Did you run get_maintainer.pl yourself? Because here (for v6.3) I get:
$ ./scripts/get_maintainer.pl -f arch/mips/cavium-octeon/octeon-usb.c 
Thomas Bogendoerfer <tsbogend@alpha.franken.de> (maintainer:MIPS,commit_signer:1/1=100%)
Ladislav Michl <ladis@linux-mips.org> (commit_signer:1/1=100%,authored:1/1=100%,added_lines:20/20=100%,removed_lines:22/22=100%)
linux-mips@vger.kernel.org (open list:MIPS)
linux-kernel@vger.kernel.org (open list)
$ ./scripts/get_maintainer.pl -f drivers/usb/dwc3
Thinh Nguyen <Thinh.Nguyen@synopsys.com> (maintainer:DESIGNWARE USB3 DRD IP DRIVER)
Greg Kroah-Hartman <gregkh@linuxfoundation.org> (supporter:USB SUBSYSTEM)
linux-usb@vger.kernel.org (open list:DESIGNWARE USB3 DRD IP DRIVER)
linux-kernel@vger.kernel.org (open list)

So I have no clue who else should I add to Cc list...

> > 
> > > Since this is a large change involving different subsystems, if
> > > possible, please split the changes related to MIPS and try to upstream
> > > those first as they will affect how dwc3 glue driver will look.
> > 
> > That's pretty straightforward as patchset is arranged exactly this way,
> > so MIPS maintainer is free to apply patches till driver move.
> > However, any actual feedback would be still usefull. In case it gets
> > some acks I'll add them and rebase patches to the latest -next.
> > 
> 
> Then that's good. If the MIPS maintainer approves all the MIPS related
> changes and already pick them up, there should be no problem.

Well, remaining question is how to make it comfortable for you to take
changes. Patches 1-7 are in mips-next already, so I propose to wait until
they propagate upstream then I rebase remaining patches to whatever is
in linux-next.

Please note I added glue driver into Makefile and Kconfig at random
locations as I failed to find any logic here. If you have any preference
or want to sort those files alphabetically first for example, just let
me know and I'll add some cleanup patches before sending v2.

Also coleagues of mine meanwhile found that PLL indeed ocassionally
fails to lock, so workaround attached to cover letter is really needed.
Naturally it cannot sneak in as it is, so unless you have better idea
I'll just port it to recent driver state and we can start discussion
from there in a separate thread.

Thank you,
	ladis
