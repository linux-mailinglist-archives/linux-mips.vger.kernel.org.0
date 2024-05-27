Return-Path: <linux-mips+bounces-3330-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4111E8D0011
	for <lists+linux-mips@lfdr.de>; Mon, 27 May 2024 14:32:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9D6F1F23605
	for <lists+linux-mips@lfdr.de>; Mon, 27 May 2024 12:32:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6222315E5C1;
	Mon, 27 May 2024 12:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e705L0vj"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C5138FA6
	for <linux-mips@vger.kernel.org>; Mon, 27 May 2024 12:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716813150; cv=none; b=P5bIFklpVmcsTpIXbaZosVfXROuHJRuh5+wOp14u2QTq+Oy4c2OM14LSedpOJka+KR8JyxpjIGa2UjAU1klv6OerSi2OnCveqLnJMqurvGc+4P2BkyVkpIy0nsMfTJ4otaE4IJeGigPQRvh0+okvoLisnGypNRCJeS4Y8FmIvPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716813150; c=relaxed/simple;
	bh=rnqsOytKGdvFtP7GzndEY/jYWumhHSQsg16lS1MaIfI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=euEj6wKWqniyVfB43C02mXb0+j4FyjdHO6sqMB8MD5wXiMM8el6w09ZI58KDX8X5lIgcSZ+RGstz5+BEhynXl0pzGkV9axPNdixwTmsnBe7BdcYEfrVTLGOMqrFCr0L8scWYpNgUClHKV7aMs3+Wkp2Lb12ZdT8DwIEq09Vuke8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e705L0vj; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-354e0d4db6cso3289768f8f.0
        for <linux-mips@vger.kernel.org>; Mon, 27 May 2024 05:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716813146; x=1717417946; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2LH60MjHH8V3Y/MHRz+sxRspAdqRVMIz1oGtP2AJuC4=;
        b=e705L0vjItbqo7tda6UhsAhtO7hE4FAnybuOCPhRG/hjY9/qiNVqbTjo3yOZ651D2y
         EVQsckLQ17tV1sY0961r+9mkc5eP7RDv6GvUX+70n7z2UUyeoAeV7xAFtgQl7/gOnf6k
         vegqUKEQS0H1bqTtIgmqsFMoqyfhmXrKUhiVw0242+5MkW0SZ14mYdHyuMAnQYAgr/A5
         uIlN9P1uMkgjJ+olbGkOKbq62wZRuSATjduQpcmhIEIl2+q/cow1aFq9UssxP+WmbuSX
         DAMxUMaim8DtjAex5UkFv/PtB6UX1/LZCXbrZ1XSeRBUbQcznj+ulxlLfZw+45cFg+7b
         4lUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716813146; x=1717417946;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2LH60MjHH8V3Y/MHRz+sxRspAdqRVMIz1oGtP2AJuC4=;
        b=I1cGhncMUQi4TINKQWIWswOwUxOYrIsdZQHdQ6yZm/C3roipFOX9CdUmglMIU8nDR1
         L9ZCyscdTs0Yb9Wf3LBdvn2WUF6Qd6alhWNpBdoF6u1UiFFoG4pHgT859NTLYxkal5ux
         v667DpaOT2J5UDfOzpL2jaOlIcTwr6uz1UclatspmZBd88E1wxskr3WWz7lDIPvGqe1a
         zG26n+xPhJwYHkXEIkqFAMH+OC6MjgvWjT7WaJeaBPwtWmz7PLILLnAA9ts9WwwSy8+9
         2SIA1vOJIL02SHj6f3dkMw9/TI3uhSkAJHrclTNbajehsji5yVLufheM07/ka+5oBP6L
         m2Cg==
X-Gm-Message-State: AOJu0Yww5YvTXol5OM1HvpqzGzkciHcjXbhn5RSTL11owXZHNXpjl7LS
	CPOsyj7Ipw0tHQiIEgTxHdB0RH300y0ejxRVlZVNpbBXF5lBSD3oap5zqahU4xs=
X-Google-Smtp-Source: AGHT+IFScL7PwcRWWZzRdhlutLL5PCMA2/UEQrr/FT9eoSRAKDmQ4MrszI5UXOAcIH2ZMj6lZ+4O7A==
X-Received: by 2002:adf:face:0:b0:34e:2a63:8500 with SMTP id ffacd0b85a97d-354f75216d4mr10124015f8f.16.1716813146487;
        Mon, 27 May 2024 05:32:26 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.152.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3557a1c9363sm8973250f8f.72.2024.05.27.05.32.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 May 2024 05:32:26 -0700 (PDT)
Message-ID: <4019c30c-6457-4f9b-adb6-b89ce02e87e5@linaro.org>
Date: Mon, 27 May 2024 14:32:24 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] MIPS: kvm: Declare prototype for
 kvm_init_loongson_ipi
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, Huacai Chen
 <chenhuacai@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-mips@vger.kernel.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240507-loongson64-warnings-v1-0-2cad88344e9e@flygoat.com>
 <20240507-loongson64-warnings-v1-1-2cad88344e9e@flygoat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240507-loongson64-warnings-v1-1-2cad88344e9e@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/5/24 20:51, Jiaxun Yang wrote:
> Declear prototype for kvm_init_loongson_ipi in interrupt.h.
> 
> Fix warning:
> arch/mips/kvm/loongson_ipi.c:190:6: warning: no previous prototype for ‘kvm_init_loongson_ipi’ [-Wmissing-prototypes]
>    190 | void kvm_init_loongson_ipi(struct kvm *kvm)
>        |      ^~~~~~~~~~~~~~~~~~~~~
> 
> Fixes: f21db3090de2 ("KVM: MIPS: Add Loongson-3 Virtual IPI interrupt support")
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   arch/mips/kvm/interrupt.h    | 4 ++++
>   arch/mips/kvm/loongson_ipi.c | 2 ++
>   arch/mips/kvm/mips.c         | 2 --
>   3 files changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


