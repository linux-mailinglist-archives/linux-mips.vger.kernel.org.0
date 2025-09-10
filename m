Return-Path: <linux-mips+bounces-11226-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA12B5240F
	for <lists+linux-mips@lfdr.de>; Thu, 11 Sep 2025 00:05:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B2A76583AB2
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 22:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3218F310771;
	Wed, 10 Sep 2025 22:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="UxVeuMem"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f226.google.com (mail-pf1-f226.google.com [209.85.210.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B26992D876C
	for <linux-mips@vger.kernel.org>; Wed, 10 Sep 2025 22:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757541919; cv=none; b=G3lrGBXegY17Y5JYUGgk7h6/b4XtvbZgG1b/IbJsNT5vUKfSj3eTAw4YiFC2MaScu9zw1TQ9ax482wTFAwbqhcQJOhBLUmT3afz4hfDBjzm7IW+cPAdsTMhCzf6Ps3EB/jceK0L5dz13/YIWSOzirKoq2CeLrB9mShBruQxf2rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757541919; c=relaxed/simple;
	bh=WPmBkbbWU0R7UVuoQr9K4F2w4LPIWw8i2zUW2ipwqcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NvhUrwLqXyUtHLzLP+kGSY6xDhoKm0fMTA3Ml0ta9txXyFKk3dwoC6hROgVFh7U1au/fA53Xn8PHAkQOpW0kKYwYXMkJt36DM7LzbMvT5JCyfmQhW2dd7z5pXgqRC3E/FzhG5a/pkIEdd3ErhsQxYxBHeev7OMuQC3h6nvB1Mv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=UxVeuMem; arc=none smtp.client-ip=209.85.210.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pf1-f226.google.com with SMTP id d2e1a72fcca58-772679eb358so77730b3a.1
        for <linux-mips@vger.kernel.org>; Wed, 10 Sep 2025 15:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757541917; x=1758146717;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+pRF4YDkBDpu0q0XohqilWJxU+Cw/6tcedpHDHdQxs=;
        b=aeUTdb7Kb1RCwks2xcn5MYAb14fZriRx3UOk1Bf4Ffb+qQVDQRdzHJlx/eeW52Fpfv
         5pilJrv4eOB7ECWNXO2m5G8ji7Uji4jXShLbHQcm69GU+yjHxWHDpA4ipdTGWw76CQyf
         MyDYUtGWVOgNLva1tRPdMNXmGuGimy9Np/vIsa1dh/JSjUUpKM0JQ6A6EdLphuF34kGh
         LZ4xO7zb7pE/GKYUm4Vuwkd0Vu/VSADhBvwH7Y25ydv4DTpTEkcNKT0uOqe+kcwKH8jH
         0v96uf8qL1/FC1aaWLWLxlHjTgqeo1HM1+KqYb7B536rJCQaG8NJ/R+BBRp7gpXN08jh
         0cIA==
X-Forwarded-Encrypted: i=1; AJvYcCUCjFCBOHGtb7SkWSTjAbHnS5r+y0XCeEf72OY8qDzgxtzx32LIabjyJRrO/zNWNuV5BaKS4SUKFKTN@vger.kernel.org
X-Gm-Message-State: AOJu0Yxwm6rHDyssASTOHFsays/rsoEEL//36MgYWFhNgCtenaelnbpR
	ENERxqmo3XtkndNaol8ky/IHAJww98f9DL3hYXOaUpcpNlZqBonEytRz1Az1J5Ad/lnfUGJdIhe
	nSW+FP2T1aVXkfK+L1hVh1WILd58XYlgXJzhhDODbLD8Wl2QEZIc7ho/sBxrz/BCYoYn63UNIs0
	r8rNMAh9zOkFA8VVkHvyDnCu9XTogLItvq0zFijbw/xxV8xhRULsbs3MnwC3GJNMkIY7j3K8zK/
	HADslfyLkl+2UT9ClCWQA==
X-Gm-Gg: ASbGnctdRs03EfwTlHSlUfTggbFlnpREb46jXbJCjJ06UiZcIFTUIa++yQUh46b0fAc
	xJPahgDEGo8SXSHaRN9VH5BdyAV9kwoCX6XzzHaSVi07fNx3mdr1DN9v9mHVUcUgdLRxd+3ctnA
	X0I7Ajeo15pbPE6+aHIOsDnPWhaM4SdIObffug05U4S/r6txHTKPOv8Ea1pRaB7t6GRne5VgK/g
	QjwD7mii1kBjPwHN5Jwj6geCyL8gMH25NGU584ppJiKalCiDpkyCXiKes9TIIkWpFftaMqdHptp
	LDhleHMqevx0Iy38Jx+WrxOWMPVizyceMiCUuTdPJwWblpfdy49eNvrgm+vERcy6a9iIdKgkSEh
	ZPttuE1VEPE9kkJ9lEAl/aFsevWxPMGEixOIhd7q1nhRVrpnmNdvl5r23U6VvqhUAWje2nGXqL1
	HIX8Ku
X-Google-Smtp-Source: AGHT+IGcauKF8TVGNwsXOqwR2KQdQCRmXo2DLmuD8lGlkxYeZ19LX/p5STy1JgsRZRc7jmTXzkQMwTEAF+QX
X-Received: by 2002:a05:6a00:928d:b0:771:e434:6c7d with SMTP id d2e1a72fcca58-7742dcce97dmr21621087b3a.12.1757541917025;
        Wed, 10 Sep 2025 15:05:17 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-10.dlp.protect.broadcom.com. [144.49.247.10])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-7746616876esm534799b3a.7.2025.09.10.15.05.16
        for <linux-mips@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Sep 2025 15:05:17 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24c8264a137so281215ad.3
        for <linux-mips@vger.kernel.org>; Wed, 10 Sep 2025 15:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1757541915; x=1758146715; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=k+pRF4YDkBDpu0q0XohqilWJxU+Cw/6tcedpHDHdQxs=;
        b=UxVeuMempUw6TSDtHk9FKiyODulkS4zStQfCexgUbdwEAF12b6zY0PfaNtSIsjDEkz
         Y5KwqNqjsv3TX3x1TIJJhJYHaGRgNuq1i8ihu3TE8cUPNHWeY3Lq6XoYnnSU8yKCcurj
         bggSE/SGiyW1qdsVtyyrKtQ1Is7VgDs93AxBs=
X-Forwarded-Encrypted: i=1; AJvYcCUY9A+I+HO9Ng5GatfZY6IRhbF1gaTFj54rPwp5HzxZ0aOLEx8rZtoTv/aHyBhK2mFbnH5R+xb66vA9@vger.kernel.org
X-Received: by 2002:a17:902:d58f:b0:24b:11c8:2d05 with SMTP id d9443c01a7336-251718ddafdmr259726715ad.45.1757541915303;
        Wed, 10 Sep 2025 15:05:15 -0700 (PDT)
X-Received: by 2002:a17:902:d58f:b0:24b:11c8:2d05 with SMTP id d9443c01a7336-251718ddafdmr259726435ad.45.1757541914912;
        Wed, 10 Sep 2025 15:05:14 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25bf675b77fsm1714715ad.43.2025.09.10.15.05.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 15:05:14 -0700 (PDT)
Message-ID: <f72733cf-cf96-4960-b07f-ed0d9efbbb03@broadcom.com>
Date: Wed, 10 Sep 2025 15:05:11 -0700
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 07/15] gpio: brcmstb: use new generic GPIO chip API
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>,
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>,
 Doug Berger <opendmb@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>,
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
 <20250910-gpio-mmio-gpio-conv-part4-v2-7-f3d1a4c57124@linaro.org>
Content-Language: en-US, fr-FR
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
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-7-f3d1a4c57124@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/10/25 00:12, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Convert the driver to using the new generic GPIO chip interfaces from
> linux/gpio/generic.h.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


