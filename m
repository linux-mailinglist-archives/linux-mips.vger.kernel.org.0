Return-Path: <linux-mips+bounces-11985-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF51C23A87
	for <lists+linux-mips@lfdr.de>; Fri, 31 Oct 2025 09:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 285BE4F1C14
	for <lists+linux-mips@lfdr.de>; Fri, 31 Oct 2025 08:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF9FF2F8BD1;
	Fri, 31 Oct 2025 08:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7UDS18t"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1392A1373
	for <linux-mips@vger.kernel.org>; Fri, 31 Oct 2025 08:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761897676; cv=none; b=GrmNb9ff1n4DlQKwbst4d+4i/yH7UAnakkRLM6VAilH+qbsM5PiwQvYlBnvYH3x8QYnFJmy/XFO2bxY+hbOKobOCNliq4K2QSaPpY1PvBaffQ4odOeRs4bdf3CWo7Q1Ktu4TUEUeVx86Q3jpaDb181gJwPe2185HY8wHEC85HGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761897676; c=relaxed/simple;
	bh=6p33IUItqsgTbWao0/8LpE6O8R7ZzMno24041gdGicw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TmZ9EV7wO5xb8IPabRXnWn/sH0gbvuqT/CP7pU98DI6ZU+1LpzHsDoO8w5SPuKTOOZC9c3QZScLE8rTMuM1EZnLwZdqJu7Q9G1rOdK60gr2w4aljsbkkFBR+iX0+fyYtOxqtFFRcRyobGu3Phz4BedDh1GO2EKVrPyYZGZN/ZVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F7UDS18t; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47117f92e32so16279625e9.1
        for <linux-mips@vger.kernel.org>; Fri, 31 Oct 2025 01:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761897673; x=1762502473; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xQXG0TEjmE73mxJaXICzQHfEj42B/5Z9uI7ucSq7Rog=;
        b=F7UDS18t4ZXkBwSY+Bz0PIVmIWL0cF7qmWc9piNpw2lCqAQxLcPUyJ9tJhpixnR+73
         ohQX6aQDuNOzsCSQiwGc+Eh7IiBiGC0P7bX+6nPnjZh2h98etBQD11rrGEvHgAEN9cgW
         v9VvcZr3gvd0yBoNIc8HZ1/Po1aMolEP6NXHrh8vbMPoa+52N93EN6LwQwn0uFsTt0je
         XJgjBPZ1U63aqlSh4/jX6QPXSj7LGwOLRsOZHVo+G0zH3wW6eFPovB81o7B0c+xHiA9x
         a5az9DFMDa6mEYOIwx5Np6f/qCI7899TsYSoKxcd0qur57jNP4DCLOECBEJTB2sBSFcP
         WPJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761897673; x=1762502473;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xQXG0TEjmE73mxJaXICzQHfEj42B/5Z9uI7ucSq7Rog=;
        b=ZrlKcIdAY10Yue1wWLOXcBwJ9ClpCNknbwxy3FM0b/oSzo84TQMlr5p3ofx/uz5Jne
         bbNdQYmEzpvvpU0yViJuEJQR4eKxsMwcZSc8RZsxVIOQnHRgcYyTFYmoKMnCxiNpt1sL
         3n6xbdyfTR8GtlOg6jefvfvjlISkQBTnyWhy9zgqRO1G544K4nCTSjafN2PLxkDQNO0r
         +JRZdVr4NWa0LOeq+87ij5xZEqQrBG3194E5K9d0xeE76S+eF2ACdupXZde6nMwmKwqg
         N30HsvEd/ajKDjvG/sQ/uwvNPF06xH3puoODLflFE12+arrQEQkVawErA3Yv0iXZVk96
         qR8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVSqTbWOP2J7Pa6+RgAE9qld3FCcyrHiLTRo+rUsmM/20Nrv9jpfmi+/D11l//wfFroGte4rhDwWDPo@vger.kernel.org
X-Gm-Message-State: AOJu0YySrnerkGPKF70nEjdBTlRgWw/HllwkyNMsXushxvZgOmnyr7u5
	AoNiOyetWdOuILTaC3OkgIWKH+RAPgh2Vpu1adIhg3JGEs1I2xpkUjzW
X-Gm-Gg: ASbGncspZyb2zHZheF6CGgR9U5DFVMNAPpFyZDkJlT4/NnjCZ+pnp0qEO7YIADAEZfN
	z63T+Bob8NFehRZH/TSlWWhZSJlttCKvCm7v6X/cqYoHogoYsE9lGgk2YVmFKHonEKLqLOQXYVw
	/eSIDywAfNLMgFKB01oEndwhuZ31WjWnUIVx5+qNjYk/zH0XhIS6OuruSkqGQ4n5V/x59mkYKIC
	YqcN72Tkm+yug9OYtY0gXKtwPALAQXYxHbn9UKKHucEl93+vPwNK/lyVh/dGe8mHMoF6BY2lnCP
	bjTRVA0MFdSlc891hhRClEhVL5V+UeeodFjwPfPh6GdD9C5oisA5M2iCArr+ssASKsgL8Vd02YW
	8C+fkPZRcuID+w9B4Ucow/Uv58y10m6s4wuvxrcaPUeOAjhnSeqpGUG1cKHS3RMuEs3cTo0dlTO
	6LoZui+h//mMXtbYc2HsiKVzoOmwjtkN4pIvHXfRrV8uLlrjthph4FvEshttpynfLztzVsMzp3n
	UFanu1XrGM6CB9E8xjwX3d5hrFJqaA5i5JcsrmztHWTj1WrDxQ=
X-Google-Smtp-Source: AGHT+IG3O6vg8rF+wyYnH9VY8eDwwYFcOfRL+X70Z7BOTOQha5cuoUjm6Rm7WfFX1PmypLP9cnG59A==
X-Received: by 2002:a5d:5847:0:b0:3fa:5925:4b11 with SMTP id ffacd0b85a97d-429bd6e100bmr1988899f8f.42.1761897673065;
        Fri, 31 Oct 2025 01:01:13 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f28:b500:9590:7da:a3e7:284b? (p200300ea8f28b500959007daa3e7284b.dip0.t-ipconnect.de. [2003:ea:8f28:b500:9590:7da:a3e7:284b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c1125ad0sm2128765f8f.13.2025.10.31.01.01.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Oct 2025 01:01:12 -0700 (PDT)
Message-ID: <827e9890-efc1-4630-9a84-931b8482cff5@gmail.com>
Date: Fri, 31 Oct 2025 09:01:19 +0100
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/6] net: fec: register a fixed phy using
 fixed_phy_register_100fd if needed
To: Wei Fang <wei.fang@nxp.com>
Cc: "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Hauke Mehrtens <hauke@hauke-m.de>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Chan <michael.chan@broadcom.com>, Shenwei Wang
 <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>
References: <0285fcb0-0fb5-4f6f-823c-7b6e85e28ba3@gmail.com>
 <adf4dc5c-5fa3-4ae6-a75c-a73954dede73@gmail.com>
 <PAXPR04MB851024F31700200CC78CE60988F8A@PAXPR04MB8510.eurprd04.prod.outlook.com>
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
In-Reply-To: <PAXPR04MB851024F31700200CC78CE60988F8A@PAXPR04MB8510.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/31/2025 4:36 AM, Wei Fang wrote:
>> Note 2: Usage of phy_find_next() makes use of the fact that dev_id can
>> only be 0 or 1.
>>
> I'm not familiar with the ColdFire platforms. Do these platforms only have
> a maximum of two FEC ports?
> 
> The logic below doesn't show a maximum of two FEC ports.
> 
Right, the quoted logic would support more ports. But AFAIK there's no
hardware with more than two ports. Max is dual fec designs, see comments
in the code wrt i.MX28, and also following commit description:
3d125f9c91c5 ("net: fec: fix MDIO bus assignement for dual fec SoC's")

> for (phy_id = 0; (phy_id < PHY_MAX_ADDR); phy_id++) {
> 	if (!mdiobus_is_registered_device(fep->mii_bus, phy_id))
> 		continue;
> 	if (dev_id--)
> 		continue;
> 	strscpy(mdio_bus_id, fep->mii_bus->id, MII_BUS_ID_SIZE);
> 	break;
> }


