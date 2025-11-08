Return-Path: <linux-mips+bounces-12150-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F3BC42CC5
	for <lists+linux-mips@lfdr.de>; Sat, 08 Nov 2025 13:31:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78D9A3B08EC
	for <lists+linux-mips@lfdr.de>; Sat,  8 Nov 2025 12:31:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B19397082F;
	Sat,  8 Nov 2025 12:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Loam7QVj"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6E71BC5C
	for <linux-mips@vger.kernel.org>; Sat,  8 Nov 2025 12:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762605069; cv=none; b=XTrkWcRVu7zSPTVO2qe2+veXXymNhOpO9C7HmLx38fRhAi5ou6lceNqYDKxh5TQqAb+WJWWwrhOLxbZZZxjQZdytiSCvJXJZ3UIU03ToMweqNhnvrghjGD7egV2w8V/VWOPy6aThPGYd2OzUx6/EPEJMj/0PkSw3Oveegvk39+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762605069; c=relaxed/simple;
	bh=8xzpprXbiGBlRsIHbzms9s8FVApMbHJGm/eVCI6hf4Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mQWzL4vsM7xLzZAj8uc2JRJab58uABpopwmL4jeK0QRoUIpWUhamT191LBQl1yMq1XeES8jIbBgE+XJgk+c+Hyf0amQIwY1yjV65nymalfALHEiCCh8RTpxk96DP9qHJqQ763/yyNzK9nYXBL3kd59ENXpY+pcjx5gfAy1YE02Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=Loam7QVj; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2957850c63bso16058695ad.0
        for <linux-mips@vger.kernel.org>; Sat, 08 Nov 2025 04:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1762605067; x=1763209867; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xzpprXbiGBlRsIHbzms9s8FVApMbHJGm/eVCI6hf4Q=;
        b=Loam7QVj44sMASwft12mduNAZuzz+cLafIIEDIrjbBLczNzLbg8qnK1ezBPqY8x5D4
         aPR00wjmWD7MDtbXA6JgENpaKoeQpCkOEQLYBsLqmeZ8ti/HAau/W7kSQVL4orbyp2cn
         wmKdx7oO+xid1qjlNZM3lF3qPJ2Ic6+J26WsDhgNYj5pGhF5FuOpE8JIwWBGkgUvdBXa
         Q4CgPSXSKJXcEBlygS07lxq/HGubsz/y3cLQP3T3eHGq5++H/xYiEXcO3X+nbMQwW7ch
         TepEfPR0tvDfpxfy4KLRKEm3DdkG4R0FncZUbjIaCIFk2NBFCvqOhA3/uVuoSRb99bya
         4viA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762605067; x=1763209867;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8xzpprXbiGBlRsIHbzms9s8FVApMbHJGm/eVCI6hf4Q=;
        b=JO7/tfx0/dqgIVHgAx4yxmFjX3PmdbG69fviLbdcdwsvT4dj/2LISkq+KGWrU35Zlz
         +IZNfnDQ6mQbVhJs6Ui4/fskqb4K7e4TJ34gidbkLBIaH40/ZUH/7l9H5urVGzgUd91j
         +Oc6W+dgTj3DnMVFyjb8BNBHtRlJKdrssbejPIKzk8Poc04CUknacDRz3a/ro9RPkiWW
         +/ETgQlHIGOt8fQ/+3hHT5VEKOKP0KcdURVfd3ILD35WPAA6myAICGUBa5mw7zQwNvI/
         92Tr4ZYAb9ZPrkI3f9He9jMCIYzxvRhnWnkpKCIj2osuuYHN8ZPagHLY4UgxlT17OIE0
         2VIg==
X-Forwarded-Encrypted: i=1; AJvYcCXYN89nUJvVLeeJAlGBrixjhZdA6U0bZ8UNycyI15LuBh0aeAOtjlaH5EU/5EK482GS0ZE20NJZ2ctA@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7qdkioyObbLsmIq2ukNAmtwNAUcczLDQOopMFn6J3UGD/652J
	5wUW1CFSJ0GhFw/HIduJdMR+Y5L039fwbvqQv8C5QKPVHPGyd4Nm+Bg2jnKC099/ST/SoRKkfVN
	Zn/e8ssAmgfVppr9cwpLbvoYwGDBtFXY=
X-Gm-Gg: ASbGnctzfgHT70vJKpDSvCJejTul+LNH8964XgwoKmm2yjNNrKVEH7GOT5evF2H9+02
	mg9m9KJ/M2b55fgAPXxQgkyTADtg1n6qd/pdUWpG4ipshODXQ3MkWbWViyA9sovGE3ZZIyrFufh
	czzp2TK9TOsOKES9T1S2KYoj5LMrXyz4pn2ws6zIPfpe2s2VQKlZcvGJ1cX5LRBOn6urGd9N4Kp
	/4tAWW1kop+EiuArMRfj47SFYm9AUkbKVHJ7VvYKANgQvQCADwjk2eXx/vQz/FAe2nHEdQKz/D3
	tBC9feksZW8RSC5j
X-Google-Smtp-Source: AGHT+IEuHvgMZMmDRNRPAfeOAymHEAn1hYvpEGWDduP2LeVblYn4NjcSRVQL/UdeJaq1Z4u9o2SDmDIZmKAPg0jARQs=
X-Received: by 2002:a17:903:3804:b0:295:5898:ff5c with SMTP id
 d9443c01a7336-297e1e3429emr34741885ad.16.1762605067406; Sat, 08 Nov 2025
 04:31:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aQ4ByErmsnAPSHIL@shell.armlinux.org.uk> <E1vHNSB-0000000DkSb-3fWL@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vHNSB-0000000DkSb-3fWL@rmk-PC.armlinux.org.uk>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sat, 8 Nov 2025 13:30:56 +0100
X-Gm-Features: AWmQ_bkQCCCHuH8ylnNhyHhFQTUKFqSEN4LNOb9Me0YP6OYeddbK-4LWE8Q83H4
Message-ID: <CAFBinCDf4rHs-Q1ZVo_WqF1r8_aLJ745B0tG+=6NpmbBOe2c9A@mail.gmail.com>
Subject: Re: [PATCH net-next 08/16] net: stmmac: meson8b: use phy_intf_sel directly
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
> Rearrange meson_axg_set_phy_mode() to use phy_intf_sel directly,
> converting it to the register field for meson8b_dwmac_mask_bits().
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

