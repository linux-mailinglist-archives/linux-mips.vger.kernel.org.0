Return-Path: <linux-mips+bounces-11197-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 234CBB517A2
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 15:10:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BEED9463880
	for <lists+linux-mips@lfdr.de>; Wed, 10 Sep 2025 13:10:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 359453191DE;
	Wed, 10 Sep 2025 13:10:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m1MUZw/o"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1972A296BCC
	for <linux-mips@vger.kernel.org>; Wed, 10 Sep 2025 13:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757509823; cv=none; b=Hjy9qdcghVnhwQc0lz49rKOxJFbpk0+JaeNNG7DaCIqL5yMCh9Kkfa0qM9okIeu57VZBheSL4Cn6TKE8gA56H5Lq2M9MIJ1Crg6Xn8FoUgJhhAupGbpbsCQFhEfjGMTWvRkTXPs7C0LmR274upHJLdR5EjGEW/07jBkXS+7jHfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757509823; c=relaxed/simple;
	bh=tARB5u1V/RXYwm+IlZJX6Sogx9fWVBBiWrlM/q73HGs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t8+0q5X05FUWtcS+1q5T+JSg6F8ekL8s5pPMN+bNU8rQSPXIElRmrqv2hfmg2ZXziFApudaZRHApdRapFGCGhijHlRubu4RBKb0MWNlpNqnnUQO2qNF9VjrzX7DogBJQGnr+fOeqgPzXCd8+tc/sIFkc2dE9FkfpHAONTPzdH4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m1MUZw/o; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55f7c0fb972so7434823e87.3
        for <linux-mips@vger.kernel.org>; Wed, 10 Sep 2025 06:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757509819; x=1758114619; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1LsnFE1xI0qQhVi+l6O9JAbITiONruUrWb3tpAPA1P4=;
        b=m1MUZw/oS8Zzg2f6RiclI72wsW3jZHFJDzdqKbiFFM5tgR0cBRVjQtyqbJVe9ghKn/
         XYY/iXm7aHbS6WHcAMVpFDkow79T8z/E/YSaqTIIAcmnGZdXLt7qpYnLiMCUkjojoaFB
         4stc8BHarwkGip0USpPL0BLZ7kzVaoxsEpqFHq/ZJq8DcJ9edDRUXtfe5eXKYFbmFxFG
         X1/hsscrwbVyYfAcnqs8GA09ST2rrv1kR+9+PU6FV8VYXckCNnqtBCs8N4Yc7FDyeFy7
         Y39kh+ZgMOzxVkbOOn4gvMN/ryL1uMoMSIJvcPEC4IlBoIGKjfvSk5HPHixWiBVwD18S
         tc+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757509819; x=1758114619;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1LsnFE1xI0qQhVi+l6O9JAbITiONruUrWb3tpAPA1P4=;
        b=jeMdfd9wVMe4fZvD/bF8M/CU2Ofq1K8wWWrbLKBw2FYZshM0HVeSkWeKmCtyAPg+hV
         QrDQjw/VDF876GRJrjAfstDlBvFU0UP93frR5mSKqCVp62jGLJjdL+/RGuivc79SnfDe
         SZ2tqGDls2KmkJdL+au7FThvkICRc7UfXljuhiCwh0nTDdihlVLejS2mEhfn31gyaGqI
         2d2XGCVTmvkTvDIHKykeaISfm5zGIJP45NB1mM6lcd3ryObd5eR6LMG25uUQ1FjcJs+r
         5Kuk0Snpoinf3Um8Y4nhmwEiqak/LmBGJk5U4mLqRrTQDABA9GzVGzhs6r2pKzpL0Xbt
         P+Iw==
X-Forwarded-Encrypted: i=1; AJvYcCUHH28A6a/PC9l/c/oCqYlhomfhn4QLqWm1NhGC2QZsxUc6EbU3QZ2Gz0mTUfSEgRVa0CEetSXn9Ea1@vger.kernel.org
X-Gm-Message-State: AOJu0YxJb/d4EZ6pe8hBBi+/zqxMUq8FRiTbNmKvpA0z3P0DEUuD+Iqf
	BpOL8NFQRFNUTc74Ol91lluQ8AvQlbZJDOEHzjMRtvbl3eSGcW230r3RQjsmk3MpHAhVS28fvMO
	RadE0dm5fYu3SmgvN0MwmdUACC66vP58jeqS9O3O1zQ==
X-Gm-Gg: ASbGncviISoyls1mjZ3UFy9UO+nJoh1CfsjJtVAsfpZMEmKsdwjHwcqkbyIbqQNbnZ0
	CBrmMOpMGa/udunE7xQWjSCQ8Nk85sMEhZFb/9nOaI+oUfsop9LSCukQ39I6lB9NhUN3n8hn2o4
	jNo0CLCcS8sHbgBEd2rlB4X3sWDz/p1aZ86/5RIqERkBF6UAEG9F2ukCK0MCU7Wc14wVz0K+T5p
	MWjkdk=
X-Google-Smtp-Source: AGHT+IGgInBj1Ic/f5mZf9DHaSimxT6oABg1gWpLpcYCM/ousRHHwwGjp7S7ZCbmXiMiFXeqAGANnBbsml0uYfwnmj8=
X-Received: by 2002:a05:6512:39cc:b0:55f:47a9:7d33 with SMTP id
 2adb3069b0e04-5626425ccd6mr5952206e87.44.1757509818943; Wed, 10 Sep 2025
 06:10:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
In-Reply-To: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 10 Sep 2025 15:10:05 +0200
X-Gm-Features: Ac12FXx4fqtngzlb3aPI-q1c6xVbomqK3jaNECwBf_yyF7AQZ2ofNJeHmlxFUVw
Message-ID: <CACRpkdb=E-_6fZ+4mX5FJas9C5Njp3Gwrygs-cAfWNdbP594cw@mail.gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: Arnd Bergmann <arnd@arndb.de>
Cc: ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Richard Weinberger <richard@nod.at>, 
	Lucas Stach <l.stach@pengutronix.de>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Ankur Arora <ankur.a.arora@oracle.com>, David Hildenbrand <david@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Matthew Wilcox <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Suren Baghdasaryan <surenb@google.com>, Ira Weiny <ira.weiny@intel.com>, Nishanth Menon <nm@ti.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Andreas Larsson <andreas@gaisler.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 11:24=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:

> - ARMv7 machines with 4GB and more exist and keep getting
>   kernel upgrades, but to my knowledge are not in production any
>   more. These are mainly 2010-2015 era chips based on rare
>   out-of-order cores like A15, A17 or PJ4 that were designed for
>   low-end servers, chromebooks and network equipment but replaced
>   with 64-bit chips shortly after. We had planned to bring a
>   CONFIG_VMSPLIT_4G_4G option to ARMv7VE to keep supporting the full
>   memory at a performance penalty, but currently have no plan to
>   finish this (volunteers welcome).

I'll fill in on the details on that, because I tried, to the best of my
ability to prototype this but I failed, so far.

Here is what I managed to do:

1. Building on another rough prototype by Afzal Mohammed, I managed
to compile the ARM32 kernel into the VMALLOC area, this works
fine and here are the patches:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git=
/log/?h=3Dkernel-in-vmalloc-v6.10-rc1

This is is done so that we can unmap *most* of the kernel
memory but *keep* the VMALLOC area, so that e.g. exceptions
can still execute and save to stack when they occur, and we can
call into the kernel to execute said exceptions.

This in practice means the area 0xf1000000-0xffffffff
which also includes the high exception vectors that must for
natural reasons also be kept in the mapping.
What we have mapped today (all of the time) is
0xc0000000-0xffffffff.

A minimal 256 MB mapping from 0xf0000000-0xffffffff
should be able to cover this.

So when we are talking about a 4G/4G split we are talking
about (4G-256MB)/(4GB-256MB) split to be exact,
we would keep the bottom 256 MB.

2. On top of this I tried to decouple kernelspace and userspace
allocations, in essence making anything outside vmalloc invisible to
userspace by unmapping it using the fact that ARM32 (LPAE) has
two separate translation table base registers: one for kernelspace
and one for userspace.

Step 2 makes sense because we know the reverse can work:
PAN (privileged access never) makes userspace memory
inaccessible from kernelspace unless explicitly requested and
that works fine already, and we implemented it for LPAE
with similar trickery, see commit 7af5b901e847.

It's harder than it looks though and I never got it to fly, but
maybe I will try again. My patches is a mess but I am a bit
smarter now due to reoccurring MM-related work.

Yours,
Linus Walleij

