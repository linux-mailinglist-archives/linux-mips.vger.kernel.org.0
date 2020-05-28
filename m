Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1B701E5DD7
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2020 13:06:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388122AbgE1LGJ (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 May 2020 07:06:09 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:60370 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388108AbgE1LGI (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 May 2020 07:06:08 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04SB5nUL009390;
        Thu, 28 May 2020 06:05:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590663949;
        bh=J3vobVhX0S2zC8e0Jy18S3skJ48i2SWhuRNZO/B02J4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=NiqotQB7h6vnrjmmo1nMatkMpaXQdoBKOhDD5qJfbCZps5Gdur9RuaXkTWG3pix+8
         eVZZ/TsJ1x8Y87tJmmFQaKtu121s2necSi0WSH0gCBKZItp0q14DYZMjMqoDS6xNPU
         FRKUSIMEQPLALnS7BdTqmOoPJzOOxYdf1an/4xOs=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04SB5nJt085127
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 28 May 2020 06:05:49 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 28
 May 2020 06:05:48 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 28 May 2020 06:05:48 -0500
Received: from [10.250.234.195] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04SB5gY5020766;
        Thu, 28 May 2020 06:05:43 -0500
Subject: Re: [PATCH RESEND v2] mtd: physmap: Add Baikal-T1 physically mapped
 ROMs support
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>
CC:     Serge Semin <fancer.lancer@gmail.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>,
        Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>,
        Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>,
        Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>,
        Vadim Vlasov <V.Vlasov@baikalelectronics.ru>,
        Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Lee Jones <lee.jones@linaro.org>, <linux-mips@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
References: <20200526225849.20985-1-Sergey.Semin@baikalelectronics.ru>
 <5f5fc883-1cf0-f0b8-11bb-a60b45d135cd@ti.com>
 <20200528104245.jurucbblufluyjut@mobilestation>
From:   Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <0a9160b6-f915-2a2b-582f-3e6d657ca7df@ti.com>
Date:   Thu, 28 May 2020 16:35:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200528104245.jurucbblufluyjut@mobilestation>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org



On 28/05/20 4:12 pm, Serge Semin wrote:
[...]
>>> +
>>> +static map_word __xipram bt1_rom_dummy_read(struct map_info *map,
>>> +					  unsigned long ofs)
>>> +{
>>> +	map_word ret;
>>> +
>>> +	ret.x[0] = 0xFF;
>>> +
>>> +	return ret;
>>> +}
>> Why define dummy_io for "baikal,bt1-boot-rom"? I don't see any use of
>> adding a driver that always reads 0xFFs
> This is supposed to be temporary solution for the baikal,bt1-boot-rom ROM.
> The Boot ROM mirror might reflect either an embedded firmware or the SPI flash
> directly mapped into the memory. In former case there is no problem, we can
> freely read from the Boot ROM region. But in the later case the mirrored region
> (memory mapped SPI flash) is not always accessible. If normal Boot SPI
> controller is enabled, then the SPI flash mapping isn't accessible (any attempt
> will cause a bus-error). In order to fix this we'd need a mutual exclusive lock,
> which would disable the SPI controller while the mirrored memory mapped SPI flash
> region needs to be accessed. Such mechanism isn't currently implemented, but it
> will in be in the framework of my patch created for the SPI subsystem.
> 
> My idea was to just provide a dummy callback for now and replace it with normal
> IO-methods with mutual exclusive lock-unlocks when the corresponding SPI driver
> is accepted.
> 

Yes I understand, but I don't see any advantage for end user by
providing dummy calls... So please don't add the callbacks until they
implement proper functionality
