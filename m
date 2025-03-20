Return-Path: <linux-mips+bounces-8248-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB266A6A68C
	for <lists+linux-mips@lfdr.de>; Thu, 20 Mar 2025 13:56:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 636593BC121
	for <lists+linux-mips@lfdr.de>; Thu, 20 Mar 2025 12:56:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A3471EEE9;
	Thu, 20 Mar 2025 12:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tjFExFxj"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B4118641
	for <linux-mips@vger.kernel.org>; Thu, 20 Mar 2025 12:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742475387; cv=none; b=NFgy5qx7wT+MVCSavPsCJ8FSWQw6L/MYebWznjOUFQnIMl/d7vpq++k54WJtuuOIuDeIdAcyrfzmfLizYWZ0Wpig1yH3rJq0tWTmAnM5vAwMrOaUHCyicOx6LgzF1y64WsBGMl1+8B8QWRgPKOySLoUXqWs5Dy/KwQE4RVCsSqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742475387; c=relaxed/simple;
	bh=zTnXAKmTuZRtU1d1p7Q5TlC/BTFpcP/VJalqvVhGyj8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y3fXrP7wywHSAH+4Xba8dsP5ZVBXQ9B1DirLlb4bepao4GBEKxe3XBSf70aQpE7zPY+j8rfQBLFYs2n4kH05DJf+dtWctsN3+Nj2p6hhFFzb79nr5hYgTAHIT/3xzjqggFWTV2GhRq67ojnRXGtweYbIWBtc2CmSGyw6V4IKdf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tjFExFxj; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac2963dc379so133114766b.2
        for <linux-mips@vger.kernel.org>; Thu, 20 Mar 2025 05:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742475384; x=1743080184; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HTiBMnvR5EfiapTBlQ2zIHklJYLCh/G/HYnYPld7nw4=;
        b=tjFExFxjbUzksAmUGKs8bktnIAL/dOdAIUu3uNWvSMhjDPsaW4uoHKutafmN0FVyLh
         ekTaSBtt9wKZaKYmJXpK72UxQPHEy43whWsR5evtAvjC5huZNbQpB/CNjzTIrri7rh8N
         diz+e0BKg56edVlYvqArZmvLOH0LrYe0k9nLU2dZ1ljZgq1r8uSbf1ewL53kyVpOPUx9
         gxN58T0N5A+uOB5eEIPVPYJGOaFcoKgI6B3HpwjjRafAzpyBDJq/2dj8u+BKcU5yNKmM
         Tu6DTpMrgszaMYb8navO0fLM09oejSADZEt4fhIqYfO9mKU0yz6YpXRmSxwMjAYWM6dE
         6TXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742475384; x=1743080184;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HTiBMnvR5EfiapTBlQ2zIHklJYLCh/G/HYnYPld7nw4=;
        b=meAKSrGKRSa+k5D0uJAXCNiQdVpXaOVxUnZQraadjmCgkVf2L1QyGs41W2V6nbw9vy
         aVRYklSBatCd4S4nm5AJNNBpOXNZMEwmu5v4pQYM9CssqoMPTW8G59pYye9FHmlRVchj
         nAXlZCskOjaQgx4BNcFODIELc43ddcCJal6uSIECEXw9AdS8Cu9CWXuJe4o43Rxdmku3
         E5KdcW856dKJNpuRM1/DLQMR6S/EfKp9n1gNO3JtJB0TjJuwjRb+oyspIQOnXL+5yif9
         IrIJuWDNuTjfxb44/pWF6PfpcbjogVozWf0OYm+5RDAs+Y5Ix2fWsbGSxvWURU+5Z+y5
         Q61g==
X-Forwarded-Encrypted: i=1; AJvYcCX9kXLT+inKkmU73SCdtf+BrozNz22/bPplpb4pWofMXzzBn1hxSGSQeI1By4yGHTlHGpVwmoEVIqVC@vger.kernel.org
X-Gm-Message-State: AOJu0YzcxdbNXAfowlGAvZgTkO7S/U3b/36LYNP9uoPoDthXowrkPnRe
	GOrOZPR0Eqq/B+LPJUC+VpFttlJ4ZQU08nE6Mnw3fdkUeTRx5fesILLhf75tC80=
X-Gm-Gg: ASbGncud9sYkBpmxDk/hhqciZR+CdyiE985/2aK46AA3Tt9Xsrw+348JIB4X1EWCPrw
	BA5hdw0WOzLbOs2se4vVZ7HcxzZPUrVshGKk5JU5A2ay7jjXaxkpZKyKdqvGkSV1xFBB1GIkx+z
	49d88Rsg2hWIVFHjESgFezlLWKhriX8AAulhlH45JjHbu+2351m6tOTzvaXXNVj9wJotLgcotCg
	kn89p0fh7A0F3hBOFYUWHHCnuj7/RY7fQUowVJta/8X0pWPACTyO3Od8RoYjYQRhOBVfCiscZFu
	jEqBTK05tMaV6NNLfjpWrDpbY0vO3+CJjfsHjnyCjZU6uqc/204dDpmc1pJTU9LBs2aIZyJ+q+O
	8ml6vJsQBxfFQ
X-Google-Smtp-Source: AGHT+IFwbUtBKy1cKZpiAYgKgI/ab8Fj6ZMme+dS/eEmYErdP1Yx16iHt4BcTPb5hz8rYdlEnkXIEA==
X-Received: by 2002:a17:907:f50a:b0:ac3:45c0:6d08 with SMTP id a640c23a62f3a-ac3b7373065mr786509366b.0.1742475384270;
        Thu, 20 Mar 2025 05:56:24 -0700 (PDT)
Received: from [192.168.69.235] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3146af080sm1155354066b.31.2025.03.20.05.56.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Mar 2025 05:56:23 -0700 (PDT)
Message-ID: <817c02a0-5493-419a-9663-73a85182b047@linaro.org>
Date: Thu, 20 Mar 2025 13:56:22 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/41] mips: Replace __ASSEMBLY__ with __ASSEMBLER__ in
 the mips headers
To: Thomas Huth <thuth@redhat.com>, linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org
References: <20250314071013.1575167-1-thuth@redhat.com>
 <20250314071013.1575167-20-thuth@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250314071013.1575167-20-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14/3/25 08:09, Thomas Huth wrote:
> While the GCC and Clang compilers already define __ASSEMBLER__
> automatically when compiling assembly code, __ASSEMBLY__ is a
> macro that only gets defined by the Makefiles in the kernel.
> This can be very confusing when switching between userspace
> and kernelspace coding, or when dealing with uapi headers that
> rather should use __ASSEMBLER__ instead. So let's standardize on
> the __ASSEMBLER__ macro that is provided by the compilers now.
> 
> This is almost a completely mechanical patch (done with a simple
> "sed -i" statement), with just one comment tweaked manually in
> arch/mips/include/asm/cpu.h (that was missing some underscores).
> 
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: linux-mips@vger.kernel.org
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   arch/mips/include/asm/addrspace.h            |  4 +--
>   arch/mips/include/asm/asm-eva.h              |  6 ++--
>   arch/mips/include/asm/asm.h                  |  8 ++---
>   arch/mips/include/asm/bmips.h                |  4 +--
>   arch/mips/include/asm/cpu.h                  |  4 +--
>   arch/mips/include/asm/dec/ecc.h              |  2 +-
>   arch/mips/include/asm/dec/interrupts.h       |  4 +--
>   arch/mips/include/asm/dec/kn01.h             |  2 +-
>   arch/mips/include/asm/dec/kn02.h             |  2 +-
>   arch/mips/include/asm/dec/kn02xa.h           |  2 +-
>   arch/mips/include/asm/eva.h                  |  4 +--
>   arch/mips/include/asm/ftrace.h               |  4 +--
>   arch/mips/include/asm/hazards.h              |  4 +--
>   arch/mips/include/asm/irqflags.h             |  4 +--
>   arch/mips/include/asm/jazz.h                 | 16 ++++-----
>   arch/mips/include/asm/jump_label.h           |  4 +--
>   arch/mips/include/asm/linkage.h              |  2 +-
>   arch/mips/include/asm/mach-generic/spaces.h  |  4 +--
>   arch/mips/include/asm/mips-boards/bonito64.h |  4 +--
>   arch/mips/include/asm/mipsmtregs.h           |  6 ++--
>   arch/mips/include/asm/mipsregs.h             |  6 ++--
>   arch/mips/include/asm/msa.h                  |  4 +--
>   arch/mips/include/asm/pci/bridge.h           |  4 +--
>   arch/mips/include/asm/pm.h                   |  6 ++--
>   arch/mips/include/asm/prefetch.h             |  2 +-
>   arch/mips/include/asm/regdef.h               |  4 +--
>   arch/mips/include/asm/sibyte/board.h         |  4 +--
>   arch/mips/include/asm/sibyte/sb1250.h        |  2 +-
>   arch/mips/include/asm/sibyte/sb1250_defs.h   |  6 ++--
>   arch/mips/include/asm/smp-cps.h              |  6 ++--
>   arch/mips/include/asm/sn/addrs.h             | 18 +++++-----
>   arch/mips/include/asm/sn/gda.h               |  4 +--
>   arch/mips/include/asm/sn/kldir.h             |  4 +--
>   arch/mips/include/asm/sn/klkernvars.h        |  4 +--
>   arch/mips/include/asm/sn/launch.h            |  4 +--
>   arch/mips/include/asm/sn/nmi.h               |  8 ++---
>   arch/mips/include/asm/sn/sn0/addrs.h         | 14 ++++----
>   arch/mips/include/asm/sn/sn0/hub.h           |  2 +-
>   arch/mips/include/asm/sn/sn0/hubio.h         | 36 ++++++++++----------
>   arch/mips/include/asm/sn/sn0/hubmd.h         |  4 +--
>   arch/mips/include/asm/sn/sn0/hubni.h         |  6 ++--
>   arch/mips/include/asm/sn/sn0/hubpi.h         |  4 +--
>   arch/mips/include/asm/sn/types.h             |  2 +-
>   arch/mips/include/asm/sync.h                 |  2 +-
>   arch/mips/include/asm/thread_info.h          |  4 +--
>   arch/mips/include/asm/unistd.h               |  4 +--
>   arch/mips/include/asm/vdso/gettimeofday.h    |  4 +--
>   arch/mips/include/asm/vdso/processor.h       |  4 +--
>   arch/mips/include/asm/vdso/vdso.h            |  4 +--
>   arch/mips/include/asm/vdso/vsyscall.h        |  4 +--
>   arch/mips/include/asm/xtalk/xtalk.h          |  4 +--
>   arch/mips/include/asm/xtalk/xwidget.h        |  4 +--
>   drivers/soc/bcm/brcmstb/pm/pm.h              |  2 +-
>   53 files changed, 140 insertions(+), 140 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


