Return-Path: <linux-mips+bounces-12865-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C59CCD154CB
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 21:42:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B54883020C5D
	for <lists+linux-mips@lfdr.de>; Mon, 12 Jan 2026 20:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ACDB34FF71;
	Mon, 12 Jan 2026 20:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dzv/Q+nZ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="RthAx7ao"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC069346FB2
	for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 20:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768250516; cv=none; b=gIMiEaEVr8zP4k0BJim+R6EQ0LWTVsiRyBfes8vnEaJTqf9PX5yQCd2H4n32IbYs3b2OVI6OhYQjYwnufoGETa9jg18p4dm57A5KQ61J2oolR9D8YAb9Dp4xhr+GgrRjemcxwtCMtA31wHJ7QIZk8Wu3ed5Pe6yy8j0wzRBvdnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768250516; c=relaxed/simple;
	bh=0apBjH3rou710+NoTDdnZM5btsO3XXqqpLVtuopCUfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XilCzCI+SZ4stngqn2MQ7umqcZR4PKOfnJzp1CBswMGWDIdQj1y21YXZANF7wUz3E2HhOH7K9N12/RkzPHSvM1tewaridiyaz7LHiohQgiAVNf1wiVtkmUgfs7eAXu8AnYXsvuXNNg0ykDVv+cGEebrFjG60FTs57RakbqjJXVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dzv/Q+nZ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=RthAx7ao; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768250513;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lJGgQVWpo/69kg314oK/hykP1Foddia8ADofq23KoAk=;
	b=dzv/Q+nZ4W+uis6PNr8CHkgEQfr57yBbyhuOgdh8WwrgiEgaVXImlncA78u/MmbYsE9LgJ
	I7YhqEYF1GDrlLPxRNRRrx6zzGJ6EY79ZtxrDUD1QnEp/Lau4wFrCHy3kggpkq+Mo9w5YO
	DUeE+0WDcHqOJwNJGFloXcxUMbBaasg=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-lNhmYo9POOCHRyeXRoYOwQ-1; Mon, 12 Jan 2026 15:41:52 -0500
X-MC-Unique: lNhmYo9POOCHRyeXRoYOwQ-1
X-Mimecast-MFC-AGG-ID: lNhmYo9POOCHRyeXRoYOwQ_1768250511
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-945e4fb842dso8916967241.2
        for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 12:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768250511; x=1768855311; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJGgQVWpo/69kg314oK/hykP1Foddia8ADofq23KoAk=;
        b=RthAx7aoRr+qHxtaKm7KBLUs/RXq102tui+Tpf6aArtlezulp2gzYuRqKC5C+VJeg+
         L/VUk8A0khNQnxk0hRXeCNftZF7lHulNht7Ct0J3900ZSksucAy7VkI+MixSveh3o/8D
         0ok+2Hr4OOam1zUFS4DN4EnwOozbfPY8gJL1PS/IyBjLudbudV1mm1fjf4sNgJx8gG62
         v84UwbT6iCkBgbbVvGzjRMaNCMXZ7QiPPFdX1jaWZOAkGo4E9pQODrIS/7r02c6+GIHg
         6F9qGQCPCA9QRiXBr+G4oXpl0QHz5dKjNSSbKe8jYxvbxrIvnJUmmWolbjfGhvOmhRQn
         gAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768250511; x=1768855311;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lJGgQVWpo/69kg314oK/hykP1Foddia8ADofq23KoAk=;
        b=UsWHsM3UDMJnu6FKZ6Yuq7NGZ1854/reCe0Qu8ssYzwCS0oIddJXvgAJ5yiTg84q6s
         k8T4pBrJZZ3VGDz0HNQs4efLKhE5oJHVyl/Y8hT734ASLJyINEDHYczas0Yjdu5lWWH/
         FoxZFfL6TUWIwg+tWQMPKMr7ZnAiWm5JZWVS+l2Rv7ZcP05RN4saeSNH8QNxOPxs+26d
         OHLKitJDuGTRaYo13IwZJ1cndX5nC6xs63wuCClobUGjws21highuzQ6sn+yXZnFuqaI
         p8qdgPr651TGW0Lvg7wFU2iXuQEFm7xGR05D6HWmZJFE3+kb/fFzXnHN/+29K8U51zUv
         XDBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJewVCqSAP731bTNtcP6kpf/7/mahwY7qfAL6mXZCd2ZqVCkHSk1OO454HfLjHFKCnixdHu1+8JU96@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr+1Ca0SGjy0VmPgBJ0WACSbr8txcQtYyIXvyy1zHnlqH1/RCn
	rhXI/HFA+voHo542s16m1bGUrGfrf8S+gbVdO9ivbXL4F3F+HY63QCpScRgwkomko/exlVrG8uz
	ZPTDX2v+Pn3PhsFG2H0TwzU48EeEMbdUTeqkt6A1nJEnSkRiseIspND/GxnVR6lrN2Bm5wd8=
X-Gm-Gg: AY/fxX5GrNb+Qjs/usWIaxh/x9hRlx6AYdY6TC6q9/7qagzdrLz0tPEBNYknuy2W8Ay
	4XynORZrh/pGkd4V6NzCxzzwLhtIsitQfCU3dQOkQEmRIKD048sYY6gdsXtAekDamsFRyY1A//6
	Tnp91H6mwwfoa0Ew8U47a+UyW2hFk2NqlqKWFfhk5aeN0OftDSNEs/arGpDJyOyVIGh6JijHbkf
	wsLl7edTiRM++kA0EDJMUcsoBXewjajyzrJIMKvwDLRYh7MlOPL++FVDVMmPEREP3wy60Z5ojPk
	juPgZH9s8+VePikCfpsCLwsHWj5u9MlpDw6N9bmI61UY5A3sAMhOrXrziulIT573hH5hTZkcQTP
	zB27hJWhw
X-Received: by 2002:a05:6122:4309:b0:55f:cae4:250c with SMTP id 71dfb90a1353d-56347fe2117mr6518852e0c.13.1768250511500;
        Mon, 12 Jan 2026 12:41:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/msJiDuMXiXTu1d5lyXSrw5TlNlZCRnExLgQ5LkAkcKPzJssyw7fe6CUA6J4kH+M+WlVMwg==
X-Received: by 2002:a05:6122:4309:b0:55f:cae4:250c with SMTP id 71dfb90a1353d-56347fe2117mr6518846e0c.13.1768250511175;
        Mon, 12 Jan 2026 12:41:51 -0800 (PST)
Received: from redhat.com ([2600:382:771e:5aa5:103f:e4ff:d734:7cd4])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5637f6ce00esm5551865e0c.0.2026.01.12.12.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 12:41:50 -0800 (PST)
Date: Mon, 12 Jan 2026 15:41:42 -0500
From: Brian Masney <bmasney@redhat.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/13] MIPS: drop unused pic32.h header
Message-ID: <aWVchtnpwjEC0FVC@redhat.com>
References: <20260109-mips-pic32-header-move-v1-0-99859c55783d@redhat.com>
 <20260109-mips-pic32-header-move-v1-12-99859c55783d@redhat.com>
 <e3f6f4fb-8438-42a3-acd7-57926942117a@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3f6f4fb-8438-42a3-acd7-57926942117a@tuxon.dev>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Claudiu,

On Sat, Jan 10, 2026 at 05:28:32PM +0200, Claudiu Beznea wrote:
> On 1/9/26 18:41, Brian Masney wrote:
> > All users of the MIPS pic32.h asm header have been migrated to
> > linux/platform_data/pic32.h, so let's go ahead and drop the unused asm
> > variant.
> > 
> > Signed-off-by: Brian Masney<bmasney@redhat.com>
> > 
> > ---
> > To: Thomas Bogendoerfer<tsbogend@alpha.franken.de>
> > Cc:linux-mips@vger.kernel.org
> > Cc:linux-kernel@vger.kernel.org
> > ---
> >   arch/mips/include/asm/mach-pic32/pic32.h | 36 --------------------------------
> >   1 file changed, 36 deletions(-)
> > 
> > diff --git a/arch/mips/include/asm/mach-pic32/pic32.h b/arch/mips/include/asm/mach-pic32/pic32.h
> > deleted file mode 100644
> > index 53918a671a4c39dba2a22121187cdd73e1935b24..0000000000000000000000000000000000000000
> > --- a/arch/mips/include/asm/mach-pic32/pic32.h
> > +++ /dev/null
> > @@ -1,36 +0,0 @@
> > -/* SPDX-License-Identifier: GPL-2.0-only */
> > -/*
> > - * Joshua Henderson<joshua.henderson@microchip.com>
> > - * Copyright (C) 2015 Microchip Technology Inc.  All rights reserved.
> > - */
> > -#ifndef _ASM_MACH_PIC32_H
> > -#define _ASM_MACH_PIC32_H
> > -
> > -#include <linux/io.h>
> > -
> 
> There are compilation errors when building pic32mzda_defconfig (see below)
> and I presume those are related to the fact that this include was dropped
> from include/linux/platform_data/pic32.h:
> 
> ../arch/mips/pic32/common/reset.c: In function 'pic32_machine_restart':
> ../arch/mips/pic32/common/reset.c:27:17: error: implicit declaration of
> function 'ioremap' [-Wimplicit-function-declaration]
>    27 |                 ioremap(PIC32_BASE_RESET + PIC32_RSWRST,
> sizeof(u32));

[snip]

I only tried compiling this on arm64, and that compiles fine. I setup
a mips cross compiler on a arm64 box and I can reproduce the compiler
errors.

So linux/io.h is not directly used by this header file. I think the
correct thing to do here is to update the files where it's actually
needed. There's 3 files that need linux/io.h, and one file needs
linux/types.h. I'll send a version two of this series with the cleanups.

Thanks,

Brian


