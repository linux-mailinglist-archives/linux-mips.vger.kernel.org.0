Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D225E489687
	for <lists+linux-mips@lfdr.de>; Mon, 10 Jan 2022 11:38:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244076AbiAJKiu (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Mon, 10 Jan 2022 05:38:50 -0500
Received: from 3.mo560.mail-out.ovh.net ([46.105.58.226]:46395 "EHLO
        3.mo560.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244070AbiAJKiJ (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Mon, 10 Jan 2022 05:38:09 -0500
X-Greylist: delayed 3601 seconds by postgrey-1.27 at vger.kernel.org; Mon, 10 Jan 2022 05:38:09 EST
Received: from player158.ha.ovh.net (unknown [10.109.156.105])
        by mo560.mail-out.ovh.net (Postfix) with ESMTP id 0BA49235D2
        for <linux-mips@vger.kernel.org>; Mon, 10 Jan 2022 09:20:49 +0000 (UTC)
Received: from milecki.pl (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
        (Authenticated sender: rafal@milecki.pl)
        by player158.ha.ovh.net (Postfix) with ESMTPSA id 7F73126197E92;
        Mon, 10 Jan 2022 09:20:45 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-97G0022a894267-133c-4f10-ac0a-2ba7a01a8ba8,
                    87B431A081F4B8A046F7AA1E67E4DC22F76031C8) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp: 194.187.74.233
Message-ID: <2f42cafb-10e3-d6d2-31da-2d17c791e278@milecki.pl>
Date:   Mon, 10 Jan 2022 10:20:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0
Subject: Re: [PATCH] bcma: get SoC device struct & assign dma_mask
To:     Christoph Hellwig <hch@lst.de>,
        Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-mips@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
References: <20220107041744.2388470-1-f.fainelli@gmail.com>
 <20220110090955.GA7422@lst.de>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
In-Reply-To: <20220110090955.GA7422@lst.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 18045923710505102182
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudehtddgtdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfesthekredttdefjeenucfhrhhomheptfgrfhgrlhcuofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhepgeevveffjeeigfeikefftdehvedvffelteethffgkefgteetueeuuedutdetieevnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucfkpheptddrtddrtddrtddpudelgedrudekjedrjeegrddvfeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehplhgrhigvrhduheekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheprhgrfhgrlhesmhhilhgvtghkihdrphhlpdhrtghpthhtoheplhhinhhugidqmhhiphhssehvghgvrhdrkhgvrhhnvghlrdhorhhg
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 10.01.2022 10:09, Christoph Hellwig wrote:
> On Thu, Jan 06, 2022 at 08:17:44PM -0800, Florian Fainelli wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> For bus devices to be fully usable it's required to set their DMA
>> parameters.
>>
>> For years it has been missing and remained unnoticed because of
>> mips_dma_alloc_coherent() silently handling the empty coherent_dma_mask.
>> Kernel 4.19 came with a lot of DMA changes and caused a regression on
>> the bcm47xx. Starting with the commit f8c55dc6e828 ("MIPS: use generic
>> dma noncoherent ops for simple noncoherent platforms") DMA coherent
>> allocations just fail. Example:
>> [    1.114914] bgmac_bcma bcma0:2: Allocation of TX ring 0x200 failed
>> [    1.121215] bgmac_bcma bcma0:2: Unable to alloc memory for DMA
>> [    1.127626] bgmac_bcma: probe of bcma0:2 failed with error -12
>> [    1.133838] bgmac_bcma: Broadcom 47xx GBit MAC driver loaded
>>
>> This change fixes above regression in addition to the MIPS bcm47xx
>> commit 321c46b91550 ("MIPS: BCM47XX: Setup struct device for the SoC").
> 
> How did it take so long to notice this?

I noticed it 3 years ago and sent semi-fix that wasn't accepted (for
probably a good reason) back then:
[PATCH wireless-drivers-next] bcma: get SoC device struct & copy its DMA params to the subdevices
https://patchwork.kernel.org/project/linux-wireless/patch/20190121101121.24555-1-zajec5@gmail.com/

Since then OpenWrt carried on above fix as a downstream patch.

I guess OpenWrt is the only active user of that code.

Thanks a lot Florian for bringing that upstream.
