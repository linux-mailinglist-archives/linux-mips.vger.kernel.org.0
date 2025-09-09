Return-Path: <linux-mips+bounces-11170-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 292A2B508D8
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 00:24:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CEFAB4E7D5C
	for <lists+linux-mips@lfdr.de>; Tue,  9 Sep 2025 22:24:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFDE726CE2B;
	Tue,  9 Sep 2025 22:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Is4EsM4o"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F9E25DCE0
	for <linux-mips@vger.kernel.org>; Tue,  9 Sep 2025 22:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757456691; cv=none; b=qH7jPMRhNXCpFzU/sUpJicY1Vfwx+VvlG/ecy8WrqIWzDccLoib+qtKXH4ZP1xWGOMOPe5hc+zizgKfydN47fc2AkI8mR2D2LwlH525A7Fe6mgY8uwEQ3QDonXB6TbppHx1s1IkzeIHbdLH2r9SX8hiZ8Fx5MyrArAB+CWU6toY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757456691; c=relaxed/simple;
	bh=TC2JZtkw5BkMX3Igl25beU/iUsWSo7CWbRuDpStlv3M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hsgqDPz3LyHVN0OqrBitgBZBR6T+tIhNSJzQ4OqZQLHoW+xRAbu/1EF1rqTvBRysU4Oz2o0kuVpW9CXZe9OEQ+jczkHzoZjrAltcCUwiEY3vggaRxqYDR8LbmJndFk9mz+sq0AwohYYUMNuHuhiGaaTMVh70pFoGXUfwsTpGjmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Is4EsM4o; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b0472bd218bso948608166b.1
        for <linux-mips@vger.kernel.org>; Tue, 09 Sep 2025 15:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1757456688; x=1758061488; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fEQiOQ22rYAZhHJ5F5hChKykmBsdSQ9Mr5OeL3gCArg=;
        b=Is4EsM4o6XsUJJ1QRxOgNa0bK1mGZ0kKUVO1GGZWvvjBQVQfdBQt3o15X9JToGPRSB
         pm4suJfyTnGgeNxSE+suXFBsXLEy4hxTPcIiIKJZlJYhb0WpzyhCORARVWV+i3moXVa8
         SabTOeZ02mExd6d7Pja/j5SxU3g1+g+0wgQ3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757456688; x=1758061488;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fEQiOQ22rYAZhHJ5F5hChKykmBsdSQ9Mr5OeL3gCArg=;
        b=eFux1QvDT6ZyUlG+2dmE1c7dNu28GvdOvUVcPwIPzzjxj0QFVKdAdtJ/9D/0aS+3qF
         MOHdO9ny9ZEvH6tiVpLGOZW7CDObukb+UCF5mV7qoSvjPtef98S90YNjXwoXRS2TT6/g
         7AYbKF7k4825u91oyg1cEZIhrk6acoQV2orcE/iSfEhPha2pHnMODQtBfAVwbaxZ2KwJ
         wk2+TkOQS0zDhFN83SN5BJpDYc+5Vqk48d/pz3YZo6y04riCuZ5btTqOTIQKhGwURdvC
         LVJcRNGpqyGCJ1Sz0u0zpBahwv/Dt/Hrbvg/EPFRLk4nfEuAq8fH8kvNCM4cL/bq4bnm
         boUg==
X-Forwarded-Encrypted: i=1; AJvYcCX6xic0bqZ7NKxhNU4EOaptcRmCNQaXVXr5YowGiamsEzvZ3/hH9fSH8eiw+SaTOJ9hkRtHXWxdXigR@vger.kernel.org
X-Gm-Message-State: AOJu0YwUfar1ffXhDvM46sWaaaZzSk4oVtVEGDaCbVbmh4EJX6vKxuVW
	8wUrKDt7as3IA6ye/vp+wyIyi4nblV1V87Y/9TJBq2EQpkNfff74Jn3p3dgUymae0u+ROaSxTQI
	w8LBkr1o=
X-Gm-Gg: ASbGncuFRHWlNQreGenKSsoU398N/1lsy11sHpC9IRlA2+5HJ+ZXDON7KmNhQ6GCFr/
	YO7bFeam3nK5AjOgDka99L8m7DX5bT+c3TpHn1PLrdgv6TzIbeZFjrxElGfol4MuKm/4zN4+Sjr
	S5PNHx+ZJLEUcu/QoIcSSWukHTROR9r2kGxySLchjToPx5SIw7cfbdQP8fYJ6rFX1o4WuhhLgJ7
	apvWblzzW6oCvbxVIQD1p6Vc2KC2L0L2fhIcsoMaEiroJ3HJA4UuCM2mNn0CRZgTmqvlhrc7tyA
	Lpn5NzfI4dBClvqWUIQ+3c9HskThknmkQj1jSyGLS7jaIuZ0MbRfbdMSA0xWvXr1mU+bkR0mK0g
	bMEFgX2mqqr9O0iBCRAVRLFzgP7hQgiWmAGrbRHJt5SXMvkVHQ1gKo5zGRqF3H1aUySBtqvECNv
	4clEWT0Ug=
X-Google-Smtp-Source: AGHT+IEomSZsRqzzOwKrm+CKYmVIVzlPshB3pHpFB+ivwURmr9LUnc8IJYPDIfjfb5cLZQ6Qt3FmqQ==
X-Received: by 2002:a17:906:6a04:b0:b04:5bc2:3246 with SMTP id a640c23a62f3a-b04b140cc26mr1430853466b.14.1757456687727;
        Tue, 09 Sep 2025 15:24:47 -0700 (PDT)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com. [209.85.208.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62c0133490esm1980992a12.34.2025.09.09.15.24.46
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 15:24:46 -0700 (PDT)
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-62d1faf1d8bso569631a12.3
        for <linux-mips@vger.kernel.org>; Tue, 09 Sep 2025 15:24:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXt8cPclrzTUHMrT7uKuvZot+92x1e9pLs/Hc3+F0654RxEnVdEE/tuSM6Sd31Zp7YBmMpNbwcg4ul1@vger.kernel.org
X-Received: by 2002:a05:6402:4412:b0:61e:a13a:27b8 with SMTP id
 4fb4d7f45d1cf-623729cb58cmr11071027a12.1.1757456686093; Tue, 09 Sep 2025
 15:24:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com> <C85C32F4-BD58-460B-ACCF-F0569ED0941A@zytor.com>
In-Reply-To: <C85C32F4-BD58-460B-ACCF-F0569ED0941A@zytor.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 9 Sep 2025 15:24:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg0bp-_kqmfaDYQLRJO30LYxEsMu3EKi65sKoi83EUZ3Q@mail.gmail.com>
X-Gm-Features: Ac12FXyoXbbHUJtrfKhAFeDlVJsB9IiUaRxuYQBQJQyqpHDKK1GQ8JtkX5zx-HA
Message-ID: <CAHk-=wg0bp-_kqmfaDYQLRJO30LYxEsMu3EKi65sKoi83EUZ3Q@mail.gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Arnd Bergmann <arnd@arndb.de>, ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Richard Weinberger <richard@nod.at>, 
	Lucas Stach <l.stach@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Ankur Arora <ankur.a.arora@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Matthew Wilcox <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Nishanth Menon <nm@ti.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Andreas Larsson <andreas@gaisler.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 9 Sept 2025 at 14:39, H. Peter Anvin <hpa@zytor.com> wrote:
>
> 1 GB systems used highmem too, sadly. And 1 GB was the norm for a big chuck of the late 32-bit era.

Well, while on x86 1GB systems did use highmem, they'd typically not
use very much of it.

IOW, they'd have about 900MB as lowmem (ok, I think it was 896MB to be
exact), with something like 120MB highmem.

So they'd either lose a bit of memory, or they'd use the 2G:2G split.

Or - and I think this is the main point - they'd stay on old kernels
like the ancient museum pieces they are.

I'm not convinced it makes sense to have a modern kernel on a museum piece.

         Linus

