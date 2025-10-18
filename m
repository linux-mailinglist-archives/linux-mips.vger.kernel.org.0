Return-Path: <linux-mips+bounces-11773-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5E0BEC2C3
	for <lists+linux-mips@lfdr.de>; Sat, 18 Oct 2025 02:33:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7A3254E4098
	for <lists+linux-mips@lfdr.de>; Sat, 18 Oct 2025 00:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4883F18B47D;
	Sat, 18 Oct 2025 00:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DUnuhVT1"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8DC6145FE0
	for <linux-mips@vger.kernel.org>; Sat, 18 Oct 2025 00:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760747626; cv=none; b=dB9AVvUdC/KwuVOhOepXGmupn+1q2jsxuLlmT1CaQNKdYdMAzIlqK1h4CROvxRH/BPcGbeSGpp9tSJ2/VCW847Vym1ZaFLH/iJbIQ7pjRgzpaLmm0Kuhe7ITfsjztLNz1qhCddZb0mdQGdU7fklxLhP2s5Z4v88AAouKkD/3saA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760747626; c=relaxed/simple;
	bh=+jLo6TCdYJAoHLVyhHS6TeaeOVBLG1L13wiRqIS43Is=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i4if+Mv8Ic/a46kMnUZX7JqbW8hK5qcRNqcb1S7qYCfGOVhxGVcJQxr0PHjB6Cl9tqlMtavqVx/t0GHk/RPc8MpheUElGEJil+QQ1zx+QZqdxREJx/LrtoYYRzNnszDm1P3ZcVsPC05S7NYbSZG7M7P3MwBl27jd+OgHOOoTNeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DUnuhVT1; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7811fa91774so2276013b3a.0
        for <linux-mips@vger.kernel.org>; Fri, 17 Oct 2025 17:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760747623; x=1761352423; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=mNQ3o6/S5vwS75e+KGyptwfjwTWI64tZpqc2vFKQ6wo=;
        b=DUnuhVT12DOfh2HfYSnLuXhWBIHQeGz0qWVZEAQZxh8F6keU5wCfDI3vifid1CITC0
         KXYEDhfufZpp0ZoMTOfIvS9YEfgbQUgQ8aN2jvCbVpxcTKzw/4MunUxlUI+rH5A3swOL
         EHak4HDHgAE88v7T2u3Fd5tNBjpNGhAx398EpmOdLQdVnS8GUmstk4Aa4xT/0QEIhEbW
         VMA3tEswdDm7Ix8myGTXuOhrPnIsnGhn9Ox7kmJbc8vbFW5S4AADt0Yd+MfO+Jddx9DR
         N1Bedeu3X+FV9wNPDBLTz7JyPHf/QzrmYc56soAhfMj0aaz+55FoT/yW5zCi1kJ3Ui9n
         j1Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760747623; x=1761352423;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mNQ3o6/S5vwS75e+KGyptwfjwTWI64tZpqc2vFKQ6wo=;
        b=KakmWufj4NMyGCG92cjLSkpTUotoGI/k2u0r+RqW0fu+nVS5V525Mh+hC1wNRS0CDF
         7Apn/h5sGodTGr0vwuSmD5jiQXyYfc9+G0oFop6OeUahljWuwHLmNGVVhMkUwU6QofO1
         AwyEua+8dUzajjLT6V45qiSiiEGklBumRO+sWhSc/7aZmYTlfcGp/rVgcny7WrGUgiaN
         oamH1tppkyrwxQilh6ajD/q6eGwUQG+lld0+nISYmNzbvSVMqPgpJHYv1bkBKCsSdOBg
         tdqPyTXgh+eHZCECJBrjkZ5HGGaMVLmUg8Kta2Fz/5MAuf5T1rMvvJoG93qK2D9At/qA
         I1IA==
X-Forwarded-Encrypted: i=1; AJvYcCVQ0Q0k9l0o2VpRSdWHklLQLCGXVzWqA/k/Tv8AWrGo2pY3pwtoJF//hf6MAEufdcDLfumXjE3gDNie@vger.kernel.org
X-Gm-Message-State: AOJu0YzfJv/raYmIDk8U4aXHunsnjzcWuO1dcxXBfH2q0+CouYAEudye
	AojZ3tE1PpTOGqeNyONTk23B7w/5TNpQnOy2n14ezVWNih2bRqVjFFQb25vnvw==
X-Gm-Gg: ASbGnctZsgzIMRP7vmdQtmPAxbJ1a5P7JUUylQqSoaSzdGDCrI/qj+DjNihyC+FxDyA
	pgRqLAPI93SHDHl3CVD00Lg/dKo3xsmJvUxVStk/Mg/2ZOKaXFxAXKnAagwbTrNS4oowMf+ldus
	sLpP9A975vPN5jPM9KzN5ha40ku3oCWkezX3dyYprPVklraPmvMlZ0Y3MLY281xtHxOTc1+8Ctu
	Ncoz6y5b72Z6Azl5EMgMA3nIKIi/t8DFJD3fVThyZwEUj8VYvofgHcFAGzVEx9nsd/mRvOaciVb
	aV5VkM3ppvyuiRtUeTIFm+GVCuqBm1zcWRVa2nsGeBLjX5dV9B8nl7ViI27aX5B1gLutz+92Ugj
	esFtRN4nGKKRadbCuOwdxQwJU0puELsnGvX2OrUO4CcOVGDw4Ls7eCRpYgaIkqsrXNmzCoZJcs6
	uM3h2+iJdTZMbI4x+dr006AvHEN1vz0VLImdFcev9iTtkimAug
X-Google-Smtp-Source: AGHT+IGMCDgh/B2GHTZDwyV/CO5kj49UE73w291sPV8yTRu02knOXGEYCKqEOMVC2gGRrkKxHKiZnw==
X-Received: by 2002:a05:6a00:4fca:b0:781:157b:3d2e with SMTP id d2e1a72fcca58-7a220a98d75mr5871123b3a.21.1760747622557;
        Fri, 17 Oct 2025 17:33:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a23010d818sm863737b3a.53.2025.10.17.17.33.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 17:33:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <77ebb89b-422a-40b6-9140-bf277517ae9c@roeck-us.net>
Date: Fri, 17 Oct 2025 17:33:39 -0700
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] MIPS: Malta: Use pcibios_align_resource() to block
 io range
To: Bjorn Helgaas <helgaas@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: linux-pci@vger.kernel.org, "Maciej W . Rozycki" <macro@orcam.me.uk>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251017221204.GA1050107@bhelgaas>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251017221204.GA1050107@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/17/25 15:12, Bjorn Helgaas wrote:
> On Fri, Oct 17, 2025 at 02:09:03PM +0300, Ilpo Järvinen wrote:
>> According to Maciej W. Rozycki <macro@orcam.me.uk>, the
>> mips_pcibios_init() for malta adjusts root bus IO resource start
>> address to prevent interfering with PIIX4 I/O cycle decoding. Adjusting
>> lower bound leaves PIIX4 IO resources outside of the root bus resource
>> and assign_fixed_resource_on_bus() does not link the resources into the
>> resource tree.
>>
>> Prior to commit ae81aad5c2e1 ("MIPS: PCI: Use pci_enable_resources()")
>> the arch specific pcibios_enable_resources() did not check if the
>> resources were assigned which diverges from what PCI core checks,
>> effectively hiding the PIIX4 IO resources were not properly within the
>> resource tree. After starting to use pcibios_enable_resources() from
>> PCI core, enabling PIIX4 fails:
>>
>> ata_piix 0000:00:0a.1: BAR 0 [io  0x01f0-0x01f7]: not claimed; can't enable device
>> ata_piix 0000:00:0a.1: probe with driver ata_piix failed with error -22
>>
>> MIPS PCI code already has support for enforcing lower bounds using
>> PCIBIOS_MIN_IO in pcibios_align_resource() without altering the IO
>> window start address itself. Make malta PCI code too to use
>> PCIBIOS_MIN_IO.
>>
>> Fixes: ae81aad5c2e1 ("MIPS: PCI: Use pci_enable_resources()")
>> Fixes: aa0980b80908 ("Fixes for system controllers for Atlas/Malta core cards.")
>> Link: https://lore.kernel.org/linux-pci/9085ab12-1559-4462-9b18-f03dcb9a4088@roeck-us.net/
>> Link: https://lore.kernel.org/linux-pci/alpine.DEB.2.21.2510132229120.39634@angie.orcam.me.uk/
>> Reported-by: Guenter Roeck <linux@roeck-us.net>
>> Suggested-by: Maciej W. Rozycki <macro@orcam.me.uk>
>> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> 
> Since ae81aad5c2e1 ("MIPS: PCI: Use pci_enable_resources()") came
> through the PCI tree, I'd be happy to merge this as well, given your
> ack, Thomas.  It would be ideal to have a tested-by from Guenter.
> 

I'll run it through my testbed tonight.

Guenter


