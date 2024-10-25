Return-Path: <linux-mips+bounces-6444-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 845739B0BFA
	for <lists+linux-mips@lfdr.de>; Fri, 25 Oct 2024 19:42:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 115A31F21C50
	for <lists+linux-mips@lfdr.de>; Fri, 25 Oct 2024 17:42:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C96F81384B3;
	Fri, 25 Oct 2024 17:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DUR/GHB/"
X-Original-To: linux-mips@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9979C20C337
	for <linux-mips@vger.kernel.org>; Fri, 25 Oct 2024 17:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729878123; cv=none; b=Wo8x7H1NFVIJrbNYg2GhnI00ee+W/Kmj887x7a5/15b5DI/V2dM2elvwrHFXe9OOeieIM6+OIcG0r7ZmkTnPlp5xq/BoIS7X3dewbgHbz8oqeP+0X8u22Ej3wIMrtyD/W+aiTLYliKej0VQ4pwtsHd9rbxhehW+pFfN5qgawtuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729878123; c=relaxed/simple;
	bh=luHPkXcmkzXARAD1k+1siQ/blVliFRMh2F/pQQLu2Pw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b+zsvzckxD0wkVJgxJWJSHH1eKLE+U48GfKDcsBIlqKh6yLzkqppBWySywJ9pRrwYw9gTwhip1qbz5mDCGyTPdaJjXTJoWqSJpXXx0/mDitz1/VOHV0RFqng86uMrjUA1QdITXZdkkqEUY0rXstsSXljzcz2CC7sYvpsCbF3orI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DUR/GHB/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729878120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=luHPkXcmkzXARAD1k+1siQ/blVliFRMh2F/pQQLu2Pw=;
	b=DUR/GHB/zU+ENd7g+McH4suIHL5pOTJGuRu8QKQ+h7Un9UEoPuSk+jqrywXWwjDZJhA/no
	Um3Mj0+A1d7YMQc4ernvQv0RlT4B0xiOSx7Z5Cskx3DQrVpX63ono7Bk7UxENws7HH3N8Q
	wBz/grDCW1W+wVtmTOOo5d2LS5a1Hio=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-rWqjqeblOje5SdZNVbqwyg-1; Fri, 25 Oct 2024 13:41:59 -0400
X-MC-Unique: rWqjqeblOje5SdZNVbqwyg-1
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-37d5016d21eso1117115f8f.3
        for <linux-mips@vger.kernel.org>; Fri, 25 Oct 2024 10:41:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729878118; x=1730482918;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=luHPkXcmkzXARAD1k+1siQ/blVliFRMh2F/pQQLu2Pw=;
        b=vnF4ar04JcdsLf+0WmR1W17iq2g4P6dgv1oO5RCP0awGqOCyUfbCYW8D4Fmfg6ctHA
         meHMlND9cbHapu0fBmdC1R5df3+GOfDysZTGLK/4Ef9cliZT7/mEIjBEtIEH5vntUCzC
         Eis4Q6xYTx4FrsYun9fm83bmT9GYEu4grzcegb2evv0c3jBx2OoeyE+QflOrZjMixScA
         KTCpsqMellACBQp+109+L2EgRs3W4Nit8kC9WN2uoiSkpcHe5TcAu+4OYVX6Iw1mlQJ3
         MmaMItzfJXQoPRzkvBJypLglMXaPFdbKe8kv+WLu3UOietIufzPBEe1lh4HjMPxDrz6b
         ofiQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5tJXboa4i85g4N4zkRmH11VuXyKIYLEcqX4sYZxeETKTg9/P1IdLWA7PCeJd1l5oOG+TGVsvfFzZG@vger.kernel.org
X-Gm-Message-State: AOJu0YzBfFhZ4/kCorTnLz8v0uE8A/j1h68jOtSdhSXVnCM/K/qD/Ido
	cNkOtbVa/Y7DvrQ2JeCPeHMPpRCHO68peVZD9grTXOxHj8isIWMlZ4Vlkh5/wlBrPnacl5erCgz
	bmCsSjtzsp31Vv1SItFKXBUsGh6uC+w63x1F6fSjDycJ4SKy0Q1A4yNs7UwwPtzC09wKIwkpM1t
	SeKBEx2AhYaQlSuKH83uIYkSRsQ4+gdaJUVQ==
X-Received: by 2002:a5d:410d:0:b0:37d:5436:49b with SMTP id ffacd0b85a97d-3806113a07emr163656f8f.13.1729878118147;
        Fri, 25 Oct 2024 10:41:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJirsSaLOjUEz6kn7HmxOjIyhE9ZfBrB9GAGHgNcgNSBUFOeNbcRoyDDrANp8n6mxM4gCIddwEWDqpYot15qQ=
X-Received: by 2002:a5d:410d:0:b0:37d:5436:49b with SMTP id
 ffacd0b85a97d-3806113a07emr163639f8f.13.1729878117761; Fri, 25 Oct 2024
 10:41:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241010182427.1434605-1-seanjc@google.com> <CABgObfbQW-3vp=mNcR4giUGZ_gxhuRykvKj8gzBDY7pOg6xdBQ@mail.gmail.com>
 <Zxbw9XcFCHYR1Ald@google.com>
In-Reply-To: <Zxbw9XcFCHYR1Ald@google.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 25 Oct 2024 19:41:45 +0200
Message-ID: <CABgObfayH1x3qFjOiM=rQjxiui5tXJXObgR_qOGV5Hn_2QLEJQ@mail.gmail.com>
Subject: Re: [PATCH v13 00/85] KVM: Stop grabbing references to PFNMAP'd pages
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Yan Zhao <yan.y.zhao@intel.com>, David Matlack <dmatlack@google.com>, 
	David Stevens <stevensd@chromium.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 2:25=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
> > Looks good to me, thanks and congratulations!! Should we merge it in
> > kvm/next asap?
>
> That has my vote, though I'm obvious extremely biased :-)

Your wish is my command... Merged.

Paolo


