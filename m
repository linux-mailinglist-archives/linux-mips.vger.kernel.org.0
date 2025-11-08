Return-Path: <linux-mips+bounces-12151-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 38535C42CCE
	for <lists+linux-mips@lfdr.de>; Sat, 08 Nov 2025 13:31:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BAD8F349B83
	for <lists+linux-mips@lfdr.de>; Sat,  8 Nov 2025 12:31:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB24154654;
	Sat,  8 Nov 2025 12:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="lMHQaOiz"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DE41BC5C
	for <linux-mips@vger.kernel.org>; Sat,  8 Nov 2025 12:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762605085; cv=none; b=Lg7GmDDUsoiwDHVoTqRAdqSviuicDlwa6/akqJyiSkLZMIYg+kvk7mGIckVv0BOPbz7lES1m+vBXV4v5+4h1JiO1TA4OYAar5Fqn9GiTaHt7elYHLaCGclhVbdMOKzPVh3lqSWULigDUlhi7Vi/mU8xBbo0GMcnynqTaCGNLzic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762605085; c=relaxed/simple;
	bh=jFqjvE99b45pu2oCz9ajTBa0meyTTID/k0aUamXBwSM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e49DbJOO1Az5ph7zXhdO+TMapGwhP8kqEVeU1Oy5wtTWx9r4h/jWr8c2HUNyPabNvhdXtbys+wWK1Tb2Vo8Kd65Iff3clG7BOXAA8jwlO8nOAhVo7rsNgHxlHnSXufCrZaVK5B+skXGcBCSnUrZVwj1pvbC9v+S1AlTLnt3EQY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=lMHQaOiz; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-341d07c020fso2092460a91.2
        for <linux-mips@vger.kernel.org>; Sat, 08 Nov 2025 04:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1762605083; x=1763209883; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jFqjvE99b45pu2oCz9ajTBa0meyTTID/k0aUamXBwSM=;
        b=lMHQaOizdnvBLP8yVB23YqXuyg9Ggt5tT0YPjuogiPgDkurTElDQ70kj/TI0pvBmkR
         4bNtj+OnigZkWiISZyNtQmRH0QVC5lQZeZmM18Jb0deQur5j4QW4DWx9eeszMzhs96Fu
         NMBKpe1jrrG3jZCMd+2PH1qlG6woN9/IpdduiEqENDkDK8aZy6hfOgHZKL9bEbLlqbVM
         ittPrZpKRhW2dRL+9jW/jJIXArJkG4zevrsW3coxss6zjLCkXKSC/ZOHx+GQwKIQVwaL
         tLkY/r0z1OcMusD0p8VVwU19cFiAE+s7t4PFZWNw1uHgi5UQucvqnAM/y38w2Azl+upI
         /scA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762605083; x=1763209883;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jFqjvE99b45pu2oCz9ajTBa0meyTTID/k0aUamXBwSM=;
        b=SlT6AbTUc4E+Q9XPbQPgqqQdvtlwiykkh3S+cwu7zspxMof6/nRn2EYjg1BzKlvDjE
         JT2xs4yqvY5mOQnMKGkqHoz+MU7ql9tdj63nid4HgjWIXLiZe02zZPjnk7bz0iHt5WPo
         Fa/beFktXoKd8VEQzAIvYDsqXNFliLPPxB3LnewuLSyJrqGaWBdBbVsLdmDoh5M7m+25
         OH8hwN4JQgAuPOMpTBWRcfyleJ5xLmSolYwYsRls6qwZp6hnWqmTK+H9ro0h4VQUr0kp
         l7xVtcJ+CHTGD/MFAa1XDCqamWM26mWvxDQEJZ5ql46XtfwU0zjlKTICOTi27E6HVHO1
         LSJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGPBP653uL4OL8xC6MTOnuZjhRDQv0T01Y8gCLVbZngFjrS/YYOHjhxjFN5vw7tUGLgwG+GfnAOzkr@vger.kernel.org
X-Gm-Message-State: AOJu0YxQYBx9DG8L3Xa6mKmUtBxphYRYii5YsJfB+GjIIRy2dmzXKKs9
	guvW4+fWpraU5uEqjW+EE1z0PpNWz7WcNXbYlGR5X8yCNKI4FQamSm/apl9EOjnu7Mu3mFGk3jD
	pjp68q+74L1HK3SFUAtHD+rGIIjmJb94=
X-Gm-Gg: ASbGnctMVoZ1Ud90ztmRTLB7ScKPhWRCPvPGTgX+N5/EvXUi9XtCxBzB7sd+piNGU3o
	qyTIT8OhujTvsgEo0xmxTqMGT3BU+DWLOfd1KdT9F353z58ESfnNDrFIFN0UuQ9VPtAHncH040W
	n/kwygL4m6z6fXSdzm/JmkKR4j033GaZPSDM7rrvwLfnJcKJR2OiYBYgMaFf2xoIntdMOejpAIV
	czaYVc8wBpTt/bS1aywUi6NW/1eQ6pSo+0eKReehso3L3rRvlN+h4eAh/DcMehjKbKuKFXOZlrK
	b9LQnuba1tLrEj8knvDcwL27nQrXyQWMXhO4qw==
X-Google-Smtp-Source: AGHT+IHx494bsoHJaju4RengP4iXpGRFmMQLliiMWy2Q89R/cSWBMiB3q+hcgQyoomcv+0z0cS+rAooMlyw+VCTekJU=
X-Received: by 2002:a17:902:f791:b0:297:dfc8:8fd with SMTP id
 d9443c01a7336-297e571236dmr29139155ad.51.1762605083407; Sat, 08 Nov 2025
 04:31:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk> <E1vHNSG-0000000DkSh-4BIj@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vHNSG-0000000DkSh-4BIj@rmk-PC.armlinux.org.uk>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 8 Nov 2025 13:31:12 +0100
X-Gm-Features: AWmQ_bn_kIDv-pwz4dNwmzBqCanYs2atUFgMMshyNEi0RKuzPdaQ1v4towlIcoM
Message-ID: <CAFBinCBp1x3KWe-5mWoGwFEVxEoSKhTXKYfGgNKS-eDsbW8X+A@mail.gmail.com>
Subject: Re: [PATCH net-next 09/16] net: stmmac: meson8b: use stmmac_get_phy_intf_sel()
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"David S. Miller" <davem@davemloft.net>, Emil Renner Berthing <kernel@esmil.dk>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	Matthias Brugger <matthias.bgg@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Minda Chen <minda.chen@starfivetech.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	netdev@vger.kernel.org, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 7, 2025 at 3:29=E2=80=AFPM Russell King (Oracle)
<rmk+kernel@armlinux.org.uk> wrote:
>
> Use stmmac_get_phy_intf_sel() to decode the PHY interface mode to the
> phy_intf_sel value, validate the result and use that to set the
> control register to select the operating mode for the DWMAC core.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

