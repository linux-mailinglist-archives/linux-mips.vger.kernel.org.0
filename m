Return-Path: <linux-mips-owner@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 209B01E5CB3
	for <lists+linux-mips@lfdr.de>; Thu, 28 May 2020 12:07:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387634AbgE1KHk (ORCPT <rfc822;lists+linux-mips@lfdr.de>);
        Thu, 28 May 2020 06:07:40 -0400
Received: from lelv0142.ext.ti.com ([198.47.23.249]:59952 "EHLO
        lelv0142.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387624AbgE1KHj (ORCPT
        <rfc822;linux-mips@vger.kernel.org>); Thu, 28 May 2020 06:07:39 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04SA7Amr011529;
        Thu, 28 May 2020 05:07:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1590660430;
        bh=JIuX7vy1NOkZZG4cWNaBQkBz7x7Mn0OSQkz/l93tdT4=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Ct26ohnr8OmHtcITq7XzJV2+6grBMLN4GIuygi4KhgTkgl7hgVeSiOgNgZspjm1vT
         VW537w7qPh33qn1LL/3EpWl0t4bXyHGj5qneXWk9M0th3j59C1i3lHMwQP/15ThW0E
         Pio2hpxqCv9kxJgGVq65PGt7gKjIUZslmNAnqxKc=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04SA7AfG092541;
        Thu, 28 May 2020 05:07:10 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 28
 May 2020 05:07:10 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 28 May 2020 05:07:10 -0500
Received: from [10.250.234.195] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04SA74na017181;
        Thu, 28 May 2020 05:07:04 -0500
Subject: Re: [PATCH RESEND v2] mtd: physmap: Add Baikal-T1 physically mapped
 ROMs support
To:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>
CC:     Serge Semin <fancer.lancer@gmail.com>,
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
From:   Vignesh Raghavendra <vigneshr@ti.com>
Message-ID: <5f5fc883-1cf0-f0b8-11bb-a60b45d135cd@ti.com>
Date:   Thu, 28 May 2020 15:36:55 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200526225849.20985-1-Sergey.Semin@baikalelectronics.ru>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-mips-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-mips.vger.kernel.org>
X-Mailing-List: linux-mips@vger.kernel.org

Hi,

On 27/05/20 4:28 am, Serge Semin wrote:
> Baikal-T1 Boot Controller provides an access to a RO storages, which are
> physically mapped into the MMIO space. In particularly there are the
> Internal ROM embedded into the SoC with a pre-installed firmware,
> externally attached SPI flash (also accessed in the read-only mode) and a
> memory region, which mirrors one of them in accordance with the currently
> enabled system boot mode (also called Boot ROM).
> 
> This commit adds the ROMs support to the physmap driver of the MTD kernel
> subsystem. Currently the driver only supports the Internal ROM, since
> physically mapped SPI flash is utilized by the Baikal-T1 System Boot
> Controller driver so won't be available over mtd-rom interface and
> the Boot ROM mirror mapping has dependency on the SPI flash mapping
> switcher available within the SPI flash registers space. The real access
> to the Boot ROM memory will be added in future.
> 
> Note we had to create a dedicated code for the ROMs since read from the
> corresponding memory regions must be done via the dword-aligned addresses.
> In addition the driver in future states will have to take into account
> that the Boot ROM might mirror the SPI flash region so before accessing it
> the SPI flash direct mapping must be enabled by means of a dedicated flag
> in the Baikal-T1 System SPI register flag.
> 
> Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> Cc: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> Cc: Maxim Kaurkin <Maxim.Kaurkin@baikalelectronics.ru>
> Cc: Pavel Parkhomenko <Pavel.Parkhomenko@baikalelectronics.ru>
> Cc: Ramil Zaripov <Ramil.Zaripov@baikalelectronics.ru>
> Cc: Ekaterina Skachko <Ekaterina.Skachko@baikalelectronics.ru>
> Cc: Vadim Vlasov <V.Vlasov@baikalelectronics.ru>
> Cc: Alexey Kolotnikov <Alexey.Kolotnikov@baikalelectronics.ru>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Lee Jones <lee.jones@linaro.org>
> Cc: linux-mips@vger.kernel.org
> 
> ---
> 
> Miquel, Richard, Vignesh, the merge window is upon us, please review/merge
> in/whatever this patch.
> 
> This patchset is rebased and tested on the mainline Linux kernel 5.7-rc4:
> base-commit: 0e698dfa2822 ("Linux 5.7-rc4")
> tag: v5.7-rc4
> 
> New vendor prefix will be added in the framework of the next patchset:
> https://lkml.org/lkml/2020/5/6/1047


Sorry, driver patch and dt bindings have to be proposed together...
Driver cannot be accepted ahead of DT bindings been reviewed.

> 
> Note since the next patchset is no longer relevant (as a result of a
> discussion with @Lee and @Miquel)
> https://lkml.org/lkml/2020/3/6/421
> and Boot ROM mtd is currently unsupported I can freely submit this patch,
> while in former case I had to wait for the patchset merged.
> 

[...]
> +static void __xipram bt1_rom_map_copy_from(struct map_info *map,
> +					   void *to, unsigned long from,
> +					   ssize_t len)
> +{
> +	void __iomem *src = map->virt + from;
> +	ssize_t shift, chunk;
> +	u32 data;
> +
> +	if (len <= 0 || from >= map->size)
> +		return;
> +
> +	/* Make sure we don't go over the map limit. */
> +	len = min_t(ssize_t, map->size - from, len);
> +
> +	/*
> +	 * Since requested data size can be pretty big we have to implement
> +	 * the copy procedure as optimal as possible. That's why it's split
> +	 * up into the next three stages: unaligned head, aligned body,
> +	 * unaligned tail.
> +	 */
> +	shift = (ssize_t)src & 0x3;
> +	if (shift) {
> +		chunk = min_t(ssize_t, 4 - shift, len);
> +		data = readl_relaxed(src - shift);
> +		memcpy(to, &data + shift, chunk);
> +		src += chunk;
> +		to += chunk;
> +		len -= chunk;
> +	}
> +
> +	while (len >= 4) {
> +		data = readl_relaxed(src);
> +		memcpy(to, &data, 4);
> +		src += 4;
> +		to += 4;
> +		len -= 4;
> +	}
> +
> +	if (len) {
> +		data = readl_relaxed(src);
> +		memcpy(to, &data, len);
> +	}
> +}
> +
> +static map_word __xipram bt1_rom_dummy_read(struct map_info *map,
> +					  unsigned long ofs)
> +{
> +	map_word ret;
> +
> +	ret.x[0] = 0xFF;
> +
> +	return ret;
> +}

Why define dummy_io for "baikal,bt1-boot-rom"? I don't see any use of
adding a driver that always reads 0xFFs


> +
> +/*
> + * Currently Baikal-T1 SoC internal ROM is only supported. Boot ROM region is
> + * dummy-data filled for now since in case of the system booted up from an
> + * external SPI flash the ROM will mirror the Baikal-T1 System Boot SPI direct
> + * mapping memory region. That region can be only accessed when transparent
> + * mode is enabled, which we unable to do here because this feature is provided
> + * by the SPI controller config space occupied by the corresponding driver.
> + * In future we'll export the mode setting method from the Baikal-T1 System
> + * Boot SPI Controller driver to also have the Boot ROM supported here.
> + */
> +static const struct of_device_id bt1_rom_of_match[] = {
> +	{
> +		.compatible = "baikal,bt1-int-rom",
> +		.data = &bt1_rom_normal_io
> +	},

> +	{
> +		.compatible = "baikal,bt1-boot-rom",
> +		.data = &bt1_rom_dummy_io
> +	},
> +	{ }



[...]

Regards
Vignesh
