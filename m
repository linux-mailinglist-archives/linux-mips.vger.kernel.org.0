Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB076E469D
	for <lists+linux-mips@lfdr.de>; Fri, 25 Oct 2019 11:06:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438229AbfJYJGG (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 25 Oct 2019 05:06:06 -0400
Received: from foss.arm.com ([217.140.110.172]:37262 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2438227AbfJYJGG (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Fri, 25 Oct 2019 05:06:06 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 636DA28;
        Fri, 25 Oct 2019 02:06:05 -0700 (PDT)
Received: from [192.168.1.103] (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F4AD3F71F;
        Fri, 25 Oct 2019 02:06:04 -0700 (PDT)
Subject: Re: v5.4-rcX: qemu-system-mips64 userspace segfault
To:     Bruce Ashfield <bruce.ashfield@gmail.com>
Cc:     linux-mips@vger.kernel.org, paul.burton@mips.com,
        Richard Purdie <richard.purdie@linuxfoundation.org>
References: <CADkTA4NT5MBzErPT5S49aswxH4bUi2KKCWEWppPpFgJ-ru3L=g@mail.gmail.com>
 <40376b35-2220-67b6-7d9b-9a2c2a3874ef@arm.com>
 <CADkTA4N1UzrHRZi4j6MUxxT4yWsv1BSHDb11SaKqtbW_gihZ-g@mail.gmail.com>
From:   Vincenzo Frascino <vincenzo.frascino@arm.com>
Message-ID: <f3257a1c-9946-c9a0-da1c-ff1b218b2e90@arm.com>
Date:   Fri, 25 Oct 2019 10:08:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4N1UzrHRZi4j6MUxxT4yWsv1BSHDb11SaKqtbW_gihZ-g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi Bruce,

On 10/24/19 5:37 PM, Bruce Ashfield wrote:
> On Thu, Oct 24, 2019 at 9:29 AM Vincenzo Frascino
> <vincenzo.frascino@arm.com> wrote:
>>
>> Hi Bruce,
>>
>> On 10/24/19 2:12 PM, Bruce Ashfield wrote:
>>> Hi all,
>>>
>>> I'm not sure if anyone else is running qemu-system-mips64 regularly,
>>> but for the past 4 (or more) years, it has been the primary way that
>>> we run QA on the mips64 Yocto Project reference kernel(s). I take care
>>> of the kernel for the project, so I always have the fun of running
>>> into issues first :D
>>>
>>> That's enough preamble ...
>>>
>>> I wanted to see if anyone recognized the issue that I'm seeing when I
>>> bumped the linux-yocto dev kernel to the v5.4-rc series.
>>>
>>> The one line summary is that I'm seeing a segfault as soon as  the
>>> kernel hands off to userspace during boot. It doesn't matter if it is
>>> systemd, sysvinit, or init=/bin/sh .. I always get a segfault.
>> [...]
>>
>> Could you please share the .config you are using?
> 
> attached (hopefully this won't cause my reply to bounce).
> 

It seems that the .config you shared was generated for a version of the kernel
that is older then the one in which we introduced the unified vDSO hence, since
the options to enable correctly the generic vdso library are selected by the
architecture, this result in a mis-configuration of the vDSO library which leads
to the issues you are seeing.

My advise is to start from a fresh defconfig and then enable the options you
need one by one. I did it with buildroot and it seems working.

Another thing I noticed and this seems confirmed by the patch series you had to
revert is that you are missing a fix that I submitted last week:

8a1bef4193e81c8afae4d2f107f1c09c8ce89470
("mips: vdso: Fix __arch_get_hw_counter()")

Could you please apply it before regenerating the .config? Seems the qemu falls
back on VDSO_CLOCK_NONE at least in the case I reproduced.

> When debugging (and bisecting), as expected, the VDSO configs bounced
> around a bit with the move to generic VDSO, etc.  So there very well
> may be something that with 5.4 I need to enable now and missed in my
> debug.
> 
> I don't have GENERIC_COMPAT_VDSO enabled, but can easily do a boot
> test with it on, similarly with the different vdso boot option. I know
> I had tried a lot of different combos, but would have to redo the
> tests now.
> 

This seems confirming my suspect of the wrong .config.

> 
>>
>> Do you know by any change which vdso clock_mode is set in this scenario?
> 
> Unfortunately not, it isn't something that we've explicitly set in the
> past, so I haven't looked into it. But can do more digging.
> 
> Bruce
> 
>>
>> --
>> Regards,
>> Vincenzo
> 
> 
> 

Please let us know how your investigation proceeds.

-- 
Regards,
Vincenzo
