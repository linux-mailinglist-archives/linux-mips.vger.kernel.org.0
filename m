Return-Path: <linux-mips+bounces-9038-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E24A5ABE23B
	for <lists+linux-mips@lfdr.de>; Tue, 20 May 2025 19:59:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 21B064C3F06
	for <lists+linux-mips@lfdr.de>; Tue, 20 May 2025 17:59:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C62A127EC7C;
	Tue, 20 May 2025 17:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="iEIwP1kx"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851CA26F440
	for <linux-mips@vger.kernel.org>; Tue, 20 May 2025 17:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747763971; cv=none; b=p0zDeva6juPK+7E/bnEB3oKIDPTbwd5cOUdhbEhdPZ/jQkJiiBMrTeP7SjFq+dhljxCPWP9CaaG7PRJvWWrfLa7JVFlLbtk+bioduzUkq4Orpj7zxYSwfQhi6a3Bx9uk0GX/QyRKD9xvvZwl0mZSXMz6InE6ULr59hVghQ6wA04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747763971; c=relaxed/simple;
	bh=sk1HYXDvnKjUBm5wbIYL2hxbtPS8MQRRAHhR6ynndh0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ofqS3c7BBAnv7M4w9otPSQWnrY7wJk/M6O+5okfDtmjrOQoZRw4SL8Q1HPBlDH2xxuS4nlGAZnFX6ZBqf1WmgMiF/2S8434nUGe1GG/xoNglhfhHVNaJniDddFjjgGXYUkXc5fUowM0hNRza+a1PgH6lkgW6aOveM/2TcnXhPfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=iEIwP1kx; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-30ea7770bd2so4617150a91.0
        for <linux-mips@vger.kernel.org>; Tue, 20 May 2025 10:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1747763969; x=1748368769; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=INM95q65BeODTHlD+8KmvZymICq+GNLSDmmtrJVHoBo=;
        b=iEIwP1kx6xxDp2mo+ru0MoTqDkVU1t9mzCEACFgPVfAlZ41Cn8cWToKoUzQCujG7VK
         Lo2SfPcAT1WgW0LVqstsY1dGY1palUJ6D6MBbHZ3PANDwGmc9U3TLegbH/koAFnighr4
         Xam03WPX2Hh4F5h8EwtkOzNJlDAXOp2HCO038=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747763969; x=1748368769;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=INM95q65BeODTHlD+8KmvZymICq+GNLSDmmtrJVHoBo=;
        b=aFk7xpDMbnzI7yX7o5k6XBM8p+Iv1y/AQVQzUuB1AT/m8mot5nGnmpedROfKD41xCt
         /HU2La+RKZKxI77hpX3M7id4pgAyHLsFS3oC2KIlnLROtGeQWJK9SOcbg31ygXp1KrDh
         AO/mdBSayQobx3QaRxwaSAguydSo0O9CDetEvyLyFXqk3s98GBb6QjKcHwqjkRY2L7ip
         4KWKgF4gxNXLnrSi7rI2vkDqTzrYHH/pgYn0+DBDg7R2+VtPsNOZFh1l+fjDAV1jFPnF
         cyBzPEReOaMDzr0IPzhhQPFFds6bnoAw4XKrgvE617o4nALpz/AcAGinLK4zvC37qhtC
         BOGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRznZ/EPjQmlfh5knwcmDK9EMnZbRSEGvgKaS2EDHip9ofp2W60fEhFHyr2hcieDnXBcoFcvj4wnNq@vger.kernel.org
X-Gm-Message-State: AOJu0Yxlnq54kw9c8hFmfD+kBvHI9GMKUYLd8XMgcouVU9h4+Ch9gDVK
	dK3eEFkOtT68KsvxdOhrcyiiUvH0eNKqKOcVZkNasxEvIJ74fKvvQsD1rYj4KSP51A==
X-Gm-Gg: ASbGncv5I3/g9bDmwfHcg4kxff6WF6kewQfZ8DCvzmoN5Biun1/z2HUz3e4u/L6NvW6
	ciCnDrtqqx7TvJGmnUgmff5wf1Z1p/qBpMr4W9k0fV1yBKH7EpU+ZTtGHO876B5CGvYAS6d1eCd
	Us/H8Hw068vlTS76aAdoaNkDUbRfwx+wA/+NSb9TWU6wiLXi5SfMZ5P+aIWpy094whzT0Wda2lz
	fYSXk4xunnjIclrt/mH4iUcRn25aBqbz4P9o1z5slwcbDQb1SxQJyDTePPf4/0nqwcF8IYWz6PA
	vQPlFfVJkbXg2kWyvB4eYtAc2Ng3JIBy19/pXBIlFx08fNNz6M0A59GpoezL5Fl8T74iTru4RHR
	5uexeKFRQWYEpf+U=
X-Google-Smtp-Source: AGHT+IFaM8IaByeAyzbZ1A4gVDC35Pyz8pR9kNbpble9jg5fMy8ANLnTcAmpKkH3tcHj+isuz15jMQ==
X-Received: by 2002:a17:90b:574c:b0:308:7270:d6ea with SMTP id 98e67ed59e1d1-30e7d5b7b41mr26127527a91.30.1747763968605;
        Tue, 20 May 2025 10:59:28 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e10039b2esm7535809a91.0.2025.05.20.10.59.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 10:59:27 -0700 (PDT)
Message-ID: <e6b8d2c5-5e3a-42b3-a68c-ceeda2fd8632@broadcom.com>
Date: Tue, 20 May 2025 10:59:22 -0700
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/3] net: phy: fixed_phy: remove irq argument
 from fixed_phy_register
To: Heiner Kallweit <hkallweit1@gmail.com>, Greg Ungerer
 <gerg@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Hauke Mehrtens <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <zajec5@gmail.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vladimir Oltean <olteanv@gmail.com>, Doug Berger <opendmb@gmail.com>,
 Thangaraj Samynathan <Thangaraj.S@microchip.com>,
 Rengarajan Sundararajan <Rengarajan.S@microchip.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>
Cc: Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org,
 Linux USB Mailing List <linux-usb@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <4d4c468e-300d-42c7-92a1-eabbdb6be748@gmail.com>
 <31cdb232-a5e9-4997-a285-cb9a7d208124@gmail.com>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <31cdb232-a5e9-4997-a285-cb9a7d208124@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/17/25 13:35, Heiner Kallweit wrote:
> All callers pass PHY_POLL, therefore remove irq argument from
> fixed_phy_register().
> 
> Note: I keep the irq argument in fixed_phy_add_gpiod() for now,
> for the case that somebody may want to use a GPIO interrupt in
> the future, by e.g. adding a call to fwnode_irq_get() to
> fixed_phy_get_gpiod().
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

