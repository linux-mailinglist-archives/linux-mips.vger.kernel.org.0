Return-Path: <linux-mips+bounces-1277-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA8F8477F3
	for <lists+linux-mips@lfdr.de>; Fri,  2 Feb 2024 19:43:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4F3E9B29A7F
	for <lists+linux-mips@lfdr.de>; Fri,  2 Feb 2024 18:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83CAB153BF2;
	Fri,  2 Feb 2024 18:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="IHeB54CF"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69EA5152E0A
	for <linux-mips@vger.kernel.org>; Fri,  2 Feb 2024 18:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706899175; cv=none; b=rBI/BipVaLviU+Bv8o3VtgddmzqALDz1iaYv2yJKPT0qUZZBd9Rgaj/EHvSr5F3g363N+E4t0ffUX+zbsq8gdJ4M31vjvSidpaQEpU+jwhcAgaQZmyEPChBRS1AJsLwLeOjakoZJbIcpSDAfbX4V/of72X0mnBZyV4LzzRNcA/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706899175; c=relaxed/simple;
	bh=6vtu3x2Y1jccAeEZW/cOuVCyNA6GUN7mxte5g1lUOrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MLKrwcO7RXxdyQ6nl+Ao7jQIAb54EIaFtuDiNLirkAu1kK8j2DcnTK7uUloz2lPNMAfHh1E6c9zulODxke/yWaxv1lIHi/mchunFj4BZIONeK0g2fc8Vb5fBj1dfQNhS4zpTrg8CtIri0n4yJVxoiDt6i472FaZy+OSNu77HXa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=IHeB54CF; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2d04c0b1cacso29963701fa.0
        for <linux-mips@vger.kernel.org>; Fri, 02 Feb 2024 10:39:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1706899171; x=1707503971; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EK/oD0i1K4QS8LEPg1LGpWmJwJIYuOve/SpbccIVK8M=;
        b=IHeB54CFUk2Pu6lD2GAj8loMeIw5OHB3CUVpXRt/zRmhwMpktRKIlzjd0TGGAQWQCQ
         Lys1/NvYHNrxHr/aZc2m9O3yaQERM66FEpZEHbGHLGv08Q+OTc1a3JnBUak8NXPz8o2O
         EhC2n2Bt+Kf0bkekEtuOGGOMSb0/k+M0stkGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706899171; x=1707503971;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EK/oD0i1K4QS8LEPg1LGpWmJwJIYuOve/SpbccIVK8M=;
        b=pvkEaLPwWE32y0P6iOjITYdnVcTTgz9ym2HgfKmv2xSdmHZtbwzJlsvzIKxU3t7U9K
         xd8mYcytVR1WkKYFvZH4jMHcNWxTUZ4Qb12FoFlQ2aagzGqNuE75glr9FLYHHnJ4eJWl
         AjDE1zAW9crD5ziLB/Dfis3NeerUUcuGsd7+D2rg9IUzT1tDG3zY5/OHatMf8AsDZTJa
         iYqEY34Sm0w3sc6apOPRm3hTCQtdwwJyn9nB7tJ6NWTbb5rTu39jcq5ru/vGOv1NlsIQ
         e9GZQCm/2Wt3c/b8+lWK5bLXG00FrsDW2Hbd5jNhS7SuA5dOVXkX5Z6RkcVAZ/zYXyAx
         gGXg==
X-Gm-Message-State: AOJu0YxJsTm8aQQi2cyImrH4YqCPeM1IPd3UXvQYfRaOGJfrnU/VtRDF
	VPa3Qijns6+nk2OIJJyJZoPojfWQLF3jJrL/MmH637ZKQ/RKgVViRV0DqqEeb8fwi3DovPnpjd7
	Cn/DZxw==
X-Google-Smtp-Source: AGHT+IFM41I5ljctA3ZoXAPShMugW/nz3vrdIGdLpL4bvrituIkjvxyBAWyvMZG9wVJyhX9HyowvyA==
X-Received: by 2002:a2e:9b46:0:b0:2cc:ea5b:ba6b with SMTP id o6-20020a2e9b46000000b002ccea5bba6bmr1633163ljj.26.1706899171126;
        Fri, 02 Feb 2024 10:39:31 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW+o/2/ddph8TBlnx/u+dTRLQF+ZHTYPWawoC1n4/RR8J9bnr9W0cM5s/jwY7Ahl1gpJrVSFThe5aht/yrsv7FPpLeRv1d8mG+Yaw==
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id s30-20020a05651c201e00b002cc7f36bed0sm342706ljo.84.2024.02.02.10.39.30
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Feb 2024 10:39:30 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d043160cd1so27726441fa.1
        for <linux-mips@vger.kernel.org>; Fri, 02 Feb 2024 10:39:30 -0800 (PST)
X-Received: by 2002:a2e:8882:0:b0:2d0:8225:919d with SMTP id
 k2-20020a2e8882000000b002d08225919dmr1794857lji.21.1706899169784; Fri, 02 Feb
 2024 10:39:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240202-exception_ip-v2-0-e6894d5ce705@flygoat.com>
In-Reply-To: <20240202-exception_ip-v2-0-e6894d5ce705@flygoat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 2 Feb 2024 10:39:13 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiaSjYApqmUYCdCyYfr_bRsfVKDkwU6r6FMmoZzrxHrKQ@mail.gmail.com>
Message-ID: <CAHk-=wiaSjYApqmUYCdCyYfr_bRsfVKDkwU6r6FMmoZzrxHrKQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Handle delay slot for extable lookup
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Oleg Nesterov <oleg@redhat.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Ben Hutchings <ben@decadent.org.uk>, 
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	Xi Ruoyao <xry111@xry111.site>
Content-Type: text/plain; charset="UTF-8"

On Fri, 2 Feb 2024 at 04:30, Jiaxun Yang <jiaxun.yang@flygoat.com> wrote:
>
>       ptrace: Introduce exception_ip arch hook
>       MIPS: Clear Cause.BD in instruction_pointer_set
>       mm/memory: Use exception ip to search exception tables

Just to clarify: does that second patch fix the problem that
__isa_exception_epc() does a __get_user()?

Because that mm/memory.c use of "exception_ip()" most definitely
cannot take a page fault.

So if MIPS cannot do that whole exception IP thing without potentially
touching user space, I do worry that we might just have to add a

   #ifndef __MIPS__

around this all.

Possibly somehow limited to just the microMIPS/MIPS16e case in Kconfig instead?

            Linus

