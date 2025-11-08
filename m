Return-Path: <linux-mips+bounces-12149-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F061C42CBC
	for <lists+linux-mips@lfdr.de>; Sat, 08 Nov 2025 13:31:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6E89188CF19
	for <lists+linux-mips@lfdr.de>; Sat,  8 Nov 2025 12:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B8411BC5C;
	Sat,  8 Nov 2025 12:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="UdUqty2Y"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C9A3849C
	for <linux-mips@vger.kernel.org>; Sat,  8 Nov 2025 12:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762605054; cv=none; b=Q3gU5oP/qkbVsR+zOPHDtCldDutbfQQXxDzfjXJvCPW97uIvw55ujN4GZZAo8SZKeJn03bzEKZaLyxCiQIriLLU4EGIisiUUVXgD0wbQOwm9/C2x8jTQHklqn/mN6r90BtpzBKsga4iUokof/VX5aeLeGDxRCIbI5RKIsLHQbLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762605054; c=relaxed/simple;
	bh=ZhUqK0vhsnwNkBTiPWIeR9vkRWXucF9aapfrwexWHYs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WiMOLOwf3N81qkfVNYEoWNUR7gDgyIJcobfsfHVWwszONxSu7IgDkmB7fRmReKc4NNPbfwUYmr3BEug6uilWBE2ZIrHUG4oKgjnUXpHPYFoT8rT3XYXaV6l88UhJa5v4hiUV0GHkZhyZUwGSHp626besvZw66SCPCgAJrCFda2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=UdUqty2Y; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-297d4ac44fbso8245835ad.0
        for <linux-mips@vger.kernel.org>; Sat, 08 Nov 2025 04:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1762605053; x=1763209853; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZhUqK0vhsnwNkBTiPWIeR9vkRWXucF9aapfrwexWHYs=;
        b=UdUqty2Yu5K2cZKcDGET6xkLUTWt1O+U2KME6y9mr2o2vu8cY8mSAnYOOfnKSQZaN7
         zjqu8cNDD6COtvDJqsBlozjqugqVO/vy5EWnIhAcnLJtgcen4EKGUJ/ivsoLlA5bWp8H
         W7/mq/U6mGDjWtuQXF7kYteMHDvj0XcZzVqupySGsbkVixwWA11MAhNx9MdsW56CnkM2
         hi7mB1cCZCROoCK9dxRFpc/njNwnC0SLipm2mIIXQaz9kxdaED0HReWKb0DFSazb4Op9
         +q4iwOgwHPtSKljVxXBYuowaL5DOzAK+28fNexIGjxUhwBJqzM3oBVXR8GeKtV6dO1gp
         Sq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762605053; x=1763209853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZhUqK0vhsnwNkBTiPWIeR9vkRWXucF9aapfrwexWHYs=;
        b=tCcxbabexKDuaTzvgOkvDhpXktEyDZUqyiahXGqz5badSg5eGmjuHCZZ03BF3bgATj
         1c0vcFOlB9qB3HAf1nKxGC5HlUYPSRO1mdJvNN3nv6BGFMaJh2IQP8SwDWVBYhwUXdMh
         OsVISyVxCs6aONgq97zKL7NeXtsnu8Ogj7/uYBL3VrifLiIeVF15KsMUB+AODuGABkj/
         fT6fcX1WqDBXUTaqnMJKabn/Nq24X5tP60V3Zr+wLJUxWg3s9gUZqw+HTuTz+HcCwrkQ
         1wmYkMuTD5VUf/Ji/SOgnowlXZLJWKrN+qmR/6L9JcfI8PVWFnzYVo3soJQRQhBcZYOU
         hrow==
X-Forwarded-Encrypted: i=1; AJvYcCWadI9Edo89XCSOpESdtFs7ydHQDzB1HejABAjYL+xgdnoJAKuIC5RLiOClN+XV9TnK8kXlK6QV3Q0l@vger.kernel.org
X-Gm-Message-State: AOJu0YyYU+Y9+eqV/VekeOjj3iA/fWX9NLLj9f0iEbNd0iaggy1euO5L
	nPVXnfyPB732Vnjm9g6NpqJCQeGRM9kiSbS7xvp90bhsIiXzr0C421/nAVvmx477yMoSTYhhiZV
	h8+2DS0e9cq324aMg3Hj2E5slqL7rBPY=
X-Gm-Gg: ASbGncvp4CJP7fPXcaVXhl6I+4WoEWgqx4Znl+eDnigOAX6Eshzhy2q7KfZi17IO7Qc
	PfuBYZKTiYtT7Th7001xrh7NkAFqLxFD2j0sV4CTVYmwFprNYTnEOz5kaSr2IteL55f6o4yMHGJ
	aNaaNvG4IsHGOF/PUGdPK8bSXjE/06ebgjOfnBe6m+r4kFeG5rGr3wckEZr9Ld/1XBfKB2eLChX
	0X6w55Nntn1F5HJUCSkjmfQqxLW99elYezn8r3WD7lgxxI/kiEodLMGH2BOOO4RDIelhdjLs4oQ
	542t9dWVwpOAOAgEsrZkcpRXHrw=
X-Google-Smtp-Source: AGHT+IFggAiteVIarAA4yH7nX7bpSEtb/3RAGcM3xV3yeTnEsgYxWgJ+blB80el3RONC2EPUTf3q2DoKMIlCAJuDAHE=
X-Received: by 2002:a17:903:1a2e:b0:295:5da6:5ff7 with SMTP id
 d9443c01a7336-297e1e3409cmr35315945ad.15.1762605052702; Sat, 08 Nov 2025
 04:30:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk> <E1vHNS6-0000000DkSV-39Ff@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vHNS6-0000000DkSV-39Ff@rmk-PC.armlinux.org.uk>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 8 Nov 2025 13:30:41 +0100
X-Gm-Features: AWmQ_bmyclexD2i-9GELP91SUMtxA9fKus1hhuyJQbz-Kh7t3dy3c6LqsK6hIg8
Message-ID: <CAFBinCDf5jMMFbkRCj7jWOSB__jBpQN5FWZhKAgdoELeKwW+Ow@mail.gmail.com>
Subject: Re: [PATCH net-next 07/16] net: stmmac: meson8b: use PHY_INTF_SEL_xxx
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

On Fri, Nov 7, 2025 at 3:28=E2=80=AFPM Russell King (Oracle)
<rmk+kernel@armlinux.org.uk> wrote:
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

