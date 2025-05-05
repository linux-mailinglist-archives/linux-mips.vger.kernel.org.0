Return-Path: <linux-mips+bounces-8904-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CA3AA91DE
	for <lists+linux-mips@lfdr.de>; Mon,  5 May 2025 13:18:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A21E517743A
	for <lists+linux-mips@lfdr.de>; Mon,  5 May 2025 11:17:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE055205AA3;
	Mon,  5 May 2025 11:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NP3CnStn"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E97204F73
	for <linux-mips@vger.kernel.org>; Mon,  5 May 2025 11:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746443825; cv=none; b=lFLONmSBJbTu5viO4Ei2kR0PMAz1ClYH2eeh5rmSJPVXGN+S5rAh52TOdDN43f7yIUm/XHJkP1s6qfpMBTi1mo94uKuywWqQZNfmMOev2C3tfHDh672sywrGk3hqstAfke/3IH4iNmrBu8ocvwD/a+iT+BkbGPTfZhkGG7jmqKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746443825; c=relaxed/simple;
	bh=V8DkUL7VwKllhb1yUSVxhPaI03yBxle7Crwrri6QItc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lvcxvUXNbpnp8fW6ZEqILkHSVbATe74LK40FkPh9RBr0iLAHIwDlQUKDm+JfDD6hZ5I2BvxN3Bz2kp+qpw2/m9y9te2CTPD7vg+g4mq0Rsvh75A6MOEs31/4CAFHkWjMXufuH6Fn0pm8/2409VM3rqKIStk3eM/U7xsTvrYnldU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NP3CnStn; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so36174345e9.3
        for <linux-mips@vger.kernel.org>; Mon, 05 May 2025 04:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746443822; x=1747048622; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PR/1TFPITj+MSR2NV1inwmG355HiaGH8G5lNmd8tBP4=;
        b=NP3CnStn9ST1MXoLK7QiNjzjzmJkP85XVE+dHc7mAK8fde4pc2IUf3SKdPgl+fheC7
         /LPbKVqF9GN3f2S0RIUq8f9AXGbVza4ErSOIhVL57ycakTBwv8ExZG2zSXaygUtWDigA
         otEID9tUlcdmlCtvRPXOuW2GssXqzmfBBMGoMQpJqmc8VOgbSj2s6FabMQfG/NfA9n/X
         hNUYlrHriGU05a29UI6IFtBvpAtNJdgr7QWKi0mxv4CmgnFt3hZ7lvzdS4MIDzUqnCKf
         f8VCPG4vusvl2MFRSGlFKBlfJiJjtOCEmUPedYlKxSO0pTGVnH5Nqgf60EeZTJshHev/
         My1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746443822; x=1747048622;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PR/1TFPITj+MSR2NV1inwmG355HiaGH8G5lNmd8tBP4=;
        b=armJag6S7T3Yk3StJP8idDNPh/aEX4wzRkP/nx9g+Dxun/0Pr9HwQoC+s1PP6FCfed
         LooWFASFyCBi2dbSs5LLYZbjQrMxC8d1qIILJHLyh0Q/woByFKjN/7eermMrbCn8id/F
         v7qNjE+Gsi0D3lBwq2Q7MR4neqkztU2dl3E7QMU6MudIM3JSodAeheIiTfeJ7ogQu9+A
         df+H3IGj83mn6nM8MCfPOhdPFGO2zLM1qtEWSwKcQAGUqvzIoWr4wjt+RLFqZRFr0lBU
         eSIOWCZgx3eupwr2URezTpRgs+3E/JWh9tb4WGjOW0KaOXOFS46rLgtUGLbCjjFZf7G0
         X5JA==
X-Forwarded-Encrypted: i=1; AJvYcCXN4AwDcsz3V+WNlkgskBLaFebu2dtnQgr1nNzG2qMPqfo/JS72Y995DMswoRJUSsn8x1KK3BsMhcKQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzeylKrqkzbUscEAaeaiyoO2/jHabw1036C44V9BC//UmE/T1Rw
	21CmXgkE4tf/ndoTVTBrtOOmpSI5u/jDgMxzqSFBiW2gUuQ9nUEG34wJltz4iJo=
X-Gm-Gg: ASbGncuQj5GfY+TCKQkhWEupWdbHXdzwLTdNIGceNBqmjt7VF2Lx7ShsXquLfgf2gu0
	xFZgYyxCWluxwOx9hXBivuEMdvinpC74X8emQxGAqSUfl9Q/37xTHoLWyR/VshuAB9LRh4O28Vg
	L59T7ruC4SuDoqWZwVtT5+3xGUiV6BBUWkfQ/FbC2vYEawv9n54XiWjsTEa35Gr4rvV6H5ncwrE
	dI/1a+p2BAGoCCGtvstTr9jHeAuRyOE80I7sw6IEgexiC0WJDIBGi+LrY8hrLyTqfpXu10eTqwJ
	h8Z5mUrhHHdiD8CSYTB13GTg+nGdiY4WUtFbjqueCjs6smSLabz0v4INVBJsCAX4BLdto3+KeeQ
	=
X-Google-Smtp-Source: AGHT+IFXGyrq6AF4eSKBqMr0ZHG5ODbF+SMMKNV3Hl/UrsQRAKrSSv09aRoM2DkTJis6kpOovgBnAg==
X-Received: by 2002:a05:600c:83cd:b0:43c:fcb1:528a with SMTP id 5b1f17b1804b1-441c48aa481mr62039405e9.6.1746443821195;
        Mon, 05 May 2025 04:17:01 -0700 (PDT)
Received: from [10.194.152.213] (71.86.95.79.rev.sfr.net. [79.95.86.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b20c3fsm177760595e9.28.2025.05.05.04.16.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 04:17:00 -0700 (PDT)
Message-ID: <9b93c67c-b163-4026-be7a-a8761a0f21f0@linaro.org>
Date: Mon, 5 May 2025 13:16:58 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/7] dt-bindings: vendor-prefixes: Add SmartFiber
To: Caleb James DeLisle <cjd@cjdns.fr>, linux-mips@vger.kernel.org
Cc: tglx@linutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, tsbogend@alpha.franken.de, daniel.lezcano@linaro.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.larsson@genexis.eu, linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250430133433.22222-1-cjd@cjdns.fr>
 <20250430133433.22222-6-cjd@cjdns.fr>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250430133433.22222-6-cjd@cjdns.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/4/25 15:34, Caleb James DeLisle wrote:
> Add "smartfiber" vendor prefix for manufactorer of EcoNet based boards.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


