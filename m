Return-Path: <linux-mips+bounces-9358-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1925FADDCF6
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 22:09:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4351217FFB4
	for <lists+linux-mips@lfdr.de>; Tue, 17 Jun 2025 20:09:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75B2724EABC;
	Tue, 17 Jun 2025 20:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="acGJo568"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5621C2EFDBA
	for <linux-mips@vger.kernel.org>; Tue, 17 Jun 2025 20:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750190916; cv=none; b=rdDE8HymT30UCPUu089nf1iiTeWLMnkkZLCCDAMIToyW+a5b8Yb9QxF4kJgsDSvGQHWa3hxEypvmrAN59JGHQTKavcwv7hMCcq+z5bg/zWJVknM67LjU/AG8npZPynNPI4gCFXfNig1JWxXenXj3Y15lpkY4aiqmazW7HX5IfOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750190916; c=relaxed/simple;
	bh=NQoGyMTrLvZ94cQK6qr/U5S3n/jCYrB9gj8+lWNrtVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=StaNQ3HrnrTLQlOTh2pgqdPsickI0As5IlOrakQRPeiV9oQNwdFgTA5ZF0D+ZUYYQtnCC3r5A8axCebZB0az6VBnpeuDDYR8duCpv7cDZXKk9nuLY2rAAaPvxF91LTnnH3FfKYhmCwOb1kdyJrbBkVAFMzzv83BMMzBxxpHHwYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=acGJo568; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-60707b740a6so9403787a12.0
        for <linux-mips@vger.kernel.org>; Tue, 17 Jun 2025 13:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750190912; x=1750795712; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KANIOG1UnKUU5UjGnVcj73JF4ShRkYSB4zL4V2vR3Pc=;
        b=acGJo568fJcBkdPZqN89p/t9YQsxbjcU09JVjucGRM8wllvT3/mzd+JlFv6gTSrnKL
         6W8qFHAuKrtfPDVUtjS5hvF9TLNVRLsvvJ+t9D0lbf4Yi6cJoKg1glVnY0FIFWXeGaJR
         M04EciSYHSuJ7qLwtuyi6SWrbNNg/d2QnjDeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750190912; x=1750795712;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KANIOG1UnKUU5UjGnVcj73JF4ShRkYSB4zL4V2vR3Pc=;
        b=cdnzVraevxEKZXsAIkksE4MV4dboFQxHy5NhpLZ7/3rlNqqNXMpQpROcMJOlFnLbiB
         GFxvPX8kys2P6OiRcjFuAiOvZbI0QeEhqjduKdCg+1Y/Ev0dkm7QbE+Mb6yQILPrNtjU
         MK2gHhNkaCO8miSWHbsyHE2VOEC7dqQQtQ6olOWkYzGFDIoZhyNF5CaYadZqJpK1+QcK
         9pNNQu2Www3vPIQlp+STdMFHu6mnUJItZYV7Pyg5DmY3YxAss8OIcurofbUbkk9SNU5U
         x1Y3AsUqQzpUpFRmE7IJIBsQElgrzDltaHs4ohfl+c/gErlWfWByE20wuzmvF02v4Fej
         n7rw==
X-Forwarded-Encrypted: i=1; AJvYcCWYEj5lBl1qfxROVQQiqtHOQJWwSR5vkrbI4TAZ4dJQAb5XUSerJtWiOYsd8vfqtjvoFaJnFY7ICA1E@vger.kernel.org
X-Gm-Message-State: AOJu0YzQcpL08V+d3ByDy0pbtmw+tUrLMzh9VjimUeNwEcNTnQulBXwj
	aSEmV+KaOchldFPE8Y8u8FWhy6T6WNwOJZWCdhoC2da1xZl3yIy2XCDeDmc6ahJ44s62v5asCiY
	+rc32GFQ=
X-Gm-Gg: ASbGnctowb88VlWlz4ez2OgCWvxHETtOziVNSAu6wGDM5KocO7QBNb9EZlwy5YLw5TP
	WQ4DrOlmz2nBSQDGlhuTQNm5NLJmBkwQVNUWilUtzM82dHtXOgDGRw+Bm2+TtdqU3QFEO4G57fA
	KEKn9CEZeAUG7lWLnWBYf6p3VqgRl1yQEDkJ4wZta6ekNpxM1zNCgNwYlWM56DtGttbU+GT6gLK
	RWpTUriVDMXSToyls6jcnJyryfN+v949rqO7VB3pc5Mv9S1X0z9UyvEI0IJhUREfD020HeAd76L
	asQXabKOi8kbW8vPyr9v2gwO3PUfS7tAe3w+wUv92CsMeOih9FcEg9KK/o6ZOADjW8RVXRIzNjc
	F35L/wEY7zjUOcygiaNrcrLvzfSJOLqS3aKXD
X-Google-Smtp-Source: AGHT+IEZ83fnzUm2Uj5mV3OTVdBp04vkEw9rTw1O42jMyKYn0SHdex48V1Kyg5aa3RhER3R81YB8Rw==
X-Received: by 2002:a05:6402:3550:b0:608:330a:9f67 with SMTP id 4fb4d7f45d1cf-608d099f2fbmr14319963a12.32.1750190912417;
        Tue, 17 Jun 2025 13:08:32 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a93a01sm8441166a12.65.2025.06.17.13.08.30
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 13:08:30 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6077dea37easo11922544a12.3
        for <linux-mips@vger.kernel.org>; Tue, 17 Jun 2025 13:08:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV+FhxFTrpAoZpoOSRw5Jkzc/KnieeJaS2ja1X0XayhR5GmkHYwekwSlZenigfxff9IpkauZhsBGkYR@vger.kernel.org
X-Received: by 2002:a05:6402:2550:b0:5f3:857f:2b38 with SMTP id
 4fb4d7f45d1cf-608d0948ae9mr13954090a12.17.1750190910438; Tue, 17 Jun 2025
 13:08:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250616014019.415791-1-ebiggers@kernel.org> <20250617060523.GH8289@sol>
 <CAHk-=wi5d4K+sF2L=tuRW6AopVxO1DDXzstMQaECmU2QHN13KA@mail.gmail.com>
 <20250617192212.GA1365424@google.com> <CAHk-=wiB6XYBt81zpebysAoya4T-YiiZEmW_7+TtoA=FSCA4XQ@mail.gmail.com>
 <20250617195858.GA1288@sol>
In-Reply-To: <20250617195858.GA1288@sol>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 17 Jun 2025 13:08:14 -0700
X-Gmail-Original-Message-ID: <CAHk-=whJjS_wfxCDhkj2fNp1XPAbxDDdNwF1iqZbamZumBmZPg@mail.gmail.com>
X-Gm-Features: AX0GCFuoL7ATRJ2CnwP4RNLTBvlSmkXnXI8fTIZk-24R8V3-BYf3WTK_tAsCN-o
Message-ID: <CAHk-=whJjS_wfxCDhkj2fNp1XPAbxDDdNwF1iqZbamZumBmZPg@mail.gmail.com>
Subject: Re: [PATCH v2 00/17] SHA-512 library functions
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 17 Jun 2025 at 12:59, Eric Biggers <ebiggers@kernel.org> wrote:
>
> Again, the tests depend on the code they test being added first.

Sure, and that's fine. We have lots of "this depends on that".

> I could do two pull requests, the first with all non-test code and the second
> with all test code, where the second depends on the first, i.e. it will have the
> last commit of the first as its base commit.  Is that what you want?

Yes.

Or if one single pull request, split out the diffstat with the
explanation (that's the "Or at the very least spell things out *very*
clearly" option). But two separate pull requests would actually be my
preference.

          Linus

