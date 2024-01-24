Return-Path: <linux-mips+bounces-1128-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 526FB83B47F
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jan 2024 23:11:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C582283424
	for <lists+linux-mips@lfdr.de>; Wed, 24 Jan 2024 22:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57D3E135A41;
	Wed, 24 Jan 2024 22:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="QHcgDBCk"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2867A135411
	for <linux-mips@vger.kernel.org>; Wed, 24 Jan 2024 22:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706134277; cv=none; b=AwaGiOV4VfZYheQnq6nKnEbsTgZ/PUyD4cxJZAkd/zUyxqHk1ckxFZ0lYLwoAtdiAhr+8H9u2+qoE6ifXSSDCZ3Qmua7TUIl4YpBqvvrHSc16LniPaJWEsA9Iw4ZE9/bmh5lOuSkuHK3bLxrNpD1OBQB38fOjm1MPDsZh4wWgCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706134277; c=relaxed/simple;
	bh=vXTfMlgh7kH671ORMb4QoEyy8NAM0PglagPwr/wSiJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dt33/bqjy7OLF/LR+ertqscEhnB0ujy+qjrWLpzzkHMy5J1kfmS/Oln6UQW/HsmKIUHFJneJO0Ke8CDGQcLAOU+tIt+W+zONW7miDHaSAcKcFWZyW/Know/6PvwMQog11JAFL0gM+gHm35b2QVzcic/ruZ6tXfZ+aeuJqlZq/wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=QHcgDBCk; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2cf13c259f3so23763801fa.2
        for <linux-mips@vger.kernel.org>; Wed, 24 Jan 2024 14:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1706134273; x=1706739073; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=24nC7FWGIti38IzxnMvpNU7GROBNbes/8B7YDtU6FyY=;
        b=QHcgDBCk3imF0ZJpTG3gmFOsxuXq1aTDHiSgTJUFVhBGTvQFt4weQnbWwOncDJYjBJ
         pHYfV4r6QPaO0anLtUGRByLqs3mpU46lLXzTEDOGpG8IrGJ2zDOt34uc1ObHTsE89GlV
         gbO3WKiMMZTVQ6WwgNAHLPhyG6J+w5G3NE/N8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706134273; x=1706739073;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=24nC7FWGIti38IzxnMvpNU7GROBNbes/8B7YDtU6FyY=;
        b=D6MKIAc6VlcWOG5STnefq1qu4x1nfVBT9lz1Rjlr4jAEgpJqY7eU7Enmk/QrhKI6IS
         rBdENUNfXH/11A7k14rikGtLNTd82buGWBx/iu960ZlK9ghYbHBDsgiSVYirQ6UFucHz
         Ki8TskM6ps+A8kA14/Cw9ewA/Vk39CyLtS2Co8UfaxW1vvNDVPPxFWASfV3QdCsQj56k
         ewxLro4OKFDZgI4BObYp0a3803DMfMkizBqzPIATyP+R6Zq1w6LJ1xCFcSBHmxNU7jU3
         JqcjGtR3QTbX4YRtmCeWJ9LbljMjeE0y5vJn3RdLV34noGQ766iAKO3usqEQUfKtYVIp
         lqfg==
X-Gm-Message-State: AOJu0YwxUiBHHlD4KLP2VQB40dr9TDmqBgyb0/X/hqSDuIj86fqbJn0x
	geRaxAVF9cI6dyd2SQ902T9eR58OSA3sxwPZtID5zLwHuewOl4+bqgxNweXm84AVrv96+vlOcEb
	U4Q9mQg==
X-Google-Smtp-Source: AGHT+IG0JzL0jbo5Dqz2q85mGaxHQDQc2lLlv+Epvn9ovWwLJCR9Z71ST58LupbUfT1k6n4I7IFeGg==
X-Received: by 2002:a05:6512:2c0b:b0:510:973:2e24 with SMTP id dx11-20020a0565122c0b00b0051009732e24mr1452387lfb.92.1706134272807;
        Wed, 24 Jan 2024 14:11:12 -0800 (PST)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id t16-20020a1709064f1000b00a3100210020sm313185eju.79.2024.01.24.14.11.12
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Jan 2024 14:11:12 -0800 (PST)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40e8d3b29f2so71010065e9.1
        for <linux-mips@vger.kernel.org>; Wed, 24 Jan 2024 14:11:12 -0800 (PST)
X-Received: by 2002:a05:600c:138c:b0:40e:3a07:41e with SMTP id
 u12-20020a05600c138c00b0040e3a07041emr1033857wmf.162.1706134271813; Wed, 24
 Jan 2024 14:11:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <75e9fd7b08562ad9b456a5bdaacb7cc220311cc9.camel@xry111.site>
 <mvmplxraqmd.fsf@suse.de> <9481b6d9d015aea25d8f2563bf7bd6f6462f758f.camel@xry111.site>
 <0be1203c9df55432548c92281c8392dfa2f7d6bf.camel@xry111.site>
 <e8583a3ab0522b4e75ba0ada47b6f093b186fa81.camel@xry111.site> <CAHk-=wgVrw+8P68Sy2krcc3QFbm_eu_DRs0-i7mct_0BDORZuA@mail.gmail.com>
In-Reply-To: <CAHk-=wgVrw+8P68Sy2krcc3QFbm_eu_DRs0-i7mct_0BDORZuA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 24 Jan 2024 14:10:54 -0800
X-Gmail-Original-Message-ID: <CAHk-=whkEXGOCEZFO2vAZ9rDd8uW8MJwFNYg9KXaC_vZVso6iA@mail.gmail.com>
Message-ID: <CAHk-=whkEXGOCEZFO2vAZ9rDd8uW8MJwFNYg9KXaC_vZVso6iA@mail.gmail.com>
Subject: Re: Strange EFAULT on mips64el returned by syscall when another
 thread is forking
To: Xi Ruoyao <xry111@xry111.site>
Cc: Andreas Schwab <schwab@suse.de>, Ben Hutchings <ben@decadent.org.uk>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, libc-alpha@sourceware.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 24 Jan 2024 at 13:54, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
>
> And I think the "fails with any integer in [1, 8)" is because the MIPS
> "copy_from_user()" code is likely doing something special for those
> small copies.

.Lcopy_bytes_checklen\@: does COPY_BYTE(0) for the first access, which is

#define COPY_BYTE(N)                    \
        LOADB(t0, N(src), .Ll_exc\@);   \
        SUB     len, len, 1;            \
        beqz    len, .Ldone\@;          \
        STOREB(t0, N(dst), .Ls_exc_p1\@)

so yeah, for 'copy_to_user()" (which is what that "read (fd, buf, 7)"
will do, we have that user space write ("STOREB()") in the branch
delay slot of the length test.

So that matches.

And it only fails when

 (a) you're unlucky, and that stack buffer

          char buf[16] = {};

     happens to be just under the last page that has been accessed, so
you get a page fault

 (b) you hit a mmap_sem already being locked, presumably because
another thread is doing that fork().

Anyway, I'm pretty sure this is the bug, now some MIPS person just
needs to fix the MIPS version of "instruction_pointer()" to do what
"exception_epc()" already does.

              Linus

