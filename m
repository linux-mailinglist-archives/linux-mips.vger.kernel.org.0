Return-Path: <linux-mips+bounces-12201-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF7AC52114
	for <lists+linux-mips@lfdr.de>; Wed, 12 Nov 2025 12:48:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8980134BB77
	for <lists+linux-mips@lfdr.de>; Wed, 12 Nov 2025 11:48:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27F2031283D;
	Wed, 12 Nov 2025 11:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="sc54x3Mk"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9F7313535
	for <linux-mips@vger.kernel.org>; Wed, 12 Nov 2025 11:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762948091; cv=none; b=iVf4ikritDrAoOKa517j1NMbf98YDtK0uTPtA+Bw0rhQdcLaI82gZeFIdMXtZLdxEiRvEwIv5JMyL5djWNqLIAu73fFBqEpoGTR43uESLPl3Y8DQStM5WtaxAfBsBbwBpJSISgqpsFmVcU7yN6d9kKxVJ4/Z3tL4bzuBkiEv6KI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762948091; c=relaxed/simple;
	bh=3ez1pFRwtvu6sbZUW1s8KM2i32OeRf3RRHffDNGCt0s=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RiNo505+ZaFzROfVIipt8wSDDoBotc9aFXbKYiLTNLo8OIW6WV1u/8hyXqAy8c9/JsqkbH83huuKn97tHsaPBpE4dw1PeuxOEph2uFJKRnGSnqxY1MrJP2YZfzwuKZ60zWT6eSUhXUo7m3HVFMrM2tsnksX8xCQoXQmqUA3vPYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=sc54x3Mk; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EBCBB3FB7A
	for <linux-mips@vger.kernel.org>; Wed, 12 Nov 2025 11:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1762947743;
	bh=3ez1pFRwtvu6sbZUW1s8KM2i32OeRf3RRHffDNGCt0s=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=sc54x3MkVSwGkLeHcjTfQKQAl4yX/22bViLmjlrrKR7MDOe3OvBzquhZdJ3h6LeCY
	 mE/T26W31wjoaCwPV8g8KXf+IX+vjY98qTgwm1xD62Kz6yAesy6LC97JnGC/g0XIhU
	 1bopwFkOOY68Lo4eWC3KPner2GAadJZ/4gZ1tuOfppsNk9XQ4Uy2ZxvJbBn0VZhSCF
	 E+4mpxb8a05FOw4Xg2rY+ibCt30nvfsnfuxiLWOXEqWDD+lyIE3J3LIov4I5/wf9zd
	 eaaByaAA+FuWrOb/aSoZ4jzqkHqpMfnIOuWcRHoN0U3EpRm+QjNr2HFgq6o8TEEO3q
	 TKsO0LXQbm7OvmCjbihq3zXPqi2sAj932qC+C8bZeRCa/kTliqSAU/HVnKs0jZp6tH
	 p8AJ8AppXnImo9osI/r4IY2/qhTv8rHSoJZTjQ6q/CYLpxv6UxxnCtJgAZREm4AcM0
	 ymJz6gZRkKx+QtTAYdctU3xQROFCwfQAbuTUScpSvK1M5s5UP+dxdiGMPXZj4UXrgQ
	 SxPvQsQiBYwjnSAxg9einIDfbcgvyYk464NFCimsX1acRRvzGvqeoqevJ+j1AfDhEK
	 J27UDzQDJTgY1/6jZG+IClmiVIMAJZTqg3y5OgoITM6rr0o2lmF4uuKiKdfCwOgGOS
	 62hQZOhIi13WJLbRKsx5rN8E=
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-b70b2a89c22so69714466b.0
        for <linux-mips@vger.kernel.org>; Wed, 12 Nov 2025 03:42:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762947741; x=1763552541;
        h=cc:to:subject:message-id:date:user-agent:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ez1pFRwtvu6sbZUW1s8KM2i32OeRf3RRHffDNGCt0s=;
        b=Iz1Dum44TsvGFHR4oi21yVkkMtR2AOcvcuXlsGCntXwZ9QxnQ7maPSKwwjeN6pNU//
         ubeV2Y9i0/zI75MJElgXA16psVTWgIZTRI6Wb6kD6Vt5wtPO08LG+gSNBqnELPZdwIwR
         swEgJAS2dLKpQWYfy3dqeuILHU9y7Lc00hTi9aUDbquzFl7ajwuJTNgff/qG/Utgq96j
         TPuRNL7iUlK7dHGMGtfg0FNvZVZzDa4SQbD+PlyRNfF7/XIEW871jrEmAl0GPx8EqzF2
         Nf7P9rBkkWG3x+zD4KMV1kBgBN27+8EE1voOfHjllbnNk8DZlEHr1Xg+bNobZLhge/kG
         omWg==
X-Forwarded-Encrypted: i=1; AJvYcCWo8KZGb7hRGy2zA92xHfFgca8D7usYUDsljj2t3Hukd+/nWguTw2wrLwwgPIA/MM32uHMSOeV5cHSz@vger.kernel.org
X-Gm-Message-State: AOJu0YwJcQvVA/GvQZPPyLIIMcGSLDc05pRC1yaFHT9IWEpPYfqfwtwL
	vC8VorHm3BxjrCRidPOb1wqteZPa6odGjzCJbbLK9s6GcQFiFkIOdj3128j+sYwHPLFJai8yicN
	/P/2C27JV/VWJpRxXzGrslrRaGhU5Jhp4czRG4QIa6+3hSbXZE057StKWJwXVcbqLPFaMcVNUkn
	NvF3vioHyjtEEHLqry2f51nMlUglj8iTxfqXFbQoHlZDQuHeYDTNR0iw==
X-Gm-Gg: ASbGncvPLeYbXRagQLQRWDDUE2keTPADdc9admbHbrYgihYK94kZcy4iD6mrQjNHeQn
	WADomnR2/9MNs3RtWp/5l3Yovwy9kDrU153nYbDzn+s8eo7bdlRDWdFQk/UR8XvjLhIeUqYTDue
	EcQMd2ueKm0wxirJFBSSfkMR1DY/3xaGCqpBuXE2R1yUtmlOQckdPyizF+B0S8xCtZ/V/ulWFC+
	o8QYWC+TIFe
X-Received: by 2002:a17:907:720a:b0:b6d:f416:2f3 with SMTP id a640c23a62f3a-b731d591ea2mr705787266b.19.1762947741637;
        Wed, 12 Nov 2025 03:42:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+3IO/2NlBrJx08X6rQMz6PNqtbjwKXovV+gvszbh/YA3hqiRZ0MYX2aiKQ9RBTBWOP5/34tQ/P9NV3zbKqZg=
X-Received: by 2002:a17:907:720a:b0:b6d:f416:2f3 with SMTP id
 a640c23a62f3a-b731d591ea2mr705783766b.19.1762947741276; Wed, 12 Nov 2025
 03:42:21 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Nov 2025 03:42:20 -0800
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Nov 2025 03:42:20 -0800
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <E1vIjUA-0000000Dqtb-0AfP@rmk-PC.armlinux.org.uk>
References: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk> <E1vIjUA-0000000Dqtb-0AfP@rmk-PC.armlinux.org.uk>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
User-Agent: alot/0.0.0
Date: Wed, 12 Nov 2025 03:42:20 -0800
X-Gm-Features: AWmQ_bnZR2XzkbNxNxbSAGVNFuRIk1DnPVqrA09Ovj5R5d5xHcMFQU01wJP-xi8
Message-ID: <CAJM55Z91wvTonahi=8SaGcHAXVrYEpQCzsH0qfecSoFeiBoZCg@mail.gmail.com>
Subject: Re: [PATCH net-next v2 07/13] net: stmmac: starfive: use
 PHY_INTF_SEL_x to select PHY interface
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	Matthias Brugger <matthias.bgg@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Minda Chen <minda.chen@starfivetech.com>, netdev@vger.kernel.org, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Quoting Russell King (Oracle) (2025-11-11 09:12:18)
> Use the common dwmac definitions for the PHY interface selection field.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

