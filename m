Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D5064EBB08
	for <lists+linux-mips@lfdr.de>; Wed, 30 Mar 2022 08:47:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243282AbiC3Grs (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Mar 2022 02:47:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243323AbiC3Grn (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 30 Mar 2022 02:47:43 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D53BA8A32D
        for <linux-mips@vger.kernel.org>; Tue, 29 Mar 2022 23:45:56 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1nZS5Z-0006HP-00; Wed, 30 Mar 2022 08:45:53 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id E274AC2ED2; Wed, 30 Mar 2022 08:42:16 +0200 (CEST)
Date:   Wed, 30 Mar 2022 08:42:16 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jackie Liu <liu.yun@linux.dev>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH] MIPS: rb532: move GPIOD definition into C-files
Message-ID: <20220330064216.GA5811@alpha.franken.de>
References: <20220329014537.4180966-1-liu.yun@linux.dev>
 <CAHp75VcAL6avNxMSVo9nWbxXOnKmXAiuGMV=uWwAx0BdHnf-+Q@mail.gmail.com>
 <71d1da40-4772-b126-7cbe-0d99024fd284@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <71d1da40-4772-b126-7cbe-0d99024fd284@linux.dev>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 30, 2022 at 09:46:07AM +0800, Jackie Liu wrote:
> 
> 
> 在 2022/3/29 下午8:54, Andy Shevchenko 写道:
> > On Tue, Mar 29, 2022 at 4:46 AM Jackie Liu <liu.yun@linux.dev> wrote:
> > > 
> > > From: Jackie Liu <liuyun01@kylinos.cn>
> > > 
> > > My kernel robot report build error from drivers/iio/adc/da9150-gpadc.c,
> > > 
> > > We define GPIOD in rb.h, in fact he should only be used in gpio.c, but
> > 
> > he --> it
> > 
> > > it affects the driver da9150-gpadc.c which goes against the original
> > > intention of the design, just move it to his scope.
> > 
> > > At the same time, GPIONMIEN and IMASK6 are not used anywhere, just delete
> > > them.
> > 
> > While not being used it's good to leave (save) them since it might be
> > the only means of the HW documentation. I know that Git history will
> > keep that, but it is more explicit just to have them in the code.
> 
> Sure.
> 
> > 
> > ...
> > 
> > >   #define DEV3TC         0x01003C
> > >   #define BTCS           0x010040
> > >   #define BTCOMPARE      0x010044
> > > -#define GPIOBASE       0x050000
> > 
> > ...
> > 
> > > +#define GPIOBASE       0x050000
> > 
> > I think this one belongs to the header.
> 
> I think it would be better to put it in gpio.c, after all it belongs to
> the GPIO module and is not used elsewhere. It doesn't feel good if we
> put it in the header file.

I have a patchset, where the both files will go away. No need to
clean up now.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
