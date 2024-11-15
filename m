Return-Path: <linux-mips+bounces-6753-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 620DC9CDB7F
	for <lists+linux-mips@lfdr.de>; Fri, 15 Nov 2024 10:24:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 196001F21DB7
	for <lists+linux-mips@lfdr.de>; Fri, 15 Nov 2024 09:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ADF218C332;
	Fri, 15 Nov 2024 09:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="O2HnCx7+"
X-Original-To: linux-mips@vger.kernel.org
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01CAA18B470;
	Fri, 15 Nov 2024 09:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731662674; cv=none; b=s0sxJdBsjwfZ9h0PsOiQrCnXt2NIl7poeDIX7GOV6ha6xWlI/okSFNigNckVwqCbRNVY3t2yMt1j5C4zUYcuMnVoEVoe7b+7352L0c5rT8e6ssyLurmZnRN5Up8Af99Sq07pOuPjqPAMfeKApxji1ymABG6aEKoU+wSt9pFQZwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731662674; c=relaxed/simple;
	bh=EQUWCqDorQoxbJKrlblLqSMKS2eBVNQfV/JWg9t946M=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:Mime-Version:
	 References:In-Reply-To; b=s+OJuLIUiEOzMzbD3OPF2cyl/tZBryv9i/+v/SiwyINFexaAJNPPMXeTN57iuu4bOIOj2WhsNWpsffwoB8z1BZNoynAcbrbG5TmTRPqVKApDhaeT0/AmptajWSF7zJyB7QfJRQU6uwZUkaHopxIUCQ+439Sc0Xe8+Lwp+KudxB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=O2HnCx7+; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E8C21BF208;
	Fri, 15 Nov 2024 09:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731662670;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yIIdqkNo5O0+SPK/1KucjXTjuTGsoWuWSTbUZoZSP3U=;
	b=O2HnCx7+vCWkPCN3BZQ0vkxHJfRyGonQD6wvVc/2wMHtWOYM/BfvEYipT+LPLgnnewdoBr
	vaNaSbCZnwQjNmO8wkSQ1gHj/suuT0FEMOVw/9DL2etspH+Pzvm0hJ7VgG054zoKKbOwsU
	9bMUOybycFX2jN3trTF105Ia4n9dqphg/OVqP/ZbbeZTxXOBuR7M4bOAin2S4QLrffVeWI
	SieWk7qX70hJ7Acomciko1huZpgmZEs5QoqfM/IGBAgLO0ThHZqWEPUliBzae3PhuxeNgq
	I6lIty+3MVlIp4ccx0DWXmdBafqgbr877CngNTmMYcC4N9BHiRRT0QQov9Larg==
Content-Type: text/plain; charset=UTF-8
Date: Fri, 15 Nov 2024 10:24:29 +0100
Message-Id: <D5MN6O1SHWV7.31HDXZG3NEOCK@bootlin.com>
Subject: Re: [PATCH v2 00/10] Usable clocks on Mobileye EyeQ5 & EyeQ6H
Cc: <linux-mips@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>, =?utf-8?q?Th=C3=A9o_Lebrun?=
 <theo.lebrun@bootlin.com>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, =?utf-8?q?Gr=C3=A9gory_Clement?=
 <gregory.clement@bootlin.com>, "Stephen Boyd" <sboyd@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.18.2-0-ge037c095a049
References: <20241106-mbly-clk-v2-0-84cfefb3f485@bootlin.com>
In-Reply-To: <20241106-mbly-clk-v2-0-84cfefb3f485@bootlin.com>
X-GND-Sasl: theo.lebrun@bootlin.com

Hello Thomas,

On Wed Nov 6, 2024 at 5:03 PM CET, Th=C3=A9o Lebrun wrote:
> Now that clk-eyeq is in the clk-next tree, we can add the small(-ish)
> details required to make the platform work fully. The work is mostly
> about updating devicetrees to rely on the system-controller nodes as
> clock providers.

[...]

>  - clk:
>    [PATCH v2 01/10] dt-bindings: soc: mobileye: set `#clock-cells =3D <1>=
` for all compatibles
>    [PATCH v2 02/10] dt-bindings: clock: eyeq: add more Mobileye EyeQ5/Eye=
Q6H clocks
>    [PATCH v2 03/10] clk: fixed-factor: add clk_hw_register_fixed_factor_i=
ndex() function
>    [PATCH v2 04/10] clk: eyeq: require clock index with phandle in all ca=
ses
>    [PATCH v2 05/10] clk: eyeq: add fixed factor clocks infrastructure
>    [PATCH v2 06/10] clk: eyeq: add EyeQ5 fixed factor clocks
>    [PATCH v2 07/10] clk: eyeq: add EyeQ6H central fixed factor clocks
>    [PATCH v2 08/10] clk: eyeq: add EyeQ6H west fixed factor clocks
>
>  - MIPS:
>    [PATCH v2 09/10] MIPS: mobileye: eyeq5: use OLB as provider for fixed =
factor clocks
>    [PATCH v2 10/10] MIPS: mobileye: eyeq6h: add OLB nodes OLB and remove =
fixed clocks

Do you think we can make those two patches go in before the next merge
window? Stephen just accepted the above patches. This makes both MIPS
platforms usable on upstream kernels!

Thanks,

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


