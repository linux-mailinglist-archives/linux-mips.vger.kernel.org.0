Return-Path: <linux-mips+bounces-5120-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4787C960518
	for <lists+linux-mips@lfdr.de>; Tue, 27 Aug 2024 11:06:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 03858281153
	for <lists+linux-mips@lfdr.de>; Tue, 27 Aug 2024 09:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AC761990CF;
	Tue, 27 Aug 2024 09:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q0+YL/b/"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BDB04C92
	for <linux-mips@vger.kernel.org>; Tue, 27 Aug 2024 09:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724749579; cv=none; b=BFhkiDmSugQDQVRajAT8w16C3pcEVLOEJBLflOBB4JfJ3hc25dMjjonMFR2IC2eFXTmaT5+zrUkvp484YPBNIp52LwAA+LNhsxkBOIdD6S+AulJQELJuP2bCZigDqciYBIp19OJMOoY+9g/V+5Wry5/1z4wF+Qjol18Q3QwfPmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724749579; c=relaxed/simple;
	bh=td6TsY+x1jF2bYWtgW1QVma5ZvKvJwuhzTvVDhTcxRU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=IzWMV3DmS7fCZlazfPkrGbysuwH3hYncFrawKwDDXwDhfNAnIDNuQWxNLI7R7ExISEBk7/O4deSj0ro/VesaYVIE4WunSP6fvlhkRm5EBfGi1Fkmnm/1NvXjJXNWSZ1I8sRsjHKb8UPJE5tSchRCJ/q/3phSS5dEXahxvQ5TpLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q0+YL/b/; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3718eaf4046so3837829f8f.3
        for <linux-mips@vger.kernel.org>; Tue, 27 Aug 2024 02:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724749576; x=1725354376; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ys5q7+xt7V4u8ZvUMbFPxHX+g0yKhziPVMVNXUTaajE=;
        b=Q0+YL/b/rl5j1EuCKgYUI8/1tv7hP3ynaUFvOc6LAh2q5WZWdaUTrVCnPuqVCMYMq+
         S29T2gYKSix5SIxrO6CryQW41Ci0QM6WVoGegsHxJVF0ABvKxkNvmdUHdQriV5Hspnau
         24wrg+mqJt6J4ClbsIRvrt+h+Eh/bUdAWJWp13Ybp/CCsAcQPxOb53Qczsr4Qy8LqFoE
         ZJsrfekr1cC6qSLWHDCuIAPy/cPmNmmux9yYVjqQyYsc3BV8SzdQVJQx93xnyv16c33q
         S0KjBE4oScqKwwqaKgq8E4nBtMWdZEsx43skUVvqHD7vCmUsGe87ab3S2h7EHFRn8XJL
         /Uww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724749576; x=1725354376;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ys5q7+xt7V4u8ZvUMbFPxHX+g0yKhziPVMVNXUTaajE=;
        b=wh4pkk4caEDOt342n6/Bdd3C/B/gtCnJGg/4NTGCDq4IhZ3qiscAdoocKfKg7IMAYG
         rbx+C3CgP8C5IwH1ooenju51GeWF0s+tkIUYtYCEC4UTzXamw2jufdXJ6O8rXcaRsfij
         6ayy0Dubc8hlmehLXT3NZAeCSrLBqlWc3Mw4Wa0tPCDIEbElQUo9L9+mhUiPMu+hb4ii
         Jh5h/QmE5gGvpTnXB348lV7lhqgaV7BzEYKl36HONA9j8UGdbvL+o8kVNPl9t7XzoheJ
         QCG09npIHUKATBzT4wQLSnSeujI//kI8Vw1uiOCFRquBjlzBaGyIKBna31sdxA/6nojT
         5mtg==
X-Forwarded-Encrypted: i=1; AJvYcCW617gvAgsq7lK4pGWxBVXuV97RIzL81kUiCB/sSnRmLRjfwIBW9MDFNtJNt0DzEN1VqUtD7Rav5VeE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2xiuVsLUZ6WlNFrvqrYl3LHMLdrbo0fcDZ/W9mb88eaLOdDVn
	FI7PXxxE86cyFvw8pky4WaFdTpjnxW+9IWMsPT2bkez/u4kiJBLs5PLy6a1yyF8=
X-Google-Smtp-Source: AGHT+IE+VDn5FOe01bWlunlr3Q/efu0PB9LC4RFl5VPjT0A0kz6PEXEkfZYstnAt53OJLkCDA/f1HA==
X-Received: by 2002:adf:b311:0:b0:368:3f6a:1dea with SMTP id ffacd0b85a97d-37311840050mr9300691f8f.6.1724749575912;
        Tue, 27 Aug 2024 02:06:15 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730826a3f7sm12533503f8f.112.2024.08.27.02.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 02:06:15 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 507E15F7A2;
	Tue, 27 Aug 2024 10:06:14 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,  Marc Zyngier <maz@kernel.org>,
  Oliver Upton <oliver.upton@linux.dev>,  Tianrui Zhao
 <zhaotianrui@loongson.cn>,  Bibo Mao <maobibo@loongson.cn>,  Huacai Chen
 <chenhuacai@kernel.org>,  Michael Ellerman <mpe@ellerman.id.au>,  Anup
 Patel <anup@brainfault.org>,  Paul Walmsley <paul.walmsley@sifive.com>,
  Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,
  Christian Borntraeger <borntraeger@linux.ibm.com>,  Janosch Frank
 <frankja@linux.ibm.com>,  Claudio Imbrenda <imbrenda@linux.ibm.com>,
  kvm@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  kvmarm@lists.linux.dev,  loongarch@lists.linux.dev,
  linux-mips@vger.kernel.org,  linuxppc-dev@lists.ozlabs.org,
  kvm-riscv@lists.infradead.org,  linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org,  David Matlack <dmatlack@google.com>,
  David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v12 00/84] KVM: Stop grabbing references to PFNMAP'd pages
In-Reply-To: <20240726235234.228822-1-seanjc@google.com> (Sean
	Christopherson's message of "Fri, 26 Jul 2024 16:51:09 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
Date: Tue, 27 Aug 2024 10:06:14 +0100
Message-ID: <875xrme3nd.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sean Christopherson <seanjc@google.com> writes:

> arm64 folks, the first two patches are bug fixes, but I have very low
> confidence that they are correct and/or desirable.  If they are more or
> less correct, I can post them separately if that'd make life easier.  I
> included them here to avoid conflicts, and because I'm pretty sure how
> KVM deals with MTE tags vs. dirty logging will impact what APIs KVM needs
> to provide to arch code.
>
> On to the series...  The TL;DR is that I would like to get input on two
> things:
>
>  1. Marking folios dirty/accessed only on the intial stage-2 page fault
>  2. The new APIs for faulting, prefetching, and doing "lookups" on
>  pfns

I've finally managed to get virtio-vulkan working on my Arm64 devbox
with an AMD graphics card plugged into the PCI. I'm confident that the
graphics path is using the discrete card memory (as it has been mapped
as device memory with alignment handlers to deal with the broken Altra
PCI). However aside from running graphics workloads in KVM guests is
their anything else I can check to see things are behaving as expected?

The predecessor series did break launching some KVM guests on my x86
system but with this series launching guests works fine and I haven't
noticed any weirdness.

So for those caveats you can certainly have a:

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

However if there is anything else I can do to further stress test this
code do let me know.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

