Return-Path: <linux-mips+bounces-9126-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9DBAC8317
	for <lists+linux-mips@lfdr.de>; Thu, 29 May 2025 22:14:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 35E12A40207
	for <lists+linux-mips@lfdr.de>; Thu, 29 May 2025 20:14:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4142292918;
	Thu, 29 May 2025 20:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QoIItw4z"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F86A1DF25A
	for <linux-mips@vger.kernel.org>; Thu, 29 May 2025 20:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748549692; cv=none; b=pT/lDW16D9xrU6LUk5k5t+WJGQ07d6muV4p0dNEsiV30LHbitBpZEfkdPooApXt7eTVI/v4s5bW8PkvMIfn/g3Tt1IeKA/S1JPXa2F9sg8G7F/SDbRAeD2Dvld6VYnEt6DfVy5y7WkPtkdwViJqoDxxV70+e62lAsiyJYR0MkNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748549692; c=relaxed/simple;
	bh=pEGh+FyMPK3zT/zV3uCRaiREChKfcHdnfIXKiv+KGVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YCFOKcNraCb7XDgQnclszbj5315PXaXesi9j6AcvhHup7YEclagjMhtNKaTny7G9LDfkmBH7pqKSYtwIk9KUw7Dg7blxc+o8yW64ADqJJY9zRP1fjKIOkRbKeeWDzrxypH2sXVxpcnocKl8exO56P3BytZn1hxWE5wP7Y0H4j5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QoIItw4z; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ad55d6aeb07so209569866b.0
        for <linux-mips@vger.kernel.org>; Thu, 29 May 2025 13:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748549688; x=1749154488; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HVSRhT5MS1pvdu2dqLDEs9T4cWr5CB+FRQ66tAe+RVE=;
        b=QoIItw4z5y0fQLE4x2m0iK+XBUZWbY0CpbfUOQ8YlIQHM/FOMopVjPbVfInbgs5MK8
         rftqzv0ErT5u/H4D1wze9Dh57nYnYkR0o63ScOkP0Mopis7dTgJ4JHu9iveMdPNinqZI
         5v4zwYRS3eWtuqkcL3h9D5mtdSqmXQzA9lfMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748549688; x=1749154488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HVSRhT5MS1pvdu2dqLDEs9T4cWr5CB+FRQ66tAe+RVE=;
        b=j+ZwFGtsxYwA14dmpuoLYhhep15A6vbvY2RsEv4Cj/NIm+MUxXB6P3xwtlRJmM4uaw
         OELT8YiTus3/dnyCEUsjNkszx3+RI+0zd/4aBzrqlsHO2zDJEx/oeHJyy7x/oalSn316
         8t6tV1KWx7YfKOCJigtdSYiU8JTxJXlqhWS+ri/GeEskNj18md5P5W1KH68I7PLfDfoa
         pvNDwZT8an8AQSp8LVGjP186OgSvn0wjGQ+/zPivnjlqit2ZBvVqEINuk5MVN11N5GDT
         dpcJJjn1WCMkN5c1G9m6mOAOz9qz9PWe2tM1WXDyHVYQ6fJ3lhOvgYYnIdA42TMsXAih
         sOTA==
X-Forwarded-Encrypted: i=1; AJvYcCVo1wn7gm5tDGKgZ7NIVuCPL+QTezz63t2Dfw+IPO/wHjKwftHkOIZ+V2M1sTrRfOLdx/LU8Yek7uFq@vger.kernel.org
X-Gm-Message-State: AOJu0YzzdRuMX1h6SiuCriA80scN64Oht+azP1V+B1ty+1sNFxjwYSrV
	KXfzfhg6puxPPPcrKJ0mhG8JqoOctJrmxKMOyR8UwKPQjDEkfqHV/hhhG2csuWWTwx76eCViGaH
	mbLTDJ2k=
X-Gm-Gg: ASbGncv/dXIFQL2eHTNiqo5k/oLkbO+yAyFjCfufbHByRlMXF5VXWR78/Mu8hJHC5db
	aX7SOab0qHYoEwjRO3RocLe/tK4WdLWUUl10VPTjpIxcdq4GrKmB/9BoB/gRpK4SaSvclinwlXz
	M1kLtuxGVE9iwd0U0Sc4P+Sl/PJcxgoXGaYCi9cd35dgNRGmc9iM1uh83jd916/flJFFlLJZiMU
	WD0VIqIseXIs6fymMP2zklwwUg2O0wUdk9GnwZIig/ox9XmlLua81sVBAJryOrb97WdWMXKtsqI
	TZcw38hxwYM9XAR9NgkCWvMoY+4VAG0r/XDNR7wpmIpT8L3PTy/syd7Tz1O7tdY5TTApfCddskn
	Bu6ie68uB/Q3EUXaDcJAVtm/GV0YoI0kFJNlM
X-Google-Smtp-Source: AGHT+IEPPsnVq9yjiG1B8ePPRVFfPtiP/eU21GP3yl7FyOgBvsnGjimXwbRuEkiQoAL4cXrGMTcrEg==
X-Received: by 2002:a17:907:3f16:b0:adb:7f8:9ec2 with SMTP id a640c23a62f3a-adb322fad27mr59039466b.53.1748549688439;
        Thu, 29 May 2025 13:14:48 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada6ad39565sm195807066b.134.2025.05.29.13.14.48
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 13:14:48 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-602039559d8so2399329a12.1
        for <linux-mips@vger.kernel.org>; Thu, 29 May 2025 13:14:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX/d1R6msHvy1L1r+ZJhGC2hVb2C35npykI9qrGy88C2ZuQOMBX3BFLQB/9cKq5MFa8+gmBJ4gWH7Rl@vger.kernel.org
X-Received: by 2002:a05:6402:2346:b0:602:1d01:2883 with SMTP id
 4fb4d7f45d1cf-6056db10b4emr581444a12.1.1748549687775; Thu, 29 May 2025
 13:14:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428170040.423825-1-ebiggers@kernel.org> <20250428170040.423825-9-ebiggers@kernel.org>
 <20250529110526.6d2959a9.alex.williamson@redhat.com> <20250529173702.GA3840196@google.com>
In-Reply-To: <20250529173702.GA3840196@google.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 29 May 2025 13:14:31 -0700
X-Gmail-Original-Message-ID: <CAHk-=whCp-nMWyLxAot4e6yVMCGANTUCWErGfvmwqNkEfTQ=Sw@mail.gmail.com>
X-Gm-Features: AX0GCFuiJcryO_X7sE1ePk8yCEY5HNa9j_jPT14Gm93VGY22kOHLk2kIn44ZkWY
Message-ID: <CAHk-=whCp-nMWyLxAot4e6yVMCGANTUCWErGfvmwqNkEfTQ=Sw@mail.gmail.com>
Subject: Re: [PATCH v4 08/13] crypto: s390/sha256 - implement library instead
 of shash
To: Eric Biggers <ebiggers@kernel.org>
Cc: Alex Williamson <alex.williamson@redhat.com>, linux-crypto@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org, 
	Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 May 2025 at 10:37, Eric Biggers <ebiggers@kernel.org> wrote:
>
> Long-term, I'd like to find a clean way to consolidate the library code for each
> algorithm into a single module.

No, while I think the current situation isn't great, I think the "make
it one single module" is even worse.

For most architectures - including s390 - you end up being in the
situation that these kinds of hw accelerated crypto things depend on
some CPU capability, and aren't necessarily statically always
available.

So these things end up having stupid extra overhead due to having some
conditional.

That extra overhead is then in turn minimized with tricks like static
branches, but that's all just just piling more ugly hacks on top
because it picked a bad choice to begin with.

So what's the *right* thing to do?

The right thing to do is to just link the right routine in the first
place, and *not* have static branch hackery at all. Because you didn't
need it.

And we already do runtime linking at module loading time. So if it's a
module, if the hardware acceleration doesn't exist, the module load
should just fail, and the loader should go on to load the next option.

Not any silly "one module to rule them all" hackery that only results
in worse code. Just a simple "if this module loads successfully,
you'll link the optimal hw acceleration".

Now, the problem with this all is the *non*modular case.

For modules, we already have the optimal solution in the form of
init-module error handling and runtime linking.

So I think the module case is "solved" (except the solution is not
what we actually do).

For the non-module case, the problem is that "I linked this
unconditionally, and now it turns out I run on hardware that doesn't
have the capability to run this".

And that's when you need to do things like static_call_update() to
basically do runtime re-linking of a static decision.

And currently we very much do this wrong. See how s390 and x86-64 (and
presumably others) basically have the *exact* same problems, but they
then mix static branches and static calls (in the case of x86-64) and
just have non-optimal code in general.

What I think the generic code should do (for the built-in case) is just have

        DEFINE_STATIC_CALL(sha256_blocks_fn, sha256_blocks_generic);

and do

        static_call(sha256_blocks_fn)(args..);

and then architecture code can do the static_call_update() to set
their optimal version.

And yeah, we'd presumably need multiple versions, since there's the
whole "is simd usable" thing. Although maybe that's going away?

                   Linus

