Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BA6D4AA163
	for <lists+linux-mips@lfdr.de>; Fri,  4 Feb 2022 21:47:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238089AbiBDUri convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-mips@lfdr.de>); Fri, 4 Feb 2022 15:47:38 -0500
Received: from aposti.net ([89.234.176.197]:48352 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231847AbiBDUri (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 4 Feb 2022 15:47:38 -0500
Date:   Fri, 04 Feb 2022 20:47:28 +0000
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 0/1] clk: jz4725b: fix mmc0 clock gating
To:     Siarhei Volkau <lis8215@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-mips@vger.kernel.org,
        linux-clk@vger.kernel.org
Message-Id: <4FSS6R.0A48V2ZMZD7X1@crapouillou.net>
In-Reply-To: <CAKNVLfbeKhcRR1Sc780GU9XvW4ACJRHiy4EHJfsPeqB5Sj9i9A@mail.gmail.com>
References: <ZFOR6R.SY2BLN8DYNHG3@crapouillou.net>
        <20220204072141.542909-1-lis8215@gmail.com>
        <QH1S6R.BMH4KZNDZAOO3@crapouillou.net>
        <CAKNVLfbeKhcRR1Sc780GU9XvW4ACJRHiy4EHJfsPeqB5Sj9i9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

Le ven., févr. 4 2022 at 21:22:04 +0300, Siarhei Volkau 
<lis8215@gmail.com> a écrit :
> пт, 4 февр. 2022 г. в 14:06, Paul Cercueil 
> <paul@crapouillou.net>:
>> 
>>  Hi,
>> 
>>  Le ven., févr. 4 2022 at 10:21:40 +0300, Siarhei Volkau
>>  <lis8215@gmail.com> a écrit :
>>  Can you confirm that the MMC0 controller will work even with the 
>> bit 6
>>  off?
>> 
>>  Do you know if the MMC0 bit has been moved elsewhere, or the MMC0
>>  controller is permanently enabled?
>> 
> Do you mean when the clock is off (bit == 1) or bit == 0 (the clock 
> is on)?

By "permanently enabled" I meant that maybe there is no bit in the 
CLKGR register that can gate this clock.

> Anyway what I tried:
> I tried not enabling this clock in the UBIBoot - it just works. I 
> guess
> boot ROM enables it earlier.

The mmc0 clock is ungated by default at bootup, yes.

> But when I explicitly disable the clock it doesn't boot.
> So I assume bit 6 definitely gates the MMC0
> clock, as stated in the jz4725b programmer's manual.

Ok, so bit 6 is indeed MMC0 and not I2S.

> Then I disabled MMC0 in Ubiboot to run Linux from MMC1 and tested
> the audio with disabled MMC0, in dts mmc0 node was disabled as well.
> With this patch applied sound works well. So I guess the bit 6 isn't
> related to the I2S clocking at all.
> 
> Hope I answered your questions.

Ok, then:
Reviewed-by: Paul Cercueil <paul@crapouillou.net>

Since it's a bug fix, you need to also add a fixes tag:
Fixes: 226dfa4726eb ("clk: Add Ingenic jz4725b CGU driver")

And add <stable@vger.kernel.org> in the Cc: list.

Cheers,
-Paul


