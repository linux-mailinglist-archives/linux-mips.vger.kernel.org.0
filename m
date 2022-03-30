Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 428534EBE41
	for <lists+linux-mips@lfdr.de>; Wed, 30 Mar 2022 12:03:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241067AbiC3KEs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Mar 2022 06:04:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238742AbiC3KEr (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 30 Mar 2022 06:04:47 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD29BBABA2
        for <linux-mips@vger.kernel.org>; Wed, 30 Mar 2022 03:03:00 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id t25so34875525lfg.7
        for <linux-mips@vger.kernel.org>; Wed, 30 Mar 2022 03:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8LFz++qylVSS+EMxWHu1+F7yR5DUC6/CmNOl3cBHE6M=;
        b=P2pn0HgisWFTqebsmlvnP3SyJ4LnA9Aj+aghRyN518TJrOiL/OjMZ6XJjQora20Bhf
         ZwacaLvTpydyookFLnIoQYG6173uQZHn0+x4mHJ2sTYT2fTJnaewz7owNnT1v8zDq0ma
         OHwTpkFCwbWKE33UEBaN42uko9YSYkBewQhPH+cJuR6Se0n73ZM60SqwcCRcZdWu/1lr
         h0yYTkIhN+L5uRUCO4SBITghNNjvjds88AB9qCwc2lPqre6TwiYZ/ejtcDZwQOQQhr2Y
         d/6SCz6UaSGfy0LRuK03wHtOOAvYeGdTVff7/UzaWLH5rTaBYpEfp2vbGMiMOK52NWxc
         6BcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8LFz++qylVSS+EMxWHu1+F7yR5DUC6/CmNOl3cBHE6M=;
        b=lzh2tVcN/FKIwMknPb4o0UT10xiXYqt61S2LaqKDOPqxwlCkboNX5PDGl7vFHWptvj
         xMc+2YxoW6UAro8byOJMqbBxIy6emsx2KF5s6+yLVew9/oMQtgoFIxqAmamcwis/K7k0
         afwQRs7/AF9DU4PSyoE2qnpkBq0SbFYungCmsy1cyz73sif7BS35kyAefeMxr9McExHs
         L3v6Md4cRmiL3e6A9kDnvL8HxRAwyx1N+mp+a9hB6hM3v8s3bIOAql6gXsJNCI8JldCz
         S59nb0VLsiJxyVXSZec+npCi4/wvCDi/eT7YoLHGNl1QcXuljNbSlUVyUydIeWxe6XrW
         WnjQ==
X-Gm-Message-State: AOAM532vVktAV+9VmX99ldWhTHBad2UsOGepQneh0hEg1S8esoLFjsfD
        wblahI1aYUJU7eaqmVyOp7GBgLk6RQTwBZ4/hP4=
X-Google-Smtp-Source: ABdhPJy9H02iy6utWi+MxYUfwHCEPCTzga4mEVdFhakZRExgqoWr2sTkbY1CgwmQWoXCtr05HWXLu+ijLOSNUEwhKno=
X-Received: by 2002:a05:6512:32c2:b0:44a:700c:4e97 with SMTP id
 f2-20020a05651232c200b0044a700c4e97mr6206872lfg.224.1648634575363; Wed, 30
 Mar 2022 03:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220329014537.4180966-1-liu.yun@linux.dev> <CAHp75VcAL6avNxMSVo9nWbxXOnKmXAiuGMV=uWwAx0BdHnf-+Q@mail.gmail.com>
 <71d1da40-4772-b126-7cbe-0d99024fd284@linux.dev> <20220330064216.GA5811@alpha.franken.de>
 <CAHp75VencGLsfR=9ug1xBeWeSe+zy_vroaqkh2xWR7BojQOGEw@mail.gmail.com>
 <20220330093227.GA8224@alpha.franken.de> <CAHp75Vc+Gvte62Smnyi_RN=c0Fpy6LLyqJV2Oy0HP+Yv6CvtxQ@mail.gmail.com>
 <f601dcf3-892c-e8de-9028-9e5108322074@linux.dev>
In-Reply-To: <f601dcf3-892c-e8de-9028-9e5108322074@linux.dev>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 30 Mar 2022 13:01:49 +0300
Message-ID: <CAHp75VdWBMQWtgL1ejk-2C2v4sfm48RzyJd-Z3hMcSvi=Tm4pg@mail.gmail.com>
Subject: Re: [PATCH] MIPS: rb532: move GPIOD definition into C-files
To:     Jackie Liu <liu.yun@linux.dev>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 30, 2022 at 12:56 PM Jackie Liu <liu.yun@linux.dev> wrote:
> =E5=9C=A8 2022/3/30 =E4=B8=8B=E5=8D=885:41, Andy Shevchenko =E5=86=99=E9=
=81=93:
> > On Wed, Mar 30, 2022 at 12:32 PM Thomas Bogendoerfer
> > <tsbogend@alpha.franken.de> wrote:

...

> > It fixes compilation breakage in some cases. I think the author of
> > this patch can (should) elaborate.
> > Also, it might need a Fixes tag.
>
> Um, it's really hard to say which commit is fixed, just because this
> header file defines a GPIOD, and someone else uses this later.

I think we may use the original commit where the header in mips
appeared with a justification that the definitions are not needed to
be there and it may induce build errors, which in fact happens.

--=20
With Best Regards,
Andy Shevchenko
