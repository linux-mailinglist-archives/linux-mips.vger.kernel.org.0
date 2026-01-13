Return-Path: <linux-mips+bounces-12891-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AA49D17F12
	for <lists+linux-mips@lfdr.de>; Tue, 13 Jan 2026 11:17:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB5CF30081BB
	for <lists+linux-mips@lfdr.de>; Tue, 13 Jan 2026 10:14:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FDC5313550;
	Tue, 13 Jan 2026 10:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a3gRe+rr"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067B5389E0B
	for <linux-mips@vger.kernel.org>; Tue, 13 Jan 2026 10:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768299265; cv=none; b=C7xyPv8WQb/Oo0EV4bIwaDa16BU0XZs4wP5k4iu9NrkZt0fJKyQOyxD2iy6aTfiSxuNirHVc8SmiE9mIbio8mIstgLpw3jNNnlq1ey5BF+b6VvDu9wIQkd7DVjX1RWxg5emdWniiqOhU8+YfO0ioJQoRlcqj5HAJ0fhsyWBXqDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768299265; c=relaxed/simple;
	bh=39NtxAeqpXvhawaLycQSgS8a7QXmm9U/xmb9EyW+PGc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=AnKp037Ue9E8G86r6jvv1ubs/7ZIeGZfdP8o8nhz/n00xoZ6xLGYAPK7JTvvUjFDj1NQ4dTx//UzBBhPsMxzD8/y7n0bUpfyDV+hX3ceOGu5oqbF5ht0DKDreSe1PXeXi78MvA339giP9wwfyYC7ElquEYtRbNsHdYTkpiWu6zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a3gRe+rr; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59b72a1e2f0so7210789e87.0
        for <linux-mips@vger.kernel.org>; Tue, 13 Jan 2026 02:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768299262; x=1768904062; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VgnN5gtqEe3Q1O0kTTet9lBrugKrM6JP8dsQeWrl1xo=;
        b=a3gRe+rrNGrlKDHBgSQasRnqSlGIDYnd6wmXjmP5+FdEbFKDgDiRChpYM5yhtVdXZA
         fkeyLzUVXUEvejpqwvtTnyB483YAwXVwqQkB0/GHjP0SgJf9OYnuWwFWd+oVwneAaKFj
         QIwxqe/ba0Abzs8ry+CO5AMk5v1BA53JT7sT7e8mVvyN5G+D5P0mKegMLYhjbSEq5E7l
         z73PA/pov84m/7ivZ4egy6/TmU5GX9RIVwko4U1WpI7wW6X9LBDVFCFusE6H0n05wuoN
         CmIEGtQOHfZflw8KTbE3O9URZYNuQcU5kzJTGRSUSgoCIosoHumq5Bbu32+1LeEUgh9M
         KfBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768299262; x=1768904062;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VgnN5gtqEe3Q1O0kTTet9lBrugKrM6JP8dsQeWrl1xo=;
        b=eKhelDNSXzcrhOlTzZ3zVNZvGRPKARczDvAaMTqXsjFfGVGOYJVthbBB31c/kY9Xtj
         5KlWVhKhnWDWPL7Ot6DJrr3RvlYmMTmzETP/lKZoBgXNXmCEMbKIQns0vYzKwnvJoT9q
         I1IvN5gtZdynfNZ4YdqkuANCQ5ueEpOj6ZTUZQs5BPhbwbyc0t7BUoJAdIGrZyZbOwu0
         j/xdx+mrDTYOs4CRTCZ+dxzZ56Qc1i2aEvxo5OpE8r1KN+gTIhFz2bSqLlxfpGcSwTVu
         5ieFnAGua1F1WRCwrMoAZaXAmlwKhtOdsuJ41rkNVYe2jWDKijPAsa+2dtPljpRtyixt
         mh3g==
X-Forwarded-Encrypted: i=1; AJvYcCV9qLmeEjqQCpslQgMZyyi06uIoaBVCMaGLIgjK3rGquN6VTSQ/c9yPvU5esLxQjUwiFTsf2LGCP05E@vger.kernel.org
X-Gm-Message-State: AOJu0YxdG5jED3rhep0z8qQUS/Ulu5KgCdU0vUkEgoCjldi+ONBQyHQd
	ELJzJP9/plTJXriSq4FQq7CmcB4Ha/gLOsop8WXx4TtOq6CawrGc+Ps7HA82pw==
X-Gm-Gg: AY/fxX6Wb6FGy8LqWJ1nlI2oDUlDQRTjdnjDSw2WHBBUTKZYil5jKZOnvRJEc05tis4
	DUITV8EpEzCFTV1/c3hFex0VhjwJhsm5ONmuf/vLa/nGgvhu59Vtoj4FawnudmZZxy1uuxBLRBj
	abeCySqlV3XRk7CL9AzTTPDV5jEMnDBNe0ofpQRauYkVzNYsBxQ+zgRiNiaGiIi1Zy2AHxZuA0j
	1yskujIpZj1dTMyo8f7frKHZQ3oaOzshHFnRJa9YSRmQuaq8VUowwFr6NYwyCtEOqd+SskGEZB0
	/z44MW0KX0Pt04QShm+YZRk2aL8lFxTDBBWI00366M/BpCHyNaxQ6pvdNuqC53QvUrgvsNfW81X
	QiPM2accVVW5M0ZR/Ltc8705fCQK5hdiU1mYSL2DWJ0gQFknwX349YujqOygM+pS9VCKmV4Tln4
	558y3BHcg7GMcBR/OXLOiAOHvPL/gdASTYPTq2FGe3QCtV3b2XQ6ZPWGewsQ==
X-Google-Smtp-Source: AGHT+IEOoK2sWcGzQ5k4NJjsFR/RmdeWAB9vvZrFfNJ0u+S6dsEFK74/fdYnqiqEV2XmHMt6sJ390w==
X-Received: by 2002:a05:6512:138b:b0:598:e851:1db3 with SMTP id 2adb3069b0e04-59b6ef05760mr8236951e87.11.1768293628066;
        Tue, 13 Jan 2026 00:40:28 -0800 (PST)
Received: from [172.20.10.9] (mobile-access-c1d2ca-216.dhcp.inet.fi. [193.210.202.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b72f3ae82sm4416299e87.71.2026.01.13.00.40.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jan 2026 00:40:27 -0800 (PST)
Message-ID: <f861a1c6-7ec7-477c-bc42-f9aaf6724bed@gmail.com>
Date: Tue, 13 Jan 2026 10:40:22 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/29] arch, mm: consolidate hugetlb early reservation
From: Kalle Niemi <kaleposti@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Cc: Alex Shi <alexs@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>,
 Brian Cain <bcain@kernel.org>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 "David S. Miller" <davem@davemloft.net>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
 Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jonathan Corbet <corbet@lwn.net>, Klara Modin <klarasmodin@gmail.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Magnus Lindholm <linmag7@gmail.com>, Matt Turner <mattst88@gmail.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Michal Hocko <mhocko@suse.com>, Michal Simek <monstr@monstr.eu>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Pratyush Yadav <pratyush@kernel.org>,
 Richard Weinberger <richard@nod.at>, Ritesh Harjani <ritesh.list@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Vineet Gupta <vgupta@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, x86@kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org
References: <20260111082105.290734-1-rppt@kernel.org>
 <20260112142323.495fc43e662e7d276b0fa371@linux-foundation.org>
 <86b974d7-cabd-4913-b5f2-5b62b520e023@gmail.com>
Content-Language: en-US
In-Reply-To: <86b974d7-cabd-4913-b5f2-5b62b520e023@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/13/26 08:50, Kalle Niemi wrote:
> On 1/13/26 00:23, Andrew Morton wrote:
>> On Sun, 11 Jan 2026 10:20:34 +0200 Mike Rapoport <rppt@kernel.org> wrote:
>>
>>> v3 changes:
>>> * fix empty_zero_page initialization on arm
>>> * fix ZONE_DMA limit calculation on powerpc
>>> * add Acks
>>
>> updated, thanks.  I'll suppress the ensuing email flood.
>>
>> Kalle, can you please retest sometime, see if the BeagleBone Black boot
>> failure was fixed?
>>
>> Seems we haven't heard back from rmk regarding
>> https://lkml.kernel.org/r/aVrUDeSkqqY9ZCtS@shell.armlinux.org.uk.
> 
> Hello!
> 
> I will test this v3 patch ASAP and reply results here.
> Collective sorry for the delay; I have been busy!
> 
> BR
> Kalle

Hello!

I tried this patch by cloning 
https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/log/?h=hugetlb-init/v3

Boots succesfully on BeagleBone Black!

BR
Kalle

