Return-Path: <linux-mips+bounces-1289-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A3674848BDD
	for <lists+linux-mips@lfdr.de>; Sun,  4 Feb 2024 08:42:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 53AF81F2276A
	for <lists+linux-mips@lfdr.de>; Sun,  4 Feb 2024 07:42:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 144C7BA27;
	Sun,  4 Feb 2024 07:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="VYi+Svoo"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2088F66
	for <linux-mips@vger.kernel.org>; Sun,  4 Feb 2024 07:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707032524; cv=none; b=pR693dm/wgU1fFtvLpX19k8csiS7M1s0KtDpBcMjYJ9ZfuGcmPcPp2bZ4J81LrXr0kbc29z/LAXQZQZoEP6ciCMMChbsVPL8zxmP3R2YxVmhgPWR9v4xaBjtEbI8Xr9EAx09i6JjWwlQ7EtDhS593pRIAN5ZR/OaL7IyxUc+5Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707032524; c=relaxed/simple;
	bh=ivawquPkjq89vuGPt9zRK+PP8y8ZqNfCeHnU8NAATS4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=agS3GGwGaQMLxuZIhC9YFGzSqBwSDHdzhGmHknN01IWFQA5xnCdgE6Pn2rdZ1SzXQH7tkR5JcgYEPeaaVMYkAy43W+TBOVZautjYuEnpDHSPRLUBvOyYT7YRpOGqIHOjxckjRo4/J53323rh3zCaU4SHPoAqxspi4FrpceO5FRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=VYi+Svoo; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a363961b96aso435531566b.3
        for <linux-mips@vger.kernel.org>; Sat, 03 Feb 2024 23:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1707032520; x=1707637320; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fuvlxA+anJtkOMreE35KRYFx2Wh10b5WLrE1tllolU0=;
        b=VYi+SvoocmthiP3wygoQdD0tLPF8ZVPkNtdm9WmKZdff/Vv8pghkKGKvXsJLKcyIAL
         E2zyRQeH+bMROme+wj8cdJDN7hog+fwlupw2wluhfut+sffoMINbaoo8hLRX2QTKMKtN
         W5f/cKL2s6QRuGVU/8lU2F2fyBkdACRz5kkCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707032520; x=1707637320;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fuvlxA+anJtkOMreE35KRYFx2Wh10b5WLrE1tllolU0=;
        b=uG2BF0X3Dp+mMTwIq19ajFoX1i3xqWXmmijWhhPeo2qCz9pTD+CZQT99AvOIM7d/jA
         17gzvp23/CRiU3tVV1aYK0NxNRzbiflBouPS2/g1ETdjxsuwmeTmaF3ppAlg/dTi5gQe
         HC715Dvrn+5eVDQg7Ls12BP3tTUfHIAGVdrVoBkG/CzM6lq+yBgH9yA99mxyGBtvW8YI
         MtiM2grVTGFMJRpQUlDaSjBbEMmflfLC7Q+Urstyjjpb1Rm5hRuk0d/52pIBmMOwrSO3
         NxobgZGfn262yuZ03q+uu0jnOwwNynSYkeo/pDFAJqhi0QNVME/TkR9iZCUTLrdbCLON
         tDWA==
X-Gm-Message-State: AOJu0YzejtcjLLB7FSWjlsmlt05N1bGUkwndTUreKCWbvT3Ek1wvvstE
	m2rJFNom6ABum6xVAChhbc+fphlZvVsVUFLKy3b/1oTCz5UCo4xQpxtqc77FJ0fSjPgTqvt1/tE
	RAqLG7Q==
X-Google-Smtp-Source: AGHT+IGqAGVLIM/1oQarlONi+NYWD7oiL9ou39FFbMSN4dsubUW7LYKpHANc6G5m9/cySyohM8UeCg==
X-Received: by 2002:a17:906:412:b0:a37:625d:397d with SMTP id d18-20020a170906041200b00a37625d397dmr2239156eja.44.1707032520045;
        Sat, 03 Feb 2024 23:42:00 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXbyJl4anPCfeT/hJRUvCPNBeyBdND5I0A61eSQg0PfijGGBgj/LMXr6qsDJL3MRbM6Uh+WRl01l+arnSgl42U2GvRKLks3DkFjvw==
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id l8-20020a1709061c4800b00a372b8ac53fsm2033859ejg.169.2024.02.03.23.41.58
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Feb 2024 23:41:59 -0800 (PST)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-55a8fd60af0so4576816a12.1
        for <linux-mips@vger.kernel.org>; Sat, 03 Feb 2024 23:41:58 -0800 (PST)
X-Received: by 2002:a05:6402:1507:b0:55f:f73d:c63b with SMTP id
 f7-20020a056402150700b0055ff73dc63bmr2660980edw.20.1707032517833; Sat, 03 Feb
 2024 23:41:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240202-exception_ip-v2-0-e6894d5ce705@flygoat.com>
 <CAHk-=wiaSjYApqmUYCdCyYfr_bRsfVKDkwU6r6FMmoZzrxHrKQ@mail.gmail.com> <eeb92d70-44d6-47f4-a059-66546be5f62a@flygoat.com>
In-Reply-To: <eeb92d70-44d6-47f4-a059-66546be5f62a@flygoat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 4 Feb 2024 07:41:41 +0000
X-Gmail-Original-Message-ID: <CAHk-=wiUb1oKMHqrxZ6pA7OjNmtgw6giTKWiagUC2kt-ePCakg@mail.gmail.com>
Message-ID: <CAHk-=wiUb1oKMHqrxZ6pA7OjNmtgw6giTKWiagUC2kt-ePCakg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Handle delay slot for extable lookup
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Oleg Nesterov <oleg@redhat.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Ben Hutchings <ben@decadent.org.uk>, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	Xi Ruoyao <xry111@xry111.site>
Content-Type: text/plain; charset="UTF-8"

On Sat, 3 Feb 2024 at 13:56, Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
> Given that exception_ip is guarded by !user_mode(regs), EPC must points
> to a kernel text address. There is no way accessing kernel text will generate such
> exception..

Sadly, that's not actually likely true.

The thing is, the only reason for the code in
get_mmap_lock_carefully() is for kernel bugs. IOW, some kernel bug
with a wild pointer, and we do not want to deadlock on the mm
semaphore, we want to get back to the fault handler and it should
report an oops.

... and one of the "wild pointers" might in fact be the instruction
pointer, in case we've branched through a NULL function pointer or
similar. IOW, the exception *source* might be the instruction pointer
itself.

So I realy think that MIPS needs to have some kind of "safe kernel
exception pointer" helper. One that is guaranteed not to fault when
evaluating the exception pointer.

Assuming the kernel itself is never built with MIPS16e instructions,
maybe that's a safe assumption thanks to the "get_isa16_mode()" check
of EPC. But all of this makes me nervous.

              Linus

