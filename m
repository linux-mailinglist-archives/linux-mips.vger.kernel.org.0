Return-Path: <linux-mips+bounces-4645-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFB2944766
	for <lists+linux-mips@lfdr.de>; Thu,  1 Aug 2024 11:03:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 919561F242AF
	for <lists+linux-mips@lfdr.de>; Thu,  1 Aug 2024 09:03:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C3C216DC35;
	Thu,  1 Aug 2024 09:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AA/7Jpg7"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8851915884A
	for <linux-mips@vger.kernel.org>; Thu,  1 Aug 2024 09:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722503025; cv=none; b=MosFI4Q6B4vssGhH+Hz83Mfs9xSasY8MM4CffpjvyeFnSUvy2aJc/DQxzt7S3GBsywQZqaCn+9PJJXKPXbft0kdtvcHGpisTan9hM6J/UiMgv6G+ALVvHm4m9KFEDLlyPxf07vUSIH6nT+7rjM73aIu4zpWGHPKT22zjtztlb/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722503025; c=relaxed/simple;
	bh=M/Nhi0sMK7PpCm2r/uuIU8M4tCHIO/lVeQuknqZEy3M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ndVKETzX6ACeynzA7ZJdHSidFL1iQOUvkuCy9h6PMOZYhjz0CIEEeiB3gPRghviMkDtWCdt8uRGV4hhu/H/PqjKOsDXc3BhKlwGry26IVKzd98KDr7NoisVcIMD4Z6obA87+cbCD+MlqGUEZ05bp7tz+JrWoar6zlzDzTZfN8VM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AA/7Jpg7; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-a7d26c2297eso823959166b.2
        for <linux-mips@vger.kernel.org>; Thu, 01 Aug 2024 02:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722503022; x=1723107822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M/Nhi0sMK7PpCm2r/uuIU8M4tCHIO/lVeQuknqZEy3M=;
        b=AA/7Jpg7Eyh9xM4Ws6hOxh9v4pi+myeEW6A5cmrv5nm48/aJZRbogzmi5+vDkzzUU7
         EpHfmeF7d99ZjuhX5IqF4iiSMu+nEzyI9Evpi3EVCmQFnC2/S+wKAYcFMnK1E+8z/KB9
         9Sv7VISV/u6Oruy3/fPi9DCmRx0yyEEGYwuRNy0Vkumll/tk1qZ7MXzXhoCyRXfaJMh9
         shnGnJz8y6bDNGi37VjHrwc47+ufVhnp026eeiH6735Ow3zx61mzMoCkqGE5A9JT90oj
         y7Up8Bepvxixct3MY7N6xcO5owDrEhbX03Px7Y2cWZOGOtT6ELjSbmtADbA9ldCFlgOx
         Sk0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722503022; x=1723107822;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M/Nhi0sMK7PpCm2r/uuIU8M4tCHIO/lVeQuknqZEy3M=;
        b=YNoOjLonRKRhwJ6UKRKO4GTQCYUklSGxSTvClE3Kl/Eg97UzWc0HEDGuVcuS/nHEvZ
         SdgDAxv9RWRQjFOA8oJ9P/DBT+ilKiTIXHuYm6U0XPMQcUdc8c7Vl5yJUeUdHF3l/wZ+
         RohOrCo73dMFegKMGHHMuMpKh+qcCSVBRccyDkkiF2k1xLeaAA1Kr6G6j7vqV4XbfJrD
         zJisM++HWNqw3WiLvzTPo/2s5zRD4PuUe2FXO+RVw58h8uDFsth3gGB+D7/dFUiZATIj
         xPucPAfi1jkw402/k/y6PLa5jRPIfEgbvO4pc5tQ6pultX4SPu+S6KV8jTBnRAOfcnDx
         zAQw==
X-Forwarded-Encrypted: i=1; AJvYcCVpLmJ6XIx1iwfgORyBDMve2/5m8Jc+DHXiI5HcKHBEEqYdPijEsN4x29sfzsNGD3L6gc5neQjoEdxznB1Gs7iayuwWShQ2WnFnDA==
X-Gm-Message-State: AOJu0Yyjz98FNg7behRZlEZjW45ZypehuQb9e2M4njcRk8ccpv7pDqhU
	4u/HSXEUvoNJunGfDmlJ4+EaYJgxV0+QTY7XNNWW6kTs30gruYBMwc8zUuouFfc=
X-Google-Smtp-Source: AGHT+IHhni1Uh+bJITVWfhi2vAVjvXUzKzH/nw0taqtk6cxicA1yt55vq2KJXrilVInru0VfNsUVMQ==
X-Received: by 2002:a17:907:a4c:b0:a77:c199:9d01 with SMTP id a640c23a62f3a-a7daf4c7df7mr132037366b.22.1722503021389;
        Thu, 01 Aug 2024 02:03:41 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad902e2sm878292566b.146.2024.08.01.02.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 02:03:39 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 36EF35F80C;
	Thu,  1 Aug 2024 10:03:38 +0100 (BST)
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
Subject: Re: [PATCH v12 04/84] KVM: Allow calling
 kvm_release_page_{clean,dirty}() on a NULL page pointer
In-Reply-To: <20240726235234.228822-5-seanjc@google.com> (Sean
	Christopherson's message of "Fri, 26 Jul 2024 16:51:13 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-5-seanjc@google.com>
Date: Thu, 01 Aug 2024 10:03:38 +0100
Message-ID: <871q38fwd1.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sean Christopherson <seanjc@google.com> writes:

> Allow passing a NULL @page to kvm_release_page_{clean,dirty}(), there's no
> tangible benefit to forcing the callers to pre-check @page, and it ends up
> generating a lot of duplicate boilerplate code.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

