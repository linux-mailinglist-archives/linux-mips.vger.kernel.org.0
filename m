Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E8BC8245416
	for <lists+linux-mips@lfdr.de>; Sun, 16 Aug 2020 00:12:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729250AbgHOWMM (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Sat, 15 Aug 2020 18:12:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:41766 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729083AbgHOWK2 (ORCPT <rfc822;linux-mips@vger.kernel.org>);
        Sat, 15 Aug 2020 18:10:28 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F3BAE22EBF;
        Sat, 15 Aug 2020 11:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597490563;
        bh=ghK4I1h/hl5658IIykG3IDEndmMPcQYGR5QUDL7wgmc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=lwUj1LTiJyeXK55xV/lUtdkVTfr0DvieDUZuSLrAF6DZ8R/HA5N71MJwG7nPKua0P
         XN8+FLgUGcXPbi6i/MCranm+bgtLtOiBUJGe3yTgOhkKtl5mGsaqmriKXBsmDx338H
         Qk13g3UnXJjZm3sQ9qnKs5RVQDD1IGu2zN6bkado=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
        by disco-boy.misterjones.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.92)
        (envelope-from <maz@kernel.org>)
        id 1k6uGn-002KBi-AX; Sat, 15 Aug 2020 12:22:41 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sat, 15 Aug 2020 12:22:41 +0100
From:   Marc Zyngier <maz@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Frank Rowand <frowand.list@gmail.com>,
        "open list:MIPS" <linux-mips@vger.kernel.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Huacai Chen <chenhc@lemote.com>,
        Paul Burton <paulburton@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Android Kernel Team <kernel-team@android.com>
Subject: Re: [PATCH v4 1/5] of_address: Add bus type match for pci ranges
 parser
In-Reply-To: <CAL_JsqKVhxu_cdo_umhY_SfuDhCC0G-AdsPAZpGB3eepOVFi-g@mail.gmail.com>
References: <20200728153708.1296374-1-jiaxun.yang@flygoat.com>
 <20200728153708.1296374-2-jiaxun.yang@flygoat.com>
 <889508bae5da3c55690a7adbd101a5cd@kernel.org>
 <CAL_JsqKVhxu_cdo_umhY_SfuDhCC0G-AdsPAZpGB3eepOVFi-g@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.7
Message-ID: <34ac2d7c0770f9aa450aaa3905c82f52@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: robh+dt@kernel.org, jiaxun.yang@flygoat.com, frowand.list@gmail.com, linux-mips@vger.kernel.org, tsbogend@alpha.franken.de, chenhc@lemote.com, paulburton@kernel.org, arnd@arndb.de, natechancellor@gmail.com, ndesaulniers@google.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@android.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

On 2020-08-14 23:51, Rob Herring wrote:
> On Fri, Aug 14, 2020 at 12:21 PM Marc Zyngier <maz@kernel.org> wrote:
>> 
>> Hi all,
>> 
>> On 2020-07-28 16:36, Jiaxun Yang wrote:
>> > So the parser can be used to parse range property of ISA bus.
>> >
>> > As they're all using PCI-like method of range property, there is no
>> > need
>> > start a new parser.
>> >
>> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> > Reviewed-by: Rob Herring <robh@kernel.org>
>> 
>> This patch, although it looks correct, breaks the RK3399-based
>> systems, as they miss the (now required) 'device_type = "pci";'
>> property.
> 
> Required since 1990 something...

And yet... The fact that it has been broken from day-1 (3.5 years
ago) shows how good we are at enforcing those requirements.

> 
>> We can fix the in-tree DT, but that's not really an option
>> if someone relies on the DT being provided by the firmware
>> (I for one definitely do).
> 
> Perhaps time to pay attention to schema errors:
> 
> arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dt.yaml:
> pcie@f8000000: 'device_type' is a required property

As long as this isn't part of the normal build flow, these errors
will get ignored. I don't even know how to trigger this validation,
TBH.

> (I thought dtc would also catch this, but there we look for
> device_type and then do PCI checks like node name. I guess we needed
> to check for either device_type or the node name...)

That would be much better. At least this *does* run at build time.

> 
>> I came up with the following hack, which solves the issue for
>> me. Definitely not my finest hour, but I really need this box
>> to keep going. I will post a patch fixing the DT separately.
>> 
>> Thanks,
>> 
>>          M.
>> 
>>  From ceef5fd9c4d2005eb577505c68868ebe527c098f Mon Sep 17 00:00:00 
>> 2001
>>  From: Marc Zyngier <maz@kernel.org>
>> Date: Fri, 14 Aug 2020 19:10:12 +0100
>> Subject: [PATCH] of: address: Workaround broken DTs missing the
>> 'device_type =
>>   "pci"' property
>> 
>> Recent changes to the PCI bus parsing made it mandatory for
>> device trees nodes describing a PCI controller to have the
>> 'device_type = "pci"' property for the node to be matched.
>> 
>> Although this is compliant with the specification, it breaks
>> existing device-trees that have been working fine for years
>> (the Rockchip rk3399-based systems being a prime example of
>> such breakage).
>> 
>> In order to paper over the blunder, let's also match nodes
>> that have the "linux,pci-domain" property, as they are
>> pretty likely to be PCI nodes. This fixes the issue for
>> systems such as the above platforms.
>> 
>> Fixes: 2f96593ecc37 ("of_address: Add bus type match for pci ranges
>> parser")
>> Signed-off-by: Marc Zyngier <maz@kernel.org>
>> ---
>>   drivers/of/address.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/of/address.c b/drivers/of/address.c
>> index 590493e04b01..712e03781a2a 100644
>> --- a/drivers/of/address.c
>> +++ b/drivers/of/address.c
>> @@ -134,9 +134,12 @@ static int of_bus_pci_match(struct device_node 
>> *np)
>>          * "pciex" is PCI Express
>>          * "vci" is for the /chaos bridge on 1st-gen PCI powermacs
>>          * "ht" is hypertransport
>> +        * "linux,pci-domain" is a workaround for broken device trees
>> +        * lacking the required "device_type" property.
> 
> I would suggest looking for 'pci' or 'pcie' node name instead.
> 
> You should remove linux,pci-domain from rk3399 as it is pointless when
> there's a single PCI host bridge.

Indeed. I was clutching at straws here.

> 
> The other option is fixup the live tree with of_add_property() in the
> Rockchip PCI driver. Less likely to impact anyone else.

That's actually a much better solution, thanks for pointing this out.
At least I can shout about broken DTs while fixing it up, and the
new fix is fairly neat.

I'll post new patches shortly.

Thanks,

         M.
-- 
Jazz is not dead. It just smells funny...
