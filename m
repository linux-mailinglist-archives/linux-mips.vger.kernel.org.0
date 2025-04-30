Return-Path: <linux-mips+bounces-8871-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 27826AA4140
	for <lists+linux-mips@lfdr.de>; Wed, 30 Apr 2025 05:16:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 208FA3A6326
	for <lists+linux-mips@lfdr.de>; Wed, 30 Apr 2025 03:15:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD0E91BF37;
	Wed, 30 Apr 2025 03:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s7Od3Ldg"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B459410942;
	Wed, 30 Apr 2025 03:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745982961; cv=none; b=KFab4/v2sBQJYrxmsEnICEQfkksp6fMXp7yp3Ims8c9ZaqFkU4XAzAXUTBHXqvijdpGyUXnD0ZTciTYBPa7SwdbltdxLP4bhkTXoO/gFNRmU08PBr4iKI6isyp56jiUBk6riYnwMhk3Aoju8+zuSFNcwpf1UAe8YYSDJiT7PSwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745982961; c=relaxed/simple;
	bh=XjINsE6GDltzUYhe3UrCW8zF3UaB9Zcc2b3Q3M9kMAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k6Yh6ApA1pjplJ5SS1xwzGCicMq/0QqwIhnO2NYwBO0aALiiF3Od8t2O/x/PPhvfyeofHpKt47gJ3DnssDCfzX7G7RNw+hiaq8O/Ea610C5uC5xAINTudGHEowaI3906m3Xiw8qI8gIZ1xrbuwguF4hFGU3t1kbTY1DzP1zCQhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s7Od3Ldg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D7AC4AF09;
	Wed, 30 Apr 2025 03:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745982961;
	bh=XjINsE6GDltzUYhe3UrCW8zF3UaB9Zcc2b3Q3M9kMAY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=s7Od3Ldg2TTDTvoxujYo3hWEkQlp/w+Elw1wKmdqnWtEXki8aH/hEZcmKYIyIVUIn
	 4aT7vCE6iRsnyrRRz3mfIz8TKafFWzbsgHnmp+VAgR/uE/7dkx/SyvdD0lHfQGO2Bs
	 kkQu5d0mqbDxLIYoZX0NwpGd81ZJCXXl/FsyYcPLA40uh2SncHO92ytbJAiXJVbWk1
	 pXbb6FyVQfMlAFvXABtzvTPdmiQjgJVkOd03qY5UxNjwaBXp+ebH5l6mfLR4xGuN7Z
	 Vzn1pnTDk/7zB6JzbjPhIyW2eryzmejcYVkhDvobhGkZ93vb2vIQ1Y5nQr+9k4Ss8C
	 PcbK86VRBRiGg==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5f5bef591d6so12940397a12.1;
        Tue, 29 Apr 2025 20:16:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCViHRvqINYrc+7ugjc9rPw3fkGwcrC592KUvKbeHL6iSjlQeTB1bh67wCGnz0hyHNxhUiUJG7LwNDF+NZU=@vger.kernel.org, AJvYcCXA3DX/gmPp5uFetksqXOuAgWvDSCKbXcOJKZa2hVlKLyGQfyrwtni+66AVjeuoOh7RQuAzUfwhvAK+Hg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3VDRm/tR4kjmIfo2sduPhEecNQiVBe0pB32BDuesOdc8241nm
	OjBRqmyiGxKgUoK/F7K7WPkPTBTqPhsz2fLNSy9mxN4y22BH8RmMP1i9P6ydELZiyz9vurylFU+
	nZu0N+anaOdJxZ5Dl6LfzII+Xetg=
X-Google-Smtp-Source: AGHT+IG+5UlFNF+7vFHRYmNl7fcdFdel76dReL68xFvQNE0EJ59Yghsq4nmbZ4sTzj1XKJz3lV9B734z8XzAdcu37aU=
X-Received: by 2002:a17:907:1c1b:b0:ace:d166:8fbd with SMTP id
 a640c23a62f3a-acedc776644mr138089466b.59.1745982959834; Tue, 29 Apr 2025
 20:15:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250403161143.361461-1-marco.crivellari@suse.com>
 <20250403161143.361461-3-marco.crivellari@suse.com> <CAAhV-H4dQ8hRfBm2JWmgMzYH5tuy4ph6hyOSXQBLOvtCQ+K9dQ@mail.gmail.com>
 <alpine.DEB.2.21.2504280426010.31828@angie.orcam.me.uk> <CAAhV-H4WTrYecBj0wev8AUi_of_qAnvHCk4heTU5P_3pMZv4fA@mail.gmail.com>
 <CAAofZF4J6H5jgqKu=KUowBrwfHJyGEzL5ThC_DOs-XPdgm497A@mail.gmail.com> <aA9XNgh7qGRZ5HBY@alpha.franken.de>
In-Reply-To: <aA9XNgh7qGRZ5HBY@alpha.franken.de>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 30 Apr 2025 11:15:48 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4q3bki+_SwRq9JW2LwS6ny+N1eS-UJsZ5N2vtZRVWHeA@mail.gmail.com>
X-Gm-Features: ATxdqUER5Nr2U4e0_PX8Yy1bFTb7k7F4bPiS3lILMQNEefJZ_nwH0KPT63MO4uE
Message-ID: <CAAhV-H4q3bki+_SwRq9JW2LwS6ny+N1eS-UJsZ5N2vtZRVWHeA@mail.gmail.com>
Subject: Re: [PATCH v7 2/2] MIPS: Move r4k_wait() to .cpuidle.text section
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Marco Crivellari <marco.crivellari@suse.com>, "Maciej W. Rozycki" <macro@orcam.me.uk>, 
	linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Frederic Weisbecker <frederic@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 28, 2025 at 6:24=E2=80=AFPM Thomas Bogendoerfer
<tsbogend@alpha.franken.de> wrote:
>
> On Mon, Apr 28, 2025 at 12:20:31PM +0200, Marco Crivellari wrote:
> > Hi,
> >
> > If it sounds good also to Maciej, I will submit the new version with th=
e
> > space before "ax" (and of course, the ".previous").
>
> save your time, this is already applied and I won't rebase the branch
> just because of this minor bisection problem.
But this series lacks a tested-by from Jiaxun Yang. The first patch is
so complicated because it should handle the pre MIPS III case, I have
no old MIPS hardware, Jiaxun said he has [1] but he hasn't tested it
by now.

[1] https://lore.kernel.org/linux-mips/20250315194002.13778-1-marco.crivell=
ari@suse.com/T/#m632ac91077d4cbc750b8acaacef08cad8bfd29da

Huacai

>
> Thomas.
>
> --
> Crap can work. Given enough thrust pigs will fly, but it's not necessaril=
y a
> good idea.                                                [ RFC1925, 2.3 =
]

