Return-Path: <linux-mips+bounces-2968-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3D78B7602
	for <lists+linux-mips@lfdr.de>; Tue, 30 Apr 2024 14:43:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED37B1C21F53
	for <lists+linux-mips@lfdr.de>; Tue, 30 Apr 2024 12:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 631DC17109E;
	Tue, 30 Apr 2024 12:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zenRqpyt"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCCC129E8A
	for <linux-mips@vger.kernel.org>; Tue, 30 Apr 2024 12:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714481026; cv=none; b=ofZMO61QVTAvRHZjdo3ysyLF+m33LJODgtRE9eoR5iv84o9AjTceoiaBI1t/lAT8cAO71R1zvDGMqkFt6W5UuBRUpgsLVnYntihJRxtyFHOfFcuCwnyBFU6jaR3k9zG1cWrJtoVtHi2H1AHIxi2OppMS9kJwfdcc3aPktYYLRns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714481026; c=relaxed/simple;
	bh=VRRnaPTgYijOUmzlvv2SBU8fJEkG0dJpXrbLMcP8Rek=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oykltl/kUKatdRfL9lWQ3WP7BZyK4+Wru8z/ugmE8gHGu9ZYAtdOtbNhNcfBWf7W3QaCzuQIvcvSP/5pXx1PxKaWswWLUFu7fsO7tf8ylVOUuZVzHNVGquHi7GuI6D2saEQco90o2ZYhFkvNnPDbwruNpwTuzKopEsCLUy043Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zenRqpyt; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-57255e89facso4977237a12.2
        for <linux-mips@vger.kernel.org>; Tue, 30 Apr 2024 05:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714481022; x=1715085822; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z2cfWtBAsXqglGUC0FXhyb0s4Cp7D8stHYMoBK9Lwj4=;
        b=zenRqpyt06LFArtaqoHAbn+vfmoaXFEEzxcFKcHCvHXmFRhYmNVfq7cWSQYybNVVlT
         dlTSMsEjSmpI7QrtvKxvKfhyAmBS/N8YEjrovphUWFRuafcAoie+hbFBpesZHedIn+/l
         /Fw+EgZgGOXUQJQV4u+Q4+TkJlq7JCaJnj+BXiCiGto5BVEZaQIBy5RwLmew73BirDh0
         nIIjNhdokLgntSyHQFiKHge6nTtHGeBsUiyKGvgNMKuA/mcjzSwgoxKI4i3D+tf8i+pm
         87jHuT8peg79BqpGiXSceql74+TXzYKRTRSSftMr3CMRZsCUn5sbrjzB7f6gLyHt2Je6
         r3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714481022; x=1715085822;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z2cfWtBAsXqglGUC0FXhyb0s4Cp7D8stHYMoBK9Lwj4=;
        b=opXPPIPPJb3lDtP+pmDWcabiU+6rze4JSMKBoBcNp4LHNfSvQI0nYsSqQwzrDTeKV+
         RoCIEyw8Ow8lLwCmDESIAPv0JOiUrdJc8R00ns5m5DBpzPwXi1QjDgGCqYbSTsvZpA8W
         kxGbfOAw44urPJbvuhxpUm3sI2WawoPi+0JHp07z0LEmsQv7v/KSVxZHuXlIzZG3uckr
         PTNW5xNl3frSropR0LABkNYQVqNVpSthjzV1ES4/Y4fp3DGXcrx5dbD7hKzdD3WCmnbh
         oiLIeByGqeT1wxjg6jQU/cjSdLR+pw8PUUGkCv0MyhwC4W69BwDpuFb6n4yckk0gypdj
         lvBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXroL7EkBSwBd6n7BodPeLgDdZbJH2g2mg7S1ooC8i3gV28G57lH1B/tX1UAJn0sW0wnNiBk2Sczw1Dw+5XUzPQIzselxyq6PtBSA==
X-Gm-Message-State: AOJu0YyOTHNS28d/CkbIV5ldnhPCHI1Oxw913LbZQm2RlXEA4tiTC+f+
	o/QZDKLpF919P1izqSKz1Ui7BRPmkf7RHxufFgpr6gJZ0sL4e5mUq+zy2QLb30g=
X-Google-Smtp-Source: AGHT+IGKnsEjYbVO9tsQMU0q//NW8easf6LR39ruZ3uVz0sbWxIo09F61ggnl/AGlRz7WlJcdeQEHg==
X-Received: by 2002:a17:906:b00d:b0:a55:5ee3:3c80 with SMTP id v13-20020a170906b00d00b00a555ee33c80mr7366326ejy.29.1714481022554;
        Tue, 30 Apr 2024 05:43:42 -0700 (PDT)
Received: from [192.168.69.100] (mab78-h01-176-184-55-179.dsl.sta.abo.bbox.fr. [176.184.55.179])
        by smtp.gmail.com with ESMTPSA id h20-20020a170906591400b00a51d3785c7bsm15006034ejq.196.2024.04.30.05.43.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Apr 2024 05:43:42 -0700 (PDT)
Message-ID: <85cfd4f4-ce6f-4c38-8c51-25c72e3ffa9f@linaro.org>
Date: Tue, 30 Apr 2024 14:43:40 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/15] i2c: jz4780: use 'time_left' variable with
 wait_for_completion_timeout()
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
Cc: Paul Cercueil <paul@crapouillou.net>, Andi Shyti <andi.shyti@kernel.org>,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240427203611.3750-1-wsa+renesas@sang-engineering.com>
 <20240427203611.3750-12-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240427203611.3750-12-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 27/4/24 22:36, Wolfram Sang wrote:
> There is a confusing pattern in the kernel to use a variable named 'timeout' to
> store the result of wait_for_completion_timeout() causing patterns like:
> 
> 	timeout = wait_for_completion_timeout(...)
> 	if (!timeout) return -ETIMEDOUT;
> 
> with all kinds of permutations. Use 'time_left' as a variable to make the code
> self explaining.
> 
> Fix to the proper variable type 'unsigned long' while here.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>   drivers/i2c/busses/i2c-jz4780.c | 22 +++++++++++-----------
>   1 file changed, 11 insertions(+), 11 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


