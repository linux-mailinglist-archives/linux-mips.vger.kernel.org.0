Return-Path: <linux-mips+bounces-5714-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B95F9885EF
	for <lists+linux-mips@lfdr.de>; Fri, 27 Sep 2024 14:59:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3C0DD1C21957
	for <lists+linux-mips@lfdr.de>; Fri, 27 Sep 2024 12:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2FCB18CBF5;
	Fri, 27 Sep 2024 12:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5l74yFr"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5527D186606;
	Fri, 27 Sep 2024 12:59:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727441985; cv=none; b=RmJFNpIkz11xYz3/dQUVr7uZu1uD6RRWxTCJ5PFm0m7MhB8yerlqaVMZdyF0ON164JZsjnFeamOQxC5FFbt4V7g4dsFyrbZCTUjjbTlqFnV4H5HAHdDPDbJH2on3/RFPShJarxmlMaAGmDVpWRNSonnPgHFVA3zWjjk6gHUIZuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727441985; c=relaxed/simple;
	bh=1xzPtrP9WWBtWHwKXCw5RV2T+tvRkxZEb51Bi1KojTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CTy0xsc3Pu8uNBNGMBJpU2BQQZXWBYngdXqP6ZmH2PlUBHu6DoBntGBSZv+r6tbGzful4BFOIwl8lOWA+voyj3HN93FVRXyvM0bAQNd0w1OUPEjm/yQ18Sr+C7MTW8TnzkiUa81XX4dxZqiWSZa1FGyQQDBFaiCebuI16spgI+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i5l74yFr; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2e0a5088777so1370574a91.2;
        Fri, 27 Sep 2024 05:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727441984; x=1728046784; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5kRvQYqrDxlyQ/4IJ60voMIp6Qt/AmF1WSn0sGcC0t0=;
        b=i5l74yFrAArhpiXnmMJkf8YG6SLG9ckjgh8ItFifsYj8J683yBpgo0Kasy9aSYFnBJ
         +4hG9l8PTFGY81K5IgtcaLZZzm1WhLNlZ7AOeoCQ/dciCC8a1RyDMBI+IqbgpB32QvVU
         9kMcwZw5u177CqeOv0beQC9EwNN9T70rCzqoJp41BC1rM9ljPJwkUhuDQx/sPjZy8AnO
         uPXGx61FTJUDPjklFOtkZgEM+0AJq78c+briH71jAlbpJKmiu72rlca2M6nxGzKcyzf/
         ZEZjoP+6RKQyPOmOEJDTiENSBr0YjxdfUWN7iFLkxiN8Ztyfd2K1euVIuj+9BuL5cjbx
         ybVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727441984; x=1728046784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5kRvQYqrDxlyQ/4IJ60voMIp6Qt/AmF1WSn0sGcC0t0=;
        b=OeNCZsB7V03hrC8zLeEnYw/tICfJqMc0uEjSWDEGR67oToGCvwHU35gaR16TQZ/QN2
         ZpXUYkOnRaOSF0FQgRdoITvoQGEbr1YM/9MJ/QuDSXHOirrcWpjfLwDjT2seX3PFnsTC
         ESN6V0792zTEZ9tCzjON5Qb+ucdM/OaU8k4uUeRYMM+9z3rZCixz7C7huIqvlSPsmWyr
         UZ5UHsOvYKePEDtBOCpoKETG9ppLIk+9a0wsOKm6f4AHq4k5FAssM6BXoujfpWXR0Bxm
         0+Ikm93VY+zbDHt5Wir1CWQpDOqJRts2K0C4iPxtSbUSSKdPEEKbBHupeTYkRPaPAJ1P
         +Ldg==
X-Forwarded-Encrypted: i=1; AJvYcCU9wKycuJ+MiOd0CXbp0fwqzOUvZVGqVcilVmMOQDQYKsA5EdidU4IMPfKw1oKn70jk7FT+NsY1QQVR@vger.kernel.org, AJvYcCUMYsImxg+zafxQaOdKmqVJrOEGSC9fUswxP/BEAg37gqv2ljjpd9p7NfK+dnNSdsMBlfCEOCYCLSM1zDA=@vger.kernel.org, AJvYcCV+qbp6Rsuj5BtWyb9btolm/DyvfWnFbAubGJPew8oX+3X+v5yU6z61Lx1yArAGwWt5gymLWAYILuodpQ==@vger.kernel.org, AJvYcCV06DeS34jtGqQEWOv41OUKIhE4wVqo7VJQfTREH3BDSrBjPqtMPdynVXRooBZhuyy5wQe50m+Rf+hbriA34cKtkBE=@vger.kernel.org, AJvYcCXesp1RtOASJmWwW3Ztud60T1sXfeTwIwM/+PVa8+r81olielhWqeXuAD+3476gM9wfHdx28aDeMdfg0z5L@vger.kernel.org
X-Gm-Message-State: AOJu0YwgFr7pYAz4q1An8sMaK4qv/s4vnirTGuuMBbYF9ViOAQtoz/CS
	UuXEy1ZWx70p/4VWGZGknBz2nLl4DefyW8L+aEuFT++DAjt9V7xaP+sWF+cTeotxpy9YO884TjH
	NHRzSlVpwXTOGWxqV62SKsvKn1cE=
X-Google-Smtp-Source: AGHT+IHCtWkk/m0gIJI4HjMGIxf6HDCRDpOESUdGt/5A/Krn13z9jK+YnLyf6mEmoZB4cokgO5ouczhwAV6HyE5bjfY=
X-Received: by 2002:a17:90b:1896:b0:2de:ec70:837 with SMTP id
 98e67ed59e1d1-2e0b876f84bmr4254037a91.1.1727441983559; Fri, 27 Sep 2024
 05:59:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1727438777.git.geert+renesas@glider.be> <750d6ac7911aef9a461dca6d07e5c1fab6211ecb.1727438777.git.geert+renesas@glider.be>
 <0bd21761-a81f-494a-9934-877f24b7fe0a@kernel.org>
In-Reply-To: <0bd21761-a81f-494a-9934-877f24b7fe0a@kernel.org>
From: Adam Ford <aford173@gmail.com>
Date: Fri, 27 Sep 2024 07:59:32 -0500
Message-ID: <CAHCN7xKKs9mUvnqZaLE2gCsDau4QtZ706LLoYcS_47-U86-nfA@mail.gmail.com>
Subject: Re: [PATCH treewide 05/11] arm64: dts: renesas: beacon-renesom:
 Switch to mic-det-gpios
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Paul Cercueil <paul@crapouillou.net>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Shengjiu Wang <shengjiu.wang@gmail.com>, 
	Xiubo Li <Xiubo.Lee@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Adrien Grassein <adrien.grassein@gmail.com>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-mips@vger.kernel.org, 
	alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 7:56=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 27/09/2024 14:42, Geert Uytterhoeven wrote:
> > Replace the deprecated "mic-det-gpio" property by "mic-det-gpios" in
> > Audio Graph Card device nodes.

Thanks!

> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  arch/arm64/boot/dts/renesas/beacon-renesom-baseboard.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Adam Ford <aford173@gmail.com>

>
> Best regards,
> Krzysztof
>

