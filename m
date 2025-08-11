Return-Path: <linux-mips+bounces-10049-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 229F1B200C9
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 09:51:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44DAC175FA5
	for <lists+linux-mips@lfdr.de>; Mon, 11 Aug 2025 07:51:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B06222D879D;
	Mon, 11 Aug 2025 07:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZV0jLXX5"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E848214812;
	Mon, 11 Aug 2025 07:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754898698; cv=none; b=DBAZRQC6rkc6du7QyBrsoRyW/O+RK3ezLnC2nez81BNy6X4g7gWWNlCNKS9jdQdFRp0+K230AiMp7rnsq+GTCWCyY7zH3rPk6a5N03CnF6A9YZt6HpAmDc4PiUfeRvPet6UnO3vXpti9btDnVMEqB3LeN/zp70brbh1in2fSX28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754898698; c=relaxed/simple;
	bh=eDYhdFkvDEKMSCUBsqX/ZY/pLN/yh/QrTwDSJZUjOMk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MTB4a0Wx7V0B9q5wPVxNotPq5zdG7bbycUFUj3CsBnLlzARh75w0PMHns7YqOVSv3g3b/NL5enxyWV4UCE/Pn1ktR7jqTs0OPfAKHu1cFf8WLYVQz/13RGm+ON93C2mEvFNcdcRUC+nmw8p16k380ltooJgmSLzHhcDgFa85CQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZV0jLXX5; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-31f325c1bc1so3536823a91.1;
        Mon, 11 Aug 2025 00:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754898695; x=1755503495; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t3xRtr6M1P9wX7tV81cfWikdjjexqfGZcN2hcrfLYYQ=;
        b=ZV0jLXX5HfF/Ht0swvY0inp5EzLKOpyohJ46AtZRNSPEXGLfUPCRnrghabMs3seMuJ
         ORz4vpLibruMygMFK0jHmPnSHwoqKGpROJOKlWl0y94g7c+8fSPBW/aKZfPJksMwnRSQ
         Iq3xvHMgi7HLBf7Q/eGUoqW3l3fzOgTotj3GRtb7KllmMB0ouvFExfvTTspJg7LLaFbD
         Ut00B9ne+VHFA+Y9ykeIkW78TmhS/0rxk2wkJRoKxYlOQ7dq13jSlzNatBJdKV9hxO2t
         0fs0YjvWoA+TPGOnjjQbYvoKbFA8PlmqJtBW5zbBcOrsiM8cGOSovsOXIXCppzBBjS2G
         wy8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754898695; x=1755503495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t3xRtr6M1P9wX7tV81cfWikdjjexqfGZcN2hcrfLYYQ=;
        b=qfRPxPy/9saxQ89s9rAN1qplxs+xtdsqwtC63m6OzLKIwMCKBU7ImeTnvssf+EBE5N
         vJx4E4JKLzsEBAL0b+yPQAkETm5Xro3DH7FhIRnlUGBobgQeZSoSuXQwKaJcs7bm5Jtt
         JBNYcHLEVaEQbz1BXG/yH0ypMnjKEpsew0AIcw1hrJEJbhlor9S7BiSahN+iHFSabIQM
         YtVokVMtmkJLCebHsBBq1Ng4qCAEMx13iHPHzFog+4Y4KKVmGCXX7xqWtyu02r0Vens7
         UIzpsMzuPekQFLeJ/dC9/9q66X7fj11+hqGABmRHl1D/3I89iiqdQpBOyrkal2XtOS2n
         rshg==
X-Forwarded-Encrypted: i=1; AJvYcCVHLjHQLzEvhOGOcOkY6lNxrKZiaEgQSUCaRzUVrKMCw/H/w3ib87GJBZ+OzuwAbP2Ufd50hFliIStSvQ==@vger.kernel.org, AJvYcCWUQA1AyWnPpbfrN69T6viioJ0Nv3wTuHbCSJF4MgHwdG00GdRSbQuBv0QBofL9gm4mgw+VxVxIbL0=@vger.kernel.org, AJvYcCX+s3flOFj6AEbe0kQwmM9jOtRe7neOumoGyZbr0+HlzO73Lp9Df8IoJE3RpsBkcoHF2xjk6fiOsVxF25Mr@vger.kernel.org
X-Gm-Message-State: AOJu0YwTti8Zww3MnU6sU7Vo+TKUcOPN7TueC3daVbzJUMPR4B1SJZ+g
	aUit0iKTRFhWzamaxNUn+Rab6xq5LDRGIsroqWTQtp44uOzojeO0YjrIlX2XxeLcm91r02PczjH
	V2yUoqf9+x5TPyuqzUgH0pAwjfArzmxc=
X-Gm-Gg: ASbGnctfMyF6NLaqOg70SosoQrO2aV/OvUzUqdY+zlViKbwSRfO/Z3dWKJwyKN3R8Ju
	uZ7W8GrC5CGiIZuO8MdZtzTScydggTBPYPzxj8pDSLdOqGV/ZJvUv8S/m6eGPJjgudFlfE2KlLA
	NzfGIjbhVsah/Kz0qba9Uhyi+M5YJIOrQCCDU6l52E8GfZkMdULqZ5ejBjRaLOT4W/xPK5yalHQ
	+TjWwELOr5TsiR7/WCQqTHfT1xTJ9uI4VsAgf/lsw==
X-Google-Smtp-Source: AGHT+IFoI4O7db2aWyY9WfND40nRAMadxahx9od9MPZOHjzWuSx6zjin2h/26ZiK9wrc6AfNeWR34nP/gxzbBL4IpaY=
X-Received: by 2002:a17:90b:2d8c:b0:31f:36da:3f85 with SMTP id
 98e67ed59e1d1-32183b3f091mr19910930a91.17.1754898695275; Mon, 11 Aug 2025
 00:51:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250810-mips-round-rate-v1-1-54e424c520dd@redhat.com>
In-Reply-To: <20250810-mips-round-rate-v1-1-54e424c520dd@redhat.com>
From: Manuel Lauss <manuel.lauss@gmail.com>
Date: Mon, 11 Aug 2025 09:50:58 +0200
X-Gm-Features: Ac12FXy8qu7moTdWXMrS4YcI0u2cSYYyLSaH29X5-uJyViANWfUfyggPhoPIvi4
Message-ID: <CAOLZvyHqkBA_=xFSXFrnWX9O_82LV0xi9UEeSSA3ZgDXaNTpAg@mail.gmail.com>
Subject: Re: [PATCH] MIPS: Alchemy: convert from round_rate() to determine_rate()
To: Brian Masney <bmasney@redhat.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Maxime Ripard <mripard@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Aug 11, 2025 at 12:30=E2=80=AFAM Brian Masney <bmasney@redhat.com> =
wrote:
[...]
>  arch/mips/alchemy/common/clock.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/arch/mips/alchemy/common/clock.c b/arch/mips/alchemy/common/=
clock.c
> index 6c8996e20a7ddc4ddaf924fc43a98c882c4110f7..551b0d21d9dc4b67d9909c030=
5db659daa8e84d9 100644
> --- a/arch/mips/alchemy/common/clock.c
> +++ b/arch/mips/alchemy/common/clock.c
> @@ -211,30 +211,34 @@ static int alchemy_clk_aux_setr(struct clk_hw *hw,
>         return 0;
>  }
>
> -static long alchemy_clk_aux_roundr(struct clk_hw *hw,
> -                                           unsigned long rate,
> -                                           unsigned long *parent_rate)
> +static int alchemy_clk_aux_determine_rate(struct clk_hw *hw,
> +                                         struct clk_rate_request *req)
>  {
>         struct alchemy_auxpll_clk *a =3D to_auxpll_clk(hw);
>         unsigned long mult;
>
> -       if (!rate || !*parent_rate)
> +       if (!req->rate || !req->best_parent_rate) {
> +               req->rate =3D 0;
> +
>                 return 0;
> +       }
>
> -       mult =3D rate / (*parent_rate);
> +       mult =3D req->rate / req->best_parent_rate;
>
>         if (mult && (mult < 7))
>                 mult =3D 7;
>         if (mult > a->maxmult)
>                 mult =3D a->maxmult;
>
> -       return (*parent_rate) * mult;
> +       req->rate =3D req->best_parent_rate * mult;
> +
> +       return 0;
>  }
>
>  static const struct clk_ops alchemy_clkops_aux =3D {
>         .recalc_rate    =3D alchemy_clk_aux_recalc,
>         .set_rate       =3D alchemy_clk_aux_setr,
> -       .round_rate     =3D alchemy_clk_aux_roundr,
> +       .determine_rate =3D alchemy_clk_aux_determine_rate,
>  };
>
>  static struct clk __init *alchemy_clk_setup_aux(const char *parent_name,
>
> ---

I've run-tested this on an Alchemy DB1300 board, and it works just fine.
In case it matters:
Tested-by: Manuel Lauss <manuel.lauss@gmail.com>

Thanks!
     Manuel

