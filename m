Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F208732F913
	for <lists+linux-mips@lfdr.de>; Sat,  6 Mar 2021 10:04:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbhCFJDx (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 6 Mar 2021 04:03:53 -0500
Received: from 1.mo2.mail-out.ovh.net ([46.105.63.121]:48571 "EHLO
        1.mo2.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229628AbhCFJDw (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Sat, 6 Mar 2021 04:03:52 -0500
X-Greylist: delayed 1800 seconds by postgrey-1.27 at vger.kernel.org; Sat, 06 Mar 2021 04:03:52 EST
Received: from player737.ha.ovh.net (unknown [10.110.115.149])
        by mo2.mail-out.ovh.net (Postfix) with ESMTP id 5EC9C1FD34D
        for <linux-mips@vger.kernel.org>; Sat,  6 Mar 2021 09:25:08 +0100 (CET)
Received: from RCM-web10.webmail.mail.ovh.net (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
        (Authenticated sender: rafal@milecki.pl)
        by player737.ha.ovh.net (Postfix) with ESMTPSA id D40441245BA27;
        Sat,  6 Mar 2021 08:24:59 +0000 (UTC)
MIME-Version: 1.0
Date:   Sat, 06 Mar 2021 09:24:58 +0100
From:   =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>
To:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc:     =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
        =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <zajec5@gmail.com>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vivek Unune <npcomplete13@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        open list <linux-kernel@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH V2 mips/linux.git] firmware: bcm47xx_nvram: refactor
 finding & reading NVRAM
In-Reply-To: <20210306080007.GB4744@alpha.franken.de>
References: <20210304072357.31108-1-zajec5@gmail.com>
 <20210305055501.13099-1-zajec5@gmail.com>
 <CAAdtpL7iWiumiOwMOH1xiBZvyOB0HB7W-9MMHoPPxkb3Srme=w@mail.gmail.com>
 <f4045af5-4866-6fc9-f34a-d789a7febb77@milecki.pl>
 <CAAdtpL5CMTaB6qCR=nZj+1MoGC97_BVd-r30E2RRYOhiktOiZQ@mail.gmail.com>
 <c66d6d99-affd-f833-1689-32394bc6a548@milecki.pl>
 <20210306080007.GB4744@alpha.franken.de>
User-Agent: Roundcube Webmail/1.4.10
Message-ID: <4f686c1babf19c42592751b6a11896c9@milecki.pl>
X-Sender: rafal@milecki.pl
X-Originating-IP: 194.187.74.233
X-Webmail-UserID: rafal@milecki.pl
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 4351603141091495430
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddtjedguddtlecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeggfffhvffujghffgfkgihitgfgsehtkehjtddtreejnecuhfhrohhmpeftrghfrghlpgfoihhlvggtkhhiuceorhgrfhgrlhesmhhilhgvtghkihdrphhlqeenucggtffrrghtthgvrhhnpeejffdufffgjefgvdeigedukefffeevheejueeikeehudeiudehvdeifeduteehieenucfkpheptddrtddrtddrtddpudelgedrudekjedrjeegrddvfeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeefjedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehrrghfrghlsehmihhlvggtkhhirdhplhdprhgtphhtthhopehlihhnuhigqdhmihhpshesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2021-03-06 09:00, Thomas Bogendoerfer wrote:
> On Fri, Mar 05, 2021 at 12:56:55PM +0100, Rafał Miłecki wrote:
>> On 05.03.2021 12:47, Philippe Mathieu-Daudé wrote:
>> > On Fri, Mar 5, 2021 at 11:16 AM Rafał Miłecki <rafal@milecki.pl> wrote:
>> > > On 05.03.2021 10:58, Philippe Mathieu-Daudé wrote:
>> > > > On Fri, Mar 5, 2021 at 6:55 AM Rafał Miłecki <zajec5@gmail.com> wrote:
>> > > > >
>> > > > > From: Rafał Miłecki <rafal@milecki.pl>
>> > > > >
>> > > > > 1. Use meaningful variable names (e.g. "flash_start", "res_size" instead
>> > > > >      of e.g. "iobase", "end")
>> > > > > 2. Always operate on "offset" instead of mix of start, end, size, etc.
>> > > >
>> > > > "instead of a mix"
>> > > >
>> > > > > 3. Add helper checking for NVRAM to avoid duplicating code
>> > > > > 4. Use "found" variable instead of goto
>> > > > > 5. Use simpler checking of offsets and sizes (2 nested loops with
>> > > > >      trivial check instead of extra function)
>> > > >
>> > > > This could be a series of trivial patches, why did you choose to make a mixed
>> > > > bag harder to review?
>> > >
>> > > It's a subjective thing and often a matter of maintainer taste. I can
>> > > say that after contributing to various Linux subsystems. If you split a
>> > > similar patch for MTD subsystem you'll get complains about making
>> > > changes too small & too hard to review (sic!).
>> >
>> > Fine. MTD subsystem developers are probably smarter than I'm :)
>> >
>> > > This isn't a bomb really: 63 insertions(+), 48 deletions(-)
>> >
>> > Too many changes at once for my brain stack doesn't mean others are
>> > willing to review it. But to me that means each time I'll have to pass over
>> > it while bisecting or reviewing git history I'll suffer the same overflow.
>> > Anyway, matter of taste as you said.
>> 
>> If I hear another voice for splitting this change into smaller patches
>> I'm 100% happy to do so. Honestly!
>> 
>> I just don't know if by splitting I won't annoy other people by making
>> changes too small.
>> 
>> Please speak up! :)
> 
> please split it. IMHO the current is patch is hard to review, because 
> of the
> different changes mixed together.

Will do, thank you for comments Philippe, Thomas!
