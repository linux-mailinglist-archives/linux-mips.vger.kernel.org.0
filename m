Return-Path: <linux-mips+bounces-4676-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 100BB945CBD
	for <lists+linux-mips@lfdr.de>; Fri,  2 Aug 2024 13:03:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEA77285797
	for <lists+linux-mips@lfdr.de>; Fri,  2 Aug 2024 11:03:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7E5F1E210B;
	Fri,  2 Aug 2024 11:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gYn7FH84"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAAA1DF67B
	for <linux-mips@vger.kernel.org>; Fri,  2 Aug 2024 11:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722596597; cv=none; b=RsP0vfNqDYE5IlObpDX6/zK95gpKipsTTzVX+GJQZr7/xigSvXjDs6kP3MpnIrazI1yPFnQRTDCuG59WHx2QuWtzSTt9HhaL1WthcJ+fVha+d3emamQ2QOyjHgxpSwcCE95AlKDxIRYdLvh7tV2bffxF3s/hQgdw3e32L/kNkg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722596597; c=relaxed/simple;
	bh=f7XccJFQ+QycCZFwHexROwL6oGOM5nxC8z9cehuDsO8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=j6hKqK6Xn6Pdg68VUtS42Jo4yZOlSX7k7i5nTjp/G62Zjhss4D6Bxv8ovLEfpjfpJp6StrSK2pZBY0VsFZD/YRYmN8m+n/MZD/s9kiW91I3OunDzi95TR0h+U2GikxvjZwZYLp6D8rggZlxy5W+VHmIpW8zhC0VNN6kRRbLuj68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gYn7FH84; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a7abe5aa9d5so912059566b.1
        for <linux-mips@vger.kernel.org>; Fri, 02 Aug 2024 04:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722596593; x=1723201393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f7XccJFQ+QycCZFwHexROwL6oGOM5nxC8z9cehuDsO8=;
        b=gYn7FH843NJAf4QDXl8odZop6k2I5+dh+FqYxirPuCKtEz4R0FxPXoaYfipO8vpst2
         MXmDeZ3fKtc88eSGc33VW25WevG+7/u7PNIJjgFQc3CLhspa1y/kl75Vl4NHBIp3JNWe
         U24wKf9Km5OCrQE13K1FBuAZOVd/xPdAksG+QA+gg3c/d8SeDda/WVTIO59qeChyFfAN
         OwtFzfj0o6fzHBTEzecDPlmO1J0YsOMvTINTpPPP3Lt2UpZuebsd6Ckzj3dpRYPG4o2e
         mErnONmBKNV79TB5IWueRsD0TQTZcO8j/FsVSOaxDMD3teaqIJaDuF0Ajyyb7OE/a6mv
         T0qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722596593; x=1723201393;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f7XccJFQ+QycCZFwHexROwL6oGOM5nxC8z9cehuDsO8=;
        b=CV405T7Rf+RnzpbMB4Uex75+JzI3HxyMxqUxPh/pN/kxIu+iYljPqPBnM1WKYOiTex
         af/vnPTPsAFmMwMQfjnXkagBYPTEgqHJxkxl+8gxthGWePD/4bX0fyht5AwL2nhQ6UqG
         UboZowknJA+R/1cyZumHWqJ9R3s2uEerCPZiMjBtIiJTr1rCd6LgjhhPOvtGEGH2Ptzo
         TQUlxkro0wZrqiX3tflT+NyywibuDnj4kQ7u920I+7PX/F1VBK71eUCCydOhopZyIx8U
         Eldl7jEpQbTvvnXqWw5PGWR/Pt7sYXEPf42jb2NkBR8ltbe5z3b2shAlyO4QLo0WigJG
         VOgw==
X-Forwarded-Encrypted: i=1; AJvYcCXgosdL7AdjQ+DNAUiHdyrm6XgMEfoG/HXXnbkmHV34ipHTylUALkOUQq+k0X1OPBy2A5cmTZ1WBi6SNK32eH9JkSzUnFPtAvD90Q==
X-Gm-Message-State: AOJu0YyB1HuwIE4BxPvX13j0IzYCziLszzKwAgU6P9iM4U7HHoC9inUL
	MuKohAGLKUsS1rM8IwzAu51eN+pkh9a8XtNLzh71A1WYyc/JtNOKlk5hIUmcSHk=
X-Google-Smtp-Source: AGHT+IFGQonexgpZjGUwl51oIYY4w2W/jqJ1zQyOCpk3kJFGs8T5j8dynyIwmzMmmRUPMHGi6NWZlQ==
X-Received: by 2002:a17:907:7f24:b0:a7d:a29e:5c41 with SMTP id a640c23a62f3a-a7dc5029a1dmr251865166b.40.1722596592689;
        Fri, 02 Aug 2024 04:03:12 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9e8676fsm84603966b.164.2024.08.02.04.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Aug 2024 04:03:12 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 24FEC5F8A9;
	Fri,  2 Aug 2024 12:03:11 +0100 (BST)
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
Subject: Re: [PATCH v12 83/84] KVM: Drop APIs that manipulate "struct page"
 via pfns
In-Reply-To: <20240726235234.228822-84-seanjc@google.com> (Sean
	Christopherson's message of "Fri, 26 Jul 2024 16:52:32 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-84-seanjc@google.com>
Date: Fri, 02 Aug 2024 12:03:11 +0100
Message-ID: <87jzgzchlc.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sean Christopherson <seanjc@google.com> writes:

> Remove all kvm_{release,set}_pfn_*() APIs not that all users are gone.

now?

Otherwise:

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

