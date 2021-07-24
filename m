Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AC4D3D4AA0
	for <lists+linux-mips@lfdr.de>; Sun, 25 Jul 2021 01:18:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229588AbhGXWiJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 24 Jul 2021 18:38:09 -0400
Received: from smtp.gentoo.org ([140.211.166.183]:55748 "EHLO smtp.gentoo.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229573AbhGXWiI (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 24 Jul 2021 18:38:08 -0400
Subject: Re: [PATCH] MIPS: check return value of pgtable_pmd_page_ctor
To:     Huang Pei <huangpei@loongson.cn>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        ambrosehua@gmail.com, Bibo Mao <maobibo@loongson.cn>,
        linux-mips@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Paul Burton <paulburton@kernel.org>,
        Li Xuefeng <lixuefeng@loongson.cn>,
        Yang Tiezhu <yangtiezhu@loongson.cn>,
        Gao Juxin <gaojuxin@loongson.cn>,
        Huacai Chen <chenhuacai@loongson.cn>,
        Jinyang He <hejinyang@loongson.cn>
References: <20210721034335.2015914-1-huangpei@loongson.cn>
 <d08a98c9-e696-57b0-5837-b8a640e156fa@gentoo.org>
 <20210721081350.ygtezwksqfy6cbsq@ambrosehua-HP-xw6600-Workstation>
From:   Joshua Kinard <kumba@gentoo.org>
Openpgp: preference=signencrypt
Message-ID: <1581cf64-7966-be85-8de7-fe4223485132@gentoo.org>
Date:   Sat, 24 Jul 2021 19:18:35 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20210721081350.ygtezwksqfy6cbsq@ambrosehua-HP-xw6600-Workstation>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 7/21/2021 04:13, Huang Pei wrote:
> On Wed, Jul 21, 2021 at 12:23:39AM -0400, Joshua Kinard wrote:
>> On 7/20/2021 23:43, Huang Pei wrote:
>>> +. According to Documentation/vm/split_page_table_lock, handle failure
>>> of pgtable_pmd_page_ctor
>>>
>>> +. use GFP_KERNEL_ACCOUNT instead of GFP_KERNEL|__GFP_ACCOUNT
>>>
>>> Reported-by: Joshua Kinard <kumba@gentoo.org>
>>> Signed-off-by: Huang Pei <huangpei@loongson.cn>

[snip]

> PS:
> 
> Latest Gentoo/MIPS stage3 is only available for big endian, is there any
> little endian stage3 available? 

At this time from us, unfortunately nothing recent.  I only focus on SGI
big-endian systems, as these are still the most widely-available (eBay) MIPS
systems that can still compile code within reasonable timeframes on Linux.

The Gentoo Embedded team has mipsel3 stages based on uclibc-ng from ~2018
available here:
https://gentoo.osuosl.org/experimental/mips/uclibc/mipsel3/

And some uclibc-ng mips32r2 stages, also 2018, here:
https://gentoo.osuosl.org/experimental/mips/uclibc/mips32r2/

Unfortunately, our support for more recent uclibc-ng-based builds has fallen
off the radar due to lack of upstream uclibc-ng activity.  I believe the
Embedded team is only focusing on musl libc-based build from now on.

There are some unofficial MIPS32 little-endian softfloat stages provided by
Manuel Lauss on his website here, albeit from 2018:
http://mlau.at/files/mips32-linux/

Last, if you truly need something to work with, I have had luck using the
OpenADK project's build system to coax musl-based big-endian rootfs tarballs
out of it in the past.  It's a very flexible build system and should be
capable of also generating mips32r* and little-endian builds as well.  It is
somewhat fickle, though, so you may have to kludge the build process at
times to get it to complete.  Depends very heavily on what packages you want
to build in.

-- 
Joshua Kinard
Gentoo/MIPS
kumba@gentoo.org
rsa6144/5C63F4E3F5C6C943 2015-04-27
177C 1972 1FB8 F254 BAD0 3E72 5C63 F4E3 F5C6 C943

"The past tempts us, the present confuses us, the future frightens us.  And
our lives slip away, moment by moment, lost in that vast, terrible in-between."

--Emperor Turhan, Centauri Republic
