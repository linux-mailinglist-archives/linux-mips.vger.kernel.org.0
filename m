Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3348D4EBDB2
	for <lists+linux-mips@lfdr.de>; Wed, 30 Mar 2022 11:32:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244840AbiC3Jec (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Mar 2022 05:34:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241954AbiC3Jeb (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 30 Mar 2022 05:34:31 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2C8712ED76
        for <linux-mips@vger.kernel.org>; Wed, 30 Mar 2022 02:32:46 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1nZUh3-0007Pe-00; Wed, 30 Mar 2022 11:32:45 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 45178C2ED2; Wed, 30 Mar 2022 11:32:27 +0200 (CEST)
Date:   Wed, 30 Mar 2022 11:32:27 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Jackie Liu <liu.yun@linux.dev>,
        Linus Walleij <linus.walleij@linaro.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Jonathan Cameron <jic23@kernel.org>
Subject: Re: [PATCH] MIPS: rb532: move GPIOD definition into C-files
Message-ID: <20220330093227.GA8224@alpha.franken.de>
References: <20220329014537.4180966-1-liu.yun@linux.dev>
 <CAHp75VcAL6avNxMSVo9nWbxXOnKmXAiuGMV=uWwAx0BdHnf-+Q@mail.gmail.com>
 <71d1da40-4772-b126-7cbe-0d99024fd284@linux.dev>
 <20220330064216.GA5811@alpha.franken.de>
 <CAHp75VencGLsfR=9ug1xBeWeSe+zy_vroaqkh2xWR7BojQOGEw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VencGLsfR=9ug1xBeWeSe+zy_vroaqkh2xWR7BojQOGEw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 30, 2022 at 12:23:59PM +0300, Andy Shevchenko wrote:
> On Wed, Mar 30, 2022 at 9:45 AM Thomas Bogendoerfer
> <tsbogend@alpha.franken.de> wrote:
> > On Wed, Mar 30, 2022 at 09:46:07AM +0800, Jackie Liu wrote:
> > > 在 2022/3/29 下午8:54, Andy Shevchenko 写道:
> 
> ...
> 
> > > I think it would be better to put it in gpio.c, after all it belongs to
> > > the GPIO module and is not used elsewhere. It doesn't feel good if we
> > > put it in the header file.
> >
> > I have a patchset, where the both files will go away. No need to
> > clean up now.
> 
> Do you plan them to be backported? If not, I would recommend applying

no plan for backporting

> this patch in order to have it backported and then do whatever you
> want we those files.

why ? This doesn't fix anything, doesn't it ?

But if it makes people happy, I'll apply it.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
