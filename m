Return-Path: <linux-mips+bounces-12259-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BD0C60A58
	for <lists+linux-mips@lfdr.de>; Sat, 15 Nov 2025 20:08:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 56E5A4E201E
	for <lists+linux-mips@lfdr.de>; Sat, 15 Nov 2025 19:07:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2721730595F;
	Sat, 15 Nov 2025 19:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b="YW6QLwFH"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFBC3043B7
	for <linux-mips@vger.kernel.org>; Sat, 15 Nov 2025 19:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763233617; cv=none; b=ieAdeH0yQKlOJVuqL7sdA1jRs9TZYq/hMINO9U1+pLrRtCgHkjYoQr93V4T4GlbBPM9Vf8cxWwdGUNFn3QcE90iU5c3WtQ7m5RP4rwqqom5gDI2xYGkXmGzJZLOzrkioBtpxOP52osJGpuLZX2r/P7nXzjtWs3ZOHaZ7JvoNZ8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763233617; c=relaxed/simple;
	bh=UAn1DCgzkUmzEfBjN6konaTygi+H/ALwSzVfPpb2m1A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WR/+hqm4lLr7n/7MTuBKQBohlB2w/831lXCZ5hsras899CYp9NM+7VXA9fy3HRq0fPd8qr4pPJa45v9A46zD6MBbaNQDZqEwK32g/4RJPVOCW/gin+v9Fnz5y/WRf2M8R4FtE3p4n4nfyNq0czO1VveYHJqmxl4wqMeNjD0Wt94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca; spf=none smtp.mailfrom=draconx.ca; dkim=pass (2048-bit key) header.d=draconx-ca.20230601.gappssmtp.com header.i=@draconx-ca.20230601.gappssmtp.com header.b=YW6QLwFH; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=draconx.ca
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=draconx.ca
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8823cde292eso35764506d6.2
        for <linux-mips@vger.kernel.org>; Sat, 15 Nov 2025 11:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=draconx-ca.20230601.gappssmtp.com; s=20230601; t=1763233614; x=1763838414; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0r42ycPq4ii0n+Y30U+z7Vd805r5WgIurS0x2hT0WZ4=;
        b=YW6QLwFHExrR14P7qfXIB1G/jHBjaoXm5UNLSsI1RyvbroXF7g/5spEpUoqFz+uYIN
         n541Wf+VkLEHkq2ILiZZvIrQnkwr4m5+bo9GQCztq7yqhODHgT0FtgTSmhGkbXp2NODY
         EBcKFPYUzWNKDCq4oresfcDzgbafz7zSBF6mJaoCl5HIMGY6ldB1dtcIR/3dcR866UJL
         W4WQIS3qkrtv0uoX2hXYWw3V3qkeWQ65fC9XqZhVKicOm1AGIelYPRtnKqYALz5oT8aW
         DdB3MOWuD+KkY1XM6OC0SvqhbugP7rQkGrS6qSLKYQ4uiUB3N7NWMIIpp9e5BsR3A9gS
         Ue7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763233614; x=1763838414;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0r42ycPq4ii0n+Y30U+z7Vd805r5WgIurS0x2hT0WZ4=;
        b=Rcf6qJIqKrs0Ml+ywHkyEaXGQCZ0KTgzBVaTKWGXE8gd5KC7armyRj3rt1LWCA7dTl
         F7vBVHpeOKwv8OT/vqmNO8yXCjF3Q1eXXfmQ3oof3SG/r0mfqIhrBqIBlja5Cml2fLYD
         5G2riyJZbq+IDWKoiObjC/1R8hpooYnMHjkpEPnvpyM+TSux/HPSLkzcMawvXwc8fZUY
         OuQ0Kp3ki0fxOicZG8kDzA/CIAUiNL8Nutbx3Mm6w0Ns8zwI1NFJAse64Dx1+afaSqUJ
         dv+QAeW5a1fI//hu1dUnqYo1VCQfz1WReyXjkqx9c9prHFa6pHo2RlrIdpmbYmWgx3gb
         +KLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYSpZl2WhY+PXH0/wqxAjFJ8hovxuTAoS8YDR3A+hicluSl51MNuBrU2VB5pV/pXZlI4lFqPmMzlyv@vger.kernel.org
X-Gm-Message-State: AOJu0Yyb3owkFFjR8Sdkk3Xnqr3KRv0Ih9bEgcWHqi0dz6HM74IIB4pJ
	QA1jPaQnwQT40RCnekdyZGzf89HudbMk20j0bH76ZmC/zw9f5tEGN9NdXJW/w0rRqos=
X-Gm-Gg: ASbGncsaRUhVP0FW0bNdqafGg7WxU3aDYcNn9WN2PbEACYZlV/JlwQ5oGSmScz8dJP5
	E3OwltqGTsSGQlZTo7AJEYSDoAVc75h2+1+TlFPLNKQ+BxQyYo5J/TSs1BBonMRieUz3a4CiH8w
	Jt2ZBCo0ko/tEMUNn/uwXST7LH4TTEvrESIw2kpK+sNBh+SNgfHZklcEQFedSDg13NEHNcy2hgO
	fAJkhiN/vjOw+Ox005MY54tVuF1FZv8h4xRJzAf1yCA+KtAvKCgwHTaDJFu0Cj568DddoCiudr9
	JdeT2uEKHlt0j8vT/InjaZ2pXWMQ+GpWs1WQ8ygJXmiPSBgmg4Mml/hUMwNhr03b/5OyGzm2Cu8
	lDos431Gr0JVqOikhd5FH3OEsC+/CJm2jl7Jn/L5bCSLeqmoqfLSt1axZY0upF9pGrNtlb4Rp8R
	jF9qGgokgBqLDjiQkEsFB3N/quTlKdLk5vRMzyog5xhld6n5mijNo=
X-Google-Smtp-Source: AGHT+IHu4RhRGyRo+jdrPPsz+MGV1wJZLYoA1CRkUq72ARJlZpYIbr7nMmp0RSFox1ocrbkWXvAt7w==
X-Received: by 2002:a05:6214:cab:b0:87c:f64:7571 with SMTP id 6a1803df08f44-88292604aefmr85886336d6.23.1763233614235;
        Sat, 15 Nov 2025 11:06:54 -0800 (PST)
Received: from localhost (ip-24-156-181-135.user.start.ca. [24.156.181.135])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-882863138c0sm57763566d6.16.2025.11.15.11.06.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Nov 2025 11:06:53 -0800 (PST)
Date: Sat, 15 Nov 2025 14:06:52 -0500
From: Nick Bowler <nbowler@draconx.ca>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] MIPS: mm: Prevent a TLB shutdown on initial
 uniquification
Message-ID: <a3z7inhvpbss7mbcef2pdoyeiu652mrtaasjmjuo6bul2rufmj@vlkvbbkj6jus>
References: <alpine.DEB.2.21.2511130507110.25436@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2511130507110.25436@angie.orcam.me.uk>

On Thu, Nov 13, 2025 at 05:21:10AM +0000, Maciej W. Rozycki wrote:
[...]
> Changes from v2 (at 
> <https://lore.kernel.org/r/alpine.DEB.2.21.2511122032400.25436@angie.orcam.me.uk/>):
> 
> - Revert the v2 update to include wired entries while reading original 
>   contents of TLB.

Everything seems fine on my R4400SC Indy with v3 too (or v2 or v1).

Thanks,
  Nick

