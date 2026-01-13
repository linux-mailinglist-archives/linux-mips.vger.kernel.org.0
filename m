Return-Path: <linux-mips+bounces-12887-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4E0D16D7C
	for <lists+linux-mips@lfdr.de>; Tue, 13 Jan 2026 07:30:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2379B302A38A
	for <lists+linux-mips@lfdr.de>; Tue, 13 Jan 2026 06:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA6C366571;
	Tue, 13 Jan 2026 06:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QtrD6kXt"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478DB36828E
	for <linux-mips@vger.kernel.org>; Tue, 13 Jan 2026 06:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768285737; cv=none; b=OHat9R5cycQsM5eloYe2D0S8GPOfzf6O5KL5Ai3TnAB/MPfyME7KSfPob4V5Sb+a1fmBxpi9rZuNJbENIJOmWbSOdFq1FMfkMkYzgZG++ociKkGMzh4u9dsK7O0bGfDwTfw3mBK/mGCIO74wO3/R+cDsWSO3cwgT11TmV+gqfWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768285737; c=relaxed/simple;
	bh=49Xtuu1beNUg9QlwNiHN6EBbAr4oftfRASjMhDj6J/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O7b3jnVe048qPSIiAGNs/uN/4W6RW3AdkZd+eeiRdQ4FBghCoIQ/W/bLyKSk6gSY1E4wKctyzFPZR6fvsBbQeQ+NyIXn2Zm7FFCPlIqjDgPmsVGA1UfiQ+P0j4sdKasLFlq0h3Sx4btYCo75cRsnNbXEF2bkpvsqVWUbwS0z6N4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QtrD6kXt; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-382f9930e54so43891421fa.1
        for <linux-mips@vger.kernel.org>; Mon, 12 Jan 2026 22:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768285734; x=1768890534; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JiUmV1eprmnhg37r9cMuLPaBFu+xlgYzvvvG7aZcdkk=;
        b=QtrD6kXtgDPukrxP/rH1IgFE5ZR8VwmNR4vA6G7gppucdNYoxYVIHf6rDmVi59m7B8
         qhrqcuXP1/2Tc9jr/Ihp9T94WyllHVUj92E0xJZ8Mx3oqsZePHHeepmURRFmKvAME2gQ
         1vVP6RXFt+cg2BBSAmH+9pLBs9p0uLVfX+BdZueiWkWb2ZUa0jwdMkdHXoh3uom9sH87
         FCitru2fghHG7tAB0OHlslGsZHW+nhIbgzz8S15+takbiYy0kynnHmT9twdY8mB3J9gE
         iLXImB9ySbP6Q9is9UuqlwiPV9A8sJ67UO6pk8JcVNHbsvZ3rUjgUEZ+aocWZI4oD16U
         IeXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768285734; x=1768890534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JiUmV1eprmnhg37r9cMuLPaBFu+xlgYzvvvG7aZcdkk=;
        b=DQs3RaY4hr5wdn3YaOJjygGlBCIJFH+IJ9G3jzXs9tprvzFxZqt5cVwQ2gM+GMXm6x
         T31G4ihbZztTCdoghoceMgpi6Y9AWrhG7XOgDww/oGofWQilJKUBBqdeuaDdt+gJGZyv
         hfaHSZpKl3OL6Dflhiw6xCt1KYt8eMhXWsR/uwT/UVmIoxTeElgYL93BzG3S+YGZAB0c
         xM1uPkrQvTJMTJz9t75H2hLjQepvfa/oMEZt4kgNaNoe+F+iYxGJsEWFsaZO6f27EmZQ
         MBM/WlVgn2w1PaILxyArJY54AvKW+3x0lQo3ppFnDKW9ymH4uHJvmuuzbYdPplfIDDCI
         Gn/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWbgyxENrvZlux/yAF5SAlkS4lExEbqZjn6sqd4jVMFzv8/J8QL1qeAF8uzLpYcaZ8ECj7Ig/I+rBV7@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/UsX09wNLhTakZcqQ+thM0xFWFZtDYV8MI6SrKxkxF/xFkGar
	8zlaS/JF374avErmFO9mgRIk6joPkQfRRXJ9hCA+cTioo+lGAQYdUDcLwkc8nMw2+0cFsVLkg3w
	kNdPXI/+tIv4sNymidun7LafrwJbmuJ4=
X-Gm-Gg: AY/fxX7Ll5qkoIM1dmNnDJokJrIPTrIRQvC38UammOu4A1BiAybCLbkg4rgrcmezIci
	fd2XtM8Cl6Qha2CBPYmYnMPtsZFOsS1UxprWq5wp34okAFkEs/fL+GRGaQtj5NhTvPPQE7bwY1J
	zTzJxjhbuhT9VARiLvfiHPlVDdl/au5I+xPtH8h0p/kRY9ksqqe5vkPGZFI6COO19Vhr/1/6TKj
	9Bfu83yZpFI8+QGzIRT8mN8k1l4g50ltKbaq3LGHOInFZXoW7QpV8XYodoHPGLqKD8wvowQtdB2
	mw/hL0g06sF5uDuIru/70dncQ1iCiTUmzgYY6v2ftsGTvrmGYWVyxBZ4jJ6qYtPdt0p6
X-Received: by 2002:a05:651c:31d2:b0:382:fccd:f99b with SMTP id
 38308e7fff4ca-38350c03886mr5317011fa.15.1768285734277; Mon, 12 Jan 2026
 22:28:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260108-clk-divider-round-rate-v1-0-535a3ed73bf3@redhat.com> <20260108-clk-divider-round-rate-v1-9-535a3ed73bf3@redhat.com>
In-Reply-To: <20260108-clk-divider-round-rate-v1-9-535a3ed73bf3@redhat.com>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Tue, 13 Jan 2026 14:28:17 +0800
X-Gm-Features: AZwV_QjXA3_FExPm1PeZJleY4KCWVtWfl5lLiACQHtAnheJostrobrRWjaNB7bU
Message-ID: <CAJhJPsXG_UKnVk7RypkKuM8M87+1DNvJND1PRxoPVzAm=P2Rbg@mail.gmail.com>
Subject: Re: [PATCH 09/27] clk: loongson1: convert from divider_round_rate()
 to divider_determine_rate()
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Reviewed-by: Keguang Zhang <keguang.zhang@gmail.com>
Tested-by: Keguang Zhang <keguang.zhang@gmail.com> # on LS1B & LS1C

On Fri, Jan 9, 2026 at 5:17=E2=80=AFAM Brian Masney <bmasney@redhat.com> wr=
ote:
>
> The divider_round_rate() function is now deprecated, so let's migrate
> to divider_determine_rate() instead so that this deprecated API can be
> removed.
>
> Note that when the main function itself was migrated to use
> determine_rate, this was mistakenly converted to:
>
>     req->rate =3D divider_round_rate(...)
>
> This is invalid in the case when an error occurs since it can set the
> rate to a negative value.
>
> Fixes: bb40a2ef4fc9 ("clk: loongson1: convert from round_rate() to determ=
ine_rate()")
> Signed-off-by: Brian Masney <bmasney@redhat.com>
>
> ---
> To: Keguang Zhang <keguang.zhang@gmail.com>
> Cc: linux-mips@vger.kernel.org
> ---
>  drivers/clk/clk-loongson1.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/clk/clk-loongson1.c b/drivers/clk/clk-loongson1.c
> index f9f060d08a5fae3291a9408c6dc93531b435609f..1674181a1107dc4f30e78ee41=
0a55a49b6d0b4b5 100644
> --- a/drivers/clk/clk-loongson1.c
> +++ b/drivers/clk/clk-loongson1.c
> @@ -99,10 +99,7 @@ static int ls1x_divider_determine_rate(struct clk_hw *=
hw,
>         struct ls1x_clk *ls1x_clk =3D to_ls1x_clk(hw);
>         const struct ls1x_clk_div_data *d =3D ls1x_clk->data;
>
> -       req->rate =3D divider_round_rate(hw, req->rate, &req->best_parent=
_rate,
> -                                      d->table, d->width, d->flags);
> -
> -       return 0;
> +       return divider_determine_rate(hw, req, d->table, d->width, d->fla=
gs);
>  }
>
>  static int ls1x_divider_set_rate(struct clk_hw *hw, unsigned long rate,
>
> --
> 2.52.0
>


--=20
Best regards,

Keguang Zhang

