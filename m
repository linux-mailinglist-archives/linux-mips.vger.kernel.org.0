Return-Path: <linux-mips+bounces-7333-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DC6A0899C
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jan 2025 09:13:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 94733188CB18
	for <lists+linux-mips@lfdr.de>; Fri, 10 Jan 2025 08:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B7D207A2A;
	Fri, 10 Jan 2025 08:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="C+Upftb4"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91B9207A20
	for <linux-mips@vger.kernel.org>; Fri, 10 Jan 2025 08:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736496822; cv=none; b=BT9xYeMpr1A2jr0P1EZJiYTRhFL69xN2J7GCjrVNYXI79/G9pTfUK2V/JDckM2GQgiXPIW50XgvsDTkgRIJbK/FtrZO8DV9PmflCHkAHklM3zfoMbR/h+STemXk9d8kLvdwvtdEx2iK0fhswdpKGim8pytCCqcyEzZCh2edVX0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736496822; c=relaxed/simple;
	bh=lLjOkjf1wXpzYZ4sT4TWPRX6MLmiW6g8LMJeKNMGu00=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fhZLJmw+swnWjb+mRCIsej63ji3E0sNhIjZyTu/kmOR5NqWMw3Hrgmj/FnafnOwk5bymOq8LpaNr394YcgkwgjgV9NT2q1C7SMFLebsoBz3Ox8RqOoTiMnwsPqUyo8OXZTMgw5v6F8W20VwQctZTRfYpWcxyJoCYX4iVDJli9GQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=C+Upftb4; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43675b1155bso20528625e9.2
        for <linux-mips@vger.kernel.org>; Fri, 10 Jan 2025 00:13:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736496818; x=1737101618; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q0EV045k8CG4Yg/GfxO4KvlU6Rqe6kFmO58kVT3kSXY=;
        b=C+Upftb4+fldE5YMFoduCKTGwcGd6lGvAC4RqKSY7t7YkanJNZ30TprlPFbtYvNcQB
         mg+Wb7Hn2xbkkBUSuldr7tDWbEiKkNh8WVpsEeaILlQG46fYv9oAag8KICsMqkyaWr9e
         u+BG11MB7T43Ue9+htQZfyiiaXaM1F/M0xL7kq9jdizkOkdFnYCGr0UKAZtX3SFkUyKl
         0gYwVTyltbJt+iZEgIUe7t0P4I4yhPebGk8AT07IaFmd3jczBym2NYpmUMXc9fkxgQGA
         YtT4zizuJIaGjhw59fokeUH+cVIzQKq9tJMGadf4ZYvbHnQcpJNn9by9yZo1AE/90lRj
         KNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736496818; x=1737101618;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q0EV045k8CG4Yg/GfxO4KvlU6Rqe6kFmO58kVT3kSXY=;
        b=eLSwR8oHceyLJgG5GXLxVORWbzrUPL1RY3XD80Z30ofAel9rmh1T3R/OmrGuVaaaZF
         ZPtqqj4kib62HfiY3mRC+iV1zZlhiXJFCQ5lIZ+iEUhojsnT5NbST/b6YxuoCJrpBT15
         vEtBqhPdz1TmlmMKk5sO978AikzhgGNLVeeRcEpPKMYQrndIv7SfI9Z0R+qXQf2JkhtW
         5QRAcOX/qJPz/2ejMAojGi7T5btzY6KLDt1e+bSXUqGC/nYo+bHiAkPUtqCjbyp0D+aD
         DOb4uzEdxySJ3iEs9rYAJ1PDljVLoopg8hmXuYX2MjTuW8R3og2UR7QwSLVKxYxVHzjn
         +uBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJrJ4JhLPgYvekR0xNUgzp0AiWvNAnP2qNPrJUw+CxUT/1LZh8Q1ayuJrhlJQ82aStigbntxom+4sx@vger.kernel.org
X-Gm-Message-State: AOJu0YzYaXYODK0IRVIiMo/MGQLb8ggl1/b0xdTzkU6t/uRFKfBQAByG
	FmOSFl0XsE44xRJvTZ7ThAvVbcHiG7cxBsSjhk6Lf8fzhAR5KXaWqcAQTC9rZlg=
X-Gm-Gg: ASbGncsRtz67jNgjmNJvUX2rQomMT10MzkeH1mvLvf5dghGwCcGCdrWY1SKDvGx5o2E
	CbkCTNw+zO3vVHcxvFJgv8JToFIMDHN6yNh13oywViChBIw05ILKLDQExzCywLo9F4r0CENqUKX
	lcFmFyqwv0SC3UWmX4anLjO8YRY0ZZQMCKvx6udXC82DL6WlLLc/OfGvpZ46v883X7dbzWC5hOB
	dOCtXb2HAN0+EbeQ2pM0fVJF5zfkwpHaFYdhQfjKnukv9BHGvJ5sDVLSHeFw7kATNA+rRZ+srOD
	WQsLKWScrNPufAcD7hOswAGZS5w=
X-Google-Smtp-Source: AGHT+IFpjInhd33mWgPk1P2BS4pHVpZXIpbSheFxrXN+9gDHs3qr5/NnCurtOhyxygGxHMuzuxoe9w==
X-Received: by 2002:a05:600c:46ce:b0:436:6ddf:7a27 with SMTP id 5b1f17b1804b1-436e27072a7mr80662725e9.23.1736496818143;
        Fri, 10 Jan 2025 00:13:38 -0800 (PST)
Received: from [192.168.1.74] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e6249csm43923755e9.38.2025.01.10.00.13.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 00:13:37 -0800 (PST)
Message-ID: <d4d4c1f6-84d8-4168-991e-dbd36091d520@linaro.org>
Date: Fri, 10 Jan 2025 09:13:35 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH] MIPS: ftrace: Declare ftrace_get_parent_ra_addr()
 as static
To: WangYuli <wangyuli@uniontech.com>, rostedt@goodmis.org,
 mhiramat@kernel.org, mark.rutland@arm.com, tsbogend@alpha.franken.de
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, xzhong86@163.com, wuzhangjin@gmail.com,
 srostedt@redhat.com, linux-mips@linux-mips.org, ralf@duck.linux-mips.net,
 jeffbai@aosc.io, zhanjun@uniontech.com, guanwentao@uniontech.com,
 jiaxun.yang@flygoat.com, gregory.clement@bootlin.com, tglx@linutronix.de,
 rppt@kernel.org
References: <527F9AFF0430AB45+20250104144708.18438-1-wangyuli@uniontech.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <527F9AFF0430AB45+20250104144708.18438-1-wangyuli@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/1/25 15:47, WangYuli wrote:
> Declare ftrace_get_parent_ra_addr() as static to suppress clang
> compiler warning that 'no previous prototype'. This function is
> not intended to be called from other parts.

Since 2009 in commit 29c5d3462f7c ("MIPS: Tracing: Add function
graph tracer support for MIPS") eh :)

> 
> Fix follow error with clang-19:
> 
> arch/mips/kernel/ftrace.c:251:15: error: no previous prototype for function 'ftrace_get_parent_ra_addr' [-Werror,-Wmissing-prototypes]
>    251 | unsigned long ftrace_get_parent_ra_addr(unsigned long self_ra, unsigned long
>        |               ^
> arch/mips/kernel/ftrace.c:251:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
>    251 | unsigned long ftrace_get_parent_ra_addr(unsigned long self_ra, unsigned long
>        | ^
>        | static
> 1 error generated.
> 
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
>   arch/mips/kernel/ftrace.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


