Return-Path: <linux-mips+bounces-2613-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3823589B7A4
	for <lists+linux-mips@lfdr.de>; Mon,  8 Apr 2024 08:31:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A0901C215A5
	for <lists+linux-mips@lfdr.de>; Mon,  8 Apr 2024 06:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6724821373;
	Mon,  8 Apr 2024 06:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T63G9lNy"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAB81D540
	for <linux-mips@vger.kernel.org>; Mon,  8 Apr 2024 06:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712557876; cv=none; b=GN4iHW+42Xk3P5UCB/ZWNLcbUabnp0uSoYMXBXeKbL3dSEbD3U/EH13jseqqQh6mvvJu9nM7b2ckeASeaGxv4ECuksMOypXGEulEDHV9pC9hnsZfUnfUWr6WABQA7RVcOQjkPsNMIn+iXfVOzCDgPhKIpwbc9vD/N/bX/naCnjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712557876; c=relaxed/simple;
	bh=QIczQJye6ulVbsUFMRnntvy0HYTn7yr5hZTeptv1VQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oH772gCgzD7z6F522lyG4/3gpxt1U2iGsAtrIhMb6sQ4Dz19Uq2yeePWPnCGrzX+GWaVoO+s7H7uijeFiXLdEfgbiun2UWjtS3s3gY8gCNmAMcglF4XiRzncq42aP4Kj2qMtabsBiOOOkDSZZiaKRmRu8uQORau2Hif5qCtYjh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T63G9lNy; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-516c403cc46so7203770e87.3
        for <linux-mips@vger.kernel.org>; Sun, 07 Apr 2024 23:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712557871; x=1713162671; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9FiTVZTYX0KeQgSiuUnwPMRri9NFK7ss97QqAH2vahM=;
        b=T63G9lNyXog2ViQ6R0cju//BiphRSyB3F+Tj3YHBF2W5S07gA01MwExsT/o2+WCgOs
         FHZG3LOLL42WMJTr96nJQHhyVN090fW+xWqHC243NOw4jMIAEZv86CN9NcI8VNkGCyhC
         JS2X5m0WA7A21JByUYXzkSfInVdJUWvaJZXSIuZZm2XuMlvpUvz6UN7qPZsFUvlYzl3k
         DRXf+cn6Oqfb8/yHUYgckpAnf0/am5NdUAllA8iiodOnGBFGAl3Jou2d+DMDDxx7yc9e
         IMiF5HnaBzmiu4dnNJ/FK3cfypfap5l1Oj1/5eIDM1e1RHhphRSloWedFH6UKxJOwFL1
         It3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712557871; x=1713162671;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9FiTVZTYX0KeQgSiuUnwPMRri9NFK7ss97QqAH2vahM=;
        b=Ynv8uJsiydFzaS1Ki2F/MZuChMopj5MOy3U9cZXqZMlZ2//MJxWwOPPg6eoQVK8MPe
         tYPmjOGAJEBHyb+H4K/4BzD4vtHgfxCDT0RlS+4TxZERois+uyDDelHbYB5ZygAvj4zz
         an7T/3w3MHOfoyDPvpgXG3s1EEeJJIj6qLnVMpvxrulJcE/sWKP41l12+dLmgTZCKBuj
         mvOhRdS37CH5Ud0agTp5artIpz+TfampvRaXWldD/3sSpqE2nhm6CsNIEebp+R1YXgoc
         47/L3qNvZJjlXenhesfGDK2oeDKdpSRZBqPlq5KE6nveuwx74cbFB4AtjWWP/Gm75KVE
         u6gg==
X-Forwarded-Encrypted: i=1; AJvYcCVHQBW02+c14txQCAHdZ3OCcWNTk8DSgjEhyqRxWyRM1iplXCX8yHSWB1ZYUSynh5e+yLX8jw1bZtYVxKt+tssFB9orH+kZfFE+ew==
X-Gm-Message-State: AOJu0YxM0A2+UI2YZrckmIJECuMrSd4Nv74QIvdQ34lFnTU1cx06JRhe
	pOAjOhrK75MGZUFnPNjxnE69Pib+uPt36QoZRQ9kI6+FBH5JkbrBuFkFPp8Yj8U=
X-Google-Smtp-Source: AGHT+IEA6kG/jLzxIs8qEGxEX4HFyMOSTK+qrw+cqbwmL3oOUtFSjPH+UfGHY26kn1STJDpLm0t9kA==
X-Received: by 2002:a05:6512:2387:b0:515:d176:dfd1 with SMTP id c7-20020a056512238700b00515d176dfd1mr8022020lfv.56.1712557871271;
        Sun, 07 Apr 2024 23:31:11 -0700 (PDT)
Received: from [192.168.69.100] ([176.176.144.67])
        by smtp.gmail.com with ESMTPSA id gs44-20020a1709072d2c00b00a46a27794f6sm3975527ejc.123.2024.04.07.23.31.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Apr 2024 23:31:10 -0700 (PDT)
Message-ID: <d1ad8803-16a9-4fd8-bc9c-8d38171a2554@linaro.org>
Date: Mon, 8 Apr 2024 08:31:07 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] KVM: remove unused argument of kvm_handle_hva_range()
To: Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org,
 kvm@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nicholas Piggin <npiggin@gmail.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Sean Christopherson
 <seanjc@google.com>, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org, linux-mm@kvack.org,
 linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
References: <20240405115815.3226315-1-pbonzini@redhat.com>
 <20240405115815.3226315-3-pbonzini@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240405115815.3226315-3-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/4/24 13:58, Paolo Bonzini wrote:
> The only user was kvm_mmu_notifier_change_pte(), which is now gone.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   virt/kvm/kvm_main.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


