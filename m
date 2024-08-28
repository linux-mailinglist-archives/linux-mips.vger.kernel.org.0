Return-Path: <linux-mips+bounces-5170-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57190963188
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 22:15:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C2941C21DC9
	for <lists+linux-mips@lfdr.de>; Wed, 28 Aug 2024 20:15:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C93291AC88B;
	Wed, 28 Aug 2024 20:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="QexoVRSQ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08641A0B05
	for <linux-mips@vger.kernel.org>; Wed, 28 Aug 2024 20:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724876137; cv=none; b=YjcSvdLKcYC8mqaaCnbGmT5H6W22vHmVoTCG5UUNs/AYm7UA4HlYbgLW5r5ix8ILSNk9EyQCwjLryWRO8q1WsP72ZfNhL2yjgfmljKeClP/hpG5yyyQfqs07ueW1fO9PwK9EZLIcqz3djbwxztJTvirxIl5SvvtJgGGNamL7yT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724876137; c=relaxed/simple;
	bh=bYt3NNBaLSmLKZlvbIxmegVun2i4HAdZ1sNs8730jNM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fo6BK+pr7Nv3PmB1DK0QmnwSyovlkWsHszBg4japA0tMCLz662zsa8GFc3R4nDX+8myFdHYcvynE3DoUSYy8hG2RumNDvcSUWSCXpsYgSvzEYNgN2Z4GC37Kwu0/BJp0Z+7UxVlvI2gGjSxVRFM8Fx48jVs/gXb57Gg0LGh3290=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=QexoVRSQ; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-715c160e231so2282803b3a.0
        for <linux-mips@vger.kernel.org>; Wed, 28 Aug 2024 13:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1724876135; x=1725480935; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DYouNjU8LVMpXKc1rxZ9hcDgJ8HQG0MfeaXtb0VLyGI=;
        b=QexoVRSQ+Qj1kBx1FyMlS7JWbF7HpN1U2iPzAVYOglWarAkEuOtXBpiIwMac67nzqH
         rp1HBZBu6/+9xmHswfdeQC5EZmXjIw442shzAg6hCloVi2Rd3Igco0A6VEhi1hcDdFkR
         iQ1aTv8K7wXaArOdVlpCpNH/TkW2MFEl3riUVSiBBBhpqsHPD+G6zAY5zgw2H3RfnPW4
         /ipyK8AqIXQBU8TC4E9g8ks0FyU9cGLb81iW8B+v7zZAYXijInaq2guKXM8g9NhZhCkl
         C59RhhFnsd5uO9ErfvBJXDMUOSV6WTtvJ/d78yDM3OQTdKx4qrcV0JMZAlGu9AZ6vkBF
         FzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724876135; x=1725480935;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DYouNjU8LVMpXKc1rxZ9hcDgJ8HQG0MfeaXtb0VLyGI=;
        b=WJjPwUscv+CUDpF+IRFfgiS0/SB6E2ZtmVvOHzgUmFX0jxijI8ZYaPB+WGUIoKavc1
         z16VCSNCaLPajwNeBDdmxDrzcfieY6/FBbVjfL5ttKCDRfzRY6LrNtdyT6u1OX6tmLSj
         VMFdXbBS/wGqzK6YFtboAOBy2EmaDyfJElxxCkANrTf7GnEa6W9D/I8yy+PMR5oL6HdY
         HDFgafA331XlxTdga5tB0T/4U+KA9iLueLjv8Jd+I/YooDqrohAX4fd9O3GIXlO/mTXm
         oY8SpW93yj8eDOGjIVknJQPGeZ2PZiO02LUzIxkTVONtsodiKwsY9X823LPA4t4r7gb1
         mdIw==
X-Forwarded-Encrypted: i=1; AJvYcCVG8ldEBYgo1miCzeeYLoxp7KndVMF4sF3ddj4zYsBWN2zCdlQJSYobIWAJ1CU35X5CaUlbSOfNnYMU@vger.kernel.org
X-Gm-Message-State: AOJu0YxOn7epv1PWRGDISI1uC6YYsg0GbLV2BY+zI69k6AwjsojRZc0H
	PC34mWd2T5PE8G976+73VW+MtDLVwOckiHIDHXf94uWoY6M8wbWDLJbcoEnG6TA=
X-Google-Smtp-Source: AGHT+IHnVszzxRV7qQ07aFqnxjDB7ZJDRj+3FpzGhCxnl0U0Ndnw3gA3qfk5sipB0cB/w/7yeJxxIA==
X-Received: by 2002:aa7:88cf:0:b0:714:15ff:a2a4 with SMTP id d2e1a72fcca58-715dfc042a7mr734410b3a.13.1724876134994;
        Wed, 28 Aug 2024 13:15:34 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-714343097fasm10850305b3a.173.2024.08.28.13.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 13:15:34 -0700 (PDT)
Date: Wed, 28 Aug 2024 13:15:29 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Russell King <linux@armlinux.org.uk>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Shuah Khan <shuah@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-mm@kvack.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 00/16] mm: Introduce MAP_BELOW_HINT
Message-ID: <Zs+FYbII0ewwdisg@ghost>
References: <20240827-patches-below_hint_mmap-v1-0-46ff2eb9022d@rivosinc.com>
 <fd1b8016-e73d-4535-9c67-579ab994351f@intel.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd1b8016-e73d-4535-9c67-579ab994351f@intel.com>

On Wed, Aug 28, 2024 at 11:29:56AM -0700, Dave Hansen wrote:
> On 8/27/24 22:49, Charlie Jenkins wrote:
> > Some applications rely on placing data in free bits addresses allocated
> > by mmap. Various architectures (eg. x86, arm64, powerpc) restrict the
> > address returned by mmap to be less than the maximum address space,
> > unless the hint address is greater than this value.
> 
> Which applications are these, btw?

Java and Go require this feature. These applications store flags that
represent the type of data a pointer holds in the upper bits of the
pointer itself.

> 
> Is this the same crowd as the folks who are using the address tagging
> features like X86_FEATURE_LAM?

Yes it is. LAM helps to mask the bits out on x86, and this feature could
be used to ensure that mmap() doesn't return an address with bits that
would be masked out. I chose not to tie this feature to x86 LAM which
only has masking boundaries at 57 and 48 bits to allow it to be
independent of architecture specific address masking.

> 
> Even if they are different, I also wonder if a per-mmap() thing
> MAP_BELOW_HINT is really what we want.  Or should the applications
> you're trying to service here use a similar mechanism to how LAM affects
> the *whole* address space as opposed to an individual mmap().

LAM is required to be enabled for entire address spaces because the
hardware needs to be configured to mask out the bits. It is not possible
to influence the granularity of LAM in the current implementation.
However mmap() does not require any of this hardware configuration so it
is possible to have finer granularity.

A way to restrict mmap() to return LAM compliant addresses in an entire
address space also doesn't have to be mutually exclusive with this flag.
This flag allows for the greatest degree of control from applications.
I don't believe there is additionally performance saving that could be
achieved by having this be on a per address space basis.

Link: https://cdrdv2.intel.com/v1/dl/getContent/671368 [1]

- Charlie


