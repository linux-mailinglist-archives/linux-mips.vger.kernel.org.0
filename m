Return-Path: <linux-mips+bounces-4644-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6459A944732
	for <lists+linux-mips@lfdr.de>; Thu,  1 Aug 2024 10:57:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9634F1C22044
	for <lists+linux-mips@lfdr.de>; Thu,  1 Aug 2024 08:57:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FC0716E884;
	Thu,  1 Aug 2024 08:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HLluQB1y"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F3A16EB71
	for <linux-mips@vger.kernel.org>; Thu,  1 Aug 2024 08:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722502652; cv=none; b=RdEBXiZ2HsuJLOpHbkXLOVzzPGo2RLFGbgSstULn7gzIbI99MWmZOBURP6IsYrpqIsHCL7knL1MRETQN6WI3xRXg/sTeDSypwDTGg+2QCh3sy6VDEcxkvyXm68dNWnlXrdnT91A2wTwiZ9wEzeVzr/6uYjrspa47gZVYVyJusZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722502652; c=relaxed/simple;
	bh=JtRBSdBvaqBsQtNVvhstlkMyWmalBV9Q7J8Cb3IfAjw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Uwnf2sYySwPTiOqhgoHZfeFh1aTe5pbiJ4fXMe2md9nd46Dqg6HXOPhqg3rwgvya/1dNC+k/9uhcpl/y4GXneh8KKehNurDWYFxKtQCK3x2jrkNfE4svjlIYa1pNMrr3QiDNFqCPo+AniP/shThYVpef5m0mIyMRf3RbE1x+J2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HLluQB1y; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a7a83a968ddso942897366b.0
        for <linux-mips@vger.kernel.org>; Thu, 01 Aug 2024 01:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722502649; x=1723107449; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Syi3zSlJ8k1vqxBzUq6nZD+avtMgHQU+/NZ7B5gDmQ4=;
        b=HLluQB1yEDz5YjrqGn3CbV5T6LoGT61JO9LW6usM7k8ZL1wb1X0Jw47YEHur/NJx2Q
         HGCHnWf0Vn32449k3dQah72KnXB+GqO3IkHf8hZSEcr0r/u+AHMaEbj1FBRx/HwPd/lo
         Vqt1wEVh44XyBihgQDXMm3b7+D3w78KpK4SxsLsly5xhZMOIuhfNwH9gb64nGyaHEsVh
         KGGyfQtANKUJWcATdRcK2g93ocJL2eD+YTa80l3Uj3IMSL3IpjPRLZiUhyYo+8EbnRdI
         h7AmHv80Zoa4/Z3SeyMUbjhm8RXP7DvzwElnQRQkfAA+gBHG+aFeeIkl5eRaTbRgQFgs
         v3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722502649; x=1723107449;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Syi3zSlJ8k1vqxBzUq6nZD+avtMgHQU+/NZ7B5gDmQ4=;
        b=ix98mPZ6XcEPLh1xWPc1tipm1zHNA/akRm5VrbaQfsGyO3HNoL/TArUQcMTmLnW/zj
         3dkilFJpuBG521eni0GAE1JhLw3s8rLsZkr85OxEPwww8Dx16UOafkZSVODBIhcmS5yw
         EhrDDxBJ1QvZKoUPJqkf22SW33/R60HNnpq4eFiRD3/43AtcUmsH/m2aWyvyOYPV89Hq
         k0sfn1H85hmSDMQ2DJqhmvoaSLOiYPJLd/K9VO1XfF91gdjEjYokSGeFTWpGdNLp5z4W
         L7DnyqITWeVFGPlDLEYzRqQSvsRutV5QwgMAi/umg4zsZUl7Vgba/Sj/8jGjnqogPW71
         XXHw==
X-Forwarded-Encrypted: i=1; AJvYcCVZLbme4yHw2RvSek0TmCeLHteoqdnIRpbsfqnBgmEbudAR4uP5KiTXIY7dMUHXcT+t3dnrvQPlsG8vkl1tMBAugcWAMl4kfMkZUw==
X-Gm-Message-State: AOJu0YzHx/iW0vh5A7N6OEf3Rfw9Q5qC4QtSIq/PHyr0Fafo/lWAkdsW
	TcqucOP+n2cbNz4fwXrHC5tG0rnKJmH6V76v+0/cwABAzuKhqF5ztUpgXfNUFIo=
X-Google-Smtp-Source: AGHT+IEdS3NM6t6Y7T/95sEL4C7ubpn/6F0Cu3mCtANczyd9mmWSLE4tcyyhWaOoIZKPq4CsXdarWQ==
X-Received: by 2002:a17:907:6d0e:b0:a75:1069:5b94 with SMTP id a640c23a62f3a-a7daf535320mr136914966b.21.1722502647807;
        Thu, 01 Aug 2024 01:57:27 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acadb82d5sm865337466b.199.2024.08.01.01.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 01:57:27 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 3FE7E5F80C;
	Thu,  1 Aug 2024 09:57:26 +0100 (BST)
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
Subject: Re: [PATCH v12 03/84] KVM: Drop KVM_ERR_PTR_BAD_PAGE and instead
 return NULL to indicate an error
In-Reply-To: <20240726235234.228822-4-seanjc@google.com> (Sean
	Christopherson's message of "Fri, 26 Jul 2024 16:51:12 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-4-seanjc@google.com>
Date: Thu, 01 Aug 2024 09:57:26 +0100
Message-ID: <875xskfwnd.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sean Christopherson <seanjc@google.com> writes:

> Remove KVM_ERR_PTR_BAD_PAGE and instead return NULL, as "bad page" is just
> a leftover bit of weirdness from days of old when KVM stuffed a "bad" page
> into the guest instead of actually handling missing pages.  See commit
> cea7bb21280e ("KVM: MMU: Make gfn_to_page() always safe").
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

