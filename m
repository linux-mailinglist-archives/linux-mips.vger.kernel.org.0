Return-Path: <linux-mips+bounces-9197-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8D8AD22B9
	for <lists+linux-mips@lfdr.de>; Mon,  9 Jun 2025 17:44:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62E263B1ED9
	for <lists+linux-mips@lfdr.de>; Mon,  9 Jun 2025 15:43:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31FA420B80A;
	Mon,  9 Jun 2025 15:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nBIRYmaJ"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06C320125F
	for <linux-mips@vger.kernel.org>; Mon,  9 Jun 2025 15:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749483810; cv=none; b=k8TXHNOpCEqau17DSaF9ey6JlNEXJ8t7FnI68oeFXCX8MIaiHrVuqiY3eWLF7YrVb0PMn6A7L+/i1sg9/gArWMlU4O3E2wyPHQYvnC9iSUECP/DQzlVMI3DC21rg4babkhYbXzzf54nvohgK8zn9VSZM/PUVx0Vuw33oiGjC8jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749483810; c=relaxed/simple;
	bh=MF8URYVd6paFLRNZA/wbEoqFzCWsn4Uq07b2eMDDSJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Raybhx2sQfJvE6j23lGMGDC958L5+X/PkDYHI/DdhEuQHv9xlskXuMLpFFYzQJFf1YnnEJmKp/DQrOa1+W00mNDrMSl36sUBFyvEOxbmPCxmbxncGC8LX1zsBhrtnogspC1gI06K7rgA4GWNx9wGho0VlbZjYy9wumT3yh2fMaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nBIRYmaJ; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7426c44e014so3750370b3a.3
        for <linux-mips@vger.kernel.org>; Mon, 09 Jun 2025 08:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1749483808; x=1750088608; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dJ6X8dIYmppUXPR9jjYjN7eoEUwVzbFBocT4G4uDz9M=;
        b=nBIRYmaJ5Wz2TJG1DapSyBDzy35UzS6K7dMSKQnl7Knn05Bryk5ScGCvqg6T4fA9y/
         isY7VkyMvoQ9mlxRNHAuIb6EwnsC6JEY8OoNtWzMAHp5lEWbI/iUjD7Frr+fQVMmWiDP
         to2gNy9K4p7wpkgKjGUdUStL1UVdPLamtfARM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749483808; x=1750088608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dJ6X8dIYmppUXPR9jjYjN7eoEUwVzbFBocT4G4uDz9M=;
        b=kdXuP+yNS7j7ez/jLodcTo07FkQ/7f3aQ+I9izVkO01a2ySO+MOMz0qCDEXfXER7Ya
         elxmeVfmMHuQSxjGFNdOPXKOXsWXhQtTNhUZVTk+OEFlK4GiKenosMZruHEMQ82qlg6d
         PL6oCVXNBqgaJFgE3ATQ8JHWsyMz+NFNa1opJvFKqCOsk74zHh0roi7HQhfOnIPxKr9n
         XEsPja2jxOesVUChZIjkNq2vi3TBoc0/SSV8jgxQj5XaFul9oLlTVBcXN34cIy0yI30T
         0CySL6kCLQitVyyKyv0+nptlyl6TLfTd67IMOcHHwILqMDFEuj9LMU4GZs7DSY9JODvR
         IYvg==
X-Forwarded-Encrypted: i=1; AJvYcCVJcTCkOwcvgjhR5JfumO4qeBBGPkk/0r621PJKH7EY1JG3vZ4kZ2vpTVidk9ZOILCDwkqxBWM2zCe2@vger.kernel.org
X-Gm-Message-State: AOJu0Yyjo1B0G57viq+KWNlhC63KPFmud57Apdy11lX24XF4gSNoXia0
	39YRP2g5+C0C53e4rQ9MMx7G9Xm1tKsmyOYRFxxJVV5eLiyrNRLfK/6v0FJ5RbeWkMEVPPTdOfr
	8OiI=
X-Gm-Gg: ASbGncuAO0vDYwRZ3G11UfAolkBF/MH5DFUEQ2+OiHIaQaPbZHRNYslSG2ZPaQtNmrp
	IoJnF3ZP3+uv3Z82/eF5VGFLU75j8+Xwk3hzWQGtwQj7/FtWmKFHNplrEyQt10j2kW9EVHChCb2
	mHobSi8FgIvYv4uaXxF3aGDyOhnyLqqPJDkO5fkEzYEzEykag8pyKHMEJoje0B959hs5hg9OC79
	nVaTSBqDYTJTZ6jpzDHSUFezq+pqksIBuJx8WkkQBfhDvPClpgds9H5xYAUiQ4QMdeL2N1SQ1ta
	tICUUNYJ+N0Mzc/ix3GVsHZH+dqn9gMtwNGcvvumhTUq65rhavsmmAvcyT8BFgpkSMWviWkYXPF
	tm7MGCRZPpGNpphc=
X-Google-Smtp-Source: AGHT+IEQTpvFxvKU4vMHCHUl5p6dtHXsQhcVIISXzUCgUohQRPTBMH+benZD5UCtvA5QjYMG82XJwQ==
X-Received: by 2002:a05:6a00:1a8d:b0:73e:2d76:9eb1 with SMTP id d2e1a72fcca58-74827e80628mr17602084b3a.10.1749483807966;
        Mon, 09 Jun 2025 08:43:27 -0700 (PDT)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com. [209.85.216.53])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0c0613sm5866009b3a.122.2025.06.09.08.43.27
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jun 2025 08:43:27 -0700 (PDT)
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3138b2f0249so802513a91.2
        for <linux-mips@vger.kernel.org>; Mon, 09 Jun 2025 08:43:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUY0t30c6VjImVDczvrdU4AaRgniz6Kx/FQEfRT1R85Chxyhr/q7eUP2KBCVcsIZQPYPWXCZHQZ9umw@vger.kernel.org
X-Received: by 2002:a17:90b:4c4e:b0:313:27e5:7ff1 with SMTP id
 98e67ed59e1d1-313472d3204mr17932741a91.1.1749483806734; Mon, 09 Jun 2025
 08:43:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250218-aux-device-create-helper-v4-0-c3d7dfdea2e6@baylibre.com>
 <20250218-aux-device-create-helper-v4-3-c3d7dfdea2e6@baylibre.com>
 <CAD=FV=Vb+Wb6wJ42jUBxVVNp9P87BiqHZgoY+Tw6W3fO==FF6g@mail.gmail.com> <1jmsahcbkv.fsf@starbuckisacylon.baylibre.com>
In-Reply-To: <1jmsahcbkv.fsf@starbuckisacylon.baylibre.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 9 Jun 2025 08:43:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WzN9Evge-v30NA64Q=QPJR8hkZAhmLXxDekXXFMFrd9g@mail.gmail.com>
X-Gm-Features: AX0GCFvkFbIIK7ULGaQhmTqdCQ0r1uM5Yw-QxUNG98qVpJtj4RBGOmfISaSOf8g
Message-ID: <CAD=FV=WzN9Evge-v30NA64Q=QPJR8hkZAhmLXxDekXXFMFrd9g@mail.gmail.com>
Subject: Re: [PATCH v4 3/8] drm/bridge: ti-sn65dsi86: use the auxiliary device
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Danilo Krummrich <dakr@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, 
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
	Gregory CLEMENT <gregory.clement@bootlin.com>, =?UTF-8?B?VGjDqW8gTGVicnVu?= <theo.lebrun@bootlin.com>, 
	Michael Turquette <mturquette@baylibre.com>, Abel Vesa <abelvesa@kernel.org>, 
	Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 9, 2025 at 6:02=E2=80=AFAM Jerome Brunet <jbrunet@baylibre.com>=
 wrote:
>
> On Tue 25 Feb 2025 at 08:04, Doug Anderson <dianders@chromium.org> wrote:
>
> > Hi,
> >
> > On Tue, Feb 18, 2025 at 11:30=E2=80=AFAM Jerome Brunet <jbrunet@baylibr=
e.com> wrote:
> >>
> >> The auxiliary device creation of this driver is simple enough to
> >> use the available auxiliary device creation helper.
> >>
> >> Use it and remove some boilerplate code.
> >>
> >> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> >> ---
> >>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 49 +++++---------------------=
---------
> >>  1 file changed, 7 insertions(+), 42 deletions(-)
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > I'll snooze this for a bunch of weeks and check back to see if this
> > can be landed in drm-misc-next every once in a while. If you notice
> > that drm-misc-next has the necessary patches before I do then feel
> > free to poke me and I'll commit it.
>
> Hi Doug,
>
> FYI, this is safe to take with v6.16-rc1.
> Please let know in case you prefer a resend.

Thanks for the reminder. Unfortunately, I still need to wait. This
patch will need to land through drm-misc-next and that doesn't have
v6.16-rc1 yet.

https://cgit.freedesktop.org/drm/drm-misc/

...presumably v6.16-rc1 will get merged in before too much longer.
I'll try to keep an eye on it.

-Doug

