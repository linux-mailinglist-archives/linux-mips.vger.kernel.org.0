Return-Path: <linux-mips+bounces-8089-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3F1A4FBA5
	for <lists+linux-mips@lfdr.de>; Wed,  5 Mar 2025 11:19:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3CCD8162D17
	for <lists+linux-mips@lfdr.de>; Wed,  5 Mar 2025 10:19:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7E362063EE;
	Wed,  5 Mar 2025 10:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JVElypjc"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFD21FC7FE;
	Wed,  5 Mar 2025 10:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741169915; cv=none; b=oBwk1RqoimHICqT4N3oJ372i+51rExMqql982SW+yAXFkpbof9/SSiRK3qmc8riFHWVevekTO7kErnJgHyljJ0oTjvzurroeHkLCHgvicUF3YZM320G8GMxgp7igCThXbqCRtMZA7L9QpcaEfopjVv1pTDOgo2daGh0H/vH52s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741169915; c=relaxed/simple;
	bh=4Vo3qOOAEBPswAqRgvzNrNkT7zw+CqURid5oS8C0xpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T50t8sazHtyJ/gmwr+/yGC47PXKEbuKjoRwVosij+VidKt/gpXoEfg25xtxH/R4wzHwCa6fM3GIAGahdjKGXRWh4g9kG/776tR/wT94VsYgxfcCdm135IVTJaMksoMEAN+ov/Iyb8ZLdWLmYTj1Hm8KO+yr+dEtTwxJ4zPSquJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JVElypjc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4705FC4CEE2;
	Wed,  5 Mar 2025 10:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741169915;
	bh=4Vo3qOOAEBPswAqRgvzNrNkT7zw+CqURid5oS8C0xpo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JVElypjcaIYX5rKtiv06hcSXy4HstFjKOeRhShpFjk2Jel2eSkA/O0uK8Wninv5/a
	 hI5Ui+51QY9Sc5wOaelsMqqEki8iPKL/7clrg37rGARtPtuO5FAtalmSz/cR624zt9
	 twTkQB6/0FugO2QSLBDkRJ1MULKIVW+tzVSg6Ccu0iGgHjhAUJfebciXlktocUXdn0
	 bbIXddxhOqHs7IDCCnaG84EzsvIT+/+FsZux9DQ1iCMoMbwVVWuwRuT4u+s9e3MuJC
	 lkrQutRMyjpWtEs6QOIxSX4h5Qvjsi5oAAXmBv854hriyofgHQ/0kVmCe+F7yX5KZc
	 9wpnC/K5XUGSQ==
Date: Wed, 5 Mar 2025 11:18:23 +0100
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: George Cherian <george.cherian@marvell.com>
Cc: linux@roeck-us.net, wim@linux-watchdog.org, jwerner@chromium.org, 
	evanbenn@chromium.org, krzk@kernel.org, mazziesaccount@gmail.com, 
	thomas.richard@bootlin.com, lma@chromium.org, bleung@chromium.org, 
	support.opensource@diasemi.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, andy@kernel.org, paul@crapouillou.net, 
	alexander.usyskin@intel.com, andreas.werner@men.de, daniel@thingy.jp, romain.perier@gmail.com, 
	avifishman70@gmail.com, tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com, 
	yuenn@google.com, benjaminfair@google.com, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, 
	mwalle@kernel.org, xingyu.wu@starfivetech.com, ziv.xu@starfivetech.com, 
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v4 1/2] watchdog: Add a new flag WDIOF_STOP_MAYSLEEP
Message-ID: <irmewriceyzxr6jvbiao5vqrvelpftbjalmheodx5w63zi6k2y@dg3wlvs6zryd>
References: <20250305101025.2279951-1-george.cherian@marvell.com>
 <20250305101025.2279951-2-george.cherian@marvell.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250305101025.2279951-2-george.cherian@marvell.com>

Hi George,

why is armada_37xx_wdt also here?
The stop function in that driver may not sleep.

Marek

