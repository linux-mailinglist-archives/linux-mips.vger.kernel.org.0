Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D4F133A1D9
	for <lists+linux-mips@lfdr.de>; Sun, 14 Mar 2021 00:10:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233219AbhCMXKD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Sat, 13 Mar 2021 18:10:03 -0500
Received: from aposti.net ([89.234.176.197]:37604 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231329AbhCMXJs (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 13 Mar 2021 18:09:48 -0500
Date:   Sat, 13 Mar 2021 23:09:23 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/2] clk: Add clk_get_first_to_set_rate
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        Ulf Hansson <ulf.hansson@linaro.org>, od@zcrc.me,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org
Message-Id: <NBKXPQ.SZZ17JHCOG5G@crapouillou.net>
In-Reply-To: <161567452539.1478170.2985873696192051312@swboyd.mtv.corp.google.com>
References: <20210307170742.70949-1-paul@crapouillou.net>
        <20210307170742.70949-2-paul@crapouillou.net>
        <161567452539.1478170.2985873696192051312@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Stephen,


Le sam. 13 mars 2021 à 14:28, Stephen Boyd <sboyd@kernel.org> a écrit 
:
> Quoting Paul Cercueil (2021-03-07 09:07:41)
>>  The purpose of this function is to be used along with the notifier
>>  mechanism.
>> 
>>  When a parent clock can see its rate externally changed at any 
>> moment,
>>  and a driver needs a specific clock rate to function, it can 
>> register a
>>  notifier on the parent clock, and call clk_set_rate() on the base 
>> clock
>>  to adjust its frequency according to the new parent clock.
> 
> Can the driver use the rate locking mechanism to get a certain rate
> instead of registering for notifiers and trying to react to changes?

You mean with clk_rate_exclusive_get()? That sounds like a good idea, 
but what would happen when a different driver calls the non-exclusive 
clk_set_rate() on this clock (or the parent), would it return -EBUSY, 
lock on a mutex? ...

Cheers,
-Paul

> 
>> 
>>  This works fine, until the base clock has the CLK_SET_RATE_PARENT 
>> flag
>>  set. In that case, calling clk_set_rate() on the base clock will 
>> call
>>  clk_set_rate() on the parent clock, which will trigger the notifier
>>  again, and we're in a loop.
>> 
>>  For that reason, we need to register the notifier on the parent 
>> clock of
>>  the first ancestor of the base clock that will effectively modify 
>> its
>>  rate when clk_set_rate() is called, which we can now obtain with
>>  clk_get_first_to_set_rate().
>> 
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>


