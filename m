Return-Path: <linux-mips+bounces-9037-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D14ABE232
	for <lists+linux-mips@lfdr.de>; Tue, 20 May 2025 19:57:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBDFC4C4C88
	for <lists+linux-mips@lfdr.de>; Tue, 20 May 2025 17:57:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F08C6262FD6;
	Tue, 20 May 2025 17:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="T61sqpL/"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574E925A2D9
	for <linux-mips@vger.kernel.org>; Tue, 20 May 2025 17:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747763861; cv=none; b=j65RmIyeRyXmOu7YnT3BR/orZWeKVvg86U/+zGEkmTShkwn8H7q/zKA3azbBZApxBMqwBzRn8amwHsA1PbVZQ9bOZoAKGqLPSBTMhfVJRRDcqhDn2JG1sl6pjEG+lNCQhzdt9RX3AbczDMqbqEWnxHou/FVewV7wHPdVn+Kc6wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747763861; c=relaxed/simple;
	bh=1M9X6QHw8QpmM9UT7xnHYungjw7J2YeWavwZ8Jbo5wo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DDny9MaNAwg37hv3Lf75AgO2sV5q0y55fTyWa92W/qDRQkVDb+AJidyQdc/MZzok0Tv08g/ZrOQYWef9foxOewzXru4NLvutKxPSgOmZNtqsTo5GtPveg379JWmwQxIB5IJDnzY5xWfjtMZRSZ0QsZyMKKx9ECjyOCf30uPyTyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=T61sqpL/; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso5262163b3a.2
        for <linux-mips@vger.kernel.org>; Tue, 20 May 2025 10:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1747763859; x=1748368659; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lkQx5a2rXQrbUi0huGR//kMdqarRCpuGjmWJng00MH0=;
        b=T61sqpL/7PkArTAQVIDSw++5sdrXLZHbC94raz1/qOPF+s6TX4XHQOktM5DTgJwB9i
         4DFUTRiAHD7GzxNZRDMyEPtK9ZxwxYYCP9V4v74yHHY6mcG+LZARTQnWdrs+TaqcR3zt
         RTwXiKKpmzK34Mvj1rRoVmxCciPaCeibIQw1E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747763859; x=1748368659;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lkQx5a2rXQrbUi0huGR//kMdqarRCpuGjmWJng00MH0=;
        b=c0TslG4PpFT4n5HgR8s7jpQNmgaHaICETiGa2F5nlF5vMKLRvjpIgEahD6Pk3OCG1G
         7LxBCRlcz7poZasPCftevFjjuGqef/ZHFdiSoHDCqFLMXIOkD5XWApklYNWEtv/Yqlyp
         /kfjmcX5lMZ6JH1+89RVFPnGVWrPxnJzxgsu8P+gcO688nIxSTF+DrbgMtZzfBAOK282
         u9bVYdh0I/HFnHdQw/aVINYYbu7UkfTszsbswWI3Dff8noWDVozM/yuWi+htuDEQDtIC
         FRsC6nyMsmnlVDNgE39ooiEyeYcN/Mv/1dBgug28iHBxrlSi6TDy6QUCH8+AJ3LnbAcn
         bPFg==
X-Forwarded-Encrypted: i=1; AJvYcCU8Lkfr7tjtvA0QLfP9IkUklHfPbEMc6ovO76tO7QzD4rPd7HYHf0KaL+ts5GCbikIoTLGofEixxM+p@vger.kernel.org
X-Gm-Message-State: AOJu0Yze6R2IAgVqQNJDzrcEEW/lhIH+3WSNDzlinqAhNC7q+Yzrpr8q
	pUQ6XOowWF45pL6upqhcsGEvQRIKjXXwXkRo+k0OKxb9m3X+p2601/wpxpjZ/YQoLA==
X-Gm-Gg: ASbGncu0O/GjIiRmc2Tfb87Hg9H9SDdnD6Iy/8sHe/EzKtJNuiV/vHZRcRUzt5CKvFZ
	uoZ+um11Z6molNDl3zFfhs8BLx3IvhLeVghhX8OCEjsqLwf+CVq1XYR0PnglTE/igYwoNrd/dpq
	LAZ2kq4v+e4a21eVsMejJDoUJcT00BMEfC1OENxIv6by2ZOh7iPW6ThEyLLZ5L46/dzmn7Os+bQ
	VjSPsDc9fwpj8AHgJQ/66tkmB3Tisb5rt1xQkms00aNx1RnwCqzVgG7fxqSzbaafAAeemdP9qRz
	BzDHmteiTrRbRzEuZe6AuutB+t4rIAkMBCfC7xdzXjO0NHGHb2bY7U49PQdJDVbgRAgKvGSaKgs
	xIbXHgLlxYztsRzlFkT92J6mtPA==
X-Google-Smtp-Source: AGHT+IGSYLANxnLLAnM0uR33FTX21jqDSKnmTyPRmRqzlfjjZkaFjTCDN44LrfmyPnhRWOP6pDsJKg==
X-Received: by 2002:a05:6a00:9186:b0:736:5e28:cfba with SMTP id d2e1a72fcca58-742a98a323bmr23868341b3a.18.1747763859603;
        Tue, 20 May 2025 10:57:39 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a982b7ffsm8484079b3a.104.2025.05.20.10.57.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 10:57:38 -0700 (PDT)
Message-ID: <45057903-7eab-451b-94c6-23c3d552f144@broadcom.com>
Date: Tue, 20 May 2025 10:57:35 -0700
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/3] net: phy: fixed_phy: remove irq argument
 from fixed_phy_add
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
 <b3b9b3bc-c310-4a54-b376-c909c83575de@gmail.com>
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
In-Reply-To: <b3b9b3bc-c310-4a54-b376-c909c83575de@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/17/25 13:34, Heiner Kallweit wrote:
> All callers pass PHY_POLL, therefore remove irq argument from
> fixed_phy_add().
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

