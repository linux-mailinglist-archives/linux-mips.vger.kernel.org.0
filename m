Return-Path: <linux-mips+bounces-6740-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 147699C7B55
	for <lists+linux-mips@lfdr.de>; Wed, 13 Nov 2024 19:36:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 52034B36C40
	for <lists+linux-mips@lfdr.de>; Wed, 13 Nov 2024 18:15:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F21C620650F;
	Wed, 13 Nov 2024 18:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="prKhp1Co"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CC8206069
	for <linux-mips@vger.kernel.org>; Wed, 13 Nov 2024 18:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731521605; cv=none; b=qQ7ElURj8CoVlRqR+QHLJ2P2Sx2CcsN21Ci8CksksEESmvRW8oI7ZMirDkk7EbNRYewPqzrbHa9+fRMdoaLf9ECbvBJzeR4xdLiPFInIM6w/sfAlio1WdoiMDuWFeO180vMrCZYC4SgPTmAb5uxBgNnE1PW4ZShCzz+Zk7qn3m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731521605; c=relaxed/simple;
	bh=tNL46p/MdQXU6B5B+Ch6wEDFtN9GWmRh54QbuFrtmmM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G+KzV75Ak7k4wC0kRMlgwmkE02SNOFvFyxQcwfGcGDIA+DNxEpiRpurO+QXUm8hFjdaDWQQEWkpI6FRKuni3wmckEl05Gni3R/1QTEYk/3frFqudOv5JMSIFf8Qh/sawjDu7qd/uSjzOp0Cw98wOAoD0gSRMg8u10Y5FZXb/9as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=prKhp1Co; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4608dddaa35so396271cf.0
        for <linux-mips@vger.kernel.org>; Wed, 13 Nov 2024 10:13:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731521603; x=1732126403; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rp8hNPX0VLmWD8XftHObcjWpZvmTQwqXzWOykYGl7Gs=;
        b=prKhp1CoPoWrn7OJV8J0JmBlcffCXhxiKOyaARssBqgeMsEQeYV7Wy2FWv90zDq4oK
         tA35mt0P2OfjLmk/WPXBuZ0VvESGNLZlY0pWlVKSJLxM2W0c8yiRoldIqEG3MpygpoVe
         Y1LixIxoUzypKjjSoIm2E8EMqHN9duS3KdUB+OdPbW890qR5B5eFfLGOi0/7nbGPBymP
         xIW6xy5p4m0boQiU+aJ1W7NJGRDWdZ5ppKjKqm4rv27cThhBD2r2WVPi84XFKou8vM94
         +KRCaOGD8LPbWqMaFgTsQfKL9PVlch+7pfSJnnK2tQxcVklhuGk9Im1bdel+facxxMnn
         V1lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731521603; x=1732126403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rp8hNPX0VLmWD8XftHObcjWpZvmTQwqXzWOykYGl7Gs=;
        b=azJRcw8ml7jnboryd7rBgqSS7grzjzILUJCE62kXohhS1zPi27bf3dnYcgqggazHGM
         q1qDOtgoKZg7VBwrJBDnOPUh+1je6KI+MVemQPux1NsZzx59pesHkYk2K9Bw9dVtrTj5
         wyFEbdDSgMLVOmWxO6V312S1YDdSZFHjkD3mK6eISWYdSgU7MyFWPEHgwPXw0ddVW02w
         OdnugSvlvKH5mIyOqWMBflC+QxUryX1xH1S4bmnNN5lbhyrOTGNlwupg9Hhu7pLghr0S
         i3dx3LBTXVO0QMcVxlmz8ejC3hRmclBBae2Jdc4vjk8kJ3tY+0CAqw6+v57ciH5lJEcG
         iEKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfU6PkDkWi6mzhIr3Ft2ROOUyq40IAy0hnpcrg4THKmfl/Z3ezdk8dA4taa1hVRxjr1AEI8b1vzEnD@vger.kernel.org
X-Gm-Message-State: AOJu0YzWgYc5gGqUnvYI5iGGa4CqnHLVdhz0LSHnTwqobHS9MAnVlYq2
	BKyBScjfbUq+eM7i+nNW5ehjUJt7IAlHwMEkVnfkgeTzYJ2OMoYsYODzc/9y5JRFBI5s8L4/Szh
	j8mpWdk0389sQpOzV8zSJxdIVnzMooRMCzo0w
X-Gm-Gg: ASbGncssCgnkkFMyO5cf9eWpim0MD9ANlwnsM1i/0ZPC6zZWuOeM0NeZdyTE3T1zGPp
	01NO8RDByeOEWTWb2LgjJGtxFwUpA1lNdxaGnKDuqUYomvpZXmrVtRXTgQfB9rw==
X-Google-Smtp-Source: AGHT+IG/7M6sd4aK24NUybAW5YiEM2SC8/ee5wr7lYsiN2DJ6ZgB+3gLQ0/9eH3a8rWX5Zl67jKI3cvfUAeL2lALvcU=
X-Received: by 2002:a05:622a:20c:b0:461:4898:8614 with SMTP id
 d75a77b69052e-4634cadd345mr3546961cf.27.1731521602474; Wed, 13 Nov 2024
 10:13:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241113064028.2795128-1-xur@google.com> <alpine.DEB.2.21.2411131542500.9262@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2411131542500.9262@angie.orcam.me.uk>
From: Rong Xu <xur@google.com>
Date: Wed, 13 Nov 2024 10:13:10 -0800
Message-ID: <CAF1bQ=TUYoc3kUnBOtO4BWfuDLb5_YdxduVGsMfsyP7jLWmH5w@mail.gmail.com>
Subject: Re: [PATCH v2] MIPS: move _stext definition to vmlinux.lds.S
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Klara Modin <klarasmodin@gmail.com>, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

"

On Wed, Nov 13, 2024 at 7:55=E2=80=AFAM Maciej W. Rozycki <macro@orcam.me.u=
k> wrote:
>
> On Tue, 12 Nov 2024, Rong Xu wrote:
>
> > The _stext symbol is intended to reference the start of the text sectio=
n.
> > However, it currently relies on a fragile link order because the existi=
ng
> > EXPORT(_stext) resides within the .text section, which is not guarantee=
d
> > to be placed first.
>
>  Umm, arch/mips/kernel/head.S does mean to be linked first.  We rely on i=
t
> for environments where there's no entry point is available and execution
> starts from the beginning of the image.  See the comment right below your
> change.
>
When you said "arch/mips/kernel/head.S does mean to be linked first", is it
a hard requirement in mips? This patch only moves _stext but leaves other
symbols from heads.S for TEXT_TEXT macro to order. For example,
__kernel_entry is placed in the middle of the text segment.

If we want head.S to be linked first, I can change the patch to place
all symbols from head.S before TEXT_TEXT.
This way, we can also resolve your concerns about moving _stext byond
the exception handlers.

I tried that method, and the symbol order is like the following:
0100000 T _text
80100400 T __kernel_entry
80100400 T _stext
80100410 T file_ra_state_init
80100450 T readahead_expand
80100710 t read_pages
80100a04 T page_cache_ra_unbounded
80100c10 t do_page_cache_ra
80100c9c T force_page_cache_ra
80100d50 T page_cache_ra_order
80100d8c T page_cache_sync_ra
80100ff4 T page_cache_async_ra
801011b8 T ksys_readahead
801012cc T __se_sys_readahead
801012cc T sys_readahead
801012e0 T __split_text_end
801012e0 T __split_text_start
801012e0 t __sync
...
Note that the reserve space for exceptions is before _stext

> > Move the _stext definition to the linker script to enforce an explicit
> > ordering.
>
>  So if you say that the link order is fragile (which it may well be), the=
n
> that problem has to be fixed instead, likely with the linker script too,

I think what we meant was the way the current vmlinux.lds.S (linker
script) written
makes the symbol ordering fragile. This patch is to fix this.

> and then perhaps an ASSERT placed there to verify that it has worked and
> `_stext' refers to the beginning, taking into account what follows too.
>
>  Also note that `_stext' currently points beyond the space reserved for
> exception handlers.  Have you analysed what the consequences would be if
> it was moved ahead of it, which your change does AFAICT?

I did not analyze this. I think it's fine. From section boundaries guidelin=
e in
include/asm-generic/sections.h
It seems ok to me that exception handlers are included in [_stext, _etext].
But I admit that I'm not an expert here.
We can use the method I mentioned above to keep current behavior.

>   Maciej

