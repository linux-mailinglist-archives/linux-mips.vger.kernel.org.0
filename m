Return-Path: <linux-mips+bounces-6490-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBD19B2D44
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 11:49:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C03DE1C21A2C
	for <lists+linux-mips@lfdr.de>; Mon, 28 Oct 2024 10:49:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F78B1CF2A3;
	Mon, 28 Oct 2024 10:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jx1CqIXv"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 163E0192B98;
	Mon, 28 Oct 2024 10:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730112587; cv=none; b=WvrvYc9xyJ0V5GgAW+KS/t2PPD0AHunbqO2FUunuUt2H/LG0Gv8bHfhaFtUV2zdFbF1QwCemJ5J3DZg+HNlrhux0oTkH2Su0SvBYsr/NeKVinfAK3OJsgdBUeE/Ka5XjA9OjPoWDGqHquAm/Ox8C6xmCZ0vjXlMRcLUbv47/quc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730112587; c=relaxed/simple;
	bh=OIlWErpCErhhvqC1O/BLstj0Os973FkT8FU9m2dF2y4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=izqtUc2c3bZTE8+5jnpvpn5d1+3uU4PZtsNmx5EX6aIGBlxnkXndUR7xg9bvflUS48cn/+ZBoz8w783z9z6KRCLu3pDzKVoNWetr6A8soGs3Te7GpYndCKpiuhoZWkpL6RIoY7sVfq07mlPvg2SCRqmRJAzozp4FMGRIzeo5Cwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jx1CqIXv; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5cbb0900c86so3105476a12.0;
        Mon, 28 Oct 2024 03:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730112582; x=1730717382; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BADti5TEboUpz7hQZAwm95LJ4r/iBnqor7lFpH91gUs=;
        b=Jx1CqIXvA9KUrVhiqPZYG5ZulMclVp0nks7EDlZlnubKOwpSEDj79jG4v1PfVrXh8Z
         /N/cxdXlpFJ1nbkOiE/stbgMZvuNO4ic4owt6tvJqHe3Q+HDdgzH70jgUlhPRUjdgHOK
         ODA+YSMTcyJ/6DOPalw7lknWUdNWnF4VhzeasF7A2JLZzaEwC2KlLDDDQNpnnwRZls77
         FPj2bj9cHd/3Pul62ybfmt88z25YYCVYhlDCN5QLPo1KBCQg69/VAUYiig0kjRc7FAnj
         avAhDnAp3aN21MmtYCkahxhWSRIR4mldIrlNfOGgsbbnxWpxtL2JEETPgc7ApTY492oL
         Jk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730112582; x=1730717382;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BADti5TEboUpz7hQZAwm95LJ4r/iBnqor7lFpH91gUs=;
        b=sspJDpOadx36kJGAyMsSs/SL6+QCa52a9iEpYVSL9p6SbwCc+lBAzWXqwjjyc5TzSB
         VYF/myZYrwqwpVvHqqu+izhYN8LtqCNgGbqirUWbV7Er5Ng8wHiy3wQg9Ucbf1Hkq1UD
         SOpP+84hWK7BBecX/GxFmYmbhBKngW4Ssnd7UMLOmmJJK59LtYPZ19HhYtSjjunHAftM
         QvSOeExtbPZ9hsTUYDwrBz2pNcwAwqHRqzHrOQDyOotHcIIs8ulcbiKWKBUDINED8uWU
         sH2CrEqJjCOyzntV2/4IhLTZGT/45efjxY1HcBtHZJbOa6EATAU1kXcA/PBaa1p0OPtS
         d24Q==
X-Forwarded-Encrypted: i=1; AJvYcCURs8OxEEkoXIyzXv3EFJ4h9dSCWFjWdCxaHP+C/cTzX4j/5ZJXgSLC1Rt8KNVvEPo/bhtwAfRJYjAMDLZj@vger.kernel.org, AJvYcCUVbmRYMTy/ZmWRoaCYUSgiSnG7Kdom31zAshgNw0ptyr2iJiFVqK+uvdjdDBjx8ZZE1Satraw5z2lv@vger.kernel.org, AJvYcCVvd7xfA12kTw5lkO08D7XoLQBxRRxarbgPIm5P8sql1pdGG0+vakAxytdLOLO9EQwYUFhwR6MCcLGR1w==@vger.kernel.org, AJvYcCWOa2M1/vkM1w5UCbEATTQr0QXBK+QgTwKFTd9Qpw/iJztUA7myZfcHlbOO0uYttIk4awSJGMJc0ARbsDaQMTY=@vger.kernel.org, AJvYcCWYswW85swLkgzkNesROMkLHIk8dIwvdbYA3XC4Dny6FNdN4eZJ3HJ67QNK4n3YWRACOeZFH7k7TY354g==@vger.kernel.org, AJvYcCWwP+SMGuKAMcgVbTHo4feZCLh8dPTX7WQFfTG/cl/liwpMfc9YKAjwM0p2VNQeMJx8ZkZ95qgy1sw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYaWCUiejFLYTcAPOMv9RJ8lb455tS1VjCZ+URCIXdd0hyyIX8
	Ue1PdAHs1jijyA/lB+p07kFPXy2PNQUj8bStq0F6Ztv5uhcbQacH
X-Google-Smtp-Source: AGHT+IEm+HFLbPsaDOWlAHThJ3+XtoGjdhXujglmfhVMP7yNqtZqIoTJpMUXVSYjXbaSqnnT3/SHtw==
X-Received: by 2002:a05:6402:5202:b0:5c9:5cff:3cc2 with SMTP id 4fb4d7f45d1cf-5cbbfa71a66mr5776613a12.29.1730112582021;
        Mon, 28 Oct 2024 03:49:42 -0700 (PDT)
Received: from ?IPV6:2a03:83e0:1126:4:eb:d0d0:c7fd:c82c? ([2620:10d:c092:500::5:1494])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cbb6258683sm3063919a12.20.2024.10.28.03.49.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 03:49:41 -0700 (PDT)
Message-ID: <71decb01-4241-4fb0-bc38-187e180d6ee5@gmail.com>
Date: Mon, 28 Oct 2024 10:49:40 +0000
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] of/fdt: add dt_phys arg to early_init_dt_scan and
 early_init_dt_verify
To: Rob Herring <robh@kernel.org>
Cc: mark.rutland@arm.com, will@kernel.org, leitao@debian.org,
 catalin.marinas@arm.com, tglx@linutronix.de, chris@zankel.net,
 saravanak@google.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 kexec@lists.infradead.org, loongarch@lists.linux.dev,
 linux-sh@vger.kernel.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-openrisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-csky@vger.kernel.org
References: <20241023171426.452688-1-usamaarif642@gmail.com>
 <CAL_JsqLBuzRYgnYHCdbdO4wneFNPe5_iEfbehvKK5M7bBuiyfA@mail.gmail.com>
Content-Language: en-US
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <CAL_JsqLBuzRYgnYHCdbdO4wneFNPe5_iEfbehvKK5M7bBuiyfA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 25/10/2024 23:15, Rob Herring wrote:
> On Wed, Oct 23, 2024 at 12:14 PM Usama Arif <usamaarif642@gmail.com> wrote:
>>
>>  __pa() is only intended to be used for linear map addresses and using
>> it for initial_boot_params which is in fixmap for arm64 will give an
>> incorrect value. Hence save the physical address when it is known at
>> boot time when calling early_init_dt_scan for arm64 and use it at kexec
>> time instead of converting the virtual address using __pa().
>>
>> Reported-by: Breno Leitao <leitao@debian.org>
>> Suggested-by: Mark Rutland <mark.rutland@arm.com>
>> Signed-off-by: Usama Arif <usamaarif642@gmail.com>
>> Fixes: ac10be5cdbfa ("arm64: Use common of_kexec_alloc_and_setup_fdt()")
> 
> This looks fine, but what is the symptom without this compared to
> before the above change? The original code in the referenced commit
> above didn't remove the reservation at all. Unless the current code
> does something worse, this is new functionality more than a fix (for
> stable).
> 
> Rob

After the series in [1] was merged, we always get a warning when kexecing
a debug kernel, which was reported by Breno in [2].
The issue is using __pa for a fixmap address in arm64 as described in [2],
which could result in removing a memory reservation for a completely
unrelated area.
That was introduced by the patch just before 
"arm64: Use common of_kexec_alloc_and_setup_fdt" [3], but arm64 switched to
using the common kexec fdt function in that commit. This commit is trying
to fix removing and corrupting any random memory reservation (and get rid
of the warning) that was introduced by [1], not adding a new functionality.

[1] https://lore.kernel.org/all/20210221174930.27324-7-nramas@linux.microsoft.com/ 
[2] https://lore.kernel.org/all/ZnFKEtqfqJkYflwL@gmail.com/
[3] https://lore.kernel.org/all/20210221174930.27324-6-nramas@linux.microsoft.com/

Thanks,
Usama

