Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 284364A96BD
	for <lists+linux-mips@lfdr.de>; Fri,  4 Feb 2022 10:29:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358569AbiBDJ26 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 4 Feb 2022 04:28:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357774AbiBDJ1K (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 4 Feb 2022 04:27:10 -0500
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B48A0C061783;
        Fri,  4 Feb 2022 01:26:28 -0800 (PST)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1nFurI-0007GZ-ER; Fri, 04 Feb 2022 10:26:25 +0100
Message-ID: <585e1812-3d0c-552f-3195-4e947b4fef9d@leemhuis.info>
Date:   Fri, 4 Feb 2022 10:26:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] MIPS: Fix build error due to PTR used in more places
Content-Language: en-BS
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220125141946.54114-1-tsbogend@alpha.franken.de>
 <20220130163725.GA2792319@roeck-us.net>
 <20220131100845.GA19252@alpha.franken.de>
From:   Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <20220131100845.GA19252@alpha.franken.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1643966788;12f74f95;
X-HE-SMSGID: 1nFurI-0007GZ-ER
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi, this is your Linux kernel regression tracker speaking.

On 31.01.22 11:08, Thomas Bogendoerfer wrote:
> On Sun, Jan 30, 2022 at 08:37:25AM -0800, Guenter Roeck wrote:
>> On Tue, Jan 25, 2022 at 03:19:44PM +0100, Thomas Bogendoerfer wrote:
>>> Use PTR_WD instead of PTR to avoid clashes with other parts.
>>>
>>> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
>>
>> Building mips:cavium_octeon_defconfig ... failed
>> --------------
>> Error log:
>> arch/mips/cavium-octeon/octeon-memcpy.S: Assembler messages:
>> arch/mips/cavium-octeon/octeon-memcpy.S:187: Error: unrecognized opcode `ptr 9b,l_exc'
>> ...
>>
>> Missed one place in Cavium assembler code.
>>
>> arch/mips/cavium-octeon/octeon-memcpy.S:        PTR     9b, handler;
>>
>> #regzbot introduced: fa62f39dc7e2

@Guenter: thx for getting the regression tracked!

> d'oh, fix sent.

Sadly you didn't link to the report about the issue using a "Link:" tag,
as explained by both Documentation/process/submitting-patches.rst and
Documentation/process/5.Posting.rst

Could you please do so in the future? Than would make my life as a Linux
kernel's regression tracker a lot easier, as my regression tracking bot
would then have been able to automatically detect the patch posting and
the commit (I for now decided to not make the bot rely on the "Fixes:"
tag alone, as that might do the wrong thing if one commit causes
multiple regressions).

Anyway: I no big deal (just makes regression tracking a lot harder), I
can tell regzbot manually about the fix:

#regzbot introduced: 50317b636e7184d

Ciao, Thorsten
