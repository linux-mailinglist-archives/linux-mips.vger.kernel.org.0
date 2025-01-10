Return-Path: <linux-mips+bounces-7332-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F58A08990
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jan 2025 09:09:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89A7F188C6F2
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jan 2025 08:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04D38207A2A;
	Fri, 10 Jan 2025 08:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TrMGt9GP"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E2F207A04
	for <linux-mips@vger.kernel.org>; Fri, 10 Jan 2025 08:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736496560; cv=none; b=ezzB3K1JPt3PBqWRMeDl61ae0vCHGZw9RMkNnZxdQXGV5zOJMqn06Rq9f6wzewc1ne6zVyHEX3PPTkDHtN6hwoU/+sXM3rzbHGugW9almljPDpy35CICL7h51AEPKHPbQSA4pe/6xiHpVlpZfPV+MEP+mGjaavlFGSTuxqVBXUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736496560; c=relaxed/simple;
	bh=IjpgBEUSfakvGbfO5qRga1RYeyECZkKl0UxwA3DwtJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FCiLThRfmOhL7wWW2BwVmRZ0ztF1Saqqfcp7xf8YiPS67iHzV/j5KvUodVn4w7W0quAL3f+cjpkz5p9+kl6tHUtGrPJAmSBy+aNTgbWykxuj6msrmBY4ZusZQRk9gQb2iAJFqwapPueGiIOQtubGxnhV2fcD66ghbE146w16FIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TrMGt9GP; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38a8b17d7a7so930056f8f.2
        for <linux-mips@vger.kernel.org>; Fri, 10 Jan 2025 00:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736496556; x=1737101356; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OqK1Xd9dCh52ZFyz9AUWQsX1pTiDP6ZUmws0hqFeVt0=;
        b=TrMGt9GPeyFbXz6YrXXV6w8PZg2wLUo0hZlYYtK3j3vb4oVWuP80Bv1nXhcCSoRJdL
         ysrtgkAISQ5rQQSm5qWdBmc9Id+tglkHi5Sp+L2+82yPVzV5E8OIY8RmHF5uNh7TRYNV
         QJ/6Xx3jzCHRNzsGkamJCoiyLmYs9lpEVztY70FTI2zi+GI3f/nmlinWcSRmepFQDXVz
         61SuUF/ArBIp0JdKXoNDQcBd8Mi3VUnoctOw7ijg78gAZW3rIWdVWKvjtturPfqKO1Nu
         4xLSCCfHAITS+jjwjqjJmRD14YPpX0+7hKnLA3K/HDuYfmxTIdA0MQW1H77kgSHj8q5J
         FzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736496556; x=1737101356;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OqK1Xd9dCh52ZFyz9AUWQsX1pTiDP6ZUmws0hqFeVt0=;
        b=k0gzJuvgoNJi3Esafif/k6XK4z5zVWIj4MgMN0+Y9WxHHfeEUuzbCnuIR8M5iRrHEc
         ux775RB9vS5IJdij20YowggS9wZZZF7Xz6yyA1V4o0FcCle6oR+M/itn2xuyrG9FVhd2
         bC/FGyDAlT/5dReAn20juhs1vT20xmPAyWUQktd9h0k/5PpvUCJaoCXoG50gcEB5Zkkd
         UH7E49pGOKD+8DUwTOTn5kqC6Xm8RFMoNS/36NQYoFYoeJ+x9zFJUh7J/NeIiZHYcbVK
         Gw/KF+REs9FCgWciFcLYdFBS6y9XX3v1d5d60oozNdTwXrQr+rrM6D5LT2SFjbkwXU7F
         Ug4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfZPtX/M7nTzvdz/BvRI1lYWKdV4YEOeepOqYOcyviCGYb7/0DfPghnCmCZa3/gYCvhN16p7wm2ZRP@vger.kernel.org
X-Gm-Message-State: AOJu0YwmD73Ua+atXx8BQmxK2OPyK5syP0XITV3gNBrDKDKPgFhnYiYy
	9Yew2Z9vnv8xKnVZ/Yq91D/oTq1XDVuLyGuO8Bln0XjJvgYvTlkQviKV5UHH02N7ofY0awoBxUX
	XTq0=
X-Gm-Gg: ASbGnctnKm+356fj+rM8tiUoFhBdcK3MxN+lEGQpEmsn7zay/0bZCd1HDGixQPdVU/N
	Jvk85+SRQYsB9EUsqbnf4CYZdZiDM1G0jQ55aZ6Vf0wFTuvGxGI/+svoUZKsT3JklijaI0xHNie
	8MOE/wStgxBpfdXQz8JMcbwm0Kyr6dSnHk8+ICQg8CCB2rfOrZlK6qIzZv/7Fi3+HouV9rEFmN6
	uIppl7/AmeOfKDOAm4W+o6T7htL7C7Qd9cohoxqAB85Cdz6h9Ee7DOhW6MDge6vnTrvFoComJfc
	iolooyTpAASuWz9y/1PnaPQoocY=
X-Google-Smtp-Source: AGHT+IGM+oE6B0mLhX2rFR7hL08R4c0/Vf0BCLVGjzA7FA5vJGzoY05bkb33gzUqmDXYoRivnGPGaw==
X-Received: by 2002:a05:6000:712:b0:385:e8dd:b143 with SMTP id ffacd0b85a97d-38a87306a79mr7919681f8f.19.1736496556503;
        Fri, 10 Jan 2025 00:09:16 -0800 (PST)
Received: from [192.168.1.74] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4b80b2sm3795412f8f.80.2025.01.10.00.09.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 00:09:16 -0800 (PST)
Message-ID: <1a52f5d2-0ded-4768-a582-6aa2f88ce297@linaro.org>
Date: Fri, 10 Jan 2025 09:09:15 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MIPS: traps: Use str_enabled_disabled() in
 parity_protection_init()
To: Thorsten Blum <thorsten.blum@linux.dev>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Huang Pei <huangpei@loongson.cn>,
 Vladimir Kondratiev <vladimir.kondratiev@intel.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250109215524.195008-2-thorsten.blum@linux.dev>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250109215524.195008-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/1/25 22:55, Thorsten Blum wrote:
> Remove hard-coded strings by using the str_enabled_disabled() helper
> function.
> 
> Use pr_info() instead of printk(KERN_INFO) to silence multiple
> checkpatch warnings.
> 
> Suggested-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>   arch/mips/kernel/traps.c | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


