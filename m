Return-Path: <linux-mips+bounces-7577-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C87A19D00
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2025 03:44:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2FCA16181A
	for <lists+linux-mips@lfdr.de>; Thu, 23 Jan 2025 02:44:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B074B20330;
	Thu, 23 Jan 2025 02:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKlN++My"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331EF2F2A;
	Thu, 23 Jan 2025 02:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737600255; cv=none; b=oZQcgUSSYS66L3g6VmZAevyOn8H/LheN38VeQJo+gozDT6UBaUSCsu/tBAQ2MXggufYsWk0GXD2IPJCFNF8Zezacpv55gUQ8M6UJjvOGwUjlq9ioHuxD1Q1wjNeBeiansNNPtjCDwD46hJwgCq7IMfE7dH7ZS6MZm09l619SI7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737600255; c=relaxed/simple;
	bh=BHRaS/Fh0hOYeBHKAKUOaA/KSubP21xzru6vjTfJRZU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KsqvNfRmpmKH3YNjjtupse7b0jkXdikfEylJwqmIVqdPfjIY6JHxsQlD9u3aEU68nojNq9jVqrd3UcimGhK5CPus0WW7shgLwpHjAPzrYCeNre3zv8Dc8wRQKmFYx58zLGYEahN/WilrkxGJQ80NR7hpnVjI2NFaLgOQVe1TUfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PKlN++My; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e4419a47887so623503276.0;
        Wed, 22 Jan 2025 18:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737600253; x=1738205053; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHRaS/Fh0hOYeBHKAKUOaA/KSubP21xzru6vjTfJRZU=;
        b=PKlN++MyDDElnABqTOMlEGwoa9DYWfxzWJ8yHbvl7NkxmBdsWmsFkgguIY1hXXoZor
         kcDD2TWLe6FrWx+j/V3kbQeySWJE8sHHLkPWqJQydS9So06WtHimA7OXyywdXqNN+IR2
         8E0wG8O3O9yw3xQ/Phknu3TPSKGfUDZH6fw23fILn2cNJyYy8e0rXCwQyTE70jtUm1+i
         DeB8wfAJ9NSX0UbhsYBLtkUtvSHi/cQJEMqmbevTDoFHNwiPHNfOxEfAu+ASSqxt0+Fo
         DYocMtC56AVgyOg/32eBLeAVU/WyVPOqXZgdO5pVtUREhDZM/qbL6+IxE9evHv1UJJjT
         5JQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737600253; x=1738205053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHRaS/Fh0hOYeBHKAKUOaA/KSubP21xzru6vjTfJRZU=;
        b=uaGO/hvJRrmElJweMalV3L4Ext1ndcAy1wnSa0l+HsmqkvJ7AiiEbi7dLQy1HxPckN
         PYcYAPcnZ4Y7LfeVju16O1T97aIGcV9Jxoe2jwBiDe90+qV9l5UI3wkXBVyU/2NH/1vZ
         3gjJ4PpxoBl3asiEIFOX+CrMad0k4LxkIVkHA0X8bvDVa4pF4Pg5+LxAKWqj9J1xfUvR
         rtlmNPlTUGW+Tr+TPYCGruoHzYMpOddfMBksOJKPDXEX/18tOtOprd5UsFD3nxz3PPAT
         7gcRrJVD+4flRcah8CD/2il6cKhov3nMn5OB4F+iP7P8ZApd7ep93Nt72pWZBQrM/BO9
         x9ug==
X-Forwarded-Encrypted: i=1; AJvYcCVNtICgLq6iv/Z6fH1jjutcxB/dv570R+RTs2+FI9MfDWqJhGxqp7KGw1ETILJbeiIuKQpaDi5BZP3j2Q==@vger.kernel.org, AJvYcCVmpPbSXVm46aPekknI4EqW6fCpimp4hvY1fjbJ+Tq5mDF5LhKL4qfBjpQDsrB/Js1OsocwPIcGFha8tFA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz//7unKN37S/jeZvRg9WuZOeIy9BpPaFuBqkSFA/l3JRso3saw
	H6QpWVclvtjBeI4fETQGV7dJ0xtjMrDz+5E0Faw01QfCAYU2yj87XKcDQimTW6RrnHFuQEFyGZN
	DhF8w/6ceSHBjkjCxs5zNO79sqxtP618Blto=
X-Gm-Gg: ASbGncv+3xVVT4+qY0PG+m5bjyMdTBJwpdZCoTxmEhHQuT13OoK+0F7+2upUKpIf6/v
	AyqOpV4ZMCOxlViS6DypGoHniolknL3vqnmF6QUtL2enGi8/v/ZpkfwiBmESECtChE5edc3ufuk
	BxdrM55l6SiaMvX4ZAtk0=
X-Google-Smtp-Source: AGHT+IHSrwfIDdR9x7tNetjN4qYI7hbscKNTrnYHVX7qU/xN/4CEVwC/xa/boDVp+4RwiT0JhJsN+3hSHF7yXgmB6lA=
X-Received: by 2002:a05:690c:62c4:b0:6ef:6448:bade with SMTP id
 00721157ae682-6f6eb941502mr176402017b3.36.1737600253096; Wed, 22 Jan 2025
 18:44:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250120015254.124447-1-gch981213@gmail.com> <0625de4d-35c5-40c8-b81c-583a949c2e2a@app.fastmail.com>
In-Reply-To: <0625de4d-35c5-40c8-b81c-583a949c2e2a@app.fastmail.com>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Thu, 23 Jan 2025 10:43:40 +0800
X-Gm-Features: AWEUYZnjdb64WFOyZbxYhAtaa3EVbJnQY2H6Xdc7ecp3nibLPrnmXgR49A9bPnU
Message-ID: <CAJsYDVKTka25bpLVDh4W6p5mzo_zKY13=gO8r-VSsyOtm2v6sQ@mail.gmail.com>
Subject: Re: [PATCH] mips: add support for Siflower MIPS SoCs
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"paulburton@kernel.org" <paulburton@kernel.org>, 
	"linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 8:05=E2=80=AFPM Jiaxun Yang <jiaxun.yang@flygoat.co=
m> wrote:
>
>
>
> =E5=9C=A82025=E5=B9=B41=E6=9C=8820=E6=97=A5=E4=B8=80=E6=9C=88 =E4=B8=8A=
=E5=8D=881:52=EF=BC=8CChuanhong Guo=E5=86=99=E9=81=93=EF=BC=9A
> > Siflower MIPS SoCs like SF19A2890 uses dual-core MIPS InterAptiv
> > processor, built-in GMAC, USB, dual-band WiFi and various other
> > peripherals.
> > Notably, it uses some ARM PLxxx peripherals, and ARM_AMBA is
> > selected for the drivers.
> > Most devices on the market with this chip come with 64M or less
> > DRAM. A kmalloc.h with malloc alignment override is added to
> > conserve memory, and a MACH_SIFLOWER_MIPS is created with reduced
> > features instead of using the generic kernel.
> >
> > Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
>
> Hmm, why not using MIPS_GENERIC.

Mainly to override MIPS_L1_CACHE_SHIFT and ARCH_DMA_MINALIGN.
This saves about 1MB of memory if I remember correctly.

--=20
Regards,
Chuanhong Guo

