Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCCA24EBDE6
	for <lists+linux-mips@lfdr.de>; Wed, 30 Mar 2022 11:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236974AbiC3Jod (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Mar 2022 05:44:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244952AbiC3Job (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 30 Mar 2022 05:44:31 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFD0D2662DB
        for <linux-mips@vger.kernel.org>; Wed, 30 Mar 2022 02:42:46 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id bi12so40401068ejb.3
        for <linux-mips@vger.kernel.org>; Wed, 30 Mar 2022 02:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DkXySaksT2b42sldA2gvUA6EGAlPsHNRha4VRaVGbvo=;
        b=CXfgGY4Pu2RDQjwQXolBBZ1mlZEpnpqCFmSn1ugbGeunm4L2eaQ1Y4DuYA6l0Wt1Om
         At1S/+4nVo7Dj5rvIEsYHGUFCbpBCZxkqRpxhNAH2+f1aBAahyejITttqs2fQMLPKT1t
         l1cjjR7oDvDjvkASBNW0xN23kcV+793jjPbIgPjQIj8I+6eaeJ+TJSDDoTztkT4NeRmY
         Xav+8RqYJ8AuB5aPlskjN2Hk/L/Aa7wsytw6xN9h8h3q9h3UN2ZMP9exrjQpzMq0Gb3E
         quH8F39ty05PFJ5hoKOzAfCCDbRJqBaX+1Yj46YE4G9qx6gm2rumjhak7bp0dnjFSzdi
         Oxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DkXySaksT2b42sldA2gvUA6EGAlPsHNRha4VRaVGbvo=;
        b=wzp92JyesY1rDfqWsvb9SVYEFwiQNohUrv/15WNFYVeUCrVPwF4BFTphMgh6tYCFsP
         8FRJdwKDi78Z1HU2SOQt1UYWfu2AFskRXRREKMpWxWPdQPgpvSZ76ZOkpLIM3ilC0Gtq
         za5wzyb4w0YMiOT0isDOcWm6vO/IMGV+12Yc9NwFm/VaBlLGLenBOUw8LIR+P8/NhKcG
         a+/bf1BOwVGar1QK8Jvziui+aStojRyndGkxoyqPEzdKV2VoobE2oMH4Mlub5ds6X+9G
         PTvQansN5JC/UWxv4ai8Nks43+Ma1uTUpK93560QW8KsNVAg7AF28ycloVnNHb3Dv1p9
         2Y+Q==
X-Gm-Message-State: AOAM532kao6PUFSdbHWT9LsMS7lex60xcxrsCGDPn2Ql64JdOJcelHxE
        IdbXoCFDIqKYqaihwUwXAxmrnt5cJvhvyrDfeKU=
X-Google-Smtp-Source: ABdhPJy1Quo4msqWFIzVPyLbWbtJiT/eO5fzzQNVUZDnBn3vRiJVLa5+H5B56+VJoSF0kj1uwP8WVufQPFLccGidTX8=
X-Received: by 2002:a17:907:628e:b0:6d9:c6fa:6168 with SMTP id
 nd14-20020a170907628e00b006d9c6fa6168mr38978998ejc.132.1648633365314; Wed, 30
 Mar 2022 02:42:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220329014537.4180966-1-liu.yun@linux.dev> <CAHp75VcAL6avNxMSVo9nWbxXOnKmXAiuGMV=uWwAx0BdHnf-+Q@mail.gmail.com>
 <71d1da40-4772-b126-7cbe-0d99024fd284@linux.dev> <20220330064216.GA5811@alpha.franken.de>
 <CAHp75VencGLsfR=9ug1xBeWeSe+zy_vroaqkh2xWR7BojQOGEw@mail.gmail.com> <20220330093227.GA8224@alpha.franken.de>
In-Reply-To: <20220330093227.GA8224@alpha.franken.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 30 Mar 2022 12:41:38 +0300
Message-ID: <CAHp75Vc+Gvte62Smnyi_RN=c0Fpy6LLyqJV2Oy0HP+Yv6CvtxQ@mail.gmail.com>
Subject: Re: [PATCH] MIPS: rb532: move GPIOD definition into C-files
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     Jackie Liu <liu.yun@linux.dev>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Jonathan Cameron <jic23@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 30, 2022 at 12:32 PM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
> On Wed, Mar 30, 2022 at 12:23:59PM +0300, Andy Shevchenko wrote:
> > On Wed, Mar 30, 2022 at 9:45 AM Thomas Bogendoerfer
> > <tsbogend@alpha.franken.de> wrote:
> > > On Wed, Mar 30, 2022 at 09:46:07AM +0800, Jackie Liu wrote:

...

> > > I have a patchset, where the both files will go away. No need to
> > > clean up now.
> >
> > Do you plan them to be backported? If not, I would recommend applying
>
> no plan for backporting
>
> > this patch in order to have it backported and then do whatever you
> > want we those files.
>
> why ? This doesn't fix anything, doesn't it ?

It fixes compilation breakage in some cases. I think the author of
this patch can (should) elaborate.
Also, it might need a Fixes tag.

> But if it makes people happy, I'll apply it.

Yes, please.

-- 
With Best Regards,
Andy Shevchenko
