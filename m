Return-Path: <linux-mips+bounces-11172-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 48ECEB50A0F
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 03:06:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04B6C5E5050
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 01:06:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E24B1E1C3F;
	Wed, 10 Sep 2025 01:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="krjcZ1dS"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378911DF99C;
	Wed, 10 Sep 2025 01:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757466367; cv=none; b=WvESHgrkaMaLju5lYKwSBH8aBt8fxk/Txf5F39EXtGYpbL9wQ0rDbIfQyo/ye3NSgBXOXGyWOSwZXGTTGR+YligyHzV+IT9irB5e78bp4FFIXdya7dXepdl5fNLrqkzHROO0LK4EIocvgEOy68tnBiIFbzsTogsuYFptWzlB0SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757466367; c=relaxed/simple;
	bh=i4RESWh/U9IijTR7kjtC1xewNFoRiMOQyOIAkv3bc6A=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=Kk/p94ebhCmPD8co9iTHM3IWby/LT2d2O1+quS+ja0cfmefjnMQ1F+Vvp5DenMUSkKA6ocUzh5GYKmZlR5WkjMMFlbpGQ1xAd2tel89+2vd/hpNeEUr2XQRKLx0t/9wwLZ0moW+N/5KgM0rWTGEkyEw6K3QJPkAG0u/NxayMM6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=krjcZ1dS; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b043a33b060so980852866b.1;
        Tue, 09 Sep 2025 18:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757466364; x=1758071164; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PDZwAXLouP084B9hVHdN4iMIIVS5iU06EyLqPH/Ivgo=;
        b=krjcZ1dSfjyeNDfkrnxiu+6b/2czHU6xiYRaOqq4hHefEk+xXAQ1GFfvIhPXAW5zzP
         RzoxHCoiZ51Bj4wV7h8CEN15LjKQyU0RPOI8x/tH5llqQnswZET7kAhkpecLpv85dxok
         KY6QwZkj04+9wuwh+LWym72m+/w+2JxyVS2vY6rrhHNoh1VmBwgM3hxPHHxfdvoxrDHe
         IUZeU72WZqsasU/OBj87/yNxaWrmHWNwlIlMhaW/2gzkMI5ccP0J6aALUshTDvX37m9X
         ETfxBUm2AouV3CShY4I2lRdj/4ousXMBXoXOQWqHgeFbfh5Rz/Qw7gLGmpedT5tqNKN2
         Cz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757466364; x=1758071164;
        h=content-transfer-encoding:in-reply-to:from:content-language:subject
         :references:cc:to:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PDZwAXLouP084B9hVHdN4iMIIVS5iU06EyLqPH/Ivgo=;
        b=i9sBayB7sI/4Lb4nTE5To+bQTUkdslNmge+3fnkEr5fEzhrU/4ysYvMVOmwbz+eI7X
         87PvaZHmUZyWBumxv9PmxyUa9mp5PM1Bj38QugSnMUFPGZJPOQ8mkHjSEF0RkdoZWTJZ
         sPFNYe/paJnqH1GEkhaVbrK9S+qrn3qaIkT7HmW+8fDI9rvCZ1hVZsZt5vbIqHncP0yM
         3gl6bcIMMXNamFYeBqjgScatxV+TAdVVxUXyGOn1wuDqrmawdrZhjZfqwrwGHE3gcT9i
         ZNJZgqr33UfFDeDu+3GGeJYS/3aeQhEglql6zeR1QHAiSTx6xKTu58pGxtnCvWCEwYzE
         ZzEw==
X-Forwarded-Encrypted: i=1; AJvYcCWjKkMpK/YYCJoqcGbmOdv7pZcSTGFwK/sAmxwciXK0dBbLst5r9B14ueqoLXf4cRtn9COu2u92s/o5TAc=@vger.kernel.org, AJvYcCWtx19me9IOb6Nb85UAuPwqx4Vbzz6snCLM5GRwQxRjwH72+vLYUoW27mrKAbPT81wgAPSv+dmnJu7y4A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Yrj/i4Jx7XsxdixXmhVsLFHrgOuqD39uxKp+4uhFNJoB7Sp9
	myVRToGXwDKgdN3sI2vJfBi3d/5RJK3kkYewKacFnt2KN/akUO9vQYyD
X-Gm-Gg: ASbGncuiBDvf49NyZs1Z1evykmNRRIgYGkGal8L94LP2roLNlk7V40G+WOV8NL2JrhN
	HaiIjb8NG70n2a9artKfXdPc+vGAXdRPl9IhObjjdDO18F8uKDrjHYlK9dUUijQsr+L5xOco2KS
	xT/OjRMvC415H8e1FZnEk4hIMZFQjMK6O9uSZ9P37FcXqrNZC7283QSp/6P5H5cRGlAz33N+O8M
	UfGVbUDVe6rREQ0ZAMTi9YlVQ+PzdI5/C3Esn2YNTUm7P1EwYCim0/BRysHC+aMuKEbMR0uZ4R6
	0DJjH8+16Nl4SlYINkinMeuKONPxq1TqX0PkwPnZ0tkzYKNPdSeU1s0obiDdMui+xBxBuWHjuHz
	HXzaTFl6jgtowB/pd6aRXiFw+ji8sdey9h/ECQESAzonG61ddCDHtb6Eln+YgBJUfjnQ5fPt6
X-Google-Smtp-Source: AGHT+IFjBmxeo0iihWNvQGW9XaPHPBKL/NIGGGOL86gq7iDWLkzDSZTSGw6FlnjUE/qdjGTpbeIhew==
X-Received: by 2002:a17:907:72c9:b0:b04:4ba7:4e0d with SMTP id a640c23a62f3a-b04b148a54emr1331824166b.26.1757466364453;
        Tue, 09 Sep 2025 18:06:04 -0700 (PDT)
Received: from [192.168.0.51] (217-62-96-139.cable.dynamic.v4.ziggo.nl. [217.62.96.139])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07830464f9sm78316966b.9.2025.09.09.18.06.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 18:06:03 -0700 (PDT)
Message-ID: <bf46e8f6-221a-40c7-9da5-8003397ff113@gmail.com>
Date: Wed, 10 Sep 2025 03:06:01 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: torvalds@linux-foundation.org
Cc: Liam.Howlett@oracle.com, akpm@linux-foundation.org,
 alexander.sverdlin@gmail.com, andreas@gaisler.com, ankur.a.arora@oracle.com,
 arnd@arndb.de, chester.a.unal@arinc9.com, christophe.leroy@csgroup.eu,
 david@redhat.com, geert+renesas@glider.be, heiko@sntech.de, hpa@zytor.com,
 imx@lists.linux.dev, ira.weiny@intel.com, ksummit@lists.linux.dev,
 l.stach@pengutronix.de, linus.walleij@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, lorenzo.stoakes@oracle.com, nm@ti.com,
 richard@nod.at, rppt@kernel.org, sergio.paracuellos@gmail.com,
 surenb@google.com, vbabka@suse.cz, willy@infradead.org
References: <CAHk-=wg0bp-_kqmfaDYQLRJO30LYxEsMu3EKi65sKoi83EUZ3Q@mail.gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Content-Language: en-US
From: =?UTF-8?Q?Ren=C3=A9_Herman?= <rene.herman@gmail.com>
In-Reply-To: <CAHk-=wg0bp-_kqmfaDYQLRJO30LYxEsMu3EKi65sKoi83EUZ3Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> Well, while on x86 1GB systems did use highmem, they'd typically not 
> use very much of it.
> 
> IOW, they'd have about 900MB as lowmem (ok, I think it was 896MB to
> be exact), with something like 120MB highmem.
> 
> So they'd either lose a bit of memory, or they'd use the 2G:2G
> split.
Right, 1G-128M of VMALLOC_RESERVE, but they didn't generally use 2G/2G 
but ever since it was introduced late in the 32-bit era VMSPLIT_3G_OPT, 
i.e., PAGE_OFFSET = 0xb0000000, i.e., 3G-256M/1G+256M.

Although at the time the patches died an unceremonious death, 4G/4G 
patches for x86 were also around; I used to be a (conceptual) fan of 
them: it takes quite a number of TLB-flushes to suck more than highmem.

Not one hint of clue if spectre/meltdown is applicable to these systems 
and if so, if they in fact do or should already be suffering through 
those same flushes anyway but maybe it'd be an option to dig those 
patches out of some archive somewhere.

I promise I'll test them on an AMD Duron with 768MB RAM :)

Rene.

