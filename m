Return-Path: <linux-mips+bounces-8821-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E66CDA9E640
	for <lists+linux-mips@lfdr.de>; Mon, 28 Apr 2025 04:27:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A7443B5F9A
	for <lists+linux-mips@lfdr.de>; Mon, 28 Apr 2025 02:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0BFA14D428;
	Mon, 28 Apr 2025 02:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uj/r+mHa"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A5078F51;
	Mon, 28 Apr 2025 02:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745807223; cv=none; b=hLJ6gvptx6MBPoS/WQHwdvk4CVLGh9OtEgNPnwvRA+BleiY1EQXu8hwUmc8OLQHHxL2iKrmO5JX6MbltxTWwFePF39xtUidYk41t032pUVgJ5LR8czymgB5jNzd/TJttECFKoKi0PvHYJhKHrbCCTmyba/Qmxt0a5z8fX6abLIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745807223; c=relaxed/simple;
	bh=ARUogu1KWOl8XAQWf/Oqsl0rAq6eejDgKlCFeI2WThM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zld2N2S4IDy19+i30WbxhUPacaI3tpodYoU/M364SfYyIZ6cyuHmxkV34kyLvCSwIy3HfZ+pk7mRd1r6PzIkmKNWQO3DD8P7VpKPCECIvIZcurr9sUObDblkz6Ixpe2X49PsOnK5KMA3S9XdxxA0ryMKf7TzHpUpB5LPC2mmQSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uj/r+mHa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B149C4CEED;
	Mon, 28 Apr 2025 02:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745807223;
	bh=ARUogu1KWOl8XAQWf/Oqsl0rAq6eejDgKlCFeI2WThM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uj/r+mHaLAIYEdBKV11mPlqzYr3AkOvpV/eb6cT09N3H8dcpDCm5+48VHg4vFwt1S
	 8e/1ZmladmjfWzh2Dy0hHmbjhtAnii/Hp8ZUMsLlU/kSirk2+3Tl14+JIrkn92UNuH
	 XzHho2qWM8m6ERjpiqPyU3WjL0OvGxWF/fzyUYaUSonZu3ijPgqftyw+7HlLYWXbF5
	 J8b2Vi6VtH794+3kEwj6q+QXaiF8nr007SzECXw4mIVzslxfQk2bZqv1o6mRblY88x
	 ZavwOvmI+xq9GxZ7keyloDU5E8P56/eHy7rvISQwsUvVPuINvAnNfYLaXSr2aar3Xt
	 2zRsWuTqDKiuQ==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-aca99fc253bso626966566b.0;
        Sun, 27 Apr 2025 19:27:02 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW418YgarSRIz88J9+GI3smzrfxcZ+whf+wLhpTejQ639AmyqXxtcY36ZyCrAkiTW+5xANjgf0wNSkXGd4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8HH1OSRZE/0yp6Uo0NAWgAFpPk9ZafqBYbw09FgmgU2q3lDyw
	LydWTe4XjrZCV5FGOHd5y7SwkCgnGcDdpK7vnOdYwat++a+C+74rBxjBWIbVDN/BVxMTnl2hggV
	PzcKB6jo3VY5b+ejUzeRPBOk4Lfs=
X-Google-Smtp-Source: AGHT+IFrzxa51ihXg7aydgBMfAxORsS7IiZgQWV17nIFgI4LvEhmAWQY2i4M/0v8LH8m4JiIn7pMROdDqgeFvRal8sA=
X-Received: by 2002:a17:907:7daa:b0:acb:5f9a:7303 with SMTP id
 a640c23a62f3a-ace8493c1e3mr608073566b.35.1745807221613; Sun, 27 Apr 2025
 19:27:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403161143.361461-1-marco.crivellari@suse.com> <20250403161143.361461-3-marco.crivellari@suse.com>
In-Reply-To: <20250403161143.361461-3-marco.crivellari@suse.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Mon, 28 Apr 2025 10:26:51 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4dQ8hRfBm2JWmgMzYH5tuy4ph6hyOSXQBLOvtCQ+K9dQ@mail.gmail.com>
X-Gm-Features: ATxdqUGost9qNZ7QpU2DF1a0CWnWmGGt-lR5NOpVjzH5-3nUd4ENdD94Ymse94c
Message-ID: <CAAhV-H4dQ8hRfBm2JWmgMzYH5tuy4ph6hyOSXQBLOvtCQ+K9dQ@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] MIPS: Move r4k_wait() to .cpuidle.text section
To: Marco Crivellari <marco.crivellari@suse.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Frederic Weisbecker <frederic@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, "Maciej W . Rozycki" <macro@orcam.me.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Marco,

On Fri, Apr 4, 2025 at 12:12=E2=80=AFAM Marco Crivellari
<marco.crivellari@suse.com> wrote:
>
> Fix missing .cpuidle.text section assignment for r4k_wait() to correct
> backtracing with nmi_backtrace().
>
> Fixes: 97c8580e85cf ("MIPS: Annotate cpu_wait implementations with __cpui=
dle")
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> Signed-off-by: Maciej W. Rozycki <macro@orcam.me.uk>
> Acked-by: Frederic Weisbecker <frederic@kernel.org>
> ---
>  arch/mips/kernel/genex.S | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/mips/kernel/genex.S b/arch/mips/kernel/genex.S
> index 46d975d00298..2cf312d9a3b0 100644
> --- a/arch/mips/kernel/genex.S
> +++ b/arch/mips/kernel/genex.S
> @@ -104,6 +104,7 @@ handle_vcei:
>
>         __FINIT
>
> +       .section .cpuidle.text,"ax"
If you submit a new version, adding a space before "ax" will be a little be=
tter.

Huacai

>         /* Align to 32 bytes for the maximum idle interrupt region size. =
*/
>         .align  5
>  LEAF(r4k_wait)
> --
> 2.49.0
>

