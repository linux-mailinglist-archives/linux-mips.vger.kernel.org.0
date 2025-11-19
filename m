Return-Path: <linux-mips+bounces-12298-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7F7C6F813
	for <lists+linux-mips@lfdr.de>; Wed, 19 Nov 2025 16:04:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5D13B4F97B9
	for <lists+linux-mips@lfdr.de>; Wed, 19 Nov 2025 14:51:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 586C332FA27;
	Wed, 19 Nov 2025 14:48:44 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35C753538BD
	for <linux-mips@vger.kernel.org>; Wed, 19 Nov 2025 14:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763563724; cv=none; b=HkOaGDhaL8o8HvlB0tfz5tWr6fGNLemKyAbw67jGlCPXjcJtaTF9RUhniYkn7ijO46BHCknwo7X70Jm5GlEwZpwdfJQUSPEKoO+z9iTELLauoQIe0bdReqKNDn6+fXZ3l/LnuA0LqAhLCOnVa0Ro+GT3QM+wbSIWaLZoVnjew0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763563724; c=relaxed/simple;
	bh=tN4N7vuK4JJ0rterP05amy6D7j/6Qj9sv/6YKc8hKYg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gctktlsRnUfEf38gwWkmGAZ59QGjee+8kACOykdMBB/YqGjmhFNOcjNHETPrs6xlvI0nL3zq9bvKlVmvmiX4jg/gsdKQ+C6Li9iqKZ2EUNEt4WbRJ4pMoFzxUZU/G9Ks4Y6G8+IYAyP7IIE7prXDty1eUElC1z2jl6SX4zelkGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5957753e0efso7114231e87.1
        for <linux-mips@vger.kernel.org>; Wed, 19 Nov 2025 06:48:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763563719; x=1764168519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U4rPsaXkkkPPqP8F89aStRjGcZr5tE7ulQ3b9FN2Uak=;
        b=JmBJ7rKq3qYFGIHspY/2+u7eYh9gLVZRwPN3p3UdXqj4nWZKWAeqVAC/fX3iGjzXAv
         3XvNY1JtfqemipgmJyke32gscAUMbQVILHdXjT8L567WfgRcGLLUtEj1jMcTYvB3IQF7
         4+qo8u/vPFgZY3Y7WfbFJ/5vMwLVzjPMm+DBYqN7Yci4WG+rAZTiTjRwi2ji2DoMce+8
         vBz7MFLhp5G93EAL5MA4WtjjS/Ip/0W34oQuO5bdaU9iytH52p6J9QHmtxRIF5imSh8D
         fxYH5Bzr5NoM+T80d3uc+rVPC+VJ8r9w60LHBxWI/DiNlF/xCnoMjVluEbaGdCFFm2DB
         lb3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWJdliCvvZ4qH6Tw99JpsTK7IotJk8aBe1LEeMAbI9M3VL7ervVQqDHvOCZMrFnqNzBCXuDAqQS3PVV@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg3TEoRuLOO5+ERVfNcQOBfHlHyU88MMWljFY9WzeEn5IAnTHV
	WSIkcFV4SFO3MMPMfljsASpJySrv1QfZ2vRWdQEL/QhAmEeCa5NwdfH3o+WzGCXY
X-Gm-Gg: ASbGncuvyQ++5HGdc4VCsUYKowU/TMe/Rl4/tPlYdYHrOtAriBOsGVN2e6ahJ8/prG/
	d4XgUY9nAWvYPAqeLi34nz4uKRTnfbs7djclGMC4g3Mxo5sAXCKkLvSws6cGZicbLl2z5nK7gj6
	PrC48ickjxZHOT3M7qYPRkPLpi0aUdzO4aaGF+/GevWAau5tpyQiR4IJh8CdMWlIIYDflMpb7GH
	wXf60QiXwjWiafMaz9S0396U/6OE5BUChr20JGjmOo8fY9dkQQhk9dsDA4mr2TlstZ4t0/w8JCo
	s4Csgg+b1C6eSNrKbTbDd/qa8HqJDxXQPGfnLOUPxU6zru7N6UgaB8SygBEd1kbo2NPAfct1k8b
	GXTJXOw/xuSl1PvDYVnyOHsxAXnJnVwQ6MoQaAc32n4u0uSfV7kyv4DnCAhL6L2zcVMOlzUbkLN
	Shug3NONhpsUvGVq56rewmLRkkVjc1cLOFgdvpzMjrUL0=
X-Google-Smtp-Source: AGHT+IEN3Nn8drp+pbVtoRxTTLD+bpfoAsKwKgIqkxcfkBF6gwLLeQfMNZVbgfkpUQN2Y7lxXZtnhw==
X-Received: by 2002:a05:6512:3b1e:b0:595:7854:af77 with SMTP id 2adb3069b0e04-595841b5442mr6893971e87.22.1763563719133;
        Wed, 19 Nov 2025 06:48:39 -0800 (PST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b77e5sm4681480e87.42.2025.11.19.06.48.39
        for <linux-mips@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 06:48:39 -0800 (PST)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-37ba5af5951so61987851fa.1
        for <linux-mips@vger.kernel.org>; Wed, 19 Nov 2025 06:48:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUF/xKy1UN7BUa8Ric3J7Sv7zfzCKpIdoC/nCnFV9wm296OHGMFuWr8J6dtrQrP+HepJdojJ2v2xlBU@vger.kernel.org
X-Received: by 2002:a2e:9ace:0:b0:372:904d:add4 with SMTP id
 38308e7fff4ca-37babd35f8amr45635351fa.28.1763563413779; Wed, 19 Nov 2025
 06:43:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aR2V0Kib7j0L4FNN@shell.armlinux.org.uk> <E1vLf2U-0000000FMN2-0SLg@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vLf2U-0000000FMN2-0SLg@rmk-PC.armlinux.org.uk>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 19 Nov 2025 22:43:18 +0800
X-Gmail-Original-Message-ID: <CAGb2v65syu47YAy8-24LDXt1MC2K7r+weOyCWn5fZzRgSFhnDA@mail.gmail.com>
X-Gm-Features: AWmQ_bnEwqpydG-ZRtqWc8I4l30DitJuwNrACYzTdhyRCjLGsAnpeFb-cKD8BLA
Message-ID: <CAGb2v65syu47YAy8-24LDXt1MC2K7r+weOyCWn5fZzRgSFhnDA@mail.gmail.com>
Subject: Re: [PATCH net-next 1/3] net: stmmac: pass struct device to
 init()/exit() methods
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Drew Fustini <fustini@kernel.org>, 
	Eric Dumazet <edumazet@google.com>, Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jakub Kicinski <kuba@kernel.org>, Jan Petrous <jan.petrous@oss.nxp.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, s32@nxp.com, 
	Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 6:04=E2=80=AFPM Russell King (Oracle)
<rmk+kernel@armlinux.org.uk> wrote:
>
> As struct plat_stmmacenet_data is not platform_device specific, pass
> a struct device into the init() and exit() methods to allow them to
> become independent of the underlying device.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-anarion.c   |  4 +--
>  .../ethernet/stmicro/stmmac/dwmac-eic7700.c   |  4 +--
>  .../ethernet/stmicro/stmmac/dwmac-loongson1.c | 12 ++++----
>  .../stmicro/stmmac/dwmac-renesas-gbeth.c      |  4 +--
>  .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 14 +++++-----
>  .../ethernet/stmicro/stmmac/dwmac-socfpga.c   |  2 +-
>  .../net/ethernet/stmicro/stmmac/dwmac-sti.c   |  4 +--


>  .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 10 +++----
>  .../net/ethernet/stmicro/stmmac/dwmac-sunxi.c |  4 +--

For sun8i / sunxi,

Acked-by: Chen-Yu Tsai <wens@kernel.org>

>  .../net/ethernet/stmicro/stmmac/dwmac-thead.c |  2 +-
>  .../ethernet/stmicro/stmmac/stmmac_platform.c | 28 ++++++++++---------
>  include/linux/stmmac.h                        |  4 +--
>  12 files changed, 47 insertions(+), 45 deletions(-)

