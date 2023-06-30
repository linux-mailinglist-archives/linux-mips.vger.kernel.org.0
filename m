Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A07667439C4
	for <lists+linux-mips@lfdr.de>; Fri, 30 Jun 2023 12:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232908AbjF3Kmj (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 30 Jun 2023 06:42:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232636AbjF3KmM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 30 Jun 2023 06:42:12 -0400
Received: from h3.cmg2.smtp.forpsi.com (h3.cmg2.smtp.forpsi.com [185.129.138.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DC7E3C21
        for <linux-mips@vger.kernel.org>; Fri, 30 Jun 2023 03:40:52 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id FBYSqlpbfv5uIFBYUq9buV; Fri, 30 Jun 2023 12:40:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1688121646; bh=g8JmLAKcloD23Ue5ykjZvMVtP2qQLeC/ZbtmEMr11J8=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=gBpwyphwYnaF52hGCfndrPwfR6s5OJ9iFW9jtQT5LhGTxMom75zz0P5Iz2ggajdtq
         Z4XyG2rep9QfrKiR22Nl9WxKcKBSs5/py9kNBHgjhUkN5uzVMToUQpxo7Xjg6s8dDF
         GSe1icMW6TMi3DFTkI8fAvunMypuaKfzclpHcA0IBcM0WUo8JxY9i0B8zkhJjTP07K
         DhGCF0H/2+C/5hO9kd7wQAPPavrRpIGs2GgKUGvOrVx30hhjGVHw1YhON4ER7yFjUD
         3JWPuFdS3nz2d5/Dx7lWQeHB+Obmr316EPFx2ts0hNhSxlwgiLi7mMZrPi4xgAbyiY
         qGzLllc9CdR8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1688121646; bh=g8JmLAKcloD23Ue5ykjZvMVtP2qQLeC/ZbtmEMr11J8=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=gBpwyphwYnaF52hGCfndrPwfR6s5OJ9iFW9jtQT5LhGTxMom75zz0P5Iz2ggajdtq
         Z4XyG2rep9QfrKiR22Nl9WxKcKBSs5/py9kNBHgjhUkN5uzVMToUQpxo7Xjg6s8dDF
         GSe1icMW6TMi3DFTkI8fAvunMypuaKfzclpHcA0IBcM0WUo8JxY9i0B8zkhJjTP07K
         DhGCF0H/2+C/5hO9kd7wQAPPavrRpIGs2GgKUGvOrVx30hhjGVHw1YhON4ER7yFjUD
         3JWPuFdS3nz2d5/Dx7lWQeHB+Obmr316EPFx2ts0hNhSxlwgiLi7mMZrPi4xgAbyiY
         qGzLllc9CdR8Q==
Date:   Fri, 30 Jun 2023 12:40:43 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 00/11] Cleanup Octeon DWC3 glue code
Message-ID: <ZJ6xK7SJ7PwLril7@lenoch>
References: <ZJC165p0Mj4jHcBh@lenoch>
 <20230622230149.4wpvtlpsu7473txr@synopsys.com>
 <ZJVQUzVW+NzCgH7i@lenoch>
 <20230623232420.vfvkqkcee5jrrkmo@synopsys.com>
 <ZJbp0P5fYkvTLN5g@lenoch>
 <20230626231753.jumwoztg464q5656@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230626231753.jumwoztg464q5656@synopsys.com>
X-CMAE-Envelope: MS4wfBm/7bLpCPufczRL3TgHwoq1lwxO80BNdL0imSWmG6RcakHhfQsVhabsohOQiv2I/+t3zEY896SbYadmEHrKG8jTbSPm9c5nyBeEzqv8aIX1rRm5dxxg
 XGECRwZsruGpabHI7hkantZaIZWc0a68MBxnd6fFSVO2Ox/mFVz+A2fXmInD5qn8ZbJKnV25nJLD9REhGFgL4rz/c0B8eUhZy9k6215C3b40OYvVvLU+ziUo
 d0RYTezLrxBZjVH6+njU0Q==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On Mon, Jun 26, 2023 at 11:17:57PM +0000, Thinh Nguyen wrote:
> Hi,
[snip]
> For each patch, please include all the emails returned from
> get_maintainer.pl including Greg's and Thomas's.

I already explained why is Cc list constructed the way it is. Despite
formal rules, time is a scarce resource, so let's not draw people's
attention too early. Anyway, if you think there's something that
needs someone's special attention, you can still extend Cc list
yourself.

Before sending v2, maintainer's review or ack is needed. I already
collected Thomas' ack for a move, but have not read a single world
from you. Do you plan to do some actual review, so we can take next
step or are you willing to wait for a v2 which will add only
octeon_get_io_clock_rate stub for non Octeon builds (having clk api
would be nice here, but that's different story)?

Also, perhaps it would be reasonable to squash patches 8 and 9.
Which tree to you want it to be rebased against? Currently I'm at
linux.git master and changes were retested here.

I'd prefer to send fewer version if possible, so actual comments
on code would certainly help.

[snip]
> > Also coleagues of mine meanwhile found that PLL indeed ocassionally
> > fails to lock, so workaround attached to cover letter is really needed.
> > Naturally it cannot sneak in as it is, so unless you have better idea
> > I'll just port it to recent driver state and we can start discussion
> > from there in a separate thread.
> 
> If this causes a regression, then please fix it before sending it in. If
> it's a new found issue, you can create a fix patch at a later point.

There are few problems with Octeon's DWC3 implementation and none of them
can be really solved without documentation. Here I come in trouble as
Sysnopsys tech support pointed to SoC manufacturer which no longer exists.
Cavium was bought by Marvell, dumped almost all the staff and those
still providing technical support were unable to find any revelant
documentation in past few months.

So unless that changes I can send only hackish patches which kinda
overcome issues found, but I do not think it is viable solution. That's
something I'll do at later point as you suggested and we'll see if an
acceptable solution pops up.

Thank you,
	ladis
