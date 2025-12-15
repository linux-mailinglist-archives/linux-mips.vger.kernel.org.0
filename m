Return-Path: <linux-mips+bounces-12479-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C17CCBF674
	for <lists+linux-mips@lfdr.de>; Mon, 15 Dec 2025 19:21:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8CC7B301338D
	for <lists+linux-mips@lfdr.de>; Mon, 15 Dec 2025 18:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA5123254BB;
	Mon, 15 Dec 2025 18:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="a5/gTm2q"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4223E322537
	for <linux-mips@vger.kernel.org>; Mon, 15 Dec 2025 18:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765822550; cv=none; b=jf1ZIRvPHMCXRUe2k4pLT5cdAKj1JYwfGTDPItYyAukQmVybg/kzcH709603OBpW7N/UUZbUEiA1T43bb1hCdrfcP9DoVE6CKOIMo9X6wiMCGvutpYOcPoWtCruNdxwqICQBEkGp8BJviHRFdc42aPSIyqG5v9bODPZ4HxUzJGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765822550; c=relaxed/simple;
	bh=c/PjK3MK1keVLcHji+RqTLxS8TEtW+tU/vQ1gsPWmFw=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=UYVPiveiDv6bpsaBAKG0mTXRh/5QbR8ukcJisko5yw4VFNAUYjiBfOdwEG53RE5+7+SiUNTkFAFE5jIASupYWGDUPiXBValC31OviuOtlURvyWvtxIIU9k6v7Snt9YvNN38LHWf/NdGM3x5i/n6Tptn7QV2Pr1aCCPSqhUvx3qA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=a5/gTm2q; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8F9484E41C1E;
	Mon, 15 Dec 2025 18:15:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4FA7160664;
	Mon, 15 Dec 2025 18:15:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9381311940441;
	Mon, 15 Dec 2025 19:15:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765822545; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=2me3Ljn4gfmMgfkqKAj40oeX1P+gfTzAJLA5BMsltrI=;
	b=a5/gTm2qjBEjpF77m0/AebIsh0AMWFDxUBJndGfo8gqphxBM/xne0JolHsTWrIWoBW4uFF
	zkQUxQaqPH7c3Jcc9x8rV1LEHNjEmY0HhlR/LTOePWxQaPj3lglMC1kL50xCGNNu/NuWjj
	VbD1K3vFp2sDbpBtxvsVrAEG+sOespBORcsI1E/BP2XR2qo81EjpObRpNs9Mulv3NxKYXk
	IDU5LMofzpB4Y3KF0lLcoYY9c3j5d71qTM2XcrriiI+6brLfFHstUNIfUVxDF5MbVnN8Z0
	5n7Ji6HtLVAsEkyZth6KveMNi24V/BWnPDlRXywh+3yPeFjXphK8+KUrd9RW/g==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 Dec 2025 19:15:38 +0100
Message-Id: <DEYZUJHYWKF7.1D7N8XSD46NKC@bootlin.com>
Cc: <linux-mips@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-phy@lists.infradead.org>,
 <linux-clk@vger.kernel.org>, =?utf-8?q?Beno=C3=AEt_Monin?=
 <benoit.monin@bootlin.com>, "Maxime Chevallier"
 <maxime.chevallier@bootlin.com>, "Tawfik Bayouk"
 <tawfik.bayouk@mobileye.com>, "Thomas Petazzoni"
 <thomas.petazzoni@bootlin.com>
To: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, "Vladimir
 Kondratiev" <vladimir.kondratiev@mobileye.com>,
 =?utf-8?q?Gr=C3=A9gory_Clement?= <gregory.clement@bootlin.com>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Vinod Koul" <vkoul@kernel.org>,
 "Kishon Vijay Abraham I" <kishon@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Stephen Boyd" <sboyd@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, "Thomas Bogendoerfer"
 <tsbogend@alpha.franken.de>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v4 2/7] phy: Add driver for EyeQ5 Ethernet PHY wrapper
X-Mailer: aerc 0.20.1
References: <20251124-macb-phy-v4-0-955c625a81a7@bootlin.com>
 <20251124-macb-phy-v4-2-955c625a81a7@bootlin.com>
 <DEUNYYW0Y23E.2SA0SOCS99NA0@bootlin.com>
 <DEYVVCWBOZSH.2ZY41YCHLS8FU@bootlin.com>
 <DEYVXJI90AA7.KPDEQCNZOOXI@bootlin.com>
 <DEYXM6CGJULV.1KKA37ZLEIW1K@bootlin.com>
In-Reply-To: <DEYXM6CGJULV.1KKA37ZLEIW1K@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3

Hi Th=C3=A9o,

On Mon Dec 15, 2025 at 5:30 PM CET, Th=C3=A9o Lebrun wrote:
> On Mon Dec 15, 2025 at 4:11 PM CET, Luca Ceresoli wrote:
>> On Mon Dec 15, 2025 at 4:08 PM CET, Th=C3=A9o Lebrun wrote:
>>> On Wed Dec 10, 2025 at 5:06 PM CET, Luca Ceresoli wrote:
>>>> On Mon Nov 24, 2025 at 3:41 PM CET, Th=C3=A9o Lebrun wrote:
>>>>> +	provider =3D devm_of_phy_provider_register(dev, eq5_phy_xlate);
>>>>> +	if (IS_ERR(provider)) {
>>>>> +		dev_err(dev, "registering provider failed\n");
>>>>> +		return PTR_ERR(provider);
>>>>> +	}
>>>>
>>>> As above, why not dev_err_probe()?
>>>
>>> Good idea once again.
>>>
>>>> Other than the above minor issues, LGTM. This driver looks cleanly
>>>> implemented.
>>>
>>> Thanks for the review. Does that imply I can append your Rb trailer?
>>
>> If you apply all the changes I have mention, yes, but in doubt you can
>> avoid it and I'll review your next version. Re-reviewing is much faster
>> than reviewing the first time (last famous words).
>
> I've taken the Rb trailer, hoping everything is to your taste.
>
> https://lore.kernel.org/lkml/20251215-macb-phy-v5-0-a9dfea39da34@bootlin.=
com/

I checked the delta, looks correct, R-by confirmed.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

