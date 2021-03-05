Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BB3B32E6C9
	for <lists+linux-mips@lfdr.de>; Fri,  5 Mar 2021 11:53:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbhCEKw3 (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Fri, 5 Mar 2021 05:52:29 -0500
Received: from 3.mo4.mail-out.ovh.net ([46.105.57.129]:59607 "EHLO
        3.mo4.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbhCEKwP (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Fri, 5 Mar 2021 05:52:15 -0500
X-Greylist: delayed 1205 seconds by postgrey-1.27 at vger.kernel.org; Fri, 05 Mar 2021 05:52:14 EST
Received: from player728.ha.ovh.net (unknown [10.108.35.211])
        by mo4.mail-out.ovh.net (Postfix) with ESMTP id D1F7E26B2FB
        for <linux-mips@vger.kernel.org>; Fri,  5 Mar 2021 11:16:50 +0100 (CET)
Received: from milecki.pl (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
        (Authenticated sender: rafal@milecki.pl)
        by player728.ha.ovh.net (Postfix) with ESMTPSA id B27BF1BA2AFF5;
        Fri,  5 Mar 2021 10:16:41 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-104R0053d2b67e1-52e4-4304-9239-db9d36a7935d,
                    4F7D11A3904BD8E553EC742B87CBB6774FEDAA0F) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp: 194.187.74.233
Subject: Re: [PATCH V2 mips/linux.git] firmware: bcm47xx_nvram: refactor
 finding & reading NVRAM
To:     =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Vivek Unune <npcomplete13@gmail.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        open list <linux-kernel@vger.kernel.org>,
        kernel test robot <lkp@intel.com>
References: <20210304072357.31108-1-zajec5@gmail.com>
 <20210305055501.13099-1-zajec5@gmail.com>
 <CAAdtpL7iWiumiOwMOH1xiBZvyOB0HB7W-9MMHoPPxkb3Srme=w@mail.gmail.com>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Message-ID: <f4045af5-4866-6fc9-f34a-d789a7febb77@milecki.pl>
Date:   Fri, 5 Mar 2021 11:16:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <CAAdtpL7iWiumiOwMOH1xiBZvyOB0HB7W-9MMHoPPxkb3Srme=w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 365354524052524656
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddtiedgudefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomheptfgrfhgrlhcuofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhepkeduheejheffudefhffghfegjeejleetkeevueelveegkefhhfffieehleelgfevnecukfhppedtrddtrddtrddtpdduleegrddukeejrdejgedrvdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejvdekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheprhgrfhgrlhesmhhilhgvtghkihdrphhlpdhrtghpthhtoheplhhinhhugidqmhhiphhssehvghgvrhdrkhgvrhhnvghlrdhorhhg
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On 05.03.2021 10:58, Philippe Mathieu-Daudé wrote:
> On Fri, Mar 5, 2021 at 6:55 AM Rafał Miłecki <zajec5@gmail.com> wrote:
>>
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> 1. Use meaningful variable names (e.g. "flash_start", "res_size" instead
>>     of e.g. "iobase", "end")
>> 2. Always operate on "offset" instead of mix of start, end, size, etc.
> 
> "instead of a mix"
> 
>> 3. Add helper checking for NVRAM to avoid duplicating code
>> 4. Use "found" variable instead of goto
>> 5. Use simpler checking of offsets and sizes (2 nested loops with
>>     trivial check instead of extra function)
> 
> This could be a series of trivial patches, why did you choose to make a mixed
> bag harder to review?

It's a subjective thing and often a matter of maintainer taste. I can
say that after contributing to various Linux subsystems. If you split a
similar patch for MTD subsystem you'll get complains about making
changes too small & too hard to review (sic!).

This isn't a bomb really: 63 insertions(+), 48 deletions(-)

That said I admit I don't know MIPS tree habits. Thomas: do you prefer
smaller patches in case like this?
