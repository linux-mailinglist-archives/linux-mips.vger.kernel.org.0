Return-Path: <linux-mips+bounces-8905-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 94300AA91EB
	for <lists+linux-mips@lfdr.de>; Mon,  5 May 2025 13:18:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14FC3177702
	for <lists+linux-mips@lfdr.de>; Mon,  5 May 2025 11:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C0A62040A7;
	Mon,  5 May 2025 11:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N1RSxx8v"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F093183098
	for <linux-mips@vger.kernel.org>; Mon,  5 May 2025 11:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746443884; cv=none; b=qIwKJcMs8f6LYnwqTNBO6jqb+jNSKtkpZFXs5cV/phlI028p+mAM35fuUWoqZa/+3ah0rRmQjWElyfwVanIs4oLYm1O0T9wJRehlb4yVDOiL4uEXvT/hrWCcX3vUhMOE7VRH1eRwZnD4ZmylNqgWuWv26kCpb+rYGwJ+/ol8SWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746443884; c=relaxed/simple;
	bh=y1har2ncqSYeMcbNF3xPx7v4qVPXDkt+yqHZ2rV1WIw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qWkGu0QRZ6ozYTsiaY2png27VDFAXWmh9p9vp2VNGbWX1NLzzeWBMjA7sydVl4PsmG6DcISQdThUAOSKySJabi88S/NQipSwrbf/u7MYoQag42ZWa2MZx53HOObz0/J5ilWEPml/mAAUQwkJQwWLoNebvMtMEkZ6s/+JyXfTO0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=fail smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N1RSxx8v; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so23579945e9.0
        for <linux-mips@vger.kernel.org>; Mon, 05 May 2025 04:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746443880; x=1747048680; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MSIHoJjmQEmR3SwhanBXvMF/GyBvUaOcIuvCYJy1q/g=;
        b=N1RSxx8vLQBckQER05uOQZhi4vpPHEjHfdPu7EwavZSILPhuPkRoB87Dc9Fyu7bIMq
         YtB0cese4w6FW14MbGiqe8hZk7OwQpneyxXFElsiwDgJ8zsDtv1PDHZCqfYUIO0CwCJO
         75FvfVHYILmMdAt2DS5I0jfA6PDzOhIy4c+TxKptKFDlSc4+6TarpYadmRy2Ib3engx9
         yaSHFAb7Zrm+iujx1Da98Bta29e9T54KnO/RwxekVVcuqpdXaA98FL0G866POoTz4Ols
         pPPFEnJQu9lS/iTKzajLpK9JXQ6ftNlcI2sGW9jqhn51cDra1TRVGeXL0s6QF8Co/Sjp
         oooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746443880; x=1747048680;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MSIHoJjmQEmR3SwhanBXvMF/GyBvUaOcIuvCYJy1q/g=;
        b=lj5xIZ4hDnViZK/Q2DZWQjrdthMAKZkbQD3SFsFyt6rwGCWl0pOXqKSy6zQ221/9B3
         7TnDEX54Oqkl6T1YxgnNl28L/2pBx8c881d8+pOUcJS482q0H6MPMPbW7UI+ogLacjpR
         FxjotsMzQkyQcDAGj5WZASF6C1FZ4t3TwaYubvzaZdanxi6i6cplWwEHEX5GOBidwrm/
         cDqZfwKThi347BmzD/Ixu15YvQno7OOjuUG8dY0ehc25uN6MV+oK9IgyyqxAAErt9zqw
         SuObh/XkhFAsrPifBxFS9/soRPyj0xhYh6C8Et0xq9rnFaos3368zz3LqYIld9G8Ou+c
         vlhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWHuPdAfHNCvjQUph1yDoZNtJ9knhvO+VjcEjPU0IzW5ukSxvpQMU1lEEOQmdguBtSZdlUqZ72fCjz4@vger.kernel.org
X-Gm-Message-State: AOJu0YzEe1Iv8hlzW2JW0LbULiI7EdirQQbK5ScwlCJPrt2l0EoZPSPy
	EQKBe18eSyCE/m1aRd2fmLVeEF9AMoLIU5A+BD27skIWqs5MsB1m1KxhnO5HTSY=
X-Gm-Gg: ASbGnctnDI1rkPprr5Bo/qfnSDptX+sasi0k5yD8X36cFYyu1KcjwCSpFLqnNiRhC2S
	OySzuG9eNOrckBcQNemsNdWAL2PADOpeOPiIFakazvpq7eV9vY97xvPI5/kPrAft4h4qaf1f+lI
	GIpAgwdVeTyKh6Euw/C2OGGCxT3Yip4PZplg1l/2V9+PE4vtWOA3X9cKuuI9x0iravTUEyGC6dK
	nvEA//1/bVu3RU27ZzzphWxMlRCpuBoWvEgsU4Y+YDw2N0yQ7xl/IAxofZqSc4iV46T3VY40x14
	XDmZwFWk1wHJn2kXikLC5iSxiqRZUpmBR2yPw4Z7S5bv/VcCFeuBsmkYUx/yr5sbcEgJLq1aDf4
	=
X-Google-Smtp-Source: AGHT+IHtLeAYgDITpx3deW3jXAAdVKG9LHkQfNIbFqRoTGdWyF2rh3YZeh6jK1CDMoX4LIkyoL6r8w==
X-Received: by 2002:a05:600c:b96:b0:43d:7588:667b with SMTP id 5b1f17b1804b1-441c48be172mr62376775e9.10.1746443879877;
        Mon, 05 May 2025 04:17:59 -0700 (PDT)
Received: from [10.194.152.213] (71.86.95.79.rev.sfr.net. [79.95.86.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a285c2sm129777475e9.32.2025.05.05.04.17.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 04:17:59 -0700 (PDT)
Message-ID: <33708722-6986-40d2-92c8-38832467b857@linaro.org>
Date: Mon, 5 May 2025 13:17:56 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] MAINTAINERS: Add entry for newly added EcoNet
 platform.
To: Caleb James DeLisle <cjd@cjdns.fr>, linux-mips@vger.kernel.org
Cc: tglx@linutronix.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, tsbogend@alpha.franken.de, daniel.lezcano@linaro.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 benjamin.larsson@genexis.eu, linux-mediatek@lists.infradead.org
References: <20250430133433.22222-1-cjd@cjdns.fr>
 <20250430133433.22222-8-cjd@cjdns.fr>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250430133433.22222-8-cjd@cjdns.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/4/25 15:34, Caleb James DeLisle wrote:
> Add a MAINTAINERS entry as part of integration of the EcoNet MIPS platform.
> 
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---
>   MAINTAINERS | 12 ++++++++++++
>   1 file changed, 12 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


