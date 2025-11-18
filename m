Return-Path: <linux-mips+bounces-12268-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 61299C66D15
	for <lists+linux-mips@lfdr.de>; Tue, 18 Nov 2025 02:17:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C63FE3472F6
	for <lists+linux-mips@lfdr.de>; Tue, 18 Nov 2025 01:16:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F59921FF4A;
	Tue, 18 Nov 2025 01:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FwdOiWdJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8342116E0
	for <linux-mips@vger.kernel.org>; Tue, 18 Nov 2025 01:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763428562; cv=none; b=CZuiekRrE+E+0Oi73xEdUvIAEOLc+kz6AeTJDdKNxEkhyv3UuXn5iBqnDYym7Ax9bkV0mgGAOpIq7p63HWBB+IwDPew9HIzHOnxS2N24KM0+VNDYzhIIZp1x0aL9qsLvo5Vwtpsq4EFpyxjXHsTr7aZTUgJWDL4A4xDoRpvFU9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763428562; c=relaxed/simple;
	bh=lj+Kd4aABU6pcKOupiretCwiMi++9jTSBYm3y7bemBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XaQeIsnR+/oB+233eRZTMqF6pnRSPvrCsQgCsmYQS4gjDLyVotHwbbnNvgqbYC3Ssn/S/6e9hXT4ZDNlwvwDuVVLosp9ZZfjZJJbbV14xafoI0eChjAWTfE8zoR6aySn01CL4EkhlOfhUviI1+4yIrMI7dCKcYORwOMpkXijWBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FwdOiWdJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AADE9C4AF0D
	for <linux-mips@vger.kernel.org>; Tue, 18 Nov 2025 01:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763428560;
	bh=lj+Kd4aABU6pcKOupiretCwiMi++9jTSBYm3y7bemBQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=FwdOiWdJrW9ky4y9OTzYVIhdJKma1wE0CM1yxa7sLpE8rB96w7rZ/73++sMALE+Ej
	 l43nSnwumXeqcV3Lsfzpko90YMEMwhOAoSTdjVgbEwLyhZdFHRiUbla8rrZP32R+Ok
	 JY25des3dhxTGoJ/fz+GYWpI2n3+nEg3Uwc5uYszaajOKQjmazVknmwT3H4FyHpiBf
	 nuugdpNrzD3AfLLGJoVe7J5soV5lo/PxU5yuKnyp4/WvhoDk2A6OVTgfiioetp9Ei4
	 gMxvSvTknK/z6stsfHVBOeaKFiISLK+RdoYHk1FugtArkoghXp7juGF0O3jhR6SaX3
	 J0/70Irni2aJQ==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b737cd03d46so381691166b.0
        for <linux-mips@vger.kernel.org>; Mon, 17 Nov 2025 17:16:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX7zdLEYU1BEuV0cKR2w4clOatEkPJoQNC2kGrl0/QeaQLaL+EjECqoOBgWvpBXYLoJEKrauB1Ysvj0@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2g1h9DTLk/9W+cEL8vdJc7d10ibosLhdcLWlZ6KcxqwizOewd
	QoYsUb+zGyIBOWrtQRm5Hq5OJ8uPjRsyK4M4DntPly3X3KC2fLB1126nTofePi0fWEETjLGfkCi
	R2cOsD7sEx+n6tsGUOvxDIEzBGxOA+KU=
X-Google-Smtp-Source: AGHT+IFHun9xYZ0Ze6tRyh+Cq7hoCly7+LvtG9T3NoH7i7Y25bIWCoOz3NrEUduWJ6JFlkIzjXeyMxFN5zCsFyTdVw0=
X-Received: by 2002:a17:907:1c82:b0:b73:4006:1884 with SMTP id
 a640c23a62f3a-b7367b8d999mr1505271366b.37.1763428558551; Mon, 17 Nov 2025
 17:15:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251117191815.69556-1-tsbogend@alpha.franken.de>
In-Reply-To: <20251117191815.69556-1-tsbogend@alpha.franken.de>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 18 Nov 2025 09:15:59 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7eoKgCWRVGWzgM55YOM9V8TRXe6Ax6-XQJF-STTpNpOg@mail.gmail.com>
X-Gm-Features: AWmQ_bmWGvSoi0Ymxi2vbF61_x7K7lUcTiyIK6KGxUIztwEgmPXhVWRkjZjhY2Y
Message-ID: <CAAhV-H7eoKgCWRVGWzgM55YOM9V8TRXe6Ax6-XQJF-STTpNpOg@mail.gmail.com>
Subject: Re: [PATCH] MIPS: kernel: Fix reservation for VDSO area
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Nam Cao <namcao@linutronix.de>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Thomas,

I think 69896119dc9d ("MIPS: vdso: Switch to generic storage
implementation") changes the size of VDSO data from one page to
VDSO_NR_PAGES pages, so here we need to remove "top -=3D PAGE_SIZE".

Huacai

On Tue, Nov 18, 2025 at 3:19=E2=80=AFAM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> Commit 69896119dc9d ("MIPS: vdso: Switch to generic storage
> implementation") switches to a generic vdso storage, but missed to adapt
> the max stack top by the number of generic VDSO pages.
>
> Fixes: 69896119dc9d ("MIPS: vdso: Switch to generic storage implementatio=
n")
> Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> ---
>  arch/mips/kernel/process.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/mips/kernel/process.c b/arch/mips/kernel/process.c
> index 29191fa1801e..9eb5b26d4b5f 100644
> --- a/arch/mips/kernel/process.c
> +++ b/arch/mips/kernel/process.c
> @@ -693,6 +693,7 @@ unsigned long mips_stack_top(void)
>         if (current->thread.abi) {
>                 top -=3D PAGE_ALIGN(current->thread.abi->vdso->size);
>                 top -=3D PAGE_SIZE;
> +               top -=3D VDSO_NR_PAGES * PAGE_SIZE;
>                 top -=3D mips_gic_present() ? PAGE_SIZE : 0;
>
>                 /* Space to randomize the VDSO base */
> --
> 2.43.0
>
>

