Return-Path: <linux-mips+bounces-9187-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9151AD164E
	for <lists+linux-mips@lfdr.de>; Mon,  9 Jun 2025 02:37:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 864051681C1
	for <lists+linux-mips@lfdr.de>; Mon,  9 Jun 2025 00:37:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 234812F37;
	Mon,  9 Jun 2025 00:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E+Jep937"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2B11362;
	Mon,  9 Jun 2025 00:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749429476; cv=none; b=FCjmEw0ec9D9dv1mzjxHPNFwvQBSdt3P9lof+B1V9ERXv78GfaPXBmF8/sOkrXMFnIGAtXuvWhxo6Op/KACLJCAR0ocYS+Lltq/RtmdR5jPUPvP+RBNTgWdq8ysms3j4a7qK8k/z6mnev9AaNyEdy70xHtTwhbHhyBfPvQalZ1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749429476; c=relaxed/simple;
	bh=w8eQaWwxvXeuDN3Oqzs8kOQiuSO0ovhEAVB4m1OgVWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tYn4xO5OOCZJxn0WqOphLq8UETYU/rdbyoQcZQiNbjoiP3zj/3iMCEBNDtebzAidkNTTEwwUUKYUxQshg0M5GCVxZDnNHV7M04FjvL5grH1jE25eom4p/bMP+PZfOPda0952+LE+ieHtMe13N444x/Kqo2Yg/d514ObPL4jwGwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E+Jep937; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74FA4C4AF09;
	Mon,  9 Jun 2025 00:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749429475;
	bh=w8eQaWwxvXeuDN3Oqzs8kOQiuSO0ovhEAVB4m1OgVWk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=E+Jep937QZ2dTZ8UoloM4f/Ug8z2Xle7Wg6tGMV7Ihjnsx2mXcbkD6428GjCRm5dB
	 xZBW/YE5oshBNyvHd+BADxWkE53M272h8mnoVzBk+6q+gMWLZGyJV2yXBJOX9IrS4s
	 xBNnGqZnHZ2xqxra0mTK3g/2A8OgCZz9kSZig7XgsJrF3rmlclvY2jEJOhtXUe2JUP
	 KxxspvARCpETfS264r695uxAbiBVfM1WLlxznnfSMWrXR9c2p11g14IdjpfLF+HaIY
	 jM99qgQZ0X0cQKxqSxqhWDYE5Ahw5yL9JXdnxDGIyZ/EO3uUyW4TSuPLx0ZPdp4POp
	 y1pOrIrNkPzSA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54998f865b8so3612850e87.3;
        Sun, 08 Jun 2025 17:37:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWvNhhh6oeNTVUhFU7JXqntFMxuZ8w+/LcpBRctSJb3eyo3CJObhienS/AG4wxRStHgGIaRXRHnFmBf@vger.kernel.org
X-Gm-Message-State: AOJu0YyDTnKcuwR0crCPhH9M/9Sb4ZwsrOoUlBnnGApLzuXP7/356m8U
	8ATSuf+NGwyxc5yrLBHPt+XgOcoFKOj8TeTbwKTaDFlbk8/ujTPXqpUBiaUO1k2YwU6z3mUAsMc
	i5M+jVmFufq3B3QvVV3dy177kHgL0wxg=
X-Google-Smtp-Source: AGHT+IGdbKWYUlmG/pv6JTxAlk5y0fDBnTopILfOcgmgJtVEQ1cjl1Xj/5EojETciRbGqU7ZOkL160Yn6WWUpb3o3yc=
X-Received: by 2002:a05:6512:1290:b0:553:37e7:867a with SMTP id
 2adb3069b0e04-55366c35759mr2660670e87.49.1749429474191; Sun, 08 Jun 2025
 17:37:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250608142010.161632-1-chenhuacai@loongson.cn>
In-Reply-To: <20250608142010.161632-1-chenhuacai@loongson.cn>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 9 Jun 2025 09:37:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNATS0AQp+07q6bDtUcxoyzW2z1M4RqGFcPeFxWmT5wA6qQ@mail.gmail.com>
X-Gm-Features: AX0GCFt74_WfQ5997Np-icEc1AhlD46D0i8NHiw3ysMd7CEqH30P3KrIPY6yDL8
Message-ID: <CAK7LNATS0AQp+07q6bDtUcxoyzW2z1M4RqGFcPeFxWmT5wA6qQ@mail.gmail.com>
Subject: Re: [PATCH] MIPS/Loongson: Fix build warnings about export.h
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: linux-kbuild@vger.kernel.org, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 8, 2025 at 11:20=E2=80=AFPM Huacai Chen <chenhuacai@loongson.cn=
> wrote:
>
> After commit a934a57a42f64a4 ("scripts/misc-check: check missing #include
> <linux/export.h> when W=3D1") and 7d95680d64ac8e836c ("scripts/misc-check=
:
> check unnecessary #include <linux/export.h> when W=3D1"), we get some bui=
ld
> warnings with W=3D1:
>
> arch/mips/loongson64/setup.c: warning: EXPORT_SYMBOL() is not used, but #=
include <linux/export.h> is present
>
> So fix these build warnings for MIPS/Loongson.
>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>


Thank you for your contribution.

Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>



--=20
Best Regards
Masahiro Yamada

