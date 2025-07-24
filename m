Return-Path: <linux-mips+bounces-9920-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6071FB109B9
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jul 2025 13:57:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8203A5A4549
	for <lists+linux-mips@lfdr.de>; Thu, 24 Jul 2025 11:57:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE452BE7CB;
	Thu, 24 Jul 2025 11:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="epkPY/cv"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12BC2BE7A7
	for <linux-mips@vger.kernel.org>; Thu, 24 Jul 2025 11:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753358262; cv=none; b=oSwHFt2cm9XfE5EVKvovEXIiQN84Mbsfo+pUCvCl6oLBczW0vMOMTABEyjJrRAOjBR9Tc7khc1xOlLq7V1kG5u96CBaWmmtRnrx6gRKUR6X+aLGgvHXf0vUlVLcSvOaLVUgPCdPbsxiPM3gnIxo43jz/GHQMpjlDN0oZKxugec4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753358262; c=relaxed/simple;
	bh=s2cS2uUpe2d12O2GQFBbYS3i/b7Gp7xb0wftHi5dJ2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hCjOmFPz/PqN/M+xal+LTQ5DszDVYJ0+mtFDK0TIxeuXtZHlYFTq/HkCAP3boyvhNRNogNx9vbAi0vYH12/vfTk8gwroe9ZaIWhg3CnU05aUgYCFH8Th4ZuCMKufCU/qlxwj3GT0g9nczlN50CapySPIVukSlZY43Es7p8sul9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=epkPY/cv; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1753358259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=IfpJaY0i9heXv55+AsXvn41rTRtAfctbmZRtuKj65Rw=;
	b=epkPY/cvYji/eC3x6Yz/bbqKGdDGyjvCNyTUNcErp9xt09fT4pCJvrKOaKOHl3kr2bT6e4
	bHoWz9CYtdXA13OJZURjHS16atLaGuWj5LHoN1eM1LxA+hz6Nebzg8L9E0KLXyqgsjlgXp
	Y0gsPhN8QwLxkQj8JZXAzPk9QWEv7ss=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-g9hSh5QYOja7j0i17rbbEg-1; Thu, 24 Jul 2025 07:57:36 -0400
X-MC-Unique: g9hSh5QYOja7j0i17rbbEg-1
X-Mimecast-MFC-AGG-ID: g9hSh5QYOja7j0i17rbbEg_1753358255
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a5058f9ef4so364332f8f.2
        for <linux-mips@vger.kernel.org>; Thu, 24 Jul 2025 04:57:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753358255; x=1753963055;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IfpJaY0i9heXv55+AsXvn41rTRtAfctbmZRtuKj65Rw=;
        b=JCyGzkU5V/kaQeINXzUHNK/D9oN4tJlaQFfjrLZwxN0D+YvAWWWlDaUiRBQ8srgVNP
         onO6s4Nwof/fUv6NY0ABHEvyPOqn7xLrmaPMbryz7pMV9Yxr9KCGA6b+urrRBo2WUBWj
         arbtdE1Kwwry3/CtKDXm0EzS0bAbQH13lwo9I2E7oWs23SIW6h3mYWiwjMP4UgTkQNb7
         OTHRVs5KR1ONgI2ywYubTZC7uWDy/ilBUCfEIupajTnczlUGgwhIRScwkHiMDKsbNVld
         HbAHenJmzLvGrvw3qYGhq0Vtl1WGwT2OwXED1bkZXpjydk3vW65VLM46UX0Yy3LU3H6g
         2cQw==
X-Forwarded-Encrypted: i=1; AJvYcCUGWmxeYaUEYIte1ciJk6ZxApT1hS7seo4PPQeZR81lxhdGy5BEaAG7EIQKwGOKyE+AyeHABK+NDcC4@vger.kernel.org
X-Gm-Message-State: AOJu0YxGQo6PpohW8TSg3Ux4JcaMvmPylLVPGXOH8KBO5kZun8kG3Ttw
	wCYW2wCkwKqaWr/4AcvIHzCTJN5hBRObZJV4UdBCg2MZI43ZDoQNLPX0SQgfCkEb4bnnXBDd1Y/
	NfEM1gq5Lq6Nxrwkm9ECW9vmQKsJN6ANAG9Lzr+u7fBoQC1j7Wa9Kuu4pH4416GQ=
X-Gm-Gg: ASbGnctmMzYBhgvUVEhxeyC4Polr3FL/mCu7fdmKHdvks1zpb9P67BxI09VUT2CHrsH
	NFHAtI+bSoRhEWTAAybf/ac+60DVvJixF7u+2N766u5hbmxus1C4bEMtF3BCTYjEyWgezs5/Uei
	+t7LBizess3syIFrNwyx4YSF5Is/P4cIlBlioaQs9D4BKRdCvmkMkRA3zcJzvsSklX8ZXoMfl2B
	qTtqYTY5Vwkcrd876t9SPWhBhL3BK5mPTBJqaJfuWD+W0gYeSrFKdGRUYIKKsCpFxG9zMDYEoZa
	RkVg4i3692zYEERG9sFdLGocZ90SAP+74rue2TKNdGtt2r4jUCox06FvOveiJ8ffxqdbP+2mojr
	8vm9TXYgMwmS+TmFp1f4uum74B73RUgHAiO1poZt00t5P7FzzPUOhc+EXLO4O+SqM
X-Received: by 2002:a05:6000:40cc:b0:3b3:a6c2:1a10 with SMTP id ffacd0b85a97d-3b768c98f7bmr5578762f8f.12.1753358255315;
        Thu, 24 Jul 2025 04:57:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3CNg0Q8ekhpe4If+ptwIZaS02E1ZZYo7XDg+YeCtzQ4aBATaJ2jYa5KVbphllNjRL4gIyZg==
X-Received: by 2002:a05:6000:40cc:b0:3b3:a6c2:1a10 with SMTP id ffacd0b85a97d-3b768c98f7bmr5578740f8f.12.1753358254762;
        Thu, 24 Jul 2025 04:57:34 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1f:5e00:c941:d6fb:3e30:b42? (p200300d82f1f5e00c941d6fb3e300b42.dip0.t-ipconnect.de. [2003:d8:2f1f:5e00:c941:d6fb:3e30:b42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45870554a02sm18071815e9.21.2025.07.24.04.57.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jul 2025 04:57:34 -0700 (PDT)
Message-ID: <6c17dd99-43e6-439a-a30a-194311eba889@redhat.com>
Date: Thu, 24 Jul 2025 13:57:31 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/15] lib: provide kmemdup_const()
To: Andy Shevchenko <andriy.shevchenko@intel.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
 <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Alexey Klimov <alexey.klimov@linaro.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>,
 Andy Shevchenko <andy@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP S32 Linux Team <s32@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Tony Lindgren <tony@atomide.com>, Haojian Zhuang
 <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
 <20250724-pinctrl-gpio-pinfuncs-v3-1-af4db9302de4@linaro.org>
 <e1253b8a-4940-417f-b530-09e57c6a8932@lucifer.local>
 <CAHp75VeWbhuL1pYvEza44Pnb5YUufgY=1WYXSx2nNMJVfcytTA@mail.gmail.com>
 <5c7edf57-bf13-4633-8348-791e0620cc79@lucifer.local>
 <aIIef0MDcZiElgN1@smile.fi.intel.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 g3eXuA==
Organization: Red Hat
In-Reply-To: <aIIef0MDcZiElgN1@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 24.07.25 13:52, Andy Shevchenko wrote:
> On Thu, Jul 24, 2025 at 12:15:11PM +0100, Lorenzo Stoakes wrote:
>> On Thu, Jul 24, 2025 at 01:12:49PM +0200, Andy Shevchenko wrote:
>>> On Thu, Jul 24, 2025 at 1:10 PM Lorenzo Stoakes
>>> <lorenzo.stoakes@oracle.com> wrote:
>>>> On Thu, Jul 24, 2025 at 11:24:29AM +0200, Bartosz Golaszewski wrote:
>>>>> +extern const void *kmemdup_const(const void *src, size_t len, gfp_t gfp);
>>>>
>>>> Please drop extern, it's unnecessary.
>>>
>>> It's all over the header. This should be done as a precursor patch and
>>> I know that usually people push back on doing that. I gave up on this.
>>> Kernel is going to rot sooner or later... :-(
>>
>> In mm we just update as we go, this is probably the best approach to avoid
>> unnecessary churn.
> 
> I agree on the idea of eliminating it, but also I agree on the consistency over
> redundancy. That's why I prefer to see this done at once for all (in the same
> header) than doing one-by-one. And this approach got a lot of pushes back, while
> the former even more pushed back on the (in)consistency matters.

No new extern where unnecessary.

-- 
Cheers,

David / dhildenb


