Return-Path: <linux-mips+bounces-11550-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D798FB988D3
	for <lists+linux-mips@lfdr.de>; Wed, 24 Sep 2025 09:32:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C59C3189B932
	for <lists+linux-mips@lfdr.de>; Wed, 24 Sep 2025 07:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B480B27CB0A;
	Wed, 24 Sep 2025 07:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Apr75Ugi"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2F627B4FA
	for <linux-mips@vger.kernel.org>; Wed, 24 Sep 2025 07:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758699142; cv=none; b=l/wX6M1oiiyUP8IsDj50VT4nM4x/DDDnWuCovki8q/GW60+Ua5X9kRzaGFzI6ki0nVPxqUMG1LFl/i8ODRGI+0L6b3Vd//yqzt+9T05DkCzQ0a8srr28ShK4OBjZsWvy1nora2ML3PK6TybaoH0rORrAbf2moVHyFcLpirTRNFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758699142; c=relaxed/simple;
	bh=TX6kI82yO/RlICOevJbAdNu2g5LXBtW4mVT11ZayfNE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fhqzn2O8wOmyWY8QuNCyfzfLUnVEMJcTGX4osG74FbWPAYnvYaK3jHBIWX60RDvux8pnyPHyGcPM86KBQTPXjxHhpbaFzb7lyhzc6UgnIjs5XvU/etq31FYNyk4ReC2LJRlWjOCNxZm4QbY+YGQEJkU/aowDA11a3QSPTeGBU6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Apr75Ugi; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-628f29d68ecso11000562a12.3
        for <linux-mips@vger.kernel.org>; Wed, 24 Sep 2025 00:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758699138; x=1759303938; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=v9ogATJZj1jG8raAY2zUuQe4EmJHk/4W4xvGLcmqNCI=;
        b=Apr75Ugi6SUfNBAH+kYzUGDTjoRx4+4tdqorCAQPRdi6ZhXxBv0peiMsD+V4puAl/L
         VnxwZSNbl9FiKKvSAqE1eYwjqdZWh7FJCNF0dlJCMq2k1bWZYIlAjQgIervtcnAm3t8B
         GN105YKAWQyS6/Cr/MiE0AtzMIVY2JD6Cl6oo5pZJOVanYffCW03eXtoB23UbA49jJ7r
         M37tNlpRwrjn7OtFzfza/vp/LuwUFXCQHnS9le2rzn9s9XBPgWtVSKHOOn2Jak7mhDnY
         wGqCR0eC89eG87mkj1IyXNs4+n6M1Xm2c52C76N990iZ2sIOpbDuxtQDSZpysCj2x7fQ
         cVpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758699138; x=1759303938;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v9ogATJZj1jG8raAY2zUuQe4EmJHk/4W4xvGLcmqNCI=;
        b=DvrCIvrQNNq8zdQLrMoBJfrRPQsDJ+mc6niZMT5vwEIciaOf8dfeNG5K5+FFzHgzvt
         I7BwMaz1OgxTKZVdz3i7aNMngVPOTjetzah+c6fJOcmpOlYDOxaTUOJHIbtqEITPJl7g
         WnvR4u1hOEBJ8SAZdCFlPiksWGN3pO79h5Hm9cllsmKz47UuTUvGYXKO75ictJJ/zq6/
         YXWvJ+vBpNwo1u6t/9OY2278R5hKLGOa9md9vHoH640ujxdvxJG1WipPmVIo4ngq3zKR
         UiHU7mRfIssd0gerhxFQTMUfcJy1IAeZWGZPioS1omq+ahL/i//7hW+h87muqHmFxvn1
         FOyA==
X-Forwarded-Encrypted: i=1; AJvYcCXEgGs7Co2k3KtokESF2Kx0gZr/Hv9rNRoEHTt32q20GkxErt9aLDLcreZKA4WHfCbVMndSsbazW8aB@vger.kernel.org
X-Gm-Message-State: AOJu0Ywduy0ESSMt7bxxngaYrb6SPhLXp95+wkvCkPvwjPkzdMYocgyI
	RbionpI7DUqMYu7drrQfZU6oYXP2Pvm77SyX6cdeL84HOjUy6geOTm8xngh/BvD45pB0cIs5Bqk
	0yahEzBr6f7gb/8lp+lOUd4Mes6d/C54=
X-Gm-Gg: ASbGncv4BmWEChz6ReEpxe+tC3J+N8pmFvmZHTtobLV8IIwfLpMdM767cTLNXrbirNd
	gtowfZba+GNqcObhzUoh4o2FouO70ZSjsfY3es6xxAtPGWVHnrlM/ifHbrkV1f1wnuNf4U7fh7m
	9tedABNNbievSJwodjUL+Ir6mcr9bb5cuVFwHmwN51qdxq6EFXc2mIT1G0aX0yoTCKMuJ8Qae19
	wNzTy0D
X-Google-Smtp-Source: AGHT+IEsD22J4a5V9bbdMWtQv1Ep8AmuRuA2KpP+ndq9VMyD7XFtjS94kSm5rlJirOSxMvazqqoNAsq4GX/ON5RyqyA=
X-Received: by 2002:a05:6402:44dc:b0:633:4726:a077 with SMTP id
 4fb4d7f45d1cf-63467796df4mr4258422a12.15.1758699137992; Wed, 24 Sep 2025
 00:32:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1758219786.git.leon@kernel.org> <0c64474985af55b1aa934b857808068a0e609c6e.1758219787.git.leon@kernel.org>
 <CA+=Fv5Q8dVUFVBh82mAe=fy3mV6mWtQT_0pBPLQwLNBt3f8E1g@mail.gmail.com>
 <20250923171819.GM10800@unreal> <CA+=Fv5SJcQ5C4UeX2+deV9mPAe5QxrocMG8EJ2eVcYjbLE5U+A@mail.gmail.com>
 <20250923235318.GD2617119@nvidia.com>
In-Reply-To: <20250923235318.GD2617119@nvidia.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Wed, 24 Sep 2025 09:32:06 +0200
X-Gm-Features: AS18NWBrVH-9-wBlZ7ZFV3RxYYp-7iSL9DfIPq4jDzU8rxFLx7xmKKzveUA49as
Message-ID: <CA+=Fv5Tg7sQACpeG8aMZF6_E6dbRnN5ifg0aiHityXadxiHoPA@mail.gmail.com>
Subject: Re: [PATCH 1/9] alpha: Convert mapping routine to rely on physical address
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Leon Romanovsky <leon@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Geoff Levand <geoff@infradead.org>, Helge Deller <deller@gmx.de>, Ingo Molnar <mingo@redhat.com>, 
	iommu@lists.linux.dev, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Jason Wang <jasowang@redhat.com>, 
	Juergen Gross <jgross@suse.com>, linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	virtualization@lists.linux.dev, x86@kernel.org, 
	xen-devel@lists.xenproject.org
Content-Type: text/plain; charset="UTF-8"

> Suggest testing the same branch with the alpha patch reverted just to
> rule out any issue in the core code. If it reproduces suggest to
> bisect Leon's branch.
>
I can try to revert just the patch containing the alpha-specific stuff and
see what happens and then, as  you say, maybe do a bisect from there.
First I'll just try the same kernel again a few times more just to make sure
that this is really reproducible.

/Magnus

