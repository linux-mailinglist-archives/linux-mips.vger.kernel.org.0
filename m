Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 135C232C896
	for <lists+linux-mips@lfdr.de>; Thu,  4 Mar 2021 02:16:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239385AbhCDAuq (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Wed, 3 Mar 2021 19:50:46 -0500
Received: from 3.mo3.mail-out.ovh.net ([46.105.44.175]:58907 "EHLO
        3.mo3.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230430AbhCCSTg (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Wed, 3 Mar 2021 13:19:36 -0500
X-Greylist: delayed 22190 seconds by postgrey-1.27 at vger.kernel.org; Wed, 03 Mar 2021 13:19:35 EST
Received: from player739.ha.ovh.net (unknown [10.108.35.103])
        by mo3.mail-out.ovh.net (Postfix) with ESMTP id 84CD827C877
        for <linux-mips@vger.kernel.org>; Wed,  3 Mar 2021 12:44:18 +0100 (CET)
Received: from milecki.pl (ip-194-187-74-233.konfederacka.maverick.com.pl [194.187.74.233])
        (Authenticated sender: rafal@milecki.pl)
        by player739.ha.ovh.net (Postfix) with ESMTPSA id 4FE5D1798D8E0;
        Wed,  3 Mar 2021 11:44:07 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-103G0058af54b4d-f3b4-44dc-ac9e-34a2a880a68e,
                    26C1B780A21ED05C344A0C24DEC46BA2B7EA0698) smtp.auth=rafal@milecki.pl
X-OVh-ClientIp: 194.187.74.233
Subject: Re: [PATCH stblinux.git 2/2] firmware: bcm47xx_nvram: support
 platform device "brcm,nvram"
To:     Florian Fainelli <f.fainelli@gmail.com>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Cc:     Vivek Unune <npcomplete13@gmail.com>,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        devicetree@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
        linux-kernel@vger.kernel.org
References: <20210302074405.18998-1-zajec5@gmail.com>
 <20210302074405.18998-2-zajec5@gmail.com>
 <8e17b978-a527-97df-3f31-1fb2123a23e9@gmail.com>
From:   =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Message-ID: <d09c9e49-d7c7-cc71-1437-48d82e14843b@milecki.pl>
Date:   Wed, 3 Mar 2021 12:44:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <8e17b978-a527-97df-3f31-1fb2123a23e9@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 8543891444003212823
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledruddtvddgfeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomheptfgrfhgrlhcuofhilhgvtghkihcuoehrrghfrghlsehmihhlvggtkhhirdhplheqnecuggftrfgrthhtvghrnhepvedttefgueffvefgvdejleeivddvjefhkeffgeeugeelieefteevffdvuedvgfefnecuffhomhgrihhnpehlkhhmlhdrohhrghenucfkpheptddrtddrtddrtddpudelgedrudekjedrjeegrddvfeefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeefledrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehrrghfrghlsehmihhlvggtkhhirdhplhdprhgtphhtthhopehlihhnuhigqdhmihhpshesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 02.03.2021 17:59, Florian Fainelli wrote:
> On 3/1/21 11:44 PM, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> Add support for platform device providing mapping resource. This allows
>> reading NVRAM based on DT mapping binding. It's required for devices
>> that boot depending on NVRAM stored setup and provides early access to
>> NVRAM data.
>>
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>> ---
>> bcm47xx_nvram driver was originally added through MIPS tree, but this
>> change doesn't affect BCM47XX (MIPS) as it doesn't use DT. It targets
>> ARCH_BCM_5301X so I suggest this goes through the stblinux.git tree.
> 
> Can you see if this change can be replaced by the nvmem-rmem work that
> Nicolas recently did to support something similar for the Raspberry Pi 4:
> 
> https://lkml.org/lkml/2021/1/29/235

I don't think it fits my case.

It's a reserved memory binding/driver which refers to the system memory.
In NVRAM case we need to do a mapping. I think it's different?

nvmem-rmem registers NVMEM device without providing any cells. It also
doesn't understand NVRAM data structure. I guess nvmem-rmem only exposes
NVMEM for user-space access. I need to access NVRAM to e.g. detect boot
parameters in kernel code.

I was thinking for a moment about treating NVRAM like a NVMEM but NVRAM
doesn't seem to fit current design and kernel API. NVMEM assumes that
every cell has a specific offset and size. Reading NVRAM should be
based on string keys (nof offsets). See nvmem_reg_read_t for details.

This won't make a huge difference I think, but for a slightly cleaner
design I could probably have NVRAM devices without cells and make it
setup NVRAM. Let me see if I can code that.
