Return-Path: <linux-mips+bounces-9128-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A770EAC8587
	for <lists+linux-mips@lfdr.de>; Fri, 30 May 2025 01:55:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 615B74A123F
	for <lists+linux-mips@lfdr.de>; Thu, 29 May 2025 23:55:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79123230BFF;
	Thu, 29 May 2025 23:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="F6I+Plfv"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E3E231A55
	for <linux-mips@vger.kernel.org>; Thu, 29 May 2025 23:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748562898; cv=none; b=cDZ/MIy5oBfDQkzzsKAl0VDgDCErnqH46KBKTJWVMhCvHHDI0/4quRJTrNM5okyW8vjMhiPAA3WLrR7X5OtjKvEnFwtyoCZDTsqdPNrjiL9RiPzhqRwax3KNFpuuWYJCDyf+hKpi6OK/sthM0AGzy4JF5Oo6JK9v5AVCSlLjvwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748562898; c=relaxed/simple;
	bh=mQ2X3C83MrQ+ifFd0cXmKRdvIysb8KwRrZHJnS3dFHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qdW+0KJPiCvVzhqivkPr3Z8+NyXALTxh/sz7XL3WaFok/1sm2xnesbagc1EohztRJrcWpgxYZty9nkD6vOt0fGUVlpn9oGt2uh+gwkp4Us4uAAeEbCsQNBAC2va2FJnBiqErznFHOhwEuMrvVEbrmjnSI6qrBS/nSUXBrjePmNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=F6I+Plfv; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad56cbc7b07so236786866b.0
        for <linux-mips@vger.kernel.org>; Thu, 29 May 2025 16:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1748562894; x=1749167694; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VCpgeKXbWpRtz3XeS2MBk7nO0oA3f7brSdzLdQTvzhc=;
        b=F6I+Plfvh1QbPuCTmn+Q/sPKw6zn0Ihak9o4GfylVNU9GwSJSbZsXBMOgrnWimPR/u
         oNEv9lH1uAn0McKTBYelp/UFFf1FQX9Mpr8h47/FIAk/eiqIlJbAYPlW4/zY4lZT1JvC
         ni8yMu0AB2cmpsDDu+PsSVJ8MXWSgIjl9fP6c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748562894; x=1749167694;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VCpgeKXbWpRtz3XeS2MBk7nO0oA3f7brSdzLdQTvzhc=;
        b=rg1h72SqQRvqIHT8Qzs2vxhp3ub/azxHvlQjRA+APSdqQTbKzQGSEOq0gW7MlTQK9u
         VqCr77feNAgsUAQ6BKzGgB2IR1RXZfsAp7780qwHKNu2pdV1alrlD7BgyavQ1I+WqMD4
         im4RBqeUrR+QHy728lDAa8mDJeShb68lYHEXBsqd1q8b14eO/IoihX1kAbE3qNPPeOB5
         5FdNdhvRnGmG99gMC7b0ejmMJpEzVDFxHjk2GRFpEjDxpqBJ+4/flbUM4C0psu5Q6r65
         C1F2oFJ9xYnlfIc3p7I6Pd0TEcti+pLXXXkbET/0s9/Etz2U4bCvQ8Sf8AAOf8BtuTnL
         E2uQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGO8s9lkFhFUE4F7Bab5QXbi3CTOgeqhk6HxjHzIMfqp7TH5CNNSy0lKPUhqYRB88bl1koIVKCit59@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4QFUDTKSfmd+gRHDhpf2/57w4Ari2xwzNZc0jFFzekob/u2Hi
	UbfXQU1OsEaBJKO22FuN5KvhLOTqk92mC1vIC3yhuw6yERDTwMAl80rsxUbUvBoNF7sRNHEAvdX
	sI/0LPoQ=
X-Gm-Gg: ASbGncsYBE+ikCHgk4wns+MChd5ubPkwbtuCjE0nWsVRtIv+0DDThpqWFNU/YDjVnjM
	LLFN9EEmKvoyn3+BaZ0EZYf2zmVENHno4C1m2pK2AcgfZQDFtE6GtzKn6LBYUBYuNnVBzfvEJqf
	je68RaAbwZ2LyYRRJuz4vtoH9lPcOvYjEaNQpCU38inauW0JoSezkHCSKGFu8a91H6CMOYB3DRs
	dSIuixlqVnK0HFw9WWrUBDmvbolmRKqWMvrCcXMaNciMFaNEDpMA2aVLUIdi1kZNsuK/R7IyFEp
	IJ8KikY6wVRa6rO4DwWyeVJNniLQTeg46n99MHGr72wKy3+9kU4P+PD9iI6dEAlggipfy4bzSII
	g9wHOoacL19cqAf7O6UeUcoqEN39QMqRlCNmF
X-Google-Smtp-Source: AGHT+IFg/4ED3VEEUfrJVZ5ehy1Ac6hMsxRgsV0lLajrUDb9pf91QtGfnv3n5kUuSLb1BETwzHwkUw==
X-Received: by 2002:a17:907:2d23:b0:ad8:a9fc:8127 with SMTP id a640c23a62f3a-adb32301962mr121319266b.41.1748562894517;
        Thu, 29 May 2025 16:54:54 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5dd045edsm219846666b.119.2025.05.29.16.54.51
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 16:54:51 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6020ff8d54bso2443876a12.2
        for <linux-mips@vger.kernel.org>; Thu, 29 May 2025 16:54:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVjDAd7uuMErRQwa2JE5ZK4X0HzSIpqByJ2m4TcDoTkLk6Kziovpv8R0jnAAVX1Mw8LHh0Dw1CzOyNB@vger.kernel.org
X-Received: by 2002:a05:6402:35c6:b0:5f8:357e:bb1 with SMTP id
 4fb4d7f45d1cf-6056e1597eamr926476a12.22.1748562890813; Thu, 29 May 2025
 16:54:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250428170040.423825-1-ebiggers@kernel.org> <20250428170040.423825-9-ebiggers@kernel.org>
 <20250529110526.6d2959a9.alex.williamson@redhat.com> <20250529173702.GA3840196@google.com>
 <CAHk-=whCp-nMWyLxAot4e6yVMCGANTUCWErGfvmwqNkEfTQ=Sw@mail.gmail.com> <20250529211639.GD23614@sol>
In-Reply-To: <20250529211639.GD23614@sol>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 29 May 2025 16:54:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=wh+H-9649NHK5cayNKn0pmReH41rvG6hWee+oposb3EUg@mail.gmail.com>
X-Gm-Features: AX0GCFuuQZJkBnHy-mtAufGSUKbxBrKrMtOhVAT8ZxGCHwWeq3lbFPW0g13cPtE
Message-ID: <CAHk-=wh+H-9649NHK5cayNKn0pmReH41rvG6hWee+oposb3EUg@mail.gmail.com>
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

On Thu, 29 May 2025 at 14:16, Eric Biggers <ebiggers@kernel.org> wrote:
>
> So using crc32c() + ext4 + x86 as an example (but SHA-256 would be very
> similar), the current behavior is that ext4.ko depends on the crc32c_arch()
> symbol.

Yes, I think that's a good example.

I think it's an example of something that "works", but it certainly is
a bit hacky.

Wouldn't it be nicer if just plain "crc32c()" did the right thing,
instead of users having to do strange hacks just to get the optimized
version that they are looking for?

> Does any of the infrastructure to handle "this symbol is in multiple modules and
> they must be loaded in this particular order" actually exist, though?

Hmm. I was sure we already did that for other things, but looking
around, I'm not finding any cases.

Or rather, I _am_ finding cases where we export the same symbol from
different code, but all the ones I found were being careful to not be
active at the same time.

I really thought we had cases where depending on which module you
loaded you got different implementations, but it looks like it either
was some historical thing that no longer exists - or that I need to go
take my meds.

> IMO this sounds questionable compared to just using static keys and/or branches,
> which we'd need anyway to support the non-modular case.

I really wish the non-modular case used static calls, not static keys
like it does now.

In fact, that should work even for modular users.

Of course, not all architectures actually do the optimized thing, and
the generic fallback uses indirect calls through a function pointer,
but hey, if an architecture didn't bother with the rewriting code that
is fixable - if the architecture maintainer cares.

(On some architectures, indirect calls are not noticeably slower than
direct calls - because you have to load the address from some global
pointer area anyway - so not having the rewriting can be a "we don't
need it" thing)

               Linus

