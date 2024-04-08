Return-Path: <linux-mips+bounces-2621-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E31789B7FE
	for <lists+linux-mips@lfdr.de>; Mon,  8 Apr 2024 08:54:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0C6EBB20FEC
	for <lists+linux-mips@lfdr.de>; Mon,  8 Apr 2024 06:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1565F14294;
	Mon,  8 Apr 2024 06:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f5ZDvmqU"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4406E290E
	for <linux-mips@vger.kernel.org>; Mon,  8 Apr 2024 06:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712559285; cv=none; b=QcEagMjkZQy/JFAVhatnJseBGsdJb/WZUVgooW7zO3Kpctp7AKFLxf2Q+wFVsesAKIzB/tqQ1z1U3BFikRne3qhpSBXJe14MCba09FUTf/FDyyYHLaIV4jburKc83EfTHBbXko2LDfGgn+MbtmjNwyrtnOEHQe2FsGSJkKi/+GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712559285; c=relaxed/simple;
	bh=qm03lHmFI1xcK+cNdIKBr2ATKotjq6FHeowyvmgNHaE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PYpHR1FWcwtZgQhuyp+3J/ZZYLliIGG2ozrvYeJKO5LYQd2NX6ZP/eqr5nwxPAi2dxwddA+HhFLkrAXfwBxlOZYYtYNvd2w75y4BQcCu068QOfxnnffOfKsVuS44HEzcY6iOGfYBucvD3i3fpgkJOJUmPf5XU4sdjaKZBYJD5NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f5ZDvmqU; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-56e2c1650d8so2425816a12.0
        for <linux-mips@vger.kernel.org>; Sun, 07 Apr 2024 23:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712559281; x=1713164081; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OGVU0zumhq+/gvF76np3l2/T58w0C0njAfUIJ9qVLfo=;
        b=f5ZDvmqUoMm23VjoV9vye+haaBWYL2bVq34fO7075UZbCgWYWkSEfqyQUiAVVtzJJk
         EPOn2MqukpEmlIM6NbA3Uc0B5H2CtK46dDE/ckYZLMSUfPB76jtmzfuGEFd+PjFKOft3
         7slZiGEYJ2x5zVf/8vRUWmvDtzSODgokHUS0drM8OCUexknS5hmj61wBIHEeOmEdMHk+
         6OiOt2pIoeTdbaVi5OTGwJaqKZPtvqjOB3nGGtf64JyelA6qsapFdUnZTa8fjy8Z54Rf
         aR+CL5YxYZEZpAJt2ZJTdrk4Z5Pk5jDj/0LWRf3n1JxjGUkQbqIWkpNjGcOK92sNcWRl
         VqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712559281; x=1713164081;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OGVU0zumhq+/gvF76np3l2/T58w0C0njAfUIJ9qVLfo=;
        b=IlWZeawola9XzF2wQW6t/DLsXiVKPSifLrGsjwKeSbUJNu2yITnjr+GUZT+zpjdmL8
         rNXXUv8dsc2MBcS9DSCu9i09pKvhVebyOCmnorXwI61+tw1kCVMRdZLO+s43ofS1LvLS
         8NTDQj9ZTCjnnQhuBwp/dKosoG04L5ej9ANSRghRqaFIkDF2QXzC4+DrMqHBXIxYbEUE
         nSMMZyshqAFpLpo2J57zg/Rql2sOK93IhJ3ThFR2NeyED8qzfPaaFNEN+4J2dYY1MfoV
         aJp67tdn9nrlVLOwkTtXmTCQw8YXuq/NpJRUUYutIeCsHK/LBD+uxx5I3zwoNNI0ypAp
         0NbA==
X-Forwarded-Encrypted: i=1; AJvYcCUZHEro2YCYXiOrrj/oizpS0Q2I9b9+G6eAhTcfjcnxzutBymvCpcKIPgKMPVkPsf+02FksbblG9+fI1mXLteae4YQRVH17XY2jDQ==
X-Gm-Message-State: AOJu0YySpJJrx93mQsIJtROPIFFWU9oCuxRdJ5+nDEhgXrjkqpID4STO
	2ME9et+dmvXaa4oG1pVg52ojEpbW6o75bLL07BEUPLhrCAfnJ+5ypCKcljt694M=
X-Google-Smtp-Source: AGHT+IHOa5FbqHEASuTOAQR2Zono0IAeTOFZiu/u3C2zjyDhXpZ4s1DcZc5+wkN+hqMKHaOp2j2TGw==
X-Received: by 2002:a50:951c:0:b0:568:32cc:f808 with SMTP id u28-20020a50951c000000b0056832ccf808mr5275627eda.15.1712559281633;
        Sun, 07 Apr 2024 23:54:41 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.144.67])
        by smtp.gmail.com with ESMTPSA id w17-20020aa7da51000000b0056e66f1fe9bsm356960eds.23.2024.04.07.23.54.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Apr 2024 23:54:41 -0700 (PDT)
Message-ID: <c2877dde-346d-462b-8980-3d42d28345e2@linaro.org>
Date: Mon, 8 Apr 2024 08:54:39 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MIPS: BCM47XX: Declare early_tlb_init() static
To: Yongzhen Zhang <zhangyongzhen@kylinos.cn>, hauke@hauke-m.de
Cc: zajec5@gmail.com, tsbogend@alpha.franken.de, linux-mips@vger.kernel.org
References: <20240315025235.182866-1-zhangyongzhen@kylinos.cn>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240315025235.182866-1-zhangyongzhen@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 15/3/24 03:52, Yongzhen Zhang wrote:
> early_tlb_init() was local to file but not declared static,
> leading to error:
> 
> arch/mips/bcm47xx/prom.c:126:6: error: no previous prototype for ‘early_tlb_init’ [-Werror=missing-prototypes]
>    126 | void early_tlb_init(void)
>        |      ^~~~~~~~~~~~~~
> 
> Signed-off-by: Yongzhen Zhang <zhangyongzhen@kylinos.cn>
> ---
>   arch/mips/bcm47xx/prom.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


