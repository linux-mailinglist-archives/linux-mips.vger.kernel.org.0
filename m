Return-Path: <linux-mips+bounces-11566-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 268CBBA6FDC
	for <lists+linux-mips@lfdr.de>; Sun, 28 Sep 2025 13:27:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B123F7ADCD5
	for <lists+linux-mips@lfdr.de>; Sun, 28 Sep 2025 11:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A16B32DA742;
	Sun, 28 Sep 2025 11:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HD7rLhiy"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE1A2DAFA3
	for <linux-mips@vger.kernel.org>; Sun, 28 Sep 2025 11:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759058847; cv=none; b=nUqBTX9HQlZenlyO5fNoOdxg95jpAP2JmFTos+3IwAS88FycRewTFCBnU/il1iuXRAPzgIhqa0HEN1sWAYjOzcb/lzFVBeVhDjM+d6UMWK1w/H+a6skAkrfOJmoyCBQQBG6VEuNhwvwepHMA5+kubyXPV7ovntnmK5Bk3IGDmoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759058847; c=relaxed/simple;
	bh=XnTsRVx2LKHSGCofdfP8cBisj0hnUGCd3CLwMZjXxX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SOvlkBjqU5Na0jlkDcvJxhl6aK1V5ModwyNcEjSKkGT/USbavC1rNN/huBUS7eNiCXYcAHUjwmD56lujfrkdPqICTMiKkKKP/gkKwMVRVhM1DfM5hDBzROBcF3vm0++ZdQKkdnlLrX76EBZpF6GZSqjS/f/FtxZMaeJ+MME3Rbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HD7rLhiy; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-62fca216e4aso8115837a12.0
        for <linux-mips@vger.kernel.org>; Sun, 28 Sep 2025 04:27:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759058844; x=1759663644; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XnTsRVx2LKHSGCofdfP8cBisj0hnUGCd3CLwMZjXxX8=;
        b=HD7rLhiyBlSDxVwrCkE0xPoKFjzZNj7YqOGmlz/JOCZQx38qd184OxbDZ63s93e5C7
         9HoOlO2hmGrRDbT/G/IEAidchn9KOnXBA3qs5Jlbu1oJFDzIhTdy7ucZsvNqeluKhvp9
         BXwHdRREnX5s2HRYUuH2iOaaK7r/Zms/sSRqlqOuI+EMjXEdOSQ1xBsUwtACyjlb6yVa
         LeG+JsjjBs8kkW4W87KZXgfF8H1hcjvOtQZOZll1D8rWfUNNc73GgspfsdX0mO6rwtBu
         JmsNO7Zkn27XyoutBK7KD7/eQMtp7A8vYCEizbGZ0TLWQPEP4lwcr7GFbqVJFX4QDSmK
         WhtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759058844; x=1759663644;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XnTsRVx2LKHSGCofdfP8cBisj0hnUGCd3CLwMZjXxX8=;
        b=XFPRboMi8DY5DRFYfAg+kfAO6kqjnhSzJ3AA8gTwNRu4Z3wHKd7TYmaNEb/xmM4SS2
         PZ8V2M3U8JnHCdvdOFqwZxYkCqURnKdrQtPbb+T8IqbbBsEeNoQiuw6uAmG1W4sRll7S
         78bCBJuhRVe91ujX+TX9y6+cNm2k6j7Xdts7kpR8tkIKLN160zYQP1BcwkVyFQivljNJ
         77pYqXW6hVhEgScGH9JsN3/oLMqK+dtOKtPnScg2a2FhbVo4Tg+SFhhPj5hLOXzljrPG
         JWkJGy2AYunVWgu7UCn/h8McoN87FllPIZTWD91Uysb9h/oypD42+uHp7P6ggfXmKpcI
         dr9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXYah3UpBwZP0nzsIV2TBh4iME+yTScVOiuEnMIvktGF0qgociQLn8V9v3n5jIOIjEqoe8JNBbfsRdI@vger.kernel.org
X-Gm-Message-State: AOJu0YzsU83h8HBSTYe0xaHUrq1dV8mAGbrtzehMeb25fz3MQo5buZ/B
	3ptYqK2Ro6A3hY7c7gHcwimY/WjzZ8UR57qaY8qoc3tkSFIqbZApE5TUdHL0qB/CgGfnI3LLqfW
	qQoGrN8KJRMHnp9KRjgeWoJIjgnyrxDI=
X-Gm-Gg: ASbGncuZW4GAK11jjvx8Ud0i8nvUqK7byfFxAAtbwKVcGWbpkOm+bhbRMSZPtkzRSXH
	pUvZ0MmZbjF/COfnM0dXm/UW6mJSETnQBjBoVdDkiRlqALghaWHZu1Ckg0++m0aUtszLt9KtKgQ
	sFvKxswWr5cFw7L5twTd7kHXWZDEX20YfBnfMPGGjDec34SABc998xFy8uXoKoE1D4W6YnXnmcJ
	yGFPSF1IQr4tTYa/Ws=
X-Google-Smtp-Source: AGHT+IEbmR6jFZWeOZACTqVTuyroT1qollOj9im3bB2gCUN08/YU89k9vFmzDRRbDuqGeOLmGGtFiulh5CESx8Sm0EE=
X-Received: by 2002:a05:6402:44ce:b0:633:ddd4:4e37 with SMTP id
 4fb4d7f45d1cf-634a331587amr9387899a12.13.1759058843815; Sun, 28 Sep 2025
 04:27:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1758219786.git.leon@kernel.org> <0c64474985af55b1aa934b857808068a0e609c6e.1758219787.git.leon@kernel.org>
 <CA+=Fv5Q8dVUFVBh82mAe=fy3mV6mWtQT_0pBPLQwLNBt3f8E1g@mail.gmail.com>
 <20250923171819.GM10800@unreal> <CA+=Fv5SJcQ5C4UeX2+deV9mPAe5QxrocMG8EJ2eVcYjbLE5U+A@mail.gmail.com>
 <20250923235318.GD2617119@nvidia.com> <CA+=Fv5Tg7sQACpeG8aMZF6_E6dbRnN5ifg0aiHityXadxiHoPA@mail.gmail.com>
 <CA+=Fv5Sze_BNmHqzypmCh8p2JO6gytXH4E6hXv3gZdfoSJsMUQ@mail.gmail.com>
 <CA+=Fv5TF+RTPEkQEmVd0_=B9xbqKycLz3ck3UwcPDqacezYfFQ@mail.gmail.com> <20250928105413.GE12165@unreal>
In-Reply-To: <20250928105413.GE12165@unreal>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 28 Sep 2025 13:27:12 +0200
X-Gm-Features: AS18NWDQy06zFzFA0Tb4sMvL6G-ftUfrOQ8ZIU-yy9wPAEd2O_xZFFnSMKmSHdI
Message-ID: <CA+=Fv5Rnk5RaGU9R_65izNOJOns9w_eEzetH9kBF_MaRgdhLAA@mail.gmail.com>
Subject: Re: [PATCH 1/9] alpha: Convert mapping routine to rely on physical address
To: Leon Romanovsky <leon@kernel.org>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
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

> Thanks for the effort.
>
> Can you please check the following change instead of reverting the patches?
>

No problem, happy to assist. I think this did the trick! preliminary
testing shows
that this now works on alpha! I guess the offset information in paddr was lost
by doing "paddr &= PAGE_MASK" before retrieving the offset, well spotted!

I'll keep running the system with some load to make sure there is nothing else
we haven't spotted yet, but so far so good. I'll keep you posted.

Will you be putting out a v2 of this patchset with these updates?

Regards

Magnus Lindholm

