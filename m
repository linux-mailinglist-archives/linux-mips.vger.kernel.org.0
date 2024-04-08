Return-Path: <linux-mips+bounces-2614-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A403C89B7A9
	for <lists+linux-mips@lfdr.de>; Mon,  8 Apr 2024 08:34:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5ED3F281516
	for <lists+linux-mips@lfdr.de>; Mon,  8 Apr 2024 06:34:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29457EEA5;
	Mon,  8 Apr 2024 06:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RCbma+kb"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CD15680
	for <linux-mips@vger.kernel.org>; Mon,  8 Apr 2024 06:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712558054; cv=none; b=l747Auc6NVzuUamB1F1tBzd69kGJ/J08FBdlS3kiAiHl7e2plY3F3X1DXW5UEEIcZYYkCYTIJpewNSzJgJQFIx9qzmD7ckbM3fZK+s2XJcVg96Sss0avOUCW7pqoGkinEeEZ1nIhor5p74rHATi15obICSUgTNAct6MBYuhZtKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712558054; c=relaxed/simple;
	bh=InO9y535hmAp+zZGrgC2s8JRJgehKGr1Ign5e90h1os=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sllQNRM8KzVzGhInI301GCkWzlVjtZfoL546fgbJsKYtCL8LbGRPGVeRTJjWMKYJWJy9my5sdsXH/cke+SpfZO+bsuotI3X3kCajBS2yb6ra1mK+XUgiPakJMdbtXl0oqEzz15vGMm61VX0Uz9XQ2tpcLc67lE9YW1vV74aKgDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RCbma+kb; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a51c6e91793so171304166b.0
        for <linux-mips@vger.kernel.org>; Sun, 07 Apr 2024 23:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712558051; x=1713162851; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GUwtvhieMotVAHxF3wc6NLXp0AjuJvjChK7bI4AfjRY=;
        b=RCbma+kbs4Ni4bsRDZ+onRZGZr7t8JEoRGX9LfBuQp1z6lItGyW+WWqq+fIIRXsKwe
         kCXIUih2A8MC5fVDXqBUZkbvyTYO4coxQWnk76quPUheNJ9LTOu2Vb55tbJX0bH9paZ/
         eynYotND/zApbN+3Ie4cJ3CJHtcSafPTppQtBltBr/uOfW8/dK7WvcR5YXLbVMO06dxk
         9DmDfuuPT2M7r90bSvgyU4PjGrSYUElxl2etZaK1ivlPAe7a6HR9klj2eTgABP5qWpWx
         JTMQDn+ixhrdIa47FeI1nXiiY4Cgz/dwcuR0maS37iAEnA77iJXdk8QTIIWoO7478hrI
         C2Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712558051; x=1713162851;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GUwtvhieMotVAHxF3wc6NLXp0AjuJvjChK7bI4AfjRY=;
        b=YgS4cab1xk+NMmsq3x7MOz7otCiaMU32uP3bzbWOoXMB6B/17DX7VXpZLalpMZhfNd
         z0KICEDzcLZddWwp5GMKcRPPffNWwN6eA+A9MT7fjTXJ54bDQyYMbPFd62f7mK4ILeIB
         pNfMe4tsCXPS00wnJDTIAQg/UVygYETlosO7Ky8fvDxkR/WUlAqxsmf1Vm81MdZW2yzJ
         qBK5orf2k352nRYZsXez+tR13EnReVHG2l6GqjWvIDFDvUzIyaUO5krjp9NGc0CM/Eyw
         WG8/TWXQZxP8VkOplnHs99X2sPXGsbGeYH9TgTAefJ9qyvL5qIVZSutC8wu8sQBSl4DQ
         khRg==
X-Gm-Message-State: AOJu0YybToaFZ/1SNfoo/AI19Au/I1QiGyRSAzM/CoZ6mYgpmnwf+csi
	QxWK8m2QtTHkcmJ9/GDVrtusg+n994xNT/e3aqTE3b7iH9vUe0aOXmFBDjTP9JU=
X-Google-Smtp-Source: AGHT+IHG8bE24wXvm47nxKr4eoHH3TtnxjuiPlw7M2h4OqpeEGSygZA6mbIWF6EGaIvJSYizSqvJTA==
X-Received: by 2002:a17:906:f20d:b0:a4e:df0:e9e with SMTP id gt13-20020a170906f20d00b00a4e0df00e9emr6745650ejb.24.1712558050824;
        Sun, 07 Apr 2024 23:34:10 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.144.67])
        by smtp.gmail.com with ESMTPSA id n2-20020a1709062bc200b00a517e505e3bsm3980587ejg.204.2024.04.07.23.34.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Apr 2024 23:34:10 -0700 (PDT)
Message-ID: <8bc35ca3-cd07-4130-952b-448acbd689d5@linaro.org>
Date: Mon, 8 Apr 2024 08:34:08 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MIPS: Guard some macros with __ASSEMBLY__ in asm.h
To: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <20240326-asm-guard-v1-1-fe0c140a5aea@flygoat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240326-asm-guard-v1-1-fe0c140a5aea@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/3/24 12:41, Jiaxun Yang wrote:
> There are some assembly macros with very generic naming
> being defined asm.h. They are clashing with other macros
> from C code.
> 
> Guard them with __ASSEMBLY__ to prevent futher clashes.
> 
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Link: https://lore.kernel.org/linux-mips/8d78894-dd89-9f4d-52bb-1b873c50be9c@linux-m68k.org/
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   arch/mips/include/asm/asm.h | 3 +++
>   1 file changed, 3 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


