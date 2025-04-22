Return-Path: <linux-mips+bounces-8689-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE409A965AF
	for <lists+linux-mips@lfdr.de>; Tue, 22 Apr 2025 12:18:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AA80F189A867
	for <lists+linux-mips@lfdr.de>; Tue, 22 Apr 2025 10:18:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 475A91F874F;
	Tue, 22 Apr 2025 10:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VR/rn87z"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9DF2144BB
	for <linux-mips@vger.kernel.org>; Tue, 22 Apr 2025 10:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745317079; cv=none; b=metfBvXi3TH7deKDsxB9Y09JbuxN/S4JbeYokHxuWVs+1xLMR/ylnLqShcck3lv0R7B9vMrygehFTbRK406m9T19cw4gHhj4+8LyeNLzMFNc1Bn3f8b2uBQ+zcd54+30vOmPDAW338vqjixsrmswXypyEluRMIjsHZRBJcxPtJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745317079; c=relaxed/simple;
	bh=RgffgJUUxVeQDwmHjDJntCJjsu15wrEwIwy6V21yf9A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f61dIHuunuWBWs1WdGVRvk4BEmTjamOhf1Vq3lyUrDtSt2s3ohlhsnek5MQEtiwCdoAqjjMjlkx4dMiG7BmpNSXwbsqyZWKZMzON3IRznLCQugigzX/+1nr6z5gQitSXTspEufpU7PgYSngDRJshAT9zvrBbw0jm/U8FdhR+9XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VR/rn87z; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so43523105e9.1
        for <linux-mips@vger.kernel.org>; Tue, 22 Apr 2025 03:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745317076; x=1745921876; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lz1K/C9/tfj1d+wAEb3dh4y94xlC+cBkVcwPFbmhyE8=;
        b=VR/rn87zYZo5IGLS1z5u+4HGwQCKGwVMBZyOreJMB8tkENTG5XpmZG51srd5UQxTPZ
         ibYgZ9ZgWt8jtkeDADVxaceAof2vrGPzXGVyQZrKchLe+eM30J8OIvtw+12qNP+++lVP
         +87UCWEqEgLPcvQSJruaVYt5E78DHGXeSxhQVRyajIK7LJ7ODr+BUCsYB6+w+E9fqAxA
         Rego665M6usZBl1QXFw6BWp4Dz5IVQ91+OdqsDIC4pm79nZixdOOKRJk+ryuBQdMVVE8
         BCX3XAo7/e65NpMPdgg5U7ljAo3VfoNR5roW/G2yMWidoWqrmRaBgbUkw8PSqvGY9aC0
         bFxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745317076; x=1745921876;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lz1K/C9/tfj1d+wAEb3dh4y94xlC+cBkVcwPFbmhyE8=;
        b=jhj8EmrIaEnxbHa2gKnRQPqzyEaCicYECJ2qyHQxhciwWhRbiyYtqAQyXfjnCbimn/
         TC3SS8LT+dzmCu1KBxtmtVS+SzQy4kJ29CQXvY3tDX/K1g0eVOf8f9F3Rt+RI9WZqaem
         kPb7UJ0Yp9eHIVK62lxRS81syV1tRXBXfvOML3mlPurbn77RZC/7evYsiuSf9CUeGqO6
         kjPvJhmTzZIojjr0w/S7pYmVEnyhd7IlUxpkwsBlAUxMPQTWAqbpVJIYFDqH2ZzWHTo/
         bMmICZYkH276XvZAQ87CIs0PIWvuHX9K2C2j5IGOiNss24RpVGP9AgtctUCXtoPyugG6
         Bccg==
X-Gm-Message-State: AOJu0YxNRaUmQFigA8jqCDc0ICig2GFhnVojRGjFFoFY3ckjocs7159j
	NzjIwu1DxT/3O2iFCX/ZN+lD9jRPXhEvS83UxhGo50Q2FA92v2Ri0XczzW+lNnc=
X-Gm-Gg: ASbGncugh7OytZsFG0kJGBw6gyqTKEYTO3JAPCuhrgTLUdvADgd2wa1mKTNXDNBW0JX
	LXgPL1DesQwKBhF/TyokZTA1UaoQloAnNjLbUXtEzv01HpmCD0C+mGITdHgXW2u41LdKei9Xb/+
	xhLwqRT/FbgoWT6bKn/xG1xJ9ou6q/xaKuFMVP6MyXWISaio1WDBmEC+bZfafuyI8pXxCzSbQh8
	m7+ahz12ny3x1A3ZE939waU1atcgWFOrZWrMpMCgxoBG2SJd1GHU212G36hjY+uhBHYWBzYPjnE
	KnjgOmfpHhebYnk2hkwK78Ach9AuDTTPZEO4WBm3yT1v13AlwDY9QMiM67PoXw9Q+PvpMc7elGo
	uQxQCegC2
X-Google-Smtp-Source: AGHT+IFBAlljs9+KM+mNfqqACpkyKOlirA1L5I4KDTzp2FQs6a9A+hezcRHzCm7KfDTFO0bJvS1w+w==
X-Received: by 2002:a5d:588a:0:b0:39c:30d8:32a4 with SMTP id ffacd0b85a97d-39ef9467254mr12012439f8f.26.1745317075690;
        Tue, 22 Apr 2025 03:17:55 -0700 (PDT)
Received: from [192.168.69.169] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4408c7cfcabsm9310395e9.0.2025.04.22.03.17.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 03:17:55 -0700 (PDT)
Message-ID: <0f8415f6-7e61-4036-95b8-31e702480c6f@linaro.org>
Date: Tue, 22 Apr 2025 12:17:54 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mips: ptrace: Improve code formatting and indentation
To: Thorsten Blum <thorsten.blum@linux.dev>, Oleg Nesterov <oleg@redhat.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250419102744.136697-1-thorsten.blum@linux.dev>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250419102744.136697-1-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 19/4/25 12:27, Thorsten Blum wrote:
> Use tabs instead of spaces in regs_query_register_offset() and
> syscall_trace_leave(), and properly indent multiple getters.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>   arch/mips/kernel/ptrace.c | 34 ++++++++++++++++++----------------
>   1 file changed, 18 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


