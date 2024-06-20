Return-Path: <linux-mips+bounces-3807-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8142B911377
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 22:41:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A39331C21CC6
	for <lists+linux-mips@lfdr.de>; Thu, 20 Jun 2024 20:40:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 167EF5C8EF;
	Thu, 20 Jun 2024 20:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="YYXX/vqj"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474715915A
	for <linux-mips@vger.kernel.org>; Thu, 20 Jun 2024 20:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718916048; cv=none; b=h3SDZP9jJSb70Q4Vig2K39elm9RC9i/CJgBhdpmD4hAXQBux4WF/PNeUqnkHJ0XF00OSPXBqPMAmiDDHsSXwf5jqos42exhDau4GQLx8Pmh72VQeOttAQVTzLHyZe4q+bb+qNChGHlNHBskxuUPyfN/NZheNAsfZH2wZ8R6bCNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718916048; c=relaxed/simple;
	bh=xe0CLiytQL+w07wMVqUc1rJS0v+e/Ti6ErqFWmVCp7I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hLlRNmUatKa1jDIGif8cpt/BKGfDXZL22uimRnEGXDIi/vU2Mug21F59AgmkA/SsOcWwTt0j7SRYi/OKJG2xs7J+UAaug6AVUg6lh3LN7oWTxBKO244BUZ3mjgMG0hrWYavwW9fGtCqpEpJBTJ6J4KB2OHZjsVXQReMc4ylk5g8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=YYXX/vqj; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a6f11a2d18aso145489766b.2
        for <linux-mips@vger.kernel.org>; Thu, 20 Jun 2024 13:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1718916044; x=1719520844; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=w6VZWpwlG7GhpGptpxtkhZuBw3s+vrw3bJ0KsbwAf6c=;
        b=YYXX/vqjqr+OsZ15aEKK95QpayOfPD6b2DScRuJckEBIDd6iYA2FyOgXBSsABDS9k5
         Hjq7g8XVqG+Ks910C0MgVxZBB1aH3SdskEstdb3DJ/iaOPLxFDff/F9CGPS7oArE9oQd
         bJ7hxcQ/CsYRUJTZYvIxI2/kBuDyfzyoheflk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718916044; x=1719520844;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w6VZWpwlG7GhpGptpxtkhZuBw3s+vrw3bJ0KsbwAf6c=;
        b=XuJZzTGY/spjyMIwCiotAwu5koGcLDaJ5VpgYrIfDxubbRd7OcD6KcU0IuxtO5NJn3
         iGtq6OW/RsXJI47t7lhUe65mQxhG/oJHke+U/LAfJrjUbOyuWoX4HTqcVqHJssZWXGTD
         CA5dmc6ZxYWcH/4bN9pbE2ODjT/m8p5hBvAfdKTim2ntX+5UR7A+ebuo0IeUnyS8KJ1E
         xXh7oaeA5p31oX9jTnv9Og3wLieDBPJHHFLoSrQ0fxMebZwrOvw9wBBlfKKHXjpeqqpI
         WN9SoSJmPEbCK2gfQfISJAEdM1w6XWl4U1LYOHX0Vl03WRwZFSevC4LkWfbG1JihxmVu
         teHA==
X-Forwarded-Encrypted: i=1; AJvYcCV/Xcupobc7O6a9Z5mj2Z0bF6pH9Fr3SpBiiSccsBOrc1/GYuSCkcYeHCXnUaje/S0ahLA5Sva7+wdjQb0rbynN+gEOS1um3fnApQ==
X-Gm-Message-State: AOJu0YwBY/jdm7iJ0WJC+8xHC565RYBh3GVl688UC9/6rzDlYORML3kt
	MEJLKUy2pXwKHg1IvXGX+ak9Cvdeppwd7HANFiAvIeWP0cGAZGDKylOgoP3RnnnSVBOjM1OJl2g
	q0spSuEJq
X-Google-Smtp-Source: AGHT+IETqGI63UiSTRfButvlJ3TvItLsOX/kgJiYIvhpDXOrwCWGtuJlzVu+i3hRGx0ZQVpmcFpxqw==
X-Received: by 2002:a17:907:30d7:b0:a6f:3135:e2ce with SMTP id a640c23a62f3a-a6fab7cd5e0mr257842466b.68.1718916044299;
        Thu, 20 Jun 2024 13:40:44 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf4ba8ecsm8217966b.92.2024.06.20.13.40.43
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 13:40:44 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-424720e73e0so13334935e9.0
        for <linux-mips@vger.kernel.org>; Thu, 20 Jun 2024 13:40:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX26XtMqEEz74xcdPSDxn6V4phsmDBK8g/ujNYl58CT3NK3LgxvHooHH926oxAkSfGrXE3GzFQ0jbRCHTsF0gSiOWumO3ih55yg1g==
X-Received: by 2002:a17:906:1348:b0:a6e:2a67:7899 with SMTP id
 a640c23a62f3a-a6fab63aaabmr312193466b.35.1718915542284; Thu, 20 Jun 2024
 13:32:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240620175703.605111-1-yury.norov@gmail.com> <CAHk-=wiUTXC452qbypG3jW6XCZGfc8d-iehSavxn5JkQ=sv0zA@mail.gmail.com>
 <ZnR1tQN01kN97G_F@yury-ThinkPad> <CAHk-=wjv-DkukaKb7f04WezyPjRERp=xfxv34j5fA8cDQ_JudA@mail.gmail.com>
 <ZnSPBFW5wL0D0b86@yury-ThinkPad>
In-Reply-To: <ZnSPBFW5wL0D0b86@yury-ThinkPad>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 20 Jun 2024 13:32:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi2R7-jyoOw27Svf1PmfDFQgBWVAH3DP5CXO+JF-BeFZA@mail.gmail.com>
Message-ID: <CAHk-=wi2R7-jyoOw27Svf1PmfDFQgBWVAH3DP5CXO+JF-BeFZA@mail.gmail.com>
Subject: Re: [PATCH v4 00/40] lib/find: add atomic find_bit() primitives
To: Yury Norov <yury.norov@gmail.com>
Cc: linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	"H. Peter Anvin" <hpa@zytor.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, "Md. Haris Iqbal" <haris.iqbal@ionos.com>, 
	Akinobu Mita <akinobu.mita@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Bjorn Andersson <andersson@kernel.org>, Borislav Petkov <bp@alien8.de>, Chaitanya Kulkarni <kch@nvidia.com>, 
	Christian Brauner <brauner@kernel.org>, Damien Le Moal <damien.lemoal@opensource.wdc.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, David Disseldorp <ddiss@suse.de>, 
	Edward Cree <ecree.xilinx@gmail.com>, Eric Dumazet <edumazet@google.com>, 
	Fenghua Yu <fenghua.yu@intel.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Gregory Greenman <gregory.greenman@intel.com>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Hans de Goede <hdegoede@redhat.com>, 
	Hugh Dickins <hughd@google.com>, Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Jason Gunthorpe <jgg@ziepe.ca>, Jens Axboe <axboe@kernel.dk>, 
	Jiri Pirko <jiri@resnulli.us>, Jiri Slaby <jirislaby@kernel.org>, Kalle Valo <kvalo@kernel.org>, 
	Karsten Graul <kgraul@linux.ibm.com>, Karsten Keil <isdn@linux-pingi.de>, 
	Kees Cook <keescook@chromium.org>, Leon Romanovsky <leon@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Martin Habets <habetsm.xilinx@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Michal Simek <monstr@monstr.eu>, 
	Nicholas Piggin <npiggin@gmail.com>, Oliver Neukum <oneukum@suse.com>, Paolo Abeni <pabeni@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ping-Ke Shih <pkshih@realtek.com>, Rich Felker <dalias@libc.org>, Rob Herring <robh@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Sean Christopherson <seanjc@google.com>, 
	Shuai Xue <xueshuai@linux.alibaba.com>, Stanislaw Gruszka <stf_xl@wp.pl>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Valentin Schneider <vschneid@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Wenjia Zhang <wenjia@linux.ibm.com>, 
	Will Deacon <will@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	GR-QLogic-Storage-Upstream@marvell.com, alsa-devel@alsa-project.org, 
	ath10k@lists.infradead.org, dmaengine@vger.kernel.org, iommu@lists.linux.dev, 
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-media@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-net-drivers@amd.com, 
	linux-pci@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-wireless@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	mpi3mr-linuxdrv.pdl@broadcom.com, netdev@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org, 
	Alexey Klimov <alexey.klimov@linaro.org>, Bart Van Assche <bvanassche@acm.org>, Jan Kara <jack@suse.cz>, 
	Matthew Wilcox <willy@infradead.org>, Mirsad Todorovac <mirsad.todorovac@alu.unizg.hr>, 
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, Sergey Shtylyov <s.shtylyov@omp.ru>
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Jun 2024 at 13:20, Yury Norov <yury.norov@gmail.com> wrote:
>
> FORCE_NR_CPUS helped to generate a better code for me back then. I'll
> check again against the current kernel.

Of _course_ it generates better code.

But when "better code" is a source of bugs, and isn't actually useful
in general, it's not better, is it.

> The 5d272dd1b343 is wrong. Limiting FORCE_NR_CPUS to UP case makes no
> sense because in UP case nr_cpu_ids is already a compile-time macro:

Yury, I'm very aware. That was obviously intentional. the whole point
of the commit is to just disable the the whole thing as useless and
problematic.

I could have just ripped it out entirely. I ended up doing a one-liner instead.

                Linus

