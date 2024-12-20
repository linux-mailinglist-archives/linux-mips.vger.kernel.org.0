Return-Path: <linux-mips+bounces-7105-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDEF9F8BC8
	for <lists+linux-mips@lfdr.de>; Fri, 20 Dec 2024 06:11:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 904F51896436
	for <lists+linux-mips@lfdr.de>; Fri, 20 Dec 2024 05:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB9FA13D8B1;
	Fri, 20 Dec 2024 05:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LdVhZE6E"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C71C5139D19;
	Fri, 20 Dec 2024 05:11:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734671490; cv=none; b=pGGKSA9SNwnoHA9Ps2Yyy6g8WD84PQgs+Zb/1PdhqhWm+ceN6AAIArXlUBZEUW4b7zk+l4EmjI+uqJvBM9kKZ+f/jWQ2LiUlkXkN4qLN93X1QV1xc1FMz8ljC69sqif764yMXlnn7rc1GSoQGj3n2SUK0wCKpZS0IsYhtq447wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734671490; c=relaxed/simple;
	bh=OC27o8t86FmqI52rIO1fGT5v2s+ed/TzaM2ahgXOH0M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=payikTThOrJVNtqXDPVhLoxoyqfEbKGgBHsGmov960ICSie+MhbZ5jDe0apjtq5zMAKBLo7POxddujpYTJifFxoybQaL/SKQ7r85SYcHPKCsDw0U7c+UTydb8pn47qQ9MWhlK4hBS5ftLpsirU2Yh8SVCEaCZ+goR5el7pCkcD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LdVhZE6E; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5401fb9fa03so1525158e87.1;
        Thu, 19 Dec 2024 21:11:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734671487; x=1735276287; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7v+VLAudnzcimduDrszP/4v8bnyy4XN2zkzBwOehlBo=;
        b=LdVhZE6Eecyb42v4hqF4PT2QWKFiIcrCBh+qXBVdbtZRkBraPRcsVmD6e9csjxo86H
         NrfeLID/EuvT8WABm0qa1rKJ1eq/oVhpRx4Gp+UnQTjA06Nr0yJ05mK034za+EVPsJ2w
         5NzQiJub+dQbnKRqkA/1bkVuA56865oAuiL5DCB+KZiNNKVAozSQ9G3Z7FKU+6rhe8QE
         SiJ3ppmlIZOndFI9gjpDMPDZynwN7PYAFPmjBMbvgFh+T6XyMrimLZKR7lrELJ7hQPN+
         dY/a1BAoODsP7xmfL9b/eiG8rEI9sCQcPrdYpcswwfs2Rfka5rR501jkGlMPvejvQa/9
         EeLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734671487; x=1735276287;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7v+VLAudnzcimduDrszP/4v8bnyy4XN2zkzBwOehlBo=;
        b=jLOx1GdZQ9XwBT08F5vEhTxFcAHI/jzWiKhojhyw8WITj+9+oxwgnBbBbVNPXKZI4P
         /hwZimh/8r8xrj3Iwf2WNPLnDMOc1VUheCbZGWAucYn0Gv4769+kGICqyk52/ALlTYCd
         2kuuc1m3J2qhZAMowpOokRLJS4EraqyGOq1JQjoRqcFzkYv/OBIQprCIIHfa1hDjzUfm
         e062aTzQQD5HqLzRXqGJztYNxQVRDWiMuB7aDtSPJo97Vpvn1ymipmRqMBS2JWFGBoek
         csgXoc8qQa7SzLbWEpw0A58oThb0bpcCawuY6k37plZ6SXZlxkve1kMCHPfuVzWzj3Px
         Ai8g==
X-Forwarded-Encrypted: i=1; AJvYcCU5WPdGp03qC4nCy7HeU03tBqXygiK0RxmDEjcfjQiT72fMTXhAvq3emHolB0Lwi9lwv5adA6BKN+SP@vger.kernel.org, AJvYcCUPusFVHi9CXVYjna/cUu8Ad9Y2woifkveucCQB9Nypxm/0fhYP+kimw3THpyKHX8mEglVb0qKD@vger.kernel.org, AJvYcCUzNejIfjcy/DZiHTY3ovG5ohi0Sx4Y/8i0l/xNq0iCneY79zFe8lP7MF7Cc3yU8TEmNYw2mlDJZAEOclsl@vger.kernel.org, AJvYcCXdPEpnXXRYXA0WNhk4EW1zGwUwCGBCEfIuvuFw62KviL8WnExVKJAyK2+Y02mJSNZTFMhF6ikr5l4/Zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyiI//dpapAEEuWgtkgjBgLsE/l3L0ByfB9vLCEWAyiA0SLPOPq
	SWfhCFwMom9aydzxVQkrlQUQGx8GBOxbeLmbj++Xk2OLJsBP5UrRt74sakjZMRV213iQfuV8vJ+
	pqY+VLEXDogeCq7PeKArypnLm6VY=
X-Gm-Gg: ASbGnctdr+AmCyChLJ8b/adg07J+iiuZWZZJwxdPxrE4HeKvw6wVcvCoaX8LnZxTbEk
	Tc4Y/x9CuIDc1z3pDDcLxYp1fEO6ya1eVOJP8K7OqdwfI5tBSM5lpQsc36ovrE40oHeW9c3c=
X-Google-Smtp-Source: AGHT+IEcSNk/G9l5uKdj89SsrYgwwgdTzi9daKQR4IAmTn2NDIwTrCu2iM6XFZh9keWJS6m/wKUJxBLPh3yzSCSfcdA=
X-Received: by 2002:a19:6a10:0:b0:542:2160:26cf with SMTP id
 2adb3069b0e04-54221602842mr1433747e87.25.1734671486577; Thu, 19 Dec 2024
 21:11:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216031346.2626805-1-chris.packham@alliedtelesis.co.nz>
 <20241216031346.2626805-5-chris.packham@alliedtelesis.co.nz>
 <CAJq09z49uBPPZqDyc3O+4nVppKoKdrJunQnQKBUfQmwzdV+ZFQ@mail.gmail.com>
 <07073382-df51-4064-9802-cdbfcf732523@lunn.ch> <fe34b6b0-01fd-4dc7-a1b4-6c27ad2c9e74@alliedtelesis.co.nz>
In-Reply-To: <fe34b6b0-01fd-4dc7-a1b4-6c27ad2c9e74@alliedtelesis.co.nz>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Fri, 20 Dec 2024 02:11:15 -0300
Message-ID: <CAJq09z7GDOmKqmbD5evafSFaQswgSJPU-G+44DtwfidmZMS6sA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] net: mdio: Add RTL9300 MDIO driver
To: Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc: Andrew Lunn <andrew@lunn.ch>, lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	tsbogend@alpha.franken.de, hkallweit1@gmail.com, linux@armlinux.org.uk, 
	markus.stockhausen@gmx.de, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> On 19/12/2024 22:40, Andrew Lunn wrote:
> > On Thu, Dec 19, 2024 at 01:46:41AM -0300, Luiz Angelo Daros de Luca wrote:
> >> Hello Chris,
> >>
> >>> +++ b/drivers/net/mdio/mdio-realtek-rtl.c
> >> I wonder if the name might be dubious in the future with other realtek
> >> products with MDIO. Realtek is quite a large company with many
> >> products. Would a version/model/family/usage in that name help a far
> >> future reader to identify what this file is about?
> > Isnt rtl the family name? Or would you prefer mdio-realtek-rtl9300.c?
>
> Yes my intention was that "rtl" was the family name.

rtl just means realtek. It is the same prefix for a wide range of
Realtek products (audio, usb, storage, network).

> I'm happy to change to rtl9300.

Even the product number might be confusing. For example, the switch
rtl8365mb is newer than (and incompatible with) the rtl8366rb. Realtek
has a library/driver name that could indicate the family (rtl8367b,
rtl8367c, rtl8367d), but it is not tightly related to model numbers.
In the DSA case, we simply adopted the first device that was supported
as the filename, even after that file was expanded to include other
models. I hope rtl93xx model numbers will be less confusing but it is
a Realtek decision. With the realtek past cases, if you want to be
sure it will not be confused with another model in the future, just
use the model "most significant" to your driver, like
modio-realtek-rtl9301. Do not expect that a future rtl93xx model will
be compatible with rtl9300. If rtl9300 does not really mean rtl93??,
rtl9301 would be, at least, more informative.

mdio-realtek-rtl9300.c or even mdio-rtl9300.c are just fine, but I
prefer the former as the common prefix will group different future
models, even if realtek abandons the rtl prefix.

> I suspect this probably will be compatible with the rtl9310. I've just
> received a RTL9313 based board so will probably start looking at that in
> the new year.

At least for the realtek switch-only products, if you have access to
the Realtek Programming Guide or the vendor library/driver, it would
be easy to spot compatible models as they share the same driver
generation. From what I saw from the difference between vendor switch
drivers rtl8367b, rtl8367c and rtl8367d, Relatek tends to use an
incremental model, but breaking the support to older models on every
new family release. They share a lot of code but they differ on
registers (normally constants on each generation). If you intend to
also upstream a DSA driver, you'll probably need to share some code
with the existing drivers as duplicating that much code is normally
rejected in the upstream kernel.

> >>> +static int realtek_mdio_wait_ready(struct realtek_mdio_priv *priv)
> >> All those realtek_mdio_* prefix might collide with realtek_mdio_* from
> >> drivers/net/dsa/realtek/realtek-mdio.c. This realtek_mdio_* is about a
> >> Realtek SoC MDIO interface with the switch. The other realtek_mdio_*
> >> is about the interface (MDIO or SMI) between (the other vendor) SoC
> >> and the switch. I don't know if the maintainers are OK with it but
> >> listing those symbols in alphabetic order from both sources might be
> >> confusing.
> > rtl9300_ as a prefix?
>
> I'd happily  change to rtl_ or rtl9300_

"rtl9300_", please (or "rtl9301_") a "rtl" just means realtek.

> >>> +static const struct of_device_id realtek_mdio_ids[] = {
> >>> +       { .compatible = "realtek,rtl9301-mdio" },
> >>> +       { .compatible = "realtek,rtl9302b-mdio" },
> >>> +       { .compatible = "realtek,rtl9302c-mdio" },
> >>> +       { .compatible = "realtek,rtl9303-mdio" },
> >> Do these different compatible strings really matter? AFAIK, compatible
> >> are not for listing all supported models/variants but to describe
> >> devices that have a different behavior and indicating that (with
> >> different strings) is needed to decide how the driver will work. If
> >> the driver does not use which compatible was set, it might indicate
> >> that we don't really need 4 compatible but 1.
> > It can be useful when we initially think they are compatible, but
> > later find out they are not, and we need different behaviour.
>
> The way I've written the dt-binding any board should include
> "realtek,rtl9301-mdio" and may also include one of
> "realtek,rtl9302b-mdio", "realtek,rtl9302c-mdio",
> "realtek,rtl9303-mdio". For the MDIO driver the specific chip could
> possibly tell us the maximum SMI bus number. Unfortunately I've only got
> a block diagram of the RTL9302C, I know that does have 4 SMI interfaces,
> the others may have fewer. Things would probably work fine for now with
> just "realtek,rtl9301-mdio" but is there any harm in including the others?

If "realtek,rtl9301-mdio" is mandatory, until you need to
differentiate each model, the extra compatible strings are not useful.
It would increase the compatible table a little bit. My concern was
not about the extra data but that a similar approach was rejected in
the past. If maintainers are OK with it, I have nothing else to say.

>>> +{
>>> +       struct regmap *regmap = priv->regmap;
>>> +       u32 reg_base = priv->reg_base;
>>> +       u32 val;
>>> +
>>> +       return regmap_read_poll_timeout(regmap, reg_base + SMI_ACCESS_PHY_CTRL_1,
>> All regmap funcs are adding reg_base to the register address. Isn't a
>> remap job to do that sum? It just looks odd but I never worked with
>> MFD. It looks like it is missing a subregmap-like variant.
>
> I'm thinking about dropping the base and just using the full 16-bit
> address. I've already confused myself between this code and the datasheet.

That's what I thought when I saw the sum. I would definitely miss it
at some point.
If their positions are fixed related to syscon base, I would use the
full 16-bit. You could use the base+relative_reg_addr in the macro
that defines the register address without increasing the complexity.

Regards,

Luiz

