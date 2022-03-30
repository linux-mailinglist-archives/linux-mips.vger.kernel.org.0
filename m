Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 857FE4EBF6B
	for <lists+linux-mips@lfdr.de>; Wed, 30 Mar 2022 13:01:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245685AbiC3LCo (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Mar 2022 07:02:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241893AbiC3LCn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 30 Mar 2022 07:02:43 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 817A0DF70
        for <linux-mips@vger.kernel.org>; Wed, 30 Mar 2022 04:00:58 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1nZW4P-0007z0-00; Wed, 30 Mar 2022 13:00:57 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id F1201C2EE0; Wed, 30 Mar 2022 12:02:13 +0200 (CEST)
Date:   Wed, 30 Mar 2022 12:02:13 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jackie Liu <liu.yun@linux.dev>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH] MIPS: rb532: move GPIOD definition into C-files
Message-ID: <20220330100213.GA8617@alpha.franken.de>
References: <20220329014537.4180966-1-liu.yun@linux.dev>
 <CAHp75VcAL6avNxMSVo9nWbxXOnKmXAiuGMV=uWwAx0BdHnf-+Q@mail.gmail.com>
 <71d1da40-4772-b126-7cbe-0d99024fd284@linux.dev>
 <20220330064216.GA5811@alpha.franken.de>
 <CAHp75VencGLsfR=9ug1xBeWeSe+zy_vroaqkh2xWR7BojQOGEw@mail.gmail.com>
 <20220330093227.GA8224@alpha.franken.de>
 <CAHp75Vc+Gvte62Smnyi_RN=c0Fpy6LLyqJV2Oy0HP+Yv6CvtxQ@mail.gmail.com>
 <f601dcf3-892c-e8de-9028-9e5108322074@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f601dcf3-892c-e8de-9028-9e5108322074@linux.dev>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 30, 2022 at 05:56:03PM +0800, Jackie Liu wrote:
> 
> 在 2022/3/30 下午5:41, Andy Shevchenko 写道:
> > On Wed, Mar 30, 2022 at 12:32 PM Thomas Bogendoerfer
> > <tsbogend@alpha.franken.de> wrote:
> > > On Wed, Mar 30, 2022 at 12:23:59PM +0300, Andy Shevchenko wrote:
> > > > On Wed, Mar 30, 2022 at 9:45 AM Thomas Bogendoerfer
> > > > <tsbogend@alpha.franken.de> wrote:
> > > > > On Wed, Mar 30, 2022 at 09:46:07AM +0800, Jackie Liu wrote:
> > 
> > ...
> > 
> > > > > I have a patchset, where the both files will go away. No need to
> > > > > clean up now.
> > > > 
> > > > Do you plan them to be backported? If not, I would recommend applying
> > > 
> > > no plan for backporting
> > > 
> > > > this patch in order to have it backported and then do whatever you
> > > > want we those files.
> > > 
> > > why ? This doesn't fix anything, doesn't it ?
> 
> Like the patch I submitted in the first version, there are some gcc
> errors.
> 
> [...]
> drivers/iio/adc/da9150-gpadc.c:254:13: error: ‘DA9150_GPADC_CHAN_0x08’
> undeclared here (not in a function); did you mean ‘DA9150_GPADC_CHAN_TBAT’?
>    254 |  .channel = DA9150_GPADC_CHAN_##_id,   \
>        |             ^~~~~~~~~~~~~~~~~~
>  drivers/iio/adc/da9150-gpadc.c:273:2: note: in expansion of macro
> ‘DA9150_GPADC_CHANNEL’
>    273 |  DA9150_GPADC_CHANNEL(_id, _hw_id, _type,   \
>        |  ^~~~~~~~~~~~~~~~~~~~
>  drivers/iio/adc/da9150-gpadc.c:281:2: note: in expansion of macro
> ‘DA9150_GPADC_CHANNEL_PROCESSED’
>    281 |  DA9150_GPADC_CHANNEL_PROCESSED(GPIOD, GPIOD_6V, IIO_VOLTAGE,
> NULL),
>        |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> make[4]: *** [../scripts/Makefile.build:288: drivers/iio/adc/da9150-gpadc.o]
> Error 1
> make[3]: *** [../scripts/Makefile.build:550: drivers/iio/adc] Error 2
> make[3]: *** Waiting for unfinished jobs....
> 
> > 
> > It fixes compilation breakage in some cases. I think the author of
> > this patch can (should) elaborate.
> > Also, it might need a Fixes tag.
> 
> 
> Um, it's really hard to say which commit is fixed, just because this
> header file defines a GPIOD, and someone else uses this later.

ok, now I got it.

> > > But if it makes people happy, I'll apply it.
> > 
> > Yes, please.

will do,

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
