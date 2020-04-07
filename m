Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B65DA1A0608
	for <lists+linux-mips@lfdr.de>; Tue,  7 Apr 2020 07:07:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726591AbgDGFHH (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Tue, 7 Apr 2020 01:07:07 -0400
Received: from hfcrelay.icp-osb-irony-out6.external.iinet.net.au ([203.59.1.86]:8292
        "EHLO hfcrelay.icp-osb-irony-out6.external.iinet.net.au"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726399AbgDGFHG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Tue, 7 Apr 2020 01:07:06 -0400
X-Greylist: delayed 558 seconds by postgrey-1.27 at vger.kernel.org; Tue, 07 Apr 2020 01:07:03 EDT
X-SMTP-MATCH: 0
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2AqAACBB4xe/yqY3MsNWRwBAQEBAQc?=
 =?us-ascii?q?BAREBBAQBAYFpBQEBCwGERYQbj0oBAQEBAQEGgQoIJYl+j1CBewoBAQEBAQE?=
 =?us-ascii?q?BAQE3BAEBhEQCgm02Bw4CEAEBAQUBAQEBAQUDAYV3hkkBAQEDIxVBEAsSBgI?=
 =?us-ascii?q?CJgICSQ4GAQwGAgEBgyKCWK9hdYEyhUuDVYE/gQ4qAYxMeYEHgTgMgi8uPoQ?=
 =?us-ascii?q?lgzuCXgSQRYdfmHoIgj+XJCOcAo83niYKgX8zGggoCIMkUCWcd2KNCYJDAQE?=
X-IPAS-Result: =?us-ascii?q?A2AqAACBB4xe/yqY3MsNWRwBAQEBAQcBAREBBAQBAYFpB?=
 =?us-ascii?q?QEBCwGERYQbj0oBAQEBAQEGgQoIJYl+j1CBewoBAQEBAQEBAQE3BAEBhEQCg?=
 =?us-ascii?q?m02Bw4CEAEBAQUBAQEBAQUDAYV3hkkBAQEDIxVBEAsSBgICJgICSQ4GAQwGA?=
 =?us-ascii?q?gEBgyKCWK9hdYEyhUuDVYE/gQ4qAYxMeYEHgTgMgi8uPoQlgzuCXgSQRYdfm?=
 =?us-ascii?q?HoIgj+XJCOcAo83niYKgX8zGggoCIMkUCWcd2KNCYJDAQE?=
X-IronPort-AV: E=Sophos;i="5.72,353,1580745600"; 
   d="scan'208";a="234957621"
Received: from 203-220-152-42.tpgi.com.au (HELO [192.168.1.108]) ([203.220.152.42])
  by icp-osb-irony-out6.iinet.net.au with ESMTP; 07 Apr 2020 12:57:41 +0800
Subject: Re: [PATCH 6/9] clk: Allow the common clk framework to be selectable
To:     Arnd Bergmann <arnd@arndb.de>, Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mark Salter <msalter@redhat.com>,
        Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Guan Xuetao <gxt@pku.edu.cn>,
        Russell King <linux@armlinux.org.uk>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        linux-c6x-dev@linux-c6x.org,
        linux-m68k <linux-m68k@lists.linux-m68k.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-sh list <linux-sh@vger.kernel.org>
References: <20200405025123.154688-1-sboyd@kernel.org>
 <20200405025123.154688-7-sboyd@kernel.org>
 <CAK8P3a2M54quhRNK4xvwjz9O9oZwgrobc_wtkGaeA2PMYwOUdg@mail.gmail.com>
 <158614207114.88454.6776609424163493475@swboyd.mtv.corp.google.com>
 <CAK8P3a3Yt2woG2LMcQ0jNPGuHdMtFbBmLvtBbrWFQ4J6x3v9aQ@mail.gmail.com>
From:   Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <8a2a142a-106a-4241-fca5-5ef12e66cd41@linux-m68k.org>
Date:   Tue, 7 Apr 2020 14:57:39 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAK8P3a3Yt2woG2LMcQ0jNPGuHdMtFbBmLvtBbrWFQ4J6x3v9aQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Arnd, Stephen

On 6/4/20 5:35 pm, Arnd Bergmann wrote:
> On Mon, Apr 6, 2020 at 5:01 AM Stephen Boyd <sboyd@kernel.org> wrote:
>> Quoting Arnd Bergmann (2020-04-05 05:45:20)
>>> On Sun, Apr 5, 2020 at 4:51 AM Stephen Boyd <sboyd@kernel.org> wrote:
>>>> There's one snag with doing this, and that's making sure that randconfig
>>>> builds don't select this option when some architecture or platform
>>>> implements 'struct clk' outside of the common clk framework. Introduce a
>>>> new config option 'HAVE_LEGACY_CLK' to indicate those platforms that
>>>> haven't migrated to the common clk framework and therefore shouldn't be
>>>> allowed to select this new config option. Also add a note that we hope
>>>> one day to remove this config entirely.
>>>
>>> Good idea!
>>>
>>> I've looked through the individual ones and commented a bit on
>>> what I think may or may not happen with them.
>>>
>>> ralink SOC_MT7621 is the only one that I think you got wrong,
>>> as it already has common-clk support.
>>
>> Ah I missed that it was inside a big if RALINK. Thanks. I suppose I
>> should just remove the select then for that config and not worry about
>> the duplication of clkdev and common clk configs.
> 
> Won't that cause build failures in those configurations that have
> both implementations?
> 
> According to the Makefile, the clk.c file is built whenever CONFIG_MIPS_GIC
> is unset, so I think we need
> 
>           select HAVE_LEGACY_CLK if !MIPS_GIC
> 
> or maybe move the select into the per-chip configs that need it:
> RT288X, RT305X, RT3883, and MT7620.
> 
>>>> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
>>>> index 60ac1cd8b96f..bd2d29c22a10 100644
>>>> --- a/arch/m68k/Kconfig.cpu
>>>> +++ b/arch/m68k/Kconfig.cpu
>>>
>>>     text    data     bss     dec     hex filename
>>> 1934726 263616   83284 2281626 22d09a obj/vmlinux-before
>>> 1971989 266192   83308 2321489 236c51 obj/vmlinux-after
>>>
>>> The coldfire clock implementation looks rather simple compared
>>> to chips from the 2010s: most chips have only fixed clocks,
>>> and three of them have one of two registers of clock gates.
>>>
>>> It shouldn't be hard to convert, but enabling common-clk will
>>> cause a noticeable kernel size increase on the fairly limited
>>> hardware.
>>>
>>> Simply enabling COMMON_CLK in m5475evb_defconfig
>>> results in a 1.7% or 40KB growth in kernel size, plus there
>>> would be additional dynamic memory usage:
>> There could certainly be some work done to reduce the code size of the
>> CCF. I haven't looked but perhaps we could save some memory by making
>> the basic types selectable too and then push a bunch of kconfig updates
>> through for that.
> 
> Right, that might help. Another possibility would be to support both
> the common clk layer and the custom clk implementation on coldfire
> until we remove the other custom implementations, by which point
> even fewer people will care about coldfire.
> 
> Let's see what Geert and Greg think would be the best path for coldfire,
> maybe the added 40KB is less of a problem after all.

Losing another 40k is not ideal, but not the end of the world.
It would not stop me running it on any platforms I regularly
run on. For sure some of the really old hardware just doesn't
have the RAM to spare.

Any way, I say we have to move forward and and move to using
the common clock framework for ColdFire sooner than later.

Regards
Greg

