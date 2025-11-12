Return-Path: <linux-mips+bounces-12204-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8F7C5394D
	for <lists+linux-mips@lfdr.de>; Wed, 12 Nov 2025 18:09:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E01B2548DC6
	for <lists+linux-mips@lfdr.de>; Wed, 12 Nov 2025 15:48:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A6C633D6E7;
	Wed, 12 Nov 2025 15:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eySDEjQm"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCC22C0279;
	Wed, 12 Nov 2025 15:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762962405; cv=none; b=srsh+OT50vY5ZL5fo2qp1h73nvJNZ2BayTpR949kaxtIpNVBsZBFx4YE7cc7CEenqv3QqX0vmC/xrVE5+Y7YeluynkW6TWzQpXauCkV28rmoZOD58cpoKwG03jT0QYA0M26zxk/hv/HE3zaSsjJiZzyfkkRz3guOqFO30REU5FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762962405; c=relaxed/simple;
	bh=+PVoqnnnaIBySDhlth6L4ay7ziIDh5hIKYrDK5UXl8g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JU0M7zQN5bvJuWNvyaWFjH0TKexOCEoCbebZT8rVnj53leBf7UswywbqWqyL5RkAApUmuD35wYrlSw0rfWReg00kp7Fh1LW6QMIH6YloTi/O1g+p32qampIc2+6sy8Ups//ry6nQYDJzzOTNv43ZYwyLSHCvUGraNvh1S2C/Kow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eySDEjQm; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3647EC0F55F;
	Wed, 12 Nov 2025 15:46:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C0E456070B;
	Wed, 12 Nov 2025 15:46:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1946C102F1C26;
	Wed, 12 Nov 2025 16:46:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762962398; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=cF0rJjJI4tWYdSogXLc0tqn+luRhJBK7q0bCFBP3A48=;
	b=eySDEjQmTYwi4hV/GI8oe0oOfuB4w3piugQQhn9HLSJu/iIGECK1sH2BE9C3rJNffTJTkS
	IyslYBrFKrZ80g7jNfIIaJO0QAMy7wZbxcN17QPI0An42QRnJQ39wT+DjOUqxGia03tNbh
	VK97KbTslzXausYPB12MP7d3Z9n7UiY73Stixcd9TQrcJ0Jw/L8cNY12+gBXxNROw4hsjU
	mZ5hkD+8XkOtqTb5FdZc0tFFxfqBR/T14zMRm5qBcMzoBNVnfuBtaxRjt/7L75gWB1nsV6
	TZIImkkN9DcrJeV9TivVQcashNB7Foo33z33h4aShVHWH59Ef01FB8F3pLDfTg==
Message-ID: <7243ff3e-839f-4ea4-9470-1a16f506b4bc@bootlin.com>
Date: Wed, 12 Nov 2025 16:46:26 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 01/13] net: stmmac: loongson1: use
 PHY_INTF_SEL_x
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "David S. Miller" <davem@davemloft.net>,
 Emil Renner Berthing <kernel@esmil.dk>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Minda Chen <minda.chen@starfivetech.com>, netdev@vger.kernel.org,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
 Paolo Abeni <pabeni@redhat.com>
References: <aRLvrfx6tOa-RhrY@shell.armlinux.org.uk>
 <E1vIjTf-0000000Dqt0-1CZg@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vIjTf-0000000Dqt0-1CZg@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/11/2025 09:11, Russell King (Oracle) wrote:
> Use PHY_INTF_SEL_x definitions for phy_intf_sel bitfield.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

