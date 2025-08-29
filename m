Return-Path: <linux-mips+bounces-10854-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B5121B3C0D1
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 18:33:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FA4116BE09
	for <lists+linux-mips@lfdr.de>; Fri, 29 Aug 2025 16:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9BB1320CDA;
	Fri, 29 Aug 2025 16:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="PjP3Fdup"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-io1-f97.google.com (mail-io1-f97.google.com [209.85.166.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D36429E0FF
	for <linux-mips@vger.kernel.org>; Fri, 29 Aug 2025 16:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756485117; cv=none; b=pSKomITH0T0onb/Zjz7SvXyvcDLh6nNBp+o2pUPWO9DMOib1+ayqA1+WqZ/CnmcmxmwZNfHftBIc5R1ZcHrYzUs+8KCN2OFaULgbyBNEKaj3585LFXdR3mZmfKl/DSd/D1Kqf605kx2vcEXPOBW3kJnTLmftikKi673PO+tTqBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756485117; c=relaxed/simple;
	bh=ieabnZMrlcZvydqsa6hfVj58aHEfh4wULnYXh7hZVI4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fhp3mkRpVH0KAxaKHYwMueyCQ6ssUirCaRSCIcSqvKJ+kIhinYSuk3611nW6eOO8N9IzbepLdoHYZJvCTTHjk/foYwLkDlv3LccplhXYFQ24JMnBctTLHZyVdyg7FGBTrVKdejflRr3fwyH5Sb4bCXB6CABQ4iHVGZUXDyDMa5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=PjP3Fdup; arc=none smtp.client-ip=209.85.166.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-io1-f97.google.com with SMTP id ca18e2360f4ac-88428b19ea9so113859139f.0
        for <linux-mips@vger.kernel.org>; Fri, 29 Aug 2025 09:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756485115; x=1757089915;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q7yfMSKVog9zrx0IzSOm5CThV+YrzQFJbwE5ZBoSV/E=;
        b=jtZLJumNg5ZlEpSqejuh/DGPF5/7YF6MBSzEL/QnWy6E6JQYjO8DT7UpPgYK4e5xhN
         ChD2uHtx5Q5WXCGIiSNaclYvK86Qom7huIQlEZM1V3+YV1B8W4yjVAc1NiPaZQTrdn/g
         iW+Yw6CrTLrJHOqIsChHxYoZVnmVa7O4tHiL84AuMNetBdqfMvpX8h9Fx8JqncTnxZu9
         4r1/U+k9JOdhpFsvRA8MQ3f+dkt8MO79I6Zhp7XGrV+wpSF9c4tevEiqAqgb+PshiDH+
         k1BxhxyLoXlMpXUwuERAGCuShLHi8ZGq1G0f+kIpEBqZ/TVO3YczLhJUQJcxE5e3gCtI
         YBHA==
X-Gm-Message-State: AOJu0Yw2wAH3D0mr0GJQfFbZM47bli/FkTqLmhRoIRDUbfxVJGXz/41H
	OFR4/gCXdCztIBWRnr9tz+2D98jAKzhilLIUF4DgJ3xywGPx5gtSJ75NkiI0KrbPq5l+tlGrSJi
	NG0FRZqXylDIoh0X7UMTkmxnG92czf8aC7rRBNT94YtBvJ4Jx5rWoTM9Fw6L8KvUoRWlNwFirca
	wrDO7agNl2ZIN8HiLS//G2IKtdOZiRtO6gWZPxlZwaeGInOBpyX0QZ6xNxOXmwWI0/5S+bPUvcj
	gUl9firKdZMGo4idP1hhA==
X-Gm-Gg: ASbGncvgJyqAPRIVn73v3XK0LjG/bU5NKwbA/KKtoCR9w6aYfeso8lb6L4eEAbGhVHK
	iRywuPa3qhSsOCVaGqBpHTxMYw0SM5G/zqyA3wwLzgJK6bYbCYBrpGi3ZiOLpBlJwQREUsFLORK
	0A3e86j5BhQr1FC1Cv84E9GzoCMW6zS7nV3BA9/jry3XJ5SGrpp1LZe7gDswUvGsD9IErWMZiFX
	ru5JPAXAIs83i/85hXkKePXZ4cPmxWV+4h5oIxytIn4Gh/qfBOi2tpycz1YfzXFbbzA9ns5C7mn
	9aEgNeYo6DSTpjY7eGfyrnQ7Yc44dWReRk1Iq7P5MqIyn+z19cpelwNDObINNY6HosN9IR0h1zq
	xnzcgMA5zwY+vyf+sr0cJ+HZwWh+rS5RrjI2to4VgOmR6SlYHxOah+VTs48oxY6uUU8EMgKFphD
	zdSsGo
X-Google-Smtp-Source: AGHT+IF3tpaEZ2EWBJlTi3453QLE89zJKT1poclewsLFvT0faGmpPPoj2HZ0Q3gNW9J6rFCezDTSmJj91DvG
X-Received: by 2002:a05:6e02:2219:b0:3e5:8344:49ed with SMTP id e9e14a558f8ab-3ef08858a97mr188083125ab.1.1756485114912;
        Fri, 29 Aug 2025 09:31:54 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-14.dlp.protect.broadcom.com. [144.49.247.14])
        by smtp-relay.gmail.com with ESMTPS id 8926c6da1cb9f-50d7c0773a5sm140495173.43.2025.08.29.09.31.54
        for <linux-mips@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 29 Aug 2025 09:31:54 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7e86f8f27e1so518337285a.0
        for <linux-mips@vger.kernel.org>; Fri, 29 Aug 2025 09:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1756485113; x=1757089913; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=q7yfMSKVog9zrx0IzSOm5CThV+YrzQFJbwE5ZBoSV/E=;
        b=PjP3FdupTScaW5LFAAntlnz7mZwKVYybP9e+zZcFtY0kZXvB5OPMMBhanPI/S5hlOZ
         qLONMHS8Vbt5ZKlE/epnKv+bxnsv00M5PSf0hHg35sSSAV+BCSHq6EL9Sg1/3Ym+6XOQ
         RQTTKgtNX1N7gn9y7VvU+dW42wyLU4ZsH+Ey8=
X-Received: by 2002:a05:620a:46ab:b0:7f0:5524:477b with SMTP id af79cd13be357-7f58da36412mr1648510985a.3.1756485112956;
        Fri, 29 Aug 2025 09:31:52 -0700 (PDT)
X-Received: by 2002:a05:620a:46ab:b0:7f0:5524:477b with SMTP id af79cd13be357-7f58da36412mr1648503985a.3.1756485112272;
        Fri, 29 Aug 2025 09:31:52 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7fcbc17487bsm142438285a.27.2025.08.29.09.31.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Aug 2025 09:31:51 -0700 (PDT)
Message-ID: <c76ab4d7-37aa-4d99-888d-e0762deb2342@broadcom.com>
Date: Fri, 29 Aug 2025 09:31:48 -0700
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] brcmstb-memc-ddr binding updates for MIPS boards
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mips@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 "open list:MEMORY CONTROLLER DRIVERS" <linux-kernel@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
References: <20250729205213.3392481-1-florian.fainelli@broadcom.com>
 <aLF_DEu6YNSCSRxu@alpha.franken.de>
 <dcb0c746-62ed-48f6-9247-03bdf36c6e92@kernel.org>
 <60e55e14-7712-4f82-93af-6751009327fd@kernel.org>
 <aLHI7arPfcMDEhzM@alpha.franken.de>
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
In-Reply-To: <aLHI7arPfcMDEhzM@alpha.franken.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 8/29/25 08:36, Thomas Bogendoerfer wrote:
> On Fri, Aug 29, 2025 at 12:39:00PM +0200, Krzysztof Kozlowski wrote:
>> On 29/08/2025 12:37, Krzysztof Kozlowski wrote:
>>> On 29/08/2025 12:21, Thomas Bogendoerfer wrote:
>>>> On Tue, Jul 29, 2025 at 01:52:11PM -0700, Florian Fainelli wrote:
>>>>> This patch series updates the MIPS-based Broadcom STB chips to use a
>>>>> proper compatible string for their memory controller node(s) after
>>>>> 501be7cecec9 ("dt-bindings: memory-controller: Define fallback
>>>>> compatible").
>>>>>
>>>>> Florian Fainelli (2):
>>>>>    dt-bindings: memory: Update brcmstb-memc-ddr binding with older chips
>>>>>    MIPS: BMIPS: Properly define memory controller compatible
>>>>>
>>>>>   .../bindings/memory-controllers/brcm,brcmstb-memc-ddr.yaml  | 4 ++++
>>>>>   arch/mips/boot/dts/brcm/bcm7346.dtsi                        | 3 ++-
>>>>>   arch/mips/boot/dts/brcm/bcm7360.dtsi                        | 3 ++-
>>>>>   arch/mips/boot/dts/brcm/bcm7362.dtsi                        | 3 ++-
>>>>>   arch/mips/boot/dts/brcm/bcm7425.dtsi                        | 6 ++++--
>>>>>   arch/mips/boot/dts/brcm/bcm7435.dtsi                        | 6 ++++--
>>>>>   6 files changed, 18 insertions(+), 7 deletions(-)
>>>>
>>>> series applied to mips-next.
>>>
>>> Why entire series? You were notified two weeks ago that I already took
>>> the driver subsystem patch.
> 
> I haven't got a mail in this thread from you about taking the first patch.

That is curious, it was in response to patch #1 and you were copied:

https://lore.kernel.org/all/175508140104.40429.8279921018476182386.b4-ty@linaro.org/

> 
>> ...and you do not have even ack from memory-controllers for that patch.
> 
> sorry, I'll drop the patch then.

Thanks!
-- 
Florian

