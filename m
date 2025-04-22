Return-Path: <linux-mips+bounces-8697-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7C6A965EB
	for <lists+linux-mips@lfdr.de>; Tue, 22 Apr 2025 12:28:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5172E3A3E15
	for <lists+linux-mips@lfdr.de>; Tue, 22 Apr 2025 10:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2522520E00A;
	Tue, 22 Apr 2025 10:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XM6R/h6k"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C37D20C49E
	for <linux-mips@vger.kernel.org>; Tue, 22 Apr 2025 10:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745317670; cv=none; b=VdDpCeihSmAieicJmw/GxELthvYX4QBcVcETs5WrNY1WSi8HHsbBi1pT5mKe9rB2f0MoJfq5Rbo3PqkHsKE05+gSTSV9Bfz++xqiGz0TY+68qxYGkyb62ubem+ItMWZiDn2r/FCni7Q32fI7C/aLB0Tdp/O4Lkq8fVcOIJ/Ugoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745317670; c=relaxed/simple;
	bh=hDWDlFvFbbmsA5BCq/XHGsuE162uckJtLdIWqrzFSBE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c6Oiwo5tXNmGxM9zERZHRmhp3gRiPe6HhehT3e+hcIWN8RTLt8p6IpDWCxL5QcKD0z6rblT8bS2ESnunJm/gq69XhPVQx3NeWAPNaY7X2awWcvKmzzIf8tp4UZq8wciafT4D35NGB53Cr8ARgr9RYhKHTCma8xBqg8+EM2gzWYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XM6R/h6k; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf848528aso37033485e9.2
        for <linux-mips@vger.kernel.org>; Tue, 22 Apr 2025 03:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745317666; x=1745922466; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pYxOWxJLwzY0xVu+iAjYB5XwjaHAZDDl7p5bmvvzLHA=;
        b=XM6R/h6kWMHBWyXpSe0lsl08NhGByYNknwcl+OsPwGVcuDwtsQgOg9Ah9IDaZMa0iN
         TF7MjzaNkbdvHpyAWk8prXykzs7pppId2oON6quxgGL8xEYi3wkd4i9gjGDJPYs99aZQ
         TdYbyV+qPEfBnDh7UqUQfvQlAtaeThX1M+NHecrjI+Pl+EIHZG+FL+MB63aDoU4t/E7E
         DM3A7TgUlZz/Y8V7hljx542nqbIPwdnE9SUtHWFu5TLn5ATEp+dd0d3JIAtUwk1D/edm
         tU9mc/XnC9LIKt2GTyk/1tBjGGI278exYzvNTiLqUrj6SdC1V8lDG1H9s07QI8M+KXq+
         NTVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745317666; x=1745922466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pYxOWxJLwzY0xVu+iAjYB5XwjaHAZDDl7p5bmvvzLHA=;
        b=Y3ZMhlqCC/YRAMdQDkZSvmjGvck875zIxcjyQqMUNzDOwfhYBhCnqUmT1j7Lt+ElXC
         SxwTTroDG5en6yjzNbFiT97hKZBoOfnAR9KoXLmjHuggAw7Har4tXIRPK32XKhjojREx
         1CkeYfyel+S6f3/UWxavVCOc36TIC8BPY7JC+5wwFBlKpi2F4gV78JZwx0Bgwhfq5eAI
         N3FdF6GvCtJ0WFdopmB1j9aGmhbHntDiNY8oYS39PuzBVQPN6yPHrjiGBJWAdhsRT06i
         d6Gpt7dQkpmLVOapkKRep9+/xC4b3bMbxIjV+Xlhswn+pTwyCQtcgX0MwxGMmg4KdnRW
         o4bg==
X-Forwarded-Encrypted: i=1; AJvYcCUKmvAR6DQOXm4E8zcIoICGleuhZH/N6CANHA74nIxQHFDjqR23xbC93QuRGT60QsQJYXA8fxgABWZN@vger.kernel.org
X-Gm-Message-State: AOJu0YzCYPtPTw57BtocAVgoFQuG0ePP1qg3FsmdzuJOn1TO51NqQT5f
	xsVcIzz6r/ENZLnCko6+/r6J7haxHLCTi3gaC9yh9ODl1cxBhbq15OAO4byarGI=
X-Gm-Gg: ASbGnctQHU5SHp9kW2dEMjhHJgUUdx2Oiz/Hgo0acx34tQUy7MZ8kx+ZpDYE5hwlZ58
	zcI+PNWyp3PqLbyUXZrymkh+TlXaak0VO59VcvwY7w7F6HKYOjez0WLytwYcsJhJwH5V4HwwDSh
	Yzdj3EhveKFHrs7+BVE+Ks9jdLnUhcVh0TwsmBoqGEYE6CIOxAoChI5R49D2e8cYWICN48fkB6b
	LygtE8r2NMZ8HQ7PED6P3oc6xqzVRN0cf1BZwKcEHVy1Dqoiz7yXnrrsXDb9m4Mfbk6j1sgPk5K
	2FsRTc8sQv7wOGpL9n6JnPopB6M0wyWvOQCRjrSOagQ3wRgfns7pudAnnFFCCSww4pFCpgWA9Id
	FLP78s/1e
X-Google-Smtp-Source: AGHT+IFP40idWKQeu7V3uTVBRBpYiXyFIGvknmwTjg4oJeTykFVpaDYIgP8LFyx6kWPloNrS6i30HQ==
X-Received: by 2002:a05:600c:1e10:b0:43d:300f:fa1d with SMTP id 5b1f17b1804b1-4406ac62b75mr151933265e9.31.1745317666165;
        Tue, 22 Apr 2025 03:27:46 -0700 (PDT)
Received: from [192.168.69.169] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4408c8b0ea0sm8525555e9.2.2025.04.22.03.27.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 03:27:45 -0700 (PDT)
Message-ID: <d8504829-45fd-4df8-a98d-599d0c8c602d@linaro.org>
Date: Tue, 22 Apr 2025 12:27:44 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] MIPS: dec: Remove dec_irq_dispatch()
To: WangYuli <wangyuli@uniontech.com>, Wu Zhangjin <wuzhangjin@gmail.com>
Cc: guanwentao@uniontech.com, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, macro@orcam.me.uk, niecheng1@uniontech.com,
 tsbogend@alpha.franken.de, zhanjun@uniontech.com
References: <24EC7D2CA58B25F5+20250422101855.136675-1-wangyuli@uniontech.com>
 <093E43FBF9F4F005+20250422102253.137944-4-wangyuli@uniontech.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <093E43FBF9F4F005+20250422102253.137944-4-wangyuli@uniontech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 22/4/25 12:22, WangYuli wrote:
> Commit 187933f23679 ("[MIPS] do_IRQ cleanup") introduced dec_irq_dispatch()
> function. But Subsequent to commit 8f99a1626535 ("MIPS: Tracing: Add
> IRQENTRY_EXIT section for MIPS"), the dec_irq_dispatch() function is
> rendered superfluous. Remove it to eradicate compilation warnings.
> 
> [ Quoting Maciej W. Rozycki: ]
> 
>      It always has been, since its inception, see commit 187933f23679
>    ("[MIPS] do_IRQ cleanup").
> 
>      Up to commit 8f99a16265353 ("MIPS: Tracing: Add IRQENTRY_EXIT section
>    for MIPS") `do_IRQ' used to be a macro, that's why.  At the time `do_IRQ'
>    was converted to a macro `dec_irq_dispatch' was created and previously
>    this place used to call `do_IRQ' too.
> 
>      This cleanup should have been made along with commit 8f99a16265353, so
>    it's pretty old a technical debt being sorted here.
> 
> [ Fix follow error with gcc-14 when -Werror: ]
> 
> arch/mips/dec/setup.c:780:25: error: no previous prototype for ‘dec_irq_dispatch’ [-Werror=missing-prototypes]
>    780 | asmlinkage unsigned int dec_irq_dispatch(unsigned int irq)
>        |                         ^~~~~~~~~~~~~~~~
> cc1: all warnings being treated as errors
> make[7]: *** [scripts/Makefile.build:207: arch/mips/dec/setup.o] Error 1
> make[6]: *** [scripts/Makefile.build:465: arch/mips/dec] Error 2
> make[5]: *** [scripts/Makefile.build:465: arch/mips] Error 2
> make[5]: *** Waiting for unfinished jobs....
> make[4]: *** [Makefile:1992: .] Error 2
> make[3]: *** [debian/rules:74: build-arch] Error 2
> dpkg-buildpackage: error: make -f debian/rules binary subprocess returned exit status 2
> make[2]: *** [scripts/Makefile.package:126: bindeb-pkg] Error 2
> make[1]: *** [/mnt/83364c87-f5ee-4ae8-b862-930f1bd74feb/Projects/CommitUpstream/LinuxKernel/Temp/linux/Makefile:1625: bindeb-pkg] Error 2
> make: *** [Makefile:251: __sub-make] Error 2
> 
> Link: https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=187933f23679c413706030aefad9e85e79164c44
> Link: https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8f99a162653531ef25a3dd0f92bfb6332cd2b295
> Link: https://lore.kernel.org/all/alpine.DEB.2.21.2502220019210.65342@angie.orcam.me.uk/
> Signed-off-by: WangYuli <wangyuli@uniontech.com>
> ---
>   arch/mips/dec/int-handler.S | 2 +-
>   arch/mips/dec/setup.c       | 6 ------
>   2 files changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/arch/mips/dec/int-handler.S b/arch/mips/dec/int-handler.S
> index 011d1d678840..a0b439c90488 100644
> --- a/arch/mips/dec/int-handler.S
> +++ b/arch/mips/dec/int-handler.S
> @@ -277,7 +277,7 @@
>   		 srlv	t3,t1,t2
>   
>   handle_it:
> -		j	dec_irq_dispatch
> +		j	do_IRQ
>   		 nop
>   
>   #if defined(CONFIG_32BIT) && defined(CONFIG_MIPS_FP_SUPPORT)
> diff --git a/arch/mips/dec/setup.c b/arch/mips/dec/setup.c
> index 6b100c7d0633..affae92f1918 100644
> --- a/arch/mips/dec/setup.c
> +++ b/arch/mips/dec/setup.c
> @@ -771,9 +771,3 @@ void __init arch_init_irq(void)
>   			pr_err("Failed to register halt interrupt\n");
>   	}
>   }
> -
> -asmlinkage unsigned int dec_irq_dispatch(unsigned int irq)
> -{
> -	do_IRQ(irq);
> -	return 0;
> -}

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


