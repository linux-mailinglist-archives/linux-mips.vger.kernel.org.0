Return-Path: <linux-mips+bounces-4648-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F189448D8
	for <lists+linux-mips@lfdr.de>; Thu,  1 Aug 2024 11:53:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BD00A1F22062
	for <lists+linux-mips@lfdr.de>; Thu,  1 Aug 2024 09:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCFB1170A22;
	Thu,  1 Aug 2024 09:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a/dBYzSf"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1442915252D
	for <linux-mips@vger.kernel.org>; Thu,  1 Aug 2024 09:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722506031; cv=none; b=ujmRxjXQWtP1PbXQaaIpEKx+XwsLg6U1YAAVrWpaYXpO2LLeuQbBYBz0lSuCgAIkKvmPsdr1QNG/FODs/Vg8UA4I8EONWQiZGhAdhB7JmioYOgrHELtbZHnm2CZ2YXBqdU7P7bfFPVMaIs+IZfxWS2KKF+PbeRIpuB0Rzt6tyDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722506031; c=relaxed/simple;
	bh=RZpvv9TExV/YqUUjMHmoW7U1MADjmJXiZRuzMf5dgoY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EMkSRGi2uKC7+K7Rte30hxiRpafQd+7aqmrjIDM/zSVE3CTLkL7U0kz9uAFV8HeajtK14Vb3Ob/6kWfIgdsYFzbkr948lePeWsS2BKHh6nZia6h/koW/xXS2ov8jvx9/oZx+3avsjZnRSAFv4vnE+Ah0+oJWbx+ITREDEutRrAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a/dBYzSf; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5a79df5af51so3486276a12.0
        for <linux-mips@vger.kernel.org>; Thu, 01 Aug 2024 02:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722506028; x=1723110828; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8MGDW2w0EUrwnI4S//nT3S+vOipXyZxOwDlAdIY1JMk=;
        b=a/dBYzSfBpI5enxqoUMWB2ZrcLecJ4RQ07xZsqTfvEPG8y+iKY2WVjBSKf4EuQJj7b
         +kfVWQuiDXL+kzXPPy30oqezNnRWzLLGKYjKkEj9CwvMB8XYTeBmLtvW+Q18B3jMHTZa
         XXWX3sW3xscqS+SnCKXW63ftbUrlwmUx7fCq3nO10Bh+isizaBNn4ohdO5/MsBMljJqP
         lYe7xmgv4RTftKlNKJtZO/k6u/pHgk14GYqsXx/5LAlCT3+6PA6NJLqw9P2FMaxgcmZj
         vdqa9kwjs16uWwoIoOj9h6OskhpUPIC2eVO5PzEyzLfH4Hc2GSDR+bRsnkXg5234SDbK
         o1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722506028; x=1723110828;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8MGDW2w0EUrwnI4S//nT3S+vOipXyZxOwDlAdIY1JMk=;
        b=JTqrjpSrBFUGCM2BZZutZ5fS7X9Zowj90Xo4TAbA+DTeBub2x/48rh90O4o45UWvAB
         XmFY8H9WaY4MQ+3ec0iuTxkMNxiC0MVlahPkB1pV9fk+6DYMkaRjT/2rFaepkEA1O2yV
         3EDcBS8bjhwvB34ph3K9a8wwZo661hvCe4XBhMzdoBgzamOBU2l45rtRGR7CocXwxiyR
         Nqu8TL4CMT/OmqFvXX2y6HrVoEMMQykwnXYTmDgtRr7bsvh7olWix7GS53srEkqpYYR+
         5RVuLKZEJPWu9EetJk/w8Gww3KL+uU1EYn0vSK0GmHfVNh6CJtyt8y67aIaRdK6ul1c0
         DnDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvytMGdbToPs5spRLSfV+lYTF0P8HcVY+CPn+X73zWgXBWbJ8zYUFsTa+i5+18qEKC22hFmP88WyXiizf9b81mbEpK6wDAvzcN4w==
X-Gm-Message-State: AOJu0YwyhGrlYY2P4vXIxgig9rUeJ7KkMdD71uEqOGareurO9dypGl7N
	mx9v/zz/TpdZ0sQojUJIpLrc9tHzDM8qJ1sh/LnrNZ7/O8r+D5cF/L4ZjWPWvVQ=
X-Google-Smtp-Source: AGHT+IHNrw29WKyolinu6cyXHFfq+0WsM6WXcBxZ1/oFvQaGEtI1aOWo6VY84S/JlZwJgkWdM0qlVw==
X-Received: by 2002:a05:6402:440d:b0:57d:5442:a709 with SMTP id 4fb4d7f45d1cf-5b778dc53f8mr879162a12.0.1722506028149;
        Thu, 01 Aug 2024 02:53:48 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5b5257f39adsm2866327a12.96.2024.08.01.02.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 02:53:41 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id CC0595F80C;
	Thu,  1 Aug 2024 10:53:39 +0100 (BST)
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
Subject: Re: [PATCH v12 24/84] KVM: Use plain "struct page" pointer instead
 of single-entry array
In-Reply-To: <20240726235234.228822-25-seanjc@google.com> (Sean
	Christopherson's message of "Fri, 26 Jul 2024 16:51:33 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-25-seanjc@google.com>
Date: Thu, 01 Aug 2024 10:53:39 +0100
Message-ID: <87le1gefh8.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sean Christopherson <seanjc@google.com> writes:

> Use a single pointer instead of a single-entry array for the struct page
> pointer in hva_to_pfn_fast().  Using an array makes the code unnecessarily
> annoying to read and update.
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

