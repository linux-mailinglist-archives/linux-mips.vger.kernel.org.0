Return-Path: <linux-mips+bounces-8266-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1BCA6BF75
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 17:16:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3D1C16FC84
	for <lists+linux-mips@lfdr.de>; Fri, 21 Mar 2025 16:16:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0167C19938D;
	Fri, 21 Mar 2025 16:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="A7JGV9oI"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1BA1DEFC5
	for <linux-mips@vger.kernel.org>; Fri, 21 Mar 2025 16:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742573717; cv=none; b=lftRn56QUtuAmIoVGyX105rf4gjboAcouKE3IGfx9frcgh73E4HuJB0DdqQhltaPbP5CuTPVAAIWyeZWEp2Lt4oLo3ILAv1Hj+0bvXvTxKKB89rYU4XtEM4hrset2JowbUn+qgnhEqDPlE3weZ9DnUP2NZ8pgE8UnxAx7b2SS9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742573717; c=relaxed/simple;
	bh=t0I85wJl6Q02gWZfsGxbdmSAryl/5ThAyE7h6UCvpP0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m5Tcj4NQW+AcWyqtiGe3mMYbRqGpEr5e+HOyM7H+epn06uUsaLKVt+ihLCx18xBRVdcu/zDtI3BhFLJDtr9QOgwLJrdAfAsO27lDtQJaADxhwuk7TrT8/9e3q9KO5VoXvbmUiFvYCyUnPejh9nfp3nkKGzB0pJpCaOtPL8ZYdnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=A7JGV9oI; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5499614d3d2so2552077e87.3
        for <linux-mips@vger.kernel.org>; Fri, 21 Mar 2025 09:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742573714; x=1743178514; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xxLB0h16iEEcVhCHw+83yfdc4253yuJpjZl1F1gKp+U=;
        b=A7JGV9oIh6ZmKwqaD71AYdB8LPOezlNH2kf2dHxfonUSKw1QOz6ojZeb8Z2027BhiP
         P+vDFbddpHbxA3WKgumIYQiE+PodnoVXVmmbEOuiFpBUZOReK9P4GrWFVLCzKzd37j+5
         xRaFNQQKnYPaL3TrurnBf7l0w0Vx29gAmKxYmS+w1p+/gsTOcIInm9cZE8G5mfrnbKkL
         3lMFgL0x8z6ycMHPKKqjo+ErAkES9oOgW1P+4ZiJj7AeT9LvSoKwrmbmymk2HkUz2tNp
         PhwlMjZjRMwx8KTz3WqeSedAiXiXPlxR5W1Woom/BBc4KAzxKu1wtuJtbwD4fCTeR7u2
         S7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742573714; x=1743178514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xxLB0h16iEEcVhCHw+83yfdc4253yuJpjZl1F1gKp+U=;
        b=gztX7BENuE7emvwy/UYBpZiqtMbpu9wVF7MZNyV/ur0UsTDEVFoMjxW7YPOIHxtIjS
         /wiF0EVmv97qawsRTgW8esA5kII71SdxyhSjZqTuK+k3BMiHoF+2bclzl/BsLy5DOPeq
         TxW6/TdG4aLIKeKYRYlB8tj7aZBumKN1WVXRX46Sbv5mTi0ZqoQlwhVPecl0g6LvoqfZ
         02Jn2susuhqymYwaBXZqgsXBQphi+coOEGONiUFcXUT0WpSQrBwWP+wwZUWi5sVKaEd/
         ifQN9CQWeZKAhhLvIKcumyQExX0UNV2InhyiMZ3TxfYqO8FW4oMINGX2g1rvNZGPQmwg
         ECvg==
X-Gm-Message-State: AOJu0YwjkVBfPPlByUfi2lxvLO3g555VAWHx0+6NScVsqCCmA0fNmn1p
	LpSJHELgf0NQpRY+pNQtT3uRBWFW3m2wfP1uALgDlND891mzTQitaGQSRnsNYXCo+IRIlQc8GjD
	wI0YNN15qmQFtJ10YRhWZpKenFKtvvPennjYnHCoPGfEpuKD6
X-Gm-Gg: ASbGnctuo6CkKCCEpknVbxY9gJi1N8E+3f8N0ab1ulGdfSe+236zHSH40XJ+t9Oultb
	uv/8npiptjuVj6l6oE1z5EaMSDtMT2Jjc2HEmITUWnfyKj4sV9v+YbLhV3zHOleTfJjgTg5qBhy
	O4U9fg08pDysj45kw4X0PtOzrDGUeMuf3Lps++BAdX2qEKxkz+xi1B7RjbCcY=
X-Google-Smtp-Source: AGHT+IFpr7tj7lCX7rK9TyEdAX36qI3BUwAIzNojkRB11whvA4tpCS//FWsPqh8dSvOvjgyUXnDZxoxT5uuaNvkOseo=
X-Received: by 2002:a05:6512:1088:b0:549:8bb2:8575 with SMTP id
 2adb3069b0e04-54ad6476834mr1559553e87.10.1742573713747; Fri, 21 Mar 2025
 09:15:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250315194002.13778-1-marco.crivellari@suse.com>
 <20250315194002.13778-2-marco.crivellari@suse.com> <alpine.DEB.2.21.2503211146001.35806@angie.orcam.me.uk>
In-Reply-To: <alpine.DEB.2.21.2503211146001.35806@angie.orcam.me.uk>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Fri, 21 Mar 2025 17:15:02 +0100
X-Gm-Features: AQ5f1JowyTWw49XnxSHXBxJuGDwxUK9dmkDqvxpfG5_TtVO4oP_4udCpS9k6fzw
Message-ID: <CAAofZF4gy6WJKLK4TzF5aV7+ca3gob5jVz3XQZyGrTpfnCsn_Q@mail.gmail.com>
Subject: Re: [PATCH v6 1/1] MIPS: Fix idle VS timer enqueue
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Huacai Chen <chenhuacai@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Maciej,

On Fri, Mar 21, 2025 at 12:53=E2=80=AFPM Maciej W. Rozycki <macro@orcam.me.=
uk> wrote:
>  This instruction sequence still suffers from the coprocessor move delay
> hazard.  How many times do I need to request to get it fixed (counting
> three so far)?

Can I have more details about this?

I can see it is the same code present also in local_irq_enable()
(arch_local_irq_enable()),
and from the manual I've seen:

"The Spacing column shown in Table 2.6 and Table 2.7 indicates the
number of unrelated instructions (such as NOPs or SSNOPs) that,
prior to the capabilities of Release 2, would need to be placed
between the producer and consumer of the hazard in order to ensure
that the effects of the first instruction are seen by the second instructio=
n."

The "Spacing column" value is 3, indeed.

"With the hazard elimination instructions available in Release 2, the
preferred method to eliminate hazards is to place one of the
instructions listed in Table 2.8 between the producer and consumer of the
hazard. Execution hazards can be removed by using the EHB [...]"

What am I missing?

Thanks in advance


--

Marco Crivellari

L3 Support Engineer, Technology & Product




marco.crivellari@suse.com

