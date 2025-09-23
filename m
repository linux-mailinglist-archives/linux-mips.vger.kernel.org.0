Return-Path: <linux-mips+bounces-11546-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75379B975C0
	for <lists+linux-mips@lfdr.de>; Tue, 23 Sep 2025 21:34:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B2087AC6CB
	for <lists+linux-mips@lfdr.de>; Tue, 23 Sep 2025 19:33:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6A1432F9C37;
	Tue, 23 Sep 2025 19:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7zlwdJK"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FE52749C1
	for <linux-mips@vger.kernel.org>; Tue, 23 Sep 2025 19:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758656087; cv=none; b=rwSwgAVnPXQmNS3D9oPlkZweNPvxZaCt5xFrcU7CjB8tz1Fox2mCGf7Iww9f9qeG6iM3d4rYxgeT/BqUMDArCkvqgCR/z5zon1gMLYjooqej7aiM46mHR3HlGmYoVM1YuGSHBnKloXmUkjpOpxFlk1bTYnZP6LnjdvfMjVyE2H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758656087; c=relaxed/simple;
	bh=etBe5tS4/ktbP7b91h5lJ7bLsJwtJz9vOdnnm/WxrFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t4biNB5v3U7k657KXxKvrUOO0EirltqFAB+jT2KOifsoE/qNxDHqN1bOIWiOWvCLl9pd/aniqEXQW2fbypndnW/iZj+iCUqBF5b3pm77grsBZc0tkc4Yfy8bob6IVCGe85YuNc1SxVgsSEODa/g8JLHlRNj74AJzPZ5SKtULbIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7zlwdJK; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-62fbc90e6f6so8101347a12.3
        for <linux-mips@vger.kernel.org>; Tue, 23 Sep 2025 12:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758656084; x=1759260884; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=++d3dqdiBWxrOtz0QgpiS/0g7+oJyTqlQjLbyxgEnJo=;
        b=Q7zlwdJKOFVQ35H1u8s9lJj61jP5zlM9rstQNUpA/6OCc4YUs4foQZifw22Ss2zIJH
         mLuMMgFTfxfBNTMCXww4KCYg10jUxiSDAi1vEQPP8F2J2Z6KpVOzyFs6MajRi8KW2MZh
         4IpTt1xArA2pUydObD5cOJdjKiTlLO3IhkfGRm2xe3CcnX8hURoUvXQpcT6hwwsQl1g2
         4psAI292mpb7VGAmBnbe/oIhi70ZQfcx2ewK08iKhJ8azq0ikTQ/NPNfvjOxTZy747ZQ
         e8wHJ+O3dotl2vx3OohfYOhwvqX6n9uTBS5LrBlCH93Q+JzO4rilOIrzr77osSnkmnKy
         WmUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758656084; x=1759260884;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=++d3dqdiBWxrOtz0QgpiS/0g7+oJyTqlQjLbyxgEnJo=;
        b=SLgy66zBIfJaaUdNXRxmDcBYQNs01eqjN1OmECqEJVWKVmsaA4DRUQzW2fSzNkKkca
         3mSJg2kAL6quBMJvRScdhTIPu54VqMyASQzOY1q9zyPhLv1EEU8oUGQwhiSdxMNdqSmW
         nBa6R9TDSpIPQSGavI7IQOvUFlCtKs9nx1S7z36cWbfFz+BTu0CE+D3a55WH4lDKgh+w
         yyWhR367Oo7F5ChKBsUiEvuzfsjH5StxOSr3dMSTSTwXT5TAiyofEePqPH7cQlBIGEG0
         E2TSI5kElAlPyWJJweLiCEA/9GoT5p5jB2iSsGCXYVmUHZQOmIL61STIEhGvc4kBRHmN
         6R4g==
X-Forwarded-Encrypted: i=1; AJvYcCX95umBSO2eu6xZNhJfzf0Hw9EybFO54zC4HoJ1qPI/42tnKlFG1CQFhFZNZL7OtHYfRxCbFN+gp/2w@vger.kernel.org
X-Gm-Message-State: AOJu0YwtImg4fs2mz3k/FaQ1rIUr5iWEk+qaLxDJSZzOft/VWYtsrYQq
	gHFO/hCvamfdbvcNC2W66ygfcdoqC06fExrb/MOD3s0/1O5kxA/v5Nf0Kj5uridkWUmRv+T0/FY
	Ptvytp+P+p1gisjJcHR4FOlyt803Zy0k=
X-Gm-Gg: ASbGnct7tnYsXQshHFC8e5em279e1FLQmSKMHIqWgSE9Os54jVSaiKnqZooNKqHB4Hl
	oBsv2KHj3oqMaEf8ZIv9Gg0LL8L96sI2dkXQM5xl5vIOyopa5weaGOkMG8ZdB6vp8rGW3XPa7xm
	V9BTfLieLdwYk8hLxHnepD4Hp3TRstldwDdaBG0bFS+v+pxd/wbap2m0pokWYd2PKBmFjFSPU95
	QCMQMO+
X-Google-Smtp-Source: AGHT+IG+y6U2HPtJWiJ06zINgKFsCV3h5cNmzOdYimKubd6x0uYI1nvJ7cf5K8syyZNEK08ri4tKiPSTOpp4XlvA7nY=
X-Received: by 2002:a05:6402:520a:b0:633:8c43:eff8 with SMTP id
 4fb4d7f45d1cf-63467a15e4cmr3129540a12.36.1758656083579; Tue, 23 Sep 2025
 12:34:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1758219786.git.leon@kernel.org> <0c64474985af55b1aa934b857808068a0e609c6e.1758219787.git.leon@kernel.org>
 <CA+=Fv5Q8dVUFVBh82mAe=fy3mV6mWtQT_0pBPLQwLNBt3f8E1g@mail.gmail.com> <20250923171819.GM10800@unreal>
In-Reply-To: <20250923171819.GM10800@unreal>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Tue, 23 Sep 2025 21:34:31 +0200
X-Gm-Features: AS18NWB41C3D5JsYFHuNFW-M81tws8xiK0mHlB-cBnQqvONalyjABahoz4jqIPg
Message-ID: <CA+=Fv5SJcQ5C4UeX2+deV9mPAe5QxrocMG8EJ2eVcYjbLE5U+A@mail.gmail.com>
Subject: Re: [PATCH 1/9] alpha: Convert mapping routine to rely on physical address
To: Leon Romanovsky <leon@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Jason Gunthorpe <jgg@nvidia.com>, 
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

>
> I will try to setup Alpha architecture in QEMU in following days, but
> would like to ask first. Did you test alpha on clean v6.17-rc5 (without
> my patches) as a reference?
>
I'm running now on a fresh git pull from today so it's more like a
6.17-rc7. So no problems running the latest git at least.  I can
dig deeper into this to see if we can figure this one out. First
of all, is this alpha specific?

Regards

Magnus

