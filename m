Return-Path: <linux-mips+bounces-10621-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2E0B363EC
	for <lists+linux-mips@lfdr.de>; Tue, 26 Aug 2025 15:34:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A5ACA7A1A82
	for <lists+linux-mips@lfdr.de>; Tue, 26 Aug 2025 13:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADE51345758;
	Tue, 26 Aug 2025 13:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b="0m1reDW4"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3D8341ABD
	for <linux-mips@vger.kernel.org>; Tue, 26 Aug 2025 13:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756215186; cv=none; b=OOc3z9Rz1ZFT8ijHge44E7nQqLrbc859sLLne9AOtxHwhZ/Dnny9vyHwHzb8+kQ2/jPbkp97BkZsTQKqgp4gaR+WqX1Mk0cThneMCiA/ixthp5KZa1GaeTSH7TAslm7YqKlofnS2RAVTK3HOUrXAKhxYHoXFIUN4bIsaZ5v9r/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756215186; c=relaxed/simple;
	bh=oWw9E1ARf/liDxi+bd5estjy09+4qZSi69zGI82k4YA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hIt4VjnAMrg8KZXA9SmBRNl0PtgzgJtAYCmM8ax/brcpjiq0QlYHX8Y4c1b6FJkX+w9/BSHYGsQ20Uj0q4kMWWTK9Oagmpkn3gWf84kP0SV7RLqvuTDb1sZfZ5j8wJkdkcJoWfTFWH27Z3KW8bLFr8r4hkMFiLCbdcKEF+ttbJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk; spf=pass smtp.mailfrom=kernel.dk; dkim=pass (2048-bit key) header.d=kernel-dk.20230601.gappssmtp.com header.i=@kernel-dk.20230601.gappssmtp.com header.b=0m1reDW4; arc=none smtp.client-ip=209.85.166.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-3ea8b3a64c4so14401635ab.2
        for <linux-mips@vger.kernel.org>; Tue, 26 Aug 2025 06:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1756215183; x=1756819983; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mTDpa33JS2qApYszgwNnpSK7UHfHjgv5egclBQN5xTA=;
        b=0m1reDW4hAfva0Q73AZIZFTIW2ixbvSgs1vQSkyEGR71DEPrhBuJXaQURutOBynY1v
         2vRClAv4jZk//2U1ABvIoW9v9pGCEjVPeKeR+P/vYwGUnPmsYJ+9pqOPBMvOiGAzGRzP
         aosWWb4mReYkYDqE5H1PeLiJnRbxcS0Qq0SyAjn/fjYVFcHVzlhXddXAE9U4XP3AW4+r
         QnLjmrPENmFKAcl7mweDO5NL7ch0MnNzF8xhgTcz5DAjI33bNIZdZSSxODvDi3NoFl0E
         BiLZ9l93jMHK8lYXw+QEIJKdi4QL95i8PbrXjnVnp9oFJBpIu/nukcCslWqa/rAaYuRa
         hDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756215183; x=1756819983;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mTDpa33JS2qApYszgwNnpSK7UHfHjgv5egclBQN5xTA=;
        b=csf/8RxKypViMBrMhN8Hh1pJ21UEr5BjHK00Sy7c2+sZ3qJ7vQ2t2QdHiX1C/pdmlD
         AUqSeJfsRNrzoQrinFIwHiHrBWb+0IxIX489zC7n3dWiXQZe1BKuy+nM9u0BAQlNjuw9
         YSXxEjtp242eEYQGP4mqkuwkpBW0zpBtuLCYtmCinTAyrNxmX/KT4SCGc3MpmPx8prpH
         5HzTkefe2ifQFtswi1nfDTx4AsHiNcD6vy2i1/DXdpClleIKahSEWVu4qc4wU7YrXiZ0
         1hyjRb4RX+bb9jfhU2r3aq9JpnjlUct/5qNnBJhXyJw3xfSqRYjwFAsLbFzdXl6JYNrV
         +Vjw==
X-Forwarded-Encrypted: i=1; AJvYcCXQID/WNxoU2qkLs6bsPbipROa5Pk4FSOoQ1vsJfmziAL3Tu9VHta8JSSCtYckrQRo7jzMWrnhBs0Ki@vger.kernel.org
X-Gm-Message-State: AOJu0YyiaHyD0n9lVwo8KHNPQeQyrvr2L6D8gOv5Ou9nSy+FiFsIsutI
	dFWs1qU/zwpZqUTRfA/sofmUQMyEbKW005LM7DO7vR6v5h20cRIRVsjTaYz/o/ZLb78=
X-Gm-Gg: ASbGncvcBY8unySYjOJVujqc626uELmd9SMvqp7+08ACOFvZcxfj2ujV7ZRGbtNjgn8
	hPm4S9r/T/ZrnRaS53IswFV1+m+jaCmoon8S0EpU5u+eor37CSF9j8SDyl/LHGgFs26CIGlvx+p
	1J98ispsmOaBHjNWS3L93/cIjv7ECCckI32u+iFIQmnGbWTCmYY+V8b3ZnH0MW6kEl8l5Tt1O8U
	QO1Htgq1527A0Q3w5PDjz05ip7ede5sUeiIo7kVl2LCYzaz79kAJ/bgEWODMM+kHuTdn30WrxZG
	pSbnfZuZm3TFjbt92iDkgVx9CoSJDV9occOXt0YOI6CXCB2qj4a+RAOr7sR80Lpazi6lMhBQOMI
	tyM45MHlpnZGyzfX3/BDE3g1xI81O9Q==
X-Google-Smtp-Source: AGHT+IHyeNqFLofJtawZSGlF7nwnpmwOET4pLDhklPZVdBrPT2USiWbLxPrFpiB4fDQsUH70NQxHfA==
X-Received: by 2002:a92:c244:0:b0:3ee:7c7a:c880 with SMTP id e9e14a558f8ab-3ee7c7acb24mr41586495ab.28.1756215183022;
        Tue, 26 Aug 2025 06:33:03 -0700 (PDT)
Received: from [192.168.1.116] ([96.43.243.2])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-886c8fa63casm630889339f.17.2025.08.26.06.33.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Aug 2025 06:33:02 -0700 (PDT)
Message-ID: <4d8cfe65-a8fd-4f3d-a324-8873f4016ad0@kernel.dk>
Date: Tue, 26 Aug 2025 07:32:59 -0600
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] floppy: A couple of cleanups
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Helge Deller <deller@gmx.de>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Fourier <fourier.thomas@gmail.com>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org, linux-block@vger.kernel.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Ian Molton <spyro@f2s.com>,
 Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Denis Efremov <efremov@linux.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <20250825163545.39303-1-andriy.shevchenko@linux.intel.com>
 <175615490112.25116.3742797696959119744.b4-ty@kernel.dk>
 <aK22kUhlxlyvVLax@smile.fi.intel.com>
From: Jens Axboe <axboe@kernel.dk>
Content-Language: en-US
In-Reply-To: <aK22kUhlxlyvVLax@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/26/25 7:28 AM, Andy Shevchenko wrote:
> On Mon, Aug 25, 2025 at 02:48:21PM -0600, Jens Axboe wrote:
>> On Mon, 25 Aug 2025 18:32:54 +0200, Andy Shevchenko wrote:
>>> There are a few places in architecture code for the floppy driver
>>> that may be cleaned up. Do it so.
>>>
>>> Assumed to route via Andrew Morton's tree as floppy is basically orphaned.
>>>
>>> Changelog v2:
>>> - combined separate patches sent earlier into a series
>>> - added tags (Helge, Geert)
>>> - fixed typo in the commit message (Geert)
> 
> [...]
> 
>> Applied, thanks!
> 
> Ah, thanks! It's good to know you can take (and actually did that) them.

I've always been happy to apply floppy fixes or cleanups, I just treat
it like any other orhpaned/unmaintained block driver.

-- 
Jens Axboe

