Return-Path: <linux-mips+bounces-11961-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C586AC226FD
	for <lists+linux-mips@lfdr.de>; Thu, 30 Oct 2025 22:39:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 2ACD934E304
	for <lists+linux-mips@lfdr.de>; Thu, 30 Oct 2025 21:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36A38311C3C;
	Thu, 30 Oct 2025 21:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ggVmHUC3"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51073307AD0
	for <linux-mips@vger.kernel.org>; Thu, 30 Oct 2025 21:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761860373; cv=none; b=m9cX7hBo1JBcrVOr9IBuxQSD5PR68NvpstXlozpWygufu5SGvL7YOb8GWzRImsrxPW0M7PHdB+HDEDzpzi5vFJSnu175ht7zr+kDCcnzQBjVSH5Xp8R0X/D1gnwzHdXvZqzIhAhGGpBVxPs7J+Bz1C+hrte9PcNsIuHGUgjaak4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761860373; c=relaxed/simple;
	bh=WFlyIexI14gzzzuldNdHGJV4JITfsrwcYTRONb/7CzE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=RWKRnNXRlCDhmcEQx6Y/Jc+pwZKHHLR4FRGRfMsVxDpYfyvtna8OJlO1hAng6RQEPoaLibPq5p2TFayElInWBd1rfMY3//5qQwtZpaDREzqLeiCTiWCejYI64WH+b49s8nGRmnp57VLoN3G27GtQdw/2wumNDyZsOS7RwS4Xzn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ggVmHUC3; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afcb7ae6ed0so361590666b.3
        for <linux-mips@vger.kernel.org>; Thu, 30 Oct 2025 14:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761860370; x=1762465170; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+Z4aBFRbBiE704Kr78L6ktIIDMs4HdMIeAn+6hqXnc=;
        b=ggVmHUC36obTP9JFIqIhKPLSHdv5+bSd9Ls9ZVMXNBiKFngDKwGt2rVSMQyPvciD64
         U/vp+26ma3a4M97PnRPqUpZrzNUhVfsrBgjBlGj5Kum/ndDqQfupziu1jkXiEluhUUGd
         +S6XVN+UoASc6iFLvVH/sxNSBaQL6YKHHxPgNnTVCqLhqqPwpoPRLVKQKQi9+0CAxcAx
         cfhcQrXR/uXVwWe1OYr50RHCBXKz/Mj4eFBr+yrLa/KeUasQ2HPv1tgvlWRzJxGqA/Nz
         Eb5snN16WcXGHELRzPd530HyDllu/AOdKRXAbV0npunx8orvXvnagB2LYCs4P55p0mag
         7v5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761860370; x=1762465170;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E+Z4aBFRbBiE704Kr78L6ktIIDMs4HdMIeAn+6hqXnc=;
        b=Onsxtiqq/iOQzU+unI/Jz4CTJzGgkwGlrMOPFdPoiGUMyhHq3XmcJaDNTpboYu8Cuk
         APZ25NpLb94yX9U5LZ9cPoVnfWLlBr1TJ6PiauG4Ptj+LQcmYdus/wCcXuyVhuq8gHoY
         USHtBeYI6+MNh2gn4IGegC2saYNCtS8trVMeEgpG7saLV67/gT754nq8IwZ96Hgt7aaS
         m3XpARPGxzK8jA7LWEbWTmiibjb/zwnnpql+LIADLhUEDD6IurS4rSe9cz8hlpUZXd3y
         dDtB/5heNp/dN10svhT8GiJImWT51+SpuTUIZJ/0hxvg1RQyWOy7oo8n7oLWt5JwQjsI
         EZMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWplPNyl/1p/WyM+lkFZXVwQcg+fOv2KB/gDwBNLWIUygK5+LTdDkyzniHgN7EhQvXSHQXaL5qH7JIy@vger.kernel.org
X-Gm-Message-State: AOJu0YzRNqNG8zRw7Ne+hdTqp8p8Xk7cMg18QK1CWeAr7MuDg40J86Oe
	3xGz1Nn8E499Wee3HbZsgfiFtQnALYjrnFZFWUW4FvkmshfSdkD3/PT0
X-Gm-Gg: ASbGncv0GEQckAXSJ2XGiOz8NxzarP6vuz68SFptSfmqYPvoKD/yus4OGU9PkWxyPQt
	oUgj+Zk2yw64xrV+ZztFob5JpHtEVt6h3Zn0XUZLEHY22EmQdBRdGkaYUGVg73dhfcu7+IQvzcZ
	uZX+MFuSLBzt1zIMPA8af4Hd7gqLNARZQzKNY/1CH/rW9S6Z7Fj0NbU38Cqol5xe2OrSZ7XYXSO
	/r/5VGXEySBlcW4jNfPSw8Gu8fwAcJIrlAKqU3KebQISa6NB7pIiAGnz/SaGGDgXpBqduja+BXB
	Av4J8qo9/WZdWw93lwTi9bsYNf5NdKSwU9GF7OHn9OuhT6JXH3wwT7vax2bqhZR5rlnJ0bpSLon
	DSj9XErHnSlQmhGB6zLQmOXBrf1pA0HX5WZkFxN3dja51OQ9oi5A0Z7iQ3WTnQCczAWp8OaIF+l
	av8K+KY5VvuqEzIrzvthhSe+G2wtHMIg4nptGDpVlPlSn5gU9gPZIIDvNBxRPCvgOmnlpnzN76x
	AyN6C1cfLMx85fGFeF4icMWRtKBKue5yrrsSOb9mSo/Gv3rRR+GpQ==
X-Google-Smtp-Source: AGHT+IH33A3IZf5JH3qGVGFsjIEcTWzgSwfEhDPkDUgrYDxBSHDFAWfg2IEswXtHcRF99P2jtkDStQ==
X-Received: by 2002:a17:907:7286:b0:b3c:a161:684c with SMTP id a640c23a62f3a-b70701055e6mr122986666b.2.1761860369354;
        Thu, 30 Oct 2025 14:39:29 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f48:be00:f474:dcfc:be2f:4938? (p200300ea8f48be00f474dcfcbe2f4938.dip0.t-ipconnect.de. [2003:ea:8f48:be00:f474:dcfc:be2f:4938])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8534d99dsm1855428866b.21.2025.10.30.14.39.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 14:39:28 -0700 (PDT)
Message-ID: <0285fcb0-0fb5-4f6f-823c-7b6e85e28ba3@gmail.com>
Date: Thu, 30 Oct 2025 22:39:34 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next 0/6] net: phy: remove fixed_phy_add and first its
 users
To: Greg Ungerer <gerg@linux-m68k.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Hauke Mehrtens
 <hauke@hauke-m.de>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Chan <michael.chan@broadcom.com>, Wei Fang <wei.fang@nxp.com>,
 Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>
Cc: linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

fixed_phy_add() has a number of problems/disadvantages:
- It uses phy address 0 w/o checking whether a fixed phy with this
  address exists already.
- A subsequent call to fixed_phy_register() would also use phy address 0,
  because fixed_phy_add() doesn't mark it as used.
- fixed_phy_add() is used from platform code, therefore requires that
  fixed phy code is built-in.

fixed_phy_add() has only two users
- coldfire/5272, using fec
- bcm47xx, using b44

So migrate fec and b44 to use fixed_phy_register_100fd(), afterwards
remove usage of fixed_phy_add() from the two platforms, and eventually
remove fixed_phy_add().

When I proposed helper fixed_phy_register_100fd() first, there was
the question whether it's worth it, and Jakub asked to submit the
full series:
https://lore.kernel.org/netdev/20251021182021.15223c1e@kernel.org/
Apart from this series, there are two more places where the helper
can be used to simplify the code: dsa_loop, ftgmac100
I left this for a follow-up.

Heiner Kallweit (6):
  net: phy: fixed_phy: add helper fixed_phy_register_100fd
  net: fec: register a fixed phy using fixed_phy_register_100fd if
    needed
  m68k: coldfire: remove creating a fixed phy
  net: b44: register a fixed phy using fixed_phy_register_100fd if
    needed
  MIPS: BCM47XX: remove creating a fixed phy
  net: phy: fixed_phy: remove fixed_phy_add

 arch/m68k/coldfire/m5272.c                | 15 -------
 arch/mips/bcm47xx/setup.c                 |  7 ---
 drivers/net/ethernet/broadcom/Kconfig     |  1 +
 drivers/net/ethernet/broadcom/b44.c       | 37 ++++++++--------
 drivers/net/ethernet/freescale/Kconfig    |  1 +
 drivers/net/ethernet/freescale/fec_main.c | 52 +++++++++++------------
 drivers/net/phy/fixed_phy.c               | 18 +++++---
 include/linux/phy_fixed.h                 |  8 +++-
 8 files changed, 66 insertions(+), 73 deletions(-)

-- 
2.51.1


