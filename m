Return-Path: <linux-mips+bounces-11264-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 912EBB54E53
	for <lists+linux-mips@lfdr.de>; Fri, 12 Sep 2025 14:46:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D09C97A8949
	for <lists+linux-mips@lfdr.de>; Fri, 12 Sep 2025 12:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28AE53043B6;
	Fri, 12 Sep 2025 12:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ECgEqL1H"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B8038FA3
	for <linux-mips@vger.kernel.org>; Fri, 12 Sep 2025 12:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757681209; cv=none; b=M/Cm2KcspYp4CHgnUYYHHHvpOs5nZ4aeWO9RAvnAHWDLu1hMMOnN05DZq+nr6+1OIvMSEu4HNrBWhGceZ7XlzUB81vUUZ0n2qteop/3XczuRfoX3faa3eDPdRAyJAW4G1U1cOAjhIgo59qcgcE9kWIxON7FjkC2KcnuPQryalfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757681209; c=relaxed/simple;
	bh=4J5UZwv7Uo2rH+o6sSlfGyt4PnQotdtpRnvjkNoAGSQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pu94wYl6pVqOFTfztbqf4RBpeoMnQxenCaVVKzC7ywflhSeQ89WBcZAadTvwWFrkWpzN7xldB7bya5ZNsgmTxjKTYNNIMHoePI78rv/istWjlZaB+Am59iHvpjl6cNNJqS+N9CvwN+BSe1iDhEy3YzYlU9fDMRWXlwha5DITCe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ECgEqL1H; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-336b88c5362so18046631fa.0
        for <linux-mips@vger.kernel.org>; Fri, 12 Sep 2025 05:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757681205; x=1758286005; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4J5UZwv7Uo2rH+o6sSlfGyt4PnQotdtpRnvjkNoAGSQ=;
        b=ECgEqL1HK7Or0mnqIrdCTeG9GtI+LZTbn8ajKpyGbWp7vZtDeAhvA8OkXo23XRT6P/
         5QfhDWxDuiKpgPsPxiTFAulLsAHkoF77+zHH12i1NpZUqLnPJjTZPUZUqDy7Rc1Rfsf/
         v8HrUVTT0dJrB4N4VkpG5WTCASigauNy1bMCniiqOzkgg2tik/+Bx5RUbQ0uyai470o+
         nh+O9sNucJwqkquFedbnvsLURqcJGXIS5WF0WcRlp0+q+9K6Pkw9FmxVlyqafbqGytki
         pJIqJCImKEKZblMR3uH+ftCpP/4gd6jsD4+jrsOBNz3GW8Tm+N8WIu44oa++j+LnCpXG
         LY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757681205; x=1758286005;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4J5UZwv7Uo2rH+o6sSlfGyt4PnQotdtpRnvjkNoAGSQ=;
        b=odiJDjpdfm901HKdg1eRxR79252ygygZZlnQ/wsbO1qgOCvEl4OKTpbVYN14UEQ0za
         kOHEMXAvrcKHsJ7HW1MWFaISJSCcjBl8EPLAntx93TVSn/J5CDXHaJeiNQYPUj4um5fm
         mY7uOqCkgE9j8AhbLtCB5Wk1/1QWay0nt5SzLy7KoNQd+eEq86nlEBPKQ1xqjL0Uxw+P
         k0l4xciED5j9fAWo7pB5nndFU7+vbil7Iu1nDFAOXnifMSXr4bkhPIfU/M1oHYMmDNJc
         CFBJwS8C8jGFhLMvSWfxwWmo6B31LJpdMElH2kvaExvNALvbj+J844aeOQ0/LahfgtFV
         ASlw==
X-Forwarded-Encrypted: i=1; AJvYcCXJyj3+RBrca9FpGIXkjyL+RHYwofQktOyt6Pen74Va1hDRIGzImbvV5nnxHfyBjmt8pA8aGDO7+R/k@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7YzEHoUaUbffBg5gXRQAo66oUn6hIhoJor/07KK6cMMOmtQcN
	+h4t0RzATkYWEyngDgTyOEKs2KWNbCT/2BA7RyHHpMNgG52+Najjy1Lia5y4TGXt2CDmmjgjLAn
	rFJ0eDCm/BCruzkAMsYp1VgQlGBTb4ZPXZRi1l9eI1Q==
X-Gm-Gg: ASbGncuYUZPQ6RECMvnG0DBlx7Fz3LVjdEH90dQ+dSYA7r/Ke3L9yqOZwV3lylRjw3x
	NWMicFNlYBXwk5fUvcZSp68GYUx7krH5nCWcS5zreNag5LV22r2GzkQOPzTDBjfmHBgdftenREZ
	Pcq+Ojl4CgESvnZLrA8CNfHN9xypKMnJ20OYJlKaSlfoecbUfwaOpdOwfSw/7rBdgzst1Mk/m8x
	n2ANCY=
X-Google-Smtp-Source: AGHT+IFceSrS+iukkr/XkXsYJuXAC3/mzUt2kTyPUu5TFhzIuaRO7o+4f66lybawSyOyyY1O0N/R5wKHhfBQZAMqWCU=
X-Received: by 2002:a05:651c:23c5:20b0:339:1b54:b367 with SMTP id
 38308e7fff4ca-3513b296a39mr5927901fa.18.1757681205355; Fri, 12 Sep 2025
 05:46:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <497308537.21756.1757513073548.JavaMail.zimbra@nod.at> <dec53524-97ee-4e56-8795-c7549c295fac@sr71.net>
 <640041197.22387.1757536385810.JavaMail.zimbra@nod.at> <4fcd272f-81e3-4729-922b-588ad144e39b@app.fastmail.com>
In-Reply-To: <4fcd272f-81e3-4729-922b-588ad144e39b@app.fastmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Sep 2025 14:46:31 +0200
X-Gm-Features: Ac12FXysdXrp8ARxlqs--JPKzGSESzQlXQvRlkFB3ZYER3az5tDF4P1ySurKojc
Message-ID: <CACRpkdY9VS1H642wSUsLvwi91YOwXGkiePdq+JktDSeiWTon8w@mail.gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: Arnd Bergmann <arnd@arndb.de>
Cc: Richard Weinberger <richard@nod.at>, Dave Hansen <dave@sr71.net>, ksummit <ksummit@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-mips <linux-mips@vger.kernel.org>, 
	linux-mm <linux-mm@kvack.org>, imx <imx@lists.linux.dev>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Lucas Stach <l.stach@pengutronix.de>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Ankur Arora <ankur.a.arora@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Matthew Wilcox <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Nishanth Menon <nm@ti.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Andreas Larsson <andreas@gaisler.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 12, 2025 at 12:31=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrot=
e:
> On Wed, Sep 10, 2025, at 22:33, Richard Weinberger wrote:
> > ----- Urspr=C3=BCngliche Mail -----
> >> Von: "Dave Hansen" <dave@sr71.net>
> >>> Even with a new memory split, which could utilize most of the
> >>> available memory, I expect there to be issues with various
> >>> applications and FPGA device drivers.
>
> I also remember driver problems on older Marvell NAS systems, which
> we never fully figured out, my best guess in retrospect is that these
> had devices with DMA address restrictions, and if lowmem is small
> enough it would always work, but any lowmem allocation above the
> hardware DMA address limit would cause data corruption.

This kind of mess is often also driver problems, in the Kirkwood MMC
driver there is some dated code traversing sglists iteratively
instead of using sg_miter() on !DMA which I think is not entirely
safe either.

I wanted to fix that driver but the hardware is in my NAS and
all the time someone is watching a movie from it :D

Yours,
Linus Walleij

