Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F002E4ECCCB
	for <lists+linux-mips@lfdr.de>; Wed, 30 Mar 2022 21:00:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349994AbiC3TCN (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 30 Mar 2022 15:02:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350285AbiC3TCM (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 30 Mar 2022 15:02:12 -0400
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 63E49267B
        for <linux-mips@vger.kernel.org>; Wed, 30 Mar 2022 12:00:26 -0700 (PDT)
Received: from uucp (helo=alpha)
        by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
        id 1nZdYO-0003Qd-02; Wed, 30 Mar 2022 21:00:24 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
        id 8758EC4DEF; Wed, 30 Mar 2022 20:35:23 +0200 (CEST)
Date:   Wed, 30 Mar 2022 20:35:23 +0200
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Jackie Liu <liu.yun@linux.dev>
Cc:     linus.walleij@linaro.org, ralf@linux-mips.org,
        linux-mips@vger.kernel.org, jic23@kernel.org,
        andy.shevchenko@gmail.com, sergei.shtylyov@gmail.com
Subject: Re: [PATCH v4] MIPS: rb532: move GPIOD definition into C-files
Message-ID: <20220330183523.GC18042@alpha.franken.de>
References: <20220330120921.1920941-1-liu.yun@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220330120921.1920941-1-liu.yun@linux.dev>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_PASS,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On Wed, Mar 30, 2022 at 08:09:21PM +0800, Jackie Liu wrote:
> From: Jackie Liu <liuyun01@kylinos.cn>
> 
> My kernel robot reports build error from drivers/iio/adc/da9150-gpadc.c,
> 
>   drivers/iio/adc/da9150-gpadc.c:254:13: error: ‘DA9150_GPADC_CHAN_0x08’
>   undeclared here (not in a function); did you mean ‘DA9150_GPADC_CHAN_TBAT’?
>      254 |  .channel = DA9150_GPADC_CHAN_##_id,
> 
> We define GPIOD in rb.h, in fact it should only be used in gpio.c, but
> it affects the driver da9150-gpadc.c which goes against the original
> intention of the design, just move it to its scope.
> 
> Fixes: 1b432840d0a4 ("MIPS: RB532: GPIO register offsets are relative to GPIOBASE")
> Suggested-by: Jonathan Cameron <jic23@kernel.org>
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reported-by: k2ci <kernel-bot@kylinos.cn>
> Signed-off-by: Jackie Liu <liuyun01@kylinos.cn>

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
