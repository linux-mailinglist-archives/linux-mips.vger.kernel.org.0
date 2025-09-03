Return-Path: <linux-mips+bounces-10980-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B946B416B8
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 09:35:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E788B1B24A81
	for <lists+linux-mips@lfdr.de>; Wed,  3 Sep 2025 07:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1984D2DAFBA;
	Wed,  3 Sep 2025 07:34:58 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6862D3723;
	Wed,  3 Sep 2025 07:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756884898; cv=none; b=P85tx0XzRj83JnRAZqI3YF4ggquRSyx2O4pRFi+oBBkUIINE/OPmC+bCI8Ep6vlJ6YBHIU0FTtNjSHxJkIpY9FWrsW8Fkkj04u46CjKb6cVLJ0rKl+mNs8obo6ECOETKybXzdKbBmMJTQBBWiu9cRI7R70j1ehjRlLR9WJCW76E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756884898; c=relaxed/simple;
	bh=KVlTZD38YWzAz5smcQFmlr3HoJ9kXtqQrAAT9RQglt0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LApofj95We71e5ndDZ9r24gXHA12Noo6pwkEIVnfTVwCHNxt+kXl/pKZW7Cubb9jqkQtimnEEIPS6dpcexolhXq1EOFSW89ptziPJsGVIXvLvETI+KBwQ9ZnjpZYH/6InpQNAOBXaAxkoeTIC2J4WpnIGm0FNbR13XfdokUDrSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-89018e9f902so4007414241.0;
        Wed, 03 Sep 2025 00:34:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756884894; x=1757489694;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x+a63vXZQbYfBRMYForQk38b20jSe1QhqlF3QJeCGYE=;
        b=H7h/16BBtyCDgJVcnFXRsZwLRNsKIBWK27uDZX4kz+Rqv1Fb7INUkYg1dR0wTK9OMD
         14ifgqlGDV23KUcb7s2w7JOnLXrCaoiB19k49GAQIXhtGJ5l49Ky/cd0sUvnbUwBpc6U
         p50Yvc7xvA0WFvDOo2PeSPkmHbIe2PJjDiZiocDRBdnHNhYrL58aIT2tnVfrQfnRYKTP
         e7OMT0K7uyS28XdkOjEGEyMGxgcMMjdk5Q+U1JyP8RXj64fdJBpdjFPlTSqttN+sby+c
         aPKXdFOzSZqN/FNKTqF7lTjmqBUJrHB+M1gqdS2aKRPLIUGAeh4OCrZlG4YvMl5fHUiq
         iNgg==
X-Forwarded-Encrypted: i=1; AJvYcCU3JIa6D5Iu+YrsgmquoAiuc8wCbAJcPIrTeJakOZd3DB9ZymuDSCHGRBx0kV2CZd7J1XpkB1ENFfU7Eg==@vger.kernel.org, AJvYcCUNOsVisiTai9pnotb9GBypWli2UqgkjczVI7nadXodnZN7SMlLYLm4t2arZmwMNcFu/F74L5pGUgXIB3LiUs78@vger.kernel.org, AJvYcCUrRUAqmVUYNBKQ8XFcBgr7Xz9JJFyQl4m3Cr0S1nTPyVox/Djm1artGZQehX+yx3VH0r3bXCwgjjkc1Fg8@vger.kernel.org, AJvYcCWNHMwovblEEgZ29w5X9dcwrtr+87E1lxdGqD+yEaUu3BkQAnvr/EcFe8jVsZE8G0fWHUR0910+rWkudg==@vger.kernel.org, AJvYcCWV0/jMdPZfaLGvdOjJtTt1D53C2G10dlPf/EI66IfVIAXB4dNc+hIGzj4yciXS33TtaA1FbVjiAdW+BQ==@vger.kernel.org, AJvYcCX6+kRNkQXQNuKbU64Zed5oDf+1kEtLKWoLPExbH6/Xvkm0l73WDtrNzDaZxdaAU8+d+9/hhaYkhsU6MhNoOC72HSg=@vger.kernel.org, AJvYcCXUqebF7Yah2vuYefpO6RHyNibFUTRxROPmhwxGwupsx12ZbPRiyRnG4azaSpyjo9sjqrThwSiErhKXNrmM@vger.kernel.org
X-Gm-Message-State: AOJu0YxtxKPTSrwARzpp70oRUL+0M74vtKGd2blXB4LOHz/813nQ91+u
	EHahrlHbwhmb7JtVZB190Hl4G7ZNCJ3GhwG/3dNHGzbnWJ04XrnRC/WBVnehzOqJ
X-Gm-Gg: ASbGnctUsN9kc0/lMHPkFdKPUP0PvZkmLW8qvTIsOJ/tFmWEAkidSHvtP4NQyzRRxil
	Uc+1g6rSoQFs1WKx0+J5QaBuLSMDRyzW8gyRoqy0XBH0MkDQhXtQG7dPVc6ZS+PAf0/o889g+Te
	jgNltEukDad8lxYTVhSu/5LoBRzqLcf2jdsK5/zyR5CcisuEQPJK07ALSiIpK1vHTnlE1hGNw4I
	Eis0mGvBgnXiHiCaA1rbBn9vEfrFaCxN4xFaSmc2fw5PRPvPEE4/SusVeU4mnJhcnjDbnys6xZh
	CXc0Q3h3E+ewt79VW/hOyT3iQmiFb3G9YmuPYBDI+a9TQDSug6EENAloD7MK5cMGyVQd/9r/+MQ
	s09eZ7cpT/lssFkYwIuRYGoY6t6Lk25uW1Z/ijyhflAlBohw3bGKt1fOZBvberItyiWQ4a10=
X-Google-Smtp-Source: AGHT+IFHIzXjta1ZznlvNwCmz1eIPklS9AO9Hk51EkuX46q+KD0HMQNlWZKaK0NkhcwGmaAool3+Yw==
X-Received: by 2002:a05:6102:3ed3:b0:523:712d:448d with SMTP id ada2fe7eead31-52b1c76f54bmr5579343137.30.1756884894426;
        Wed, 03 Sep 2025 00:34:54 -0700 (PDT)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com. [209.85.222.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-52aef458d62sm5115684137.3.2025.09.03.00.34.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Sep 2025 00:34:54 -0700 (PDT)
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-89018e9f902so4007404241.0;
        Wed, 03 Sep 2025 00:34:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUXxVidC5cghRtB43RGCeEk8aH7eMEISQjtLegaaIebkBqS7sYT3E9fHiM6KkrF0GXV5PIr/WwbUlZjEQ==@vger.kernel.org, AJvYcCUdRhtCCdhuswhL6cqZEv82KI4zKphb7guaz1rIVFkT5Z38DbdvIL95O5c/edsw4B94ooJWH1ehAakJ6jaH7265QSI=@vger.kernel.org, AJvYcCVPD7bKp1iGk8Lo0TvL1avJ+3QRDZFCQtA5QCv9xZRQeqNYPU/ZyOFPYb19GNBzYzmDP3ahh6kuCj26fw==@vger.kernel.org, AJvYcCWGaF4LjDcFyRtckjJH01fmt8R7NSZEvj5HnpNBQQaa8Ri973sNgqPiA/Q4oXONxJyILvaosUCg5KVdsw==@vger.kernel.org, AJvYcCWSF11VAMrEpqiERVyHLnzQ49a+SoF7Cfk0LD7iwbQpcp1ecEGi2ndsDXhzQXehhf0cdXJ+QSA4gTlnBd6m@vger.kernel.org, AJvYcCWmBFrC7BZ7kh69nPMNOCDkWQVmk37RpbLXxCM+b4rOm8Qp4hq5fXISztNRM4KzL4gW6/BOvKm23lTjKp26@vger.kernel.org, AJvYcCXkpSNuVWaweTiRbRQx+xNs7saExHyUY12h6jkwMKszA5gHLlUzxN0gXt/j81qyZrGBjQVg6OqmoS6qitACZyt+@vger.kernel.org
X-Received: by 2002:a05:6102:3581:b0:524:5266:f74c with SMTP id
 ada2fe7eead31-52b1c8811fdmr4486002137.31.1756884894118; Wed, 03 Sep 2025
 00:34:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-16-bb091daedc52@linaro.org>
 <aLcBcjvMbrxoDYoC@smile.fi.intel.com> <CAMRc=MfcFMgkNqWNZV5o0NxkAvxBTjC3vv56Cr98n0R2CkxuPw@mail.gmail.com>
 <CAHp75VcgaqnDrPH27wxfgyK6zz4RAKJQB0r7G2vbTONTxkEzTw@mail.gmail.com>
In-Reply-To: <CAHp75VcgaqnDrPH27wxfgyK6zz4RAKJQB0r7G2vbTONTxkEzTw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Sep 2025 09:34:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUd1PeUbdkmrhaFstknwP2x=03m24gacJBJgEeCDf7toQ@mail.gmail.com>
X-Gm-Features: Ac12FXyh8sb0bID330gK0HQPUvNSBJ0mn18x9ggidNhkopon3DqspiWAPKYplC8
Message-ID: <CAMuHMdUd1PeUbdkmrhaFstknwP2x=03m24gacJBJgEeCDf7toQ@mail.gmail.com>
Subject: Re: [PATCH v7 16/16] pinctrl: qcom: make the pinmuxing strict
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Tue, 2 Sept 2025 at 22:46, Andy Shevchenko <andy.shevchenko@gmail.com> w=
rote:
> On Tue, Sep 2, 2025 at 8:42=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
> > On Tue, Sep 2, 2025 at 4:38=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > > How does this keep (or allow) I=E6=B6=8E generic recovery mechanism t=
o work?
> >
> > What even is the "generic recovery mechanism"? That's the first time
> > I'm hearing this name.
>
> "I=C2=B2C generic recovery mechanism" (I dunno why you put away the I=C2=
=B2C keyword).

Your original email had:

    Content-Type: text/plain; charset=3Diso-8859-1

Bartosz' has:

    Content-Type: text/plain; charset=3D"UTF-8"

Note that the Gmail web interface does show me the Kanji character
instead of the intended "=C2=B2C".

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

