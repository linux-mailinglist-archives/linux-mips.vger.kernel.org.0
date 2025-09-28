Return-Path: <linux-mips+bounces-11564-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5C5BA6F03
	for <lists+linux-mips@lfdr.de>; Sun, 28 Sep 2025 12:24:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22F0B3A67AA
	for <lists+linux-mips@lfdr.de>; Sun, 28 Sep 2025 10:24:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B67742DD5F3;
	Sun, 28 Sep 2025 10:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D/XX24QA"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D7C2DCBF3
	for <linux-mips@vger.kernel.org>; Sun, 28 Sep 2025 10:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759055044; cv=none; b=Op/6jM5IpD3PgMqnogkw38ZFCGXQois07xI96DIIbEs73I6SfI5/wCNZYQ1WRYxfI5EH5SJD22xS7hNYaiMIaAn2jlfkuQj6kK5+9mxtMge72zPJqAdnkxuu6ux9O0F+psk5Mn6pT1x4ylHD+GiFfx7/6P2JNWFX6XcPYYZSGY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759055044; c=relaxed/simple;
	bh=D6IUpv1N1uqZnzwjcSW/CDPKsLpnOn0CcSzXGCV/+/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dROfxzNV3xnDIkWcbgx7vtb74+XIixR8w92F2RnkCqplTsK0qh48MjhPNhI3gG50+d2rthcJNzMjn0gGwBvGUcyt9Glf8sT9YOt/JPAeu0QIuAAn7b2aAi2pv8FqgTnt0CnrVVHgffXYXR3u1dDX0EGPdgspipqoIsCIbrsCTfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D/XX24QA; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-631787faf35so7349494a12.3
        for <linux-mips@vger.kernel.org>; Sun, 28 Sep 2025 03:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759055040; x=1759659840; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LcChJkbyyCyxxnYoZ0h2dgScTYQu8ypUACGdGHRDEY8=;
        b=D/XX24QARRVg99CyYmaO9aZB29n9O+hNxVas7M+YzXr5W7iyod8yNdTxpmyrKOV4SX
         DIfaJZoYKVQ9KEXkBdz5AID/d9kdtcD7ndQNhTpu2Xk59V2jhcI3OpiXANWBXkrz+eQA
         r8DCz+sL0/yp3fEIavbG55VbvrNwtgV74aMrTXJ0BsTwNp+PDCQLEAgygdChwzwpWktJ
         /x2euhGfuhI02XnIa6MLzSDchc8s3K0CZl1Uo7vNt9Bbnj4MhMEaBsWCOGFnjkpTYuZF
         AWMV6ZS36p5oLtbP9Leu83seM5pLLPG5rjgV/nKptnplpwcVzIdTjn9sAsWDQ/reRqYF
         5Dyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759055040; x=1759659840;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LcChJkbyyCyxxnYoZ0h2dgScTYQu8ypUACGdGHRDEY8=;
        b=rWsR+vOXUfjmXiTfrtN3IbleAPmx9UB16Ug8U7zMQffZByUkBnPW3yIgE88gFjg883
         /jYzW9F6p8tOPWfoJaHbfZgB7JdJtm5kzXNfXSNx2sm/42zda3vkxd3jrelOPANI/bgz
         v1FdgVF1OxXSc6GjtMfnbPj2nKkX870qd4tQEfmV6nm1hwUy1TtMrOKnCh/XMOnIi8/d
         L3hFvBbG0fK3/HJ/994Xk7pYvZoG/FED4Dq3OQYPyaSD2LoXErxSM82aOvR9nXEZPqXX
         SXrUCwjB7EmWNOPdl+hCGPhO6ILoxgjDvro4hlHPouSpov9b/jCy4SuZvZwoKzUNcwC2
         pAqg==
X-Forwarded-Encrypted: i=1; AJvYcCWajrI2WnYCYItrCxIMvumEN+7vgiWqVgmhHJfhhASTVBCanAKbH4glNc3otrMtPdPQnN6UxGRT0hJc@vger.kernel.org
X-Gm-Message-State: AOJu0YzzdqCRWpi0gfRiCFKbAqidlnuou6rLlSxBW8/3WDMWzA86EVmM
	cf7BBHfnPsSVzJux5/gEgBicMwHtFBt2WbOmkS1/0P5AUDqWVF6F1jVuhyk+soXAjHNfMrobYfv
	guXeEZqDvxvJe9S40nFUazHYCksANH4A=
X-Gm-Gg: ASbGncsFSrJlFt8tQMyQntxj0qT6d6k3eIU36//nvJsL8dsfHYz3TSWYWu0zAW5L/Id
	5wNffOWnHmUibkVOKOUT0eLfr4qo6XzwOgfqPx8hp17AkGZJCopMDplpEhF07YX8vPOz1ILCe49
	Qe9xaYQkmTaO4rNQVxQ88v8FMpdEYmHVfGeyUff1732omGWBruHddqU/TtSGy0DKKrdGxm1YUBW
	EexZ+5v
X-Google-Smtp-Source: AGHT+IGAq0LbOWTh24q9bLB+mXJC5ix6EL+ilnN7HstffL1oa4ImYTxpRTBcFvmhE8oxPjiGws6tJF6LzW8U7U3nO24=
X-Received: by 2002:a05:6402:606:b0:633:8337:da95 with SMTP id
 4fb4d7f45d1cf-6349fa9f661mr8379897a12.38.1759055040002; Sun, 28 Sep 2025
 03:24:00 -0700 (PDT)
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
In-Reply-To: <CA+=Fv5Sze_BNmHqzypmCh8p2JO6gytXH4E6hXv3gZdfoSJsMUQ@mail.gmail.com>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 28 Sep 2025 12:23:48 +0200
X-Gm-Features: AS18NWC4Nb9W4XCpYP_OV5Q9pNZrLenXw3hzv9kO6uALa6_OupoUAOrEskTs214
Message-ID: <CA+=Fv5TF+RTPEkQEmVd0_=B9xbqKycLz3ck3UwcPDqacezYfFQ@mail.gmail.com>
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

> After reverting the above commits, I'm able to build a working kernel,
> that is, no filesystem corruption occurs. I'll take a closer look at this
> after the weekend.
>

Short update,  It is enough to revert the following commits, in order to
have a working kernel on alpha:

e78a9d72517a88faa6f16dab4d1c6f966ed378ae
(dma-mapping: remove unused map_page callback)

d459e3b80ad1c81bf596d63d2e3347cf8c7bb0d9
(alpha: Convert mapping routine to rely on physical address)


/Magnus

