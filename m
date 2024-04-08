Return-Path: <linux-mips+bounces-2619-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B06A89B7E3
	for <lists+linux-mips@lfdr.de>; Mon,  8 Apr 2024 08:48:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EEBB61F2158E
	for <lists+linux-mips@lfdr.de>; Mon,  8 Apr 2024 06:48:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15CB525622;
	Mon,  8 Apr 2024 06:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q/xJHQc1"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475FC25570
	for <linux-mips@vger.kernel.org>; Mon,  8 Apr 2024 06:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712558911; cv=none; b=hpSg87iesQL8sRTBdb6WHN+n0a4t+AUeJZP3BmTKbzOlvg2aimkLWJ60utLP7tI8K/5l9qfyrnN2u34XL8mli6xWkKDSWGurL5VM9Djtl5zx4mWWVaGSSeXxqsbJxtlFHojROgAUAvN5NkvTRoWfrNHeSqax1V/KeOMpQAWWypY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712558911; c=relaxed/simple;
	bh=OU1pRHykJNQWPgpCgYdU2lGmCV6FTUuwq9rQvP2sYhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MjtVoGs1qs9JVpNduUrWgNl8Ne7IYmxvNLzTmaIWyFHZww8FQNxdQ+sCvjxZ9Cxe+2fjOUD3pRg15hiexHsEAz2NJaWSI04wm3WRzh28LPbh9XW1mUK6Tk+4SwKQ914roXIPLIfEi3wCTlHA2po53vzAOo2QYE+pPz/0wyq19V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q/xJHQc1; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-416422e2acbso5867765e9.1
        for <linux-mips@vger.kernel.org>; Sun, 07 Apr 2024 23:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712558907; x=1713163707; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tuU5HrPX6/Kq0AAOmjh7ZjsMPB5kwQSkhaeRztpCm5k=;
        b=q/xJHQc1QuF0fTHECrNqbFcNdD/Rlu3XJU4h9/3kGer1JsIayYhnZx6KA7kAKi3g91
         HFnkV5NpaFYn2IQLs5F5qZd+jK1kRvcdwdKnOUvRpm56sHnbZLwtMTr5MTrr8TDBi4m5
         v7JNh3NEDBHrkcB9Hr93cML8a3yqY2lwGxbTNGGJDlQQoQKSDU3rWdLTyP6X6UHQc1Pu
         8k9FgTXcVHlV68nM177vHNaYrlpK5Q1QnyASZFIg65dp3/rp5DhldFvYrXyQOr6ju3Wq
         cTiIP/gPKAcqP0mTZGViYR9SRNP2mLYKUyrx3MFSaZPTH0VEbhmxL5JB/54I0NiJselF
         gGYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712558907; x=1713163707;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tuU5HrPX6/Kq0AAOmjh7ZjsMPB5kwQSkhaeRztpCm5k=;
        b=YTn9xSVN7/whdpfSw/vc4gkuj9UQlYkCPtopcfVzZjhfo+nr6J0POs6S+HYXLcWEqQ
         m9KV07Q4O/pcFUnLUuQxZPG6K3keFb5SKYyoOyiX1n+4a0lawt9JNDNFeG863SY4QHFJ
         XMy81IXImUzKnxcMz6GzqKwTmgiQXSA4aV0xqpgqwMmKKT+hv/FkMTsrI7Xt059zjdkJ
         Yf/6qz2oV82cHLRIGAza9zt8yiJMF52kqRln+/ofA/UWpzXhyq0jML/grypxBi4U8oLe
         vB4mI9tzUgMJMuiMGJ9jt/4OwYJuRs/FkkW9igMr0HVt9wYmfvWpQcpNVUKgqe4Dphi5
         WRNg==
X-Gm-Message-State: AOJu0YxwVhMSx2kpJrfqdbTWpXgHwfWkdjP/4TpPmRPVozrYS9j1w1Wq
	OtirrBFTFhm8DKK/+QGEn7RB1Nb8D3JC7Sux5AWlA5FPud5kL4RrJ5wevpjq1XHP8JLAcsDdT5e
	k
X-Google-Smtp-Source: AGHT+IFuDq+ccGHmbG7fv3EvroLMgrV6kfESSmdPeTxgVIpyPWXvrl+BI/YV5UJyMZ/ex2qQ/EZhNw==
X-Received: by 2002:a5d:64ea:0:b0:345:6010:6343 with SMTP id g10-20020a5d64ea000000b0034560106343mr4165761wri.6.1712558907695;
        Sun, 07 Apr 2024 23:48:27 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.144.67])
        by smtp.gmail.com with ESMTPSA id d6-20020a056000114600b003456c693fa4sm3915426wrx.93.2024.04.07.23.48.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Apr 2024 23:48:27 -0700 (PDT)
Message-ID: <2654580f-aeac-45d9-b838-8d6cf8605bdc@linaro.org>
Date: Mon, 8 Apr 2024 08:48:26 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/9] MIPS: asm: Move strings to .rodata.str section
To: Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240326-mips_debug_ll-v2-0-b64abc76f2a1@flygoat.com>
 <20240326-mips_debug_ll-v2-1-b64abc76f2a1@flygoat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240326-mips_debug_ll-v2-1-b64abc76f2a1@flygoat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 26/3/24 21:35, Jiaxun Yang wrote:
> Well, they are read only.
> 
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
>   arch/mips/include/asm/asm.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/mips/include/asm/asm.h b/arch/mips/include/asm/asm.h
> index 2e99450f4228..05a158a8920c 100644
> --- a/arch/mips/include/asm/asm.h
> +++ b/arch/mips/include/asm/asm.h
> @@ -94,7 +94,7 @@ symbol:		.insn
>   symbol		=	value
>   
>   #define TEXT(msg)					\
> -		.pushsection .data;			\
> +		.pushsection .rodata.str;			\

Nitpicking, \ is now misaligned.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

>   8:		.asciiz msg;				\
>   		.popsection;
>   
> 


