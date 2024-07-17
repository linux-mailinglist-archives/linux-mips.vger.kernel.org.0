Return-Path: <linux-mips+bounces-4366-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 971BC933E87
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jul 2024 16:33:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB3661C2105A
	for <lists+linux-mips@lfdr.de>; Wed, 17 Jul 2024 14:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46DB7181B85;
	Wed, 17 Jul 2024 14:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IZ/IV3eE"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83D11802DC
	for <linux-mips@vger.kernel.org>; Wed, 17 Jul 2024 14:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721226820; cv=none; b=Z20R7z1cofEuEudN3Z/qAN4vhTP9U2qAokbUuUF6+4cMxEW8Tn6X/Jjk79oDlbXhZSJkn+RlmpiD3IYyZxZ8nbZZalZtLNTF8vl5+bt4lhiGUFk+E3fm+9P28BDuAG01xufmGFQslMrE5hioHw9iwSCYLB9tb402rGYyxLIha64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721226820; c=relaxed/simple;
	bh=UKE4C3ChcQCqvqZtO8WYSa+lxSVP5PaklsSxUaTSpEg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f56jse8tO+vHTK8bejik/SbHNYFh454zRPoGCe/Ddj+CNvnUjC/qTplGfXKg9q9RPYEQjCx4LGoZwdBo2mRPSabtbRD9sbO7jioIw4uCn+49V5ABUllszYt5AzggGjNtwOWO3nHRmIC4t6QM4pAwjApGf++hfX6IRbor7kmNxu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IZ/IV3eE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721226817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mXBB0qjMEXfzqVaUDcGt6NXANeyKiUeQZZAQu7kGYb4=;
	b=IZ/IV3eEtMqkbhqfoNGOr73dhG3UNwOIL8q/YKZP1lCvA6yj1cwIW/jnDhA8A9sEO0GnPU
	5y2VQGe9a0nIuEFavkOLgC7k4VCamj77OqYBGeRKR4tWY4f1J/3hu+0heXfQBqH8NxsCdi
	BT+DqjeiO7kSUgCqbHUqKwSSVQM1Wgk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-vtX4nE6kMHSXsvOnHEu7iw-1; Wed, 17 Jul 2024 10:33:35 -0400
X-MC-Unique: vtX4nE6kMHSXsvOnHEu7iw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-42796140873so45383545e9.2
        for <linux-mips@vger.kernel.org>; Wed, 17 Jul 2024 07:33:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721226813; x=1721831613;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mXBB0qjMEXfzqVaUDcGt6NXANeyKiUeQZZAQu7kGYb4=;
        b=kiCaTOD5vJ3pOlNqpU6LEH77V7SVSK7V6aHqiS5iAwB1K2aXPJrkQk0Y6PGRZufSOx
         F+jyBYcb2YIGGXramMgKImf3Et5jrBxdq6E0qCJiXEPleU3WPRu4RQ8NgkI7ogVG8Jgf
         z5xV3V5L+03A2EC3Cl53X7BNm5nhze+wGZPSlUH2+49+D7+8uOysOO0dIdi1h4A+HGbk
         ma1878D5OI+bD1b4uwiqn288ZT3b8Rjasme9VW9AbIFM/WZBCQ2hVaAiszRA3g9la/r2
         nSTOLLUPU0WgFx/bxsIT1IT4RTaXl4VIsgY8wrWh/cdxOJ/wgijj8brtB2xLJTuwAGWw
         ILSQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7EXVnEPCwXcPSDWG1hy/zbt7/Ct0wKcEv1y3a7uY471EDxAg1sCoiAA4+5mYLpLEkedjYtH8uwAe0GreTPjSjcrs4fPsY//CnUw==
X-Gm-Message-State: AOJu0YyvcJISXO9HR7hUJ5MIublmebjv998cTE5mzs0YGdjGFazp2UfJ
	NqHduIRjX1kVY/m1Dj3tg6039SxVDxhMrixjTJRW1umIf8rTKR1fS3F7hHKJqEaVbmcIC1zxGC5
	eZWVDQWmOmom0hDOaZpXamqL/FnN5yph4j+6v2bc0/CzK6rGKZwLL2g/XT7k=
X-Received: by 2002:a05:600c:3d96:b0:426:6f81:d235 with SMTP id 5b1f17b1804b1-427c303a321mr14977175e9.15.1721226813639;
        Wed, 17 Jul 2024 07:33:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgu8rq663eT8ufhgNgCFLg21tSPwYTS9ihkX5BMsdTSuq5GcoEgyv7xkCuRjh9w8LzVIxZFg==
X-Received: by 2002:a05:600c:3d96:b0:426:6f81:d235 with SMTP id 5b1f17b1804b1-427c303a321mr14976865e9.15.1721226813241;
        Wed, 17 Jul 2024 07:33:33 -0700 (PDT)
Received: from ?IPV6:2003:cb:c714:c00:b08b:a871:ce99:dfde? (p200300cbc7140c00b08ba871ce99dfde.dip0.t-ipconnect.de. [2003:cb:c714:c00:b08b:a871:ce99:dfde])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427c77bffa1sm74815e9.18.2024.07.17.07.33.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 07:33:32 -0700 (PDT)
Message-ID: <f73022b4-20d4-4358-9b15-949934d52b5e@redhat.com>
Date: Wed, 17 Jul 2024 16:33:30 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/17] MIPS: loongson64: rename __node_data to node_data
To: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org
Cc: Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>,
 Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heiko Carstens <hca@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Palmer Dabbelt <palmer@dabbelt.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-cxl@vger.kernel.org, nvdimm@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org,
 x86@kernel.org
References: <20240716111346.3676969-1-rppt@kernel.org>
 <20240716111346.3676969-4-rppt@kernel.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20240716111346.3676969-4-rppt@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.07.24 13:13, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Make definition of node_data match other architectures.
> This will allow pulling declaration of node_data to the generic mm code in
> the following commit.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


