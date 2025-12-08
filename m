Return-Path: <linux-mips+bounces-12413-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D9C6CAC749
	for <lists+linux-mips@lfdr.de>; Mon, 08 Dec 2025 09:04:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46066302651D
	for <lists+linux-mips@lfdr.de>; Mon,  8 Dec 2025 08:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AF0D2D7DC7;
	Mon,  8 Dec 2025 08:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RSTEl7vD"
X-Original-To: linux-mips@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD4F2D3228
	for <linux-mips@vger.kernel.org>; Mon,  8 Dec 2025 08:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765181049; cv=none; b=mbkzck4K1aBOYsyImMyOyoemZUv+4LPLayc93uVn1bQ+ycVvM+hQWHG2Sw3+HSf4hnteRGkgNBF593dwvTi8m9BhyRLbdTrnFXlltlW0E2u0I5CVDXrHf9KSHeUwoznFOGAc7k3wPb0uWXzv9FlT7klVu3rzSEXaEQLVEUgvjqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765181049; c=relaxed/simple;
	bh=LcIjzS/QX9OdfzWd7S5fStct/j5BiQOmeNhDz/vl8LE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bIAYadlyyE6+2TUfjOp8sjNuhSPmIe0kNop9txT7xxCWiuO9KuGto5pkEc7my2HAOih947k6ATteR1cMt6PSI1sWHh0D6wYstJx6R+8X0HTK7DDa4cPxy1HTSzLXwZOA0zBLePaa5Xz1m6JIG8+P6Ma6ww5yz1twOR8FC6kXdOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RSTEl7vD; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5942bac322dso4147035e87.0
        for <linux-mips@vger.kernel.org>; Mon, 08 Dec 2025 00:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765181045; x=1765785845; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0+tebP17XJiSVpHNLRMqnpjIXpj4TNVdcjDVZw4M8+c=;
        b=RSTEl7vDc1dcrV43f4lJp71x71nXdxonolSC+FgFuW2YrEJPE+ZMyPV0P1/UvbeGg7
         3rIAzVfJ1h0EgIoQYtz2j49lWTVnmXZgCkbqWODl5IF8edwdTqlPYrNnRJGjJ9zC9JJh
         jg26EOgV7P0Vm9/2A8Ovijk839KiGACsWcyvRNyBTYzLEo9LOdlFT5Hmcx8vEXK1tV1P
         OQIras0Rhqw/3cV1AH8p6GpM/2+6Cr1ogNpf2swjA4i7kItSWxFyxyy2T3nBWQHOIzPo
         Qd4p/0Tg5LLNMbWm37CZG8gcG4QXRYLWvsCywPbO6ahrgrZi4l19j8AXaL1xAa6vmOoO
         x3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765181045; x=1765785845;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0+tebP17XJiSVpHNLRMqnpjIXpj4TNVdcjDVZw4M8+c=;
        b=Q0CqbyvEdhn9IlWESW1mig7YfyGyBqyX+HZh2d1lYezESj35ps1COAkPdNeuPXe+Fe
         akyrT/Adl2anT5PVaJx72PGDY6vsmqdvDFIsdd3RtwkhgdU9cfEOsB4lj3zyzJIvzRJg
         04Woi3En9YNrlr0JQ1qpwcIciQneo0LwO70FC0TQXLV9jMFISVByn7VvobygOu0GeM+U
         K4g0xUDXsNX3i+8XWBJ6+cmbEZOEg70CFJPj/8CrGLYjRPBcXRM3Aa2c0mrTpQHmi5xN
         McV14jHwrIJsVwwvometeQCAROc52pyzQySYTmda0CvVKd56XV6aUQjmsKirYZPcP+42
         pv3A==
X-Forwarded-Encrypted: i=1; AJvYcCWC92QoFWBWn+n+bXPdxPVDrl4+a/OZbBXUC19JetWO1k2bt67dllfLDvZLVsK7bbvL7/8ZtMNnQYZA@vger.kernel.org
X-Gm-Message-State: AOJu0YxrCbzFNsbOmkjnQaKKAJt8ceFxi5ag5DohU2Y107EMDipNi+Ps
	zCPl+/mtAr++J0w+YtrDozq9Ueaq9/rGg3eOKpGCFv2yHhjVXJXBbXeB0Q5HwHNp
X-Gm-Gg: ASbGncuOFERvtr23gj0RBXOxke5of7osXVXbZNCmJJiq90R5lwxO6Xd0QanL1l0vQvE
	YCz750MofgvUgoiN6celcQXRUyf33QsXp7kyZoE6sNeRQEh79dqVv+vnvRvbvXol6tjrfCErtS7
	PEkvjDSTncgipZSlfc7sPV5M521uex1vNLlzGONEIy7Rz8Wx9/Y0rwjtZ6B7EMwfJ7XyXFMOSL5
	QY52ALG47/Kn6rPiVprvpLe5YCXUzfzsggpUz/JeYXhBgItAFskdOibmUdl3bChWwM+3P/Cv9IQ
	8CeAi/8nMY2DyLEo610MRu43mnxGoXh1ZpWGGj45y8H2ZD9p2oH8pura3IUu3rGYetkufQUyaFb
	k9bYa5jLIDnD0wK4hZtRa0PvFIRXaAfN7NeVXc/LR/UPjQ3ViDUzk/4hoxGYxtdnzIBxUiG3FAA
	FhqRulePbcafwAyem4p6i43xHuppOw2hNOiaP5l8rxp5Aq7s23qS5mRcaOys+hoQ/PpW0YLWEja
	IoA5pY=
X-Google-Smtp-Source: AGHT+IEtsjzvo2jB+dbI9VQ7yZrjbx6yvK3VRttDJmqZME09yWJ/CiejjRuxkvbF6yvGpf9tC/V6mQ==
X-Received: by 2002:a05:6512:104f:b0:592:fb5d:6300 with SMTP id 2adb3069b0e04-5987e88bb77mr1971804e87.10.1765181045203;
        Mon, 08 Dec 2025 00:04:05 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c1e2b7sm3942418e87.51.2025.12.08.00.04.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Dec 2025 00:04:04 -0800 (PST)
Message-ID: <bcbe66b0-23bc-4ba1-93ab-f2c09262e07b@gmail.com>
Date: Mon, 8 Dec 2025 10:04:03 +0200
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Kconfig dangling references (BZ 216748)
To: Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Arnd Bergmann
 <arnd@arndb.de>, andrew.jones@linux.dev, linux-omap@vger.kernel.org,
 openbmc@lists.ozlabs.org, linux-sound@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 linux-mips@vger.kernel.org, asahi@lists.linux.dev,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Paul Kocialkowski <paulk@sys-base.io>, chrome-platform@lists.linux.dev,
 Paul Cercueil <paul@crapouillou.net>,
 linux-stm32@st-md-mailman.stormreply.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-gpio@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Cameron <jic23@kernel.org>,
 Vaibhav Hiremath <hvaibhav.linux@gmail.com>, linux-sh@vger.kernel.org,
 x86@kernel.org, Max Filippov <jcmvbkbc@gmail.com>
References: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/12/2025 04:04, Randy Dunlap wrote:
> from  https://bugzilla.kernel.org/show_bug.cgi?id=216748
> 
> The bugzilla entry includes a Perl script and a shell script.
> This is the edited result of running them (I removed some entries that were noise).
> 
> I'll try to Cc: all of the relevant mailing lists or individuals.
> 

Thanks Randy! This is good.

> TEST_KUNIT_DEVICE_HELPERS ---
> drivers/iio/test/Kconfig:11:	select TEST_KUNIT_DEVICE_HELPERS
This is a config for stuff that never went upstream. It was replaced by 
more sophisticated kunit_device, which I believe is behind the 
'CONFIG_KUNIT'. So, this should be dropped, thanks!

Yours,
	-- Matti

---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

