Return-Path: <linux-mips+bounces-12096-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 305BFC3D6B5
	for <lists+linux-mips@lfdr.de>; Thu, 06 Nov 2025 21:51:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 64276349BB7
	for <lists+linux-mips@lfdr.de>; Thu,  6 Nov 2025 20:51:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7FEE301034;
	Thu,  6 Nov 2025 20:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="B/u5nQYC"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-io1-f100.google.com (mail-io1-f100.google.com [209.85.166.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8FC2FBDE1
	for <linux-mips@vger.kernel.org>; Thu,  6 Nov 2025 20:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762462278; cv=none; b=tXslgu/9cvDT21hQDD2d8zQE4VWLQ/xdEZKtvI4EN622+ktlF05aQZo2Ocg1jr7IPJOThWX++PNiMCKpWWJW7bep5jp2hzbJs780y1rsYxSc+mXwGdP750Nyf6jwN/0S/3z7kRUmmw3xPp/BVVhBkVNC3HgruGlOjOKiCok0dk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762462278; c=relaxed/simple;
	bh=9t3pSv0xPJZOknrNSk7qhoIPhDn3JeVjjG76y00eFN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Bm9GSojTchwPsVQJW+nB91f0n1wPLvye4YpE4b3H8ZQswwSc+PhpeN3CZGe9aS5MMABPkep4yPl7Kvw7hMYrFO8azMlsk9waiJT233UZdQofIoGB5dI8CSy6XuDHYmrg60B4L9msx2LRxS6WxUw66UzPXzQS37RKLcGrqaYEpQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=B/u5nQYC; arc=none smtp.client-ip=209.85.166.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-io1-f100.google.com with SMTP id ca18e2360f4ac-9487bde3d07so1680139f.1
        for <linux-mips@vger.kernel.org>; Thu, 06 Nov 2025 12:51:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762462276; x=1763067076;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YaaO5Vz4QQWSkxbqCuHg6fzGeHTGukM8RnsOYsz8pwE=;
        b=mMpkZM6m1qgZ//gmdlsEDpynk5PREru/4eDp3aZSxUnZBdBGqYb042dJTCqa0MQdwr
         tPVp5wgv1ScW9/HSZVsaeDtpVNx0YAqIYmC7OHrc/BfvYwZnTT6hJfrSN+9RDgKPFi4z
         1fbCSAAUj9q54mubM1go/D28hThtenIOjd1GPflEbxJiNvxtIOnRc66k5Bg0hB5oitK6
         KSw+IG7ee4NaRDYSttNfRmDgYR3pBSKmiDlCvnZA9fjI0E1H+nQz+evnqFrEdr4A4KuK
         wVA6C/VbQsMSBGRjUoHW3HLhfPP3JfuR9X4+SBN3KVt4ziP0K4B096a/b4jLSEyzqE+f
         UG4A==
X-Forwarded-Encrypted: i=1; AJvYcCWQT64X1U7/F1QdHpCGaLiWRU1aXyomm9S5qhOgdAroMK6oAfJGJaW/4LVq9FCByC5tzf0+ea96fouN@vger.kernel.org
X-Gm-Message-State: AOJu0YxAJa4/ULuEqFUoD/jmGDmwl35zK/kcg+3LazuTL50lV+HGiX0F
	/5ROvxYwAlHQ3c6m7sdP/effsZGkjOxXmHDUDPusQ34MO3s8bKiZiqJl+CKun5YPp9hJBsIiB/X
	Ad49WqNxU++mQ97Bp7o86c21gMwkdj8qIP/CbxNtNwCwx2wU0VFOIWmvGN1VtOnDIGYQlbKc2Af
	DVpyzBDLVnWlefRB1DE5S0E8UlD4q9F26XJAwKe4ySS0ix+TA9MEBFqsY6auMiBHdsYUb1Y0Rwy
	7aml+8bYxoAOrNZq+LONw==
X-Gm-Gg: ASbGncuYwb1yOhbDQNxNCn7ub2hxCShFSEliwXkcM3wO0hJ3KEFXtk24nc7wkiFRH6w
	UYpp+vb9FU+X/Lh5GQZf+JAn/W9ThAbRlWSJ72oZ/T9Hxk0g78FH3CDK7ziXtRGl0Ajw3b43rA2
	xKw2Z+diKIeM4Hu70yfigxmwH8BJ3R0up8xiXTUO6qblvT8p+eEEfnwT/TRtqTuPo70/zkVTtW0
	mKSjJcm9jyGT8B7ntzhiSwZHDFHok5ddzQ/AjMNlhcEZdEpgkSiS7eYA1rLnuifWBfITh8oaWS6
	tDSPucBGinWV+ZctY6WX9VUOcSW+iWA8lfO7DSz+yfxE2RnjpdGNHuEH++qbG/AB1ig/rblF3iC
	BtCebzX4zykdsItXpAVpXhqTT4ba4yqFXwBugw+F+BQGyALrAIlDOWd8Gz60jvdRl0TYAqUZ/1Y
	pOfSbMbVoF6RWdOoRd25JPXq2MSUcupB9zaWZbbx4=
X-Google-Smtp-Source: AGHT+IFYWGs9pgI6P0v9bPmT1hxHbZ5yKWRtnvK94xl1NRBQjazPKHL6TrQ7bbFNJAqID5LVc4TQX2g+5Ley
X-Received: by 2002:a05:6e02:1fe1:b0:433:246d:283f with SMTP id e9e14a558f8ab-4335f44157bmr15497365ab.17.1762462276080;
        Thu, 06 Nov 2025 12:51:16 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-12.dlp.protect.broadcom.com. [144.49.247.12])
        by smtp-relay.gmail.com with ESMTPS id e9e14a558f8ab-4334f4c52b3sm2808185ab.30.2025.11.06.12.51.15
        for <linux-mips@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 06 Nov 2025 12:51:16 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b630753cc38so164283a12.1
        for <linux-mips@vger.kernel.org>; Thu, 06 Nov 2025 12:51:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1762462273; x=1763067073; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YaaO5Vz4QQWSkxbqCuHg6fzGeHTGukM8RnsOYsz8pwE=;
        b=B/u5nQYCk0tGbjp+cHCw630C9ATe+8JjhrRBCLYpZjfvDvVlCfNSOsEaZvEhmRmImf
         Tcsdiv2jOoBoaWIHoZUfZN5lLDlCgTDSWJLFbQeOSMyfgbV+HcNc2MZeSQ8Frkp1tbM9
         CSKI2mtrOTQOO2JCh4vawTxuO57zWp+Y4yLQA=
X-Forwarded-Encrypted: i=1; AJvYcCWJ2Q0LNp+d/P81QQH2WArIgn3zKMBQVTpKh6o8AbUSLoyjuceviuQPgPVIE040JJVX/KSbkritx5Y9@vger.kernel.org
X-Received: by 2002:a05:6a20:394c:b0:2f9:39b0:fd88 with SMTP id adf61e73a8af0-35229745d5bmr1072788637.21.1762462273460;
        Thu, 06 Nov 2025 12:51:13 -0800 (PST)
X-Received: by 2002:a05:6a20:394c:b0:2f9:39b0:fd88 with SMTP id adf61e73a8af0-35229745d5bmr1072772637.21.1762462273108;
        Thu, 06 Nov 2025 12:51:13 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c6951633sm513373b3a.0.2025.11.06.12.51.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Nov 2025 12:51:12 -0800 (PST)
Message-ID: <af73cda1-b1a3-4b06-ad70-84f59b0a4527@broadcom.com>
Date: Thu, 6 Nov 2025 12:51:11 -0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] irqchip/irq-bcm7038-l1: Drop unused reg_mask_status()
 function
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Thomas Gleixner
 <tglx@linutronix.de>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20251106155200.337399-2-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20251106155200.337399-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 11/6/25 07:52, Krzysztof Kozlowski wrote:
> reg_mask_status() is not referenced anywhere leading to W=1 warning:
> 
>    irq-bcm7038-l1.c:85:28: error: unused function 'reg_mask_status' [-Werror,-Wunused-function]
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

