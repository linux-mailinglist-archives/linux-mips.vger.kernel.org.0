Return-Path: <linux-mips+bounces-11966-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EE954C22743
	for <lists+linux-mips@lfdr.de>; Thu, 30 Oct 2025 22:45:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DEE464EF373
	for <lists+linux-mips@lfdr.de>; Thu, 30 Oct 2025 21:45:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9794E334C00;
	Thu, 30 Oct 2025 21:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DAZrYR+I"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C442620C3
	for <linux-mips@vger.kernel.org>; Thu, 30 Oct 2025 21:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761860728; cv=none; b=maZkQcQP5xlJdn4EHJLxEYFtbCiiKOjv+53fz/nqCU1KxxToAkxWwuMxk6+bywAiILPgz8OftibsKZNg3JmcR33kacAIU+1K/fE4cdS7GoafXUPhh0jzcgrOfr0cnlxxrlxCx3XyHntwExpm0+OWPT2x0zPcSOC2fI84lfjlnQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761860728; c=relaxed/simple;
	bh=uBkk+tHHrc1rrXHOAF46QAp6kvFsvo1lCdXV+dIoOAg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=eJM2Dm3hpU1EbZW/51lsJ75lxwIbh+/6qOdvwGCpYZWKz4Gx24X1Z0xz+fN8SGlpYovrGpqPl6aU+3YcANl4cj+HB0H3WBOb3dMSBSUbiD1RvtSggXcD5ZmHcfVBZhjddNpCqAjTvltN2q08RdLXZbud2LNk+myO8N7ZAQ1mZvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DAZrYR+I; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-63c3c7d3d53so2981482a12.2
        for <linux-mips@vger.kernel.org>; Thu, 30 Oct 2025 14:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761860725; x=1762465525; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/ooLXFnCj1JQf5bLHzgDLlFMnUZG9dG8krO6XUPVWSM=;
        b=DAZrYR+IMuO1lQYDLx4LNoaTG30vyivrj55tFVmcSv/838PFWgWH8+avNGlM6A0xRc
         bZYFhPKfsViq1zibX801smRQ0Jb8yJzCkKPUWp0vXJgHFd6SJiTPg/nnXSTV/u2GrHva
         cOc5h4XzCjruxcZ95H3iM6T5sAGf/UFv79hDhU6ohIdzZtXjo9QNsaP4tPLA07j1W2qr
         Q1PKPrTl/3sL2b4ruvqUD37z7DAojeVM4NL3pJ1uTwKtJ+RMJmpBVwvS2P6hjYY6BT5Q
         YAsfh9bDbllGyhAGN51MzLsL7bLAEM9BYGDP3ho+x+Ru6JF7R4PkaxrfxdQNo7rpuwdf
         8Iyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761860725; x=1762465525;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ooLXFnCj1JQf5bLHzgDLlFMnUZG9dG8krO6XUPVWSM=;
        b=VWzA/L+vUzmVQB1t7bdZojrrvntfSpvKgxm46yeynxM2MbUz/FTnZUEd6ae97/O4lt
         1WWDozAxvvXjd/dz5R/fiG5qua3TiYbee6WpVYDeMXcckh0TCfPIP8shpUdrsjUjjEyv
         kwEXDUNZ2rR/qgR4AoHvbwG1RGUJY4FFRISm2m5EqD+9fyUaL6blG82eIWI1079uwQGR
         q0cxl4NwXxg9lreSjIGzbaGNU64CBtoHp6wYfhe2qT5U8FW2w+CArWt5QemKmxcnofVR
         H9Cq8hIbdOaNgKrVMuWSrozWMGs2Cq0/+I81QA+6WLGqcaUtjYtiDy8kl3mEjVJQ7Dq8
         hN8A==
X-Forwarded-Encrypted: i=1; AJvYcCVvr892K3QTybTj1zsWWvACwBmMTPEkth7l0iHZKxl2Vmtkn+XzPzUylAa0wOmOoW8h13F8miDcZVTI@vger.kernel.org
X-Gm-Message-State: AOJu0YzoiobwrSxW0rd7dtPxYPrc08ilGkxGWoGG/z+Q3HrnTZN5ihUu
	UV8n71TJjJvsLPTVTPC4USRQNcFlIZOR5m2e8zGPVLmVe1tgaBLgD8b1
X-Gm-Gg: ASbGncuABMUGhgaEKX9PAWSsZpSVN+aW46jWb8CvUTziHuas7u1X3Yv2Llz4hJ5o1H1
	MI6jW9GX4ILoxpayj14+KyMBME2CgSGSAF4pi0V4JNNySTdLC3NQ4LNXLuy3Q7txu0v11Ak8k97
	B17jSKs/DkcXAA/8jQcFriTnhPcQ6EahCc9pYZlKypa+5TTP5rT3d1iQoppKpSUUZgg++MWrQ2I
	PM1/6nYTAy43yzQ83h9cQ3klWOg+nbrr7WZJgZb1M754H4+8gCyApVhrijA33jfjKp6TQL1o8w1
	FVwF/WmXjaMLBf9FmdZuaT+3xMpPOTiWpH5WjBSSWNddRf9BlImBrttWJiUw7/qlfDlqzpqHhJU
	kb1FcBX8RpbeyzML/quSYMtMMLZz6J7tVcWeB0f4d+NCIm1ucCgeQd05b9gbt/Jrnqlesm6GmeX
	+/wsHJv4nwa59b/MIHBf7uYgckJ1Rz+EjV4dBoz1N0XN2B5TA5l+m+hu25zMu7DSi435IT2zKAZ
	fWqqtGGU7z7QZe6iaAJZYRXX9zmT1v9Ej6i8ez+P6A=
X-Google-Smtp-Source: AGHT+IGhyymQfHr5msGL4ysnrrXsuX5kI/Bs7xqXWjhPsbZ1HNwDrWmnY+RRZo06Z6Ip4+Ixlwd6Nw==
X-Received: by 2002:a05:6402:20d3:10b0:640:6e1e:40a with SMTP id 4fb4d7f45d1cf-64077020c84mr772375a12.25.1761860724741;
        Thu, 30 Oct 2025 14:45:24 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f48:be00:f474:dcfc:be2f:4938? (p200300ea8f48be00f474dcfcbe2f4938.dip0.t-ipconnect.de. [2003:ea:8f48:be00:f474:dcfc:be2f:4938])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6407b34a735sm17978a12.1.2025.10.30.14.45.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 14:45:24 -0700 (PDT)
Message-ID: <8983b705-6bca-4728-9283-7aa60f49340f@gmail.com>
Date: Thu, 30 Oct 2025 22:45:30 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 5/6] MIPS: BCM47XX: remove creating a fixed phy
From: Heiner Kallweit <hkallweit1@gmail.com>
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
References: <0285fcb0-0fb5-4f6f-823c-7b6e85e28ba3@gmail.com>
Content-Language: en-US
In-Reply-To: <0285fcb0-0fb5-4f6f-823c-7b6e85e28ba3@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Now that b44 ethernet driver creates a fixed phy if needed, we can
remove this here.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 arch/mips/bcm47xx/setup.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/arch/mips/bcm47xx/setup.c b/arch/mips/bcm47xx/setup.c
index a93a4266d..38ed61b4b 100644
--- a/arch/mips/bcm47xx/setup.c
+++ b/arch/mips/bcm47xx/setup.c
@@ -256,12 +256,6 @@ static int __init bcm47xx_cpu_fixes(void)
 }
 arch_initcall(bcm47xx_cpu_fixes);
 
-static const struct fixed_phy_status bcm47xx_fixed_phy_status __initconst = {
-	.link	= 1,
-	.speed	= SPEED_100,
-	.duplex	= DUPLEX_FULL,
-};
-
 static int __init bcm47xx_register_bus_complete(void)
 {
 	switch (bcm47xx_bus_type) {
@@ -282,7 +276,6 @@ static int __init bcm47xx_register_bus_complete(void)
 	bcm47xx_leds_register();
 	bcm47xx_workarounds();
 
-	fixed_phy_add(&bcm47xx_fixed_phy_status);
 	return 0;
 }
 device_initcall(bcm47xx_register_bus_complete);
-- 
2.51.1



