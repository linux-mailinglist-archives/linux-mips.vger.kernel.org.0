Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6822A7716C9
	for <lists+linux-mips@lfdr.de>; Sun,  6 Aug 2023 23:03:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbjHFVDm (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sun, 6 Aug 2023 17:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230226AbjHFVDl (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sun, 6 Aug 2023 17:03:41 -0400
Received: from h1.cmg2.smtp.forpsi.com (h1.cmg2.smtp.forpsi.com [81.2.195.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 797961724
        for <linux-mips@vger.kernel.org>; Sun,  6 Aug 2023 14:03:39 -0700 (PDT)
Received: from lenoch ([80.95.121.122])
        by cmgsmtp with ESMTPSA
        id SkuVq5qp8v5uISkuWqRo2l; Sun, 06 Aug 2023 23:03:36 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1691355816; bh=gqQsbgHdAQXBJG7c7HQKGiUkjPW4BuK1aHkZuh5N6I0=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=zE64+GN8hrAJaH5lkUk1XFCNefvXHYfkAMzOHhUiLd3pFpVeEhGk15FllUfYD4Yw3
         GyJAzlS+QGpD2N4aQjh0wkG/8Qz674Jpjw2HmXTBnbeZb/n0wMUSC0rlPPvWngLAK0
         /rdd/KprLqyCJx/+BDS76LE2y+Ex+b3fNIRR6ozzWhOMA7LQ7ca0AfTkKo/a3yiyFR
         Q9BMuBBjM+rA0khS38nG74/z0kgEleYwW8NARH03cblKBMfGUDdOiYflOM4jc+ZVti
         LX1A3f+zXthxJEL5mYEM0LClELxWRZD9FJRH727VVJFLTQeg5ZdlHtjtWL3pyjHhCj
         QV/h9zPgOszNw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1691355816; bh=gqQsbgHdAQXBJG7c7HQKGiUkjPW4BuK1aHkZuh5N6I0=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=zE64+GN8hrAJaH5lkUk1XFCNefvXHYfkAMzOHhUiLd3pFpVeEhGk15FllUfYD4Yw3
         GyJAzlS+QGpD2N4aQjh0wkG/8Qz674Jpjw2HmXTBnbeZb/n0wMUSC0rlPPvWngLAK0
         /rdd/KprLqyCJx/+BDS76LE2y+Ex+b3fNIRR6ozzWhOMA7LQ7ca0AfTkKo/a3yiyFR
         Q9BMuBBjM+rA0khS38nG74/z0kgEleYwW8NARH03cblKBMfGUDdOiYflOM4jc+ZVti
         LX1A3f+zXthxJEL5mYEM0LClELxWRZD9FJRH727VVJFLTQeg5ZdlHtjtWL3pyjHhCj
         QV/h9zPgOszNw==
Date:   Sun, 6 Aug 2023 23:03:35 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Robert Richter <rric@kernel.org>, linux-mmc@vger.kernel.org,
        linux-mips@vger.kernel.org
Subject: Re: (Octeon) MMC performance degradation due to too many requests
Message-ID: <ZNAKpw02GR0yfbyv@lenoch>
References: <ZM+IlctTTQLs7Qg9@lenoch>
 <CACRpkdZmd-nb21Cx-jp-CDRjW4VQRV=c4MekHxS3h2p3HsDwZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZmd-nb21Cx-jp-CDRjW4VQRV=c4MekHxS3h2p3HsDwZQ@mail.gmail.com>
X-CMAE-Envelope: MS4wfEpCs7TVuHZVBR5Di3XREAhjZ9Xz4xZE6OVKIf91+63w8u6MNDVk1S2gQ+nEAxZQkHf0PGIna6WYI7yHQ6SlijHsBc+kE/XOB7yZ9WuE7ncWGrMfo8v7
 JyTP8QbglyAPVwYWQryAw8MiZlJAyl6neICySVG9K/NHUk1jtFJfaGfE/mGZ22WZm7zUHQ9R+zobthD3OzIXnhVV1NrqWb5eWlFIP1lw3G5FK8rzhHRv0SzZ
 CCAoH61s82FvFL6PlIPwNe8Aivb4rZ4vNfQQj5UF07E=
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Sun, Aug 06, 2023 at 10:44:21PM +0200, Linus Walleij wrote:
> On Sun, Aug 6, 2023 at 1:48 PM Ladislav Michl <oss-lists@triops.cz> wrote:
> 
> > How do we get there?
> > ff4143ccff31 ("MIPS: Octeon: cavium_octeon_defconfig: Enable Octeon MMC")
> > enabled MMC driver, but left MMC_BLOCK_BOUNCE disabled, although driver
> > performace depends on it.
> 
> Ooops.
> 
> > c3dccb74be28 ("mmc: core: Delete bounce buffer Kconfig option")
> > Added MMC_CAP_NO_BOUNCE_BUFF to the caps, based on assumption it should
> > be there as MMC_BLOCK_BOUNCE is disabled in defconfig
> > de3ee99b097d ("mmc: Delete bounce buffer handling")
> > finally removed all bounce buffer handling as almost nothing needs that.
> >
> > Sadly, 70XX SoC cannot do SG, so it suffers a lot. Strangely enough,
> > above patches are either authored or suggested by Cavium's employees.
> >
> > So, given the number of affected SoC and before cooking driver specific
> > solution, are we sure we indeed do not want some generic one?
> 
> So you are talking about something along the lines of:
> 
> commit bd9b902798ab14d19ca116b10bde581ddff8f905
> Author: Linus Walleij <linus.walleij@linaro.org>
> Date:   Mon Jan 29 00:44:53 2018 +0100
> 
>     mmc: sdhci: Implement an SDHCI-specific bounce buffer
> 
> ?

Yes, this is the exact commit I had in mind :)

> Yeah I guess that if this is needed by more than one driver it
> should be made into a library, or say a piece of code turned on by
> a config option that the dependent drivers select.
> 
> Interested in the job? :D

Interested is not the word I'd use, but yes, I'll give it a try making it
a little more generic solution.

> Yours,
> Linus Walleij

Best reards,
	ladis
