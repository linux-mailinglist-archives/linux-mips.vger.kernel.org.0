Return-Path: <linux-mips+bounces-12735-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2152CCF04A0
	for <lists+linux-mips@lfdr.de>; Sat, 03 Jan 2026 20:01:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1D7DD3011A9E
	for <lists+linux-mips@lfdr.de>; Sat,  3 Jan 2026 19:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6326125F798;
	Sat,  3 Jan 2026 19:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rgqyhFrF"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E3F8221710
	for <linux-mips@vger.kernel.org>; Sat,  3 Jan 2026 19:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767466906; cv=none; b=mfRxdILn2IidR6Ex0HIpGGPFm0AwWhzMZxFdc/7b7+VWgbckOaH0tdbU8pZnC/8SzI4IHFlMZW3hy2WPAW7h4B6sMuv30CsKh029t3nSNwXgj9h0GpriqPsu5Ua1OOIKY4cD6BC/EOz/A/j/vgoIitVsEE/4/Q+caFYL2ogUFc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767466906; c=relaxed/simple;
	bh=a0WHpEQRu4csEQWT8GI5MyK6jG9oqi1WLmbV26JweCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rPPEKQuw8aMcTnc2K9HwHQ1IJpVWwtP/+wlqQ3gdYi9MwkU4BHpxb1XS0be+sVtX+2UpAkP5pW1NEPkA85yevMbHWVngX+c6EXhX45le/jeobf6fDHQh/13CIkvl+0z6BPiJvNpQ306HwjOOQbvMfvxCTB3JBP1gUDugo5gJ4hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rgqyhFrF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0176C2BC9E
	for <linux-mips@vger.kernel.org>; Sat,  3 Jan 2026 19:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767466905;
	bh=a0WHpEQRu4csEQWT8GI5MyK6jG9oqi1WLmbV26JweCU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rgqyhFrFF0MvUgL4wtsfojC2r4dE++V8lRFqpC/T6Qty4d8BtieBmV/wtJ9Ep9Jgx
	 1TyLgboK4yqkhqOV7ABGNbl1FRD3LqWMsKLcJ+Vi7uaDi9lpDLPGU/xNuZ98CmMwoF
	 bxoFkSiDwWQg07BdMA9GhWG/52qR7LOvSq9O84koyWD5wyYlnU1MzS0q6UQbXdYxLL
	 OBgeHkET2OLA/1VYCYeg0ojnIOu36eTaR45ki0eUQy0dINxQE6j0TLWt5myU2ITxIQ
	 ci3kUMBvT569W6TmKzNGW3wTfkaNKqHP0YwNUpIiFMvJsdc7+jobANJqeDGLj7Y81g
	 cJSNTz1Vkd7/g==
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-78fd0cd23faso95990967b3.2
        for <linux-mips@vger.kernel.org>; Sat, 03 Jan 2026 11:01:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVaJC1m/NVQrqCDSPfyelQQ00UqW5jWIhK+6M8KvU8Jy6G9g6gOLCI7fNdz0qvdbxopdG2mdmW0DwFA@vger.kernel.org
X-Gm-Message-State: AOJu0Yydgn4trGh9xqkhBxgJxm26RWmuPAL3qqeUDA96SJT1qJhw7FNa
	8Ez7cGVxkUtJCEevgHYLksG8C68n4i7WHp9y8UojCTuv67CffGMgtSoet9RwdQsRShqDD4gv1YK
	z6Vv3LCS0a9MiwK3EFwR5/6eS1/7bGL4=
X-Google-Smtp-Source: AGHT+IHPR+FiigDgOrVHfu/QzSSoj0L27E99iL7Of0KlIPcheIALHeerHtk54K1ng7vvbQEGhJ9+qfx4s/y8haF8/vc=
X-Received: by 2002:a05:690c:9c0a:b0:787:d1e7:e75b with SMTP id
 00721157ae682-78fb40ae4e3mr287015967b3.64.1767466905216; Sat, 03 Jan 2026
 11:01:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-eyeq6lplus-v2-0-cd1fd21d182c@bootlin.com>
 <20251223-eyeq6lplus-v2-6-cd1fd21d182c@bootlin.com> <CAD++jLnBMXQAv75a8k=mbEt8pAxS0UXhayQPz1YWCiLic9_+ig@mail.gmail.com>
 <20260102230322.29d2ea65@windsurf> <CAD++jLkH3MK_GWE_HueDaRmM_xT4Ud3J6OXX_6X3XTD=fgn1sQ@mail.gmail.com>
In-Reply-To: <CAD++jLkH3MK_GWE_HueDaRmM_xT4Ud3J6OXX_6X3XTD=fgn1sQ@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 3 Jan 2026 20:01:34 +0100
X-Gmail-Original-Message-ID: <CAD++jL=ibsk+dfet9hFaAi_r+UrBSdL3ixYabJsucKT09Kq4Mg@mail.gmail.com>
X-Gm-Features: AQt7F2otcw52Tkucy1qvZOzI8mO5TZGFEGxDwvKQoVO1KXk8sqLIYa6Bur_06LI
Message-ID: <CAD++jL=ibsk+dfet9hFaAi_r+UrBSdL3ixYabJsucKT09Kq4Mg@mail.gmail.com>
Subject: Re: [PATCH v2 06/13] pinctrl: eyeq5: Add Mobileye EyeQ6Lplus OLB
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: =?UTF-8?Q?Beno=C3=AEt_Monin?= <benoit.monin@bootlin.com>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, 
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 3, 2026 at 7:59=E2=80=AFPM Linus Walleij <linusw@kernel.org> wr=
ote:
> On Fri, Jan 2, 2026 at 11:03=E2=80=AFPM Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
> > On Fri, 2 Jan 2026 22:57:44 +0100
> > Linus Walleij <linusw@kernel.org> wrote:
> >
> > > On Tue, Dec 23, 2025 at 11:02=E2=80=AFAM Beno=C3=AEt Monin <benoit.mo=
nin@bootlin.com> wrote:
> > >
> > > >  static const struct of_device_id eq5p_match_table[] =3D {
> > > >         { .compatible =3D "mobileye,eyeq5-olb", .data =3D &eq5p_eye=
q5_data },
> > > > +       { .compatible =3D "mobileye,eyeq6lplus-olb", .data =3D &eq5=
p_eyeq6lplus_data },
> > >
> > > Which patch can I find this new binding in? Or is it already upstream=
?
> >
> > In the same series, PATCH 02/13:
> >
> >   https://lore.kernel.org/all/20251223-eyeq6lplus-v2-2-cd1fd21d182c@boo=
tlin.com/
>
> Aha OK.
>
> Once I know 02/13 is ACKed and will be merged, maybe I can merge the pinc=
trl
> patches separately to the pinctrl tree? There doesn't seem to be any buil=
d-time
> dependency?

...and seeing Rob has ACKed it, what about I just merge patches 5+6 so we
get some traction in the patch set? These two patches look good to me.

Yours,
Linus Walleij

