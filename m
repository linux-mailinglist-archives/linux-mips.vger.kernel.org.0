Return-Path: <linux-mips+bounces-9067-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1F5AC0C2E
	for <lists+linux-mips@lfdr.de>; Thu, 22 May 2025 15:04:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90280A2466B
	for <lists+linux-mips@lfdr.de>; Thu, 22 May 2025 13:03:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CA6F1D618A;
	Thu, 22 May 2025 13:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="P5CBdeaj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="RHc4CrXL"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEEA2F85B;
	Thu, 22 May 2025 13:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747919054; cv=none; b=I9vkSactUXznhbtKM4DGhS2NiyR1EWJ3/Onf6FT5ofCNhwvTs8+cw/Ey6BWuopZertTqjJZdxYZVdXrnyJjOWOlhUGIL+z1wLdLiOTnKTYjGlblylkULxJmrhqVlVDse4j1/NoBdmPeehCavcY4T/uNHSBdxHCRFLzguJmYYE/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747919054; c=relaxed/simple;
	bh=wNY6l4wV3IAmGUJTqydxuvOlnaTtVOB+aMvhQaHtVWA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=DprMaoHJCMbhdffjaIvKiKWQ9O4sC4Eic9Ti4vH+D0bD2D3fW9yssbJTJHXgm2txXezn68uLpuxvzikBmdOB/WwSffyx1YJvU13q5ot8KDeJUOmN79aKskIblheXJCo2RZkk//sBjKxtc7/rgYkMKaYZQCzQl+d5OsdCxA6yd9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=P5CBdeaj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=RHc4CrXL; arc=none smtp.client-ip=202.12.124.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1155C2540203;
	Thu, 22 May 2025 09:04:11 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-06.internal (MEProxy); Thu, 22 May 2025 09:04:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1747919050;
	 x=1748005450; bh=wNY6l4wV3IAmGUJTqydxuvOlnaTtVOB+aMvhQaHtVWA=; b=
	P5CBdeajEX7ZItZ9GovcrsV1+gqk1N4Ij8LRfxFtxS7+jQp3LfSkZHvvbvYOYlcE
	pk0XCoTC3uHSpEOdhaZeX/gzL6UzN/ymJqbNd17lq26LbHAVq7zAdzI4++t6SyNS
	ePxo+SiNvOCQowZ1+MKX097keFltQ4xC3XNr0pmI66a1N8ACyxWOS4/WZRr4tyxC
	/cqdwMTfEI+UGpQWU1i3jnXzuJD3AOAlRUQ++WCKJZ0bbK3F/2+ebTBt+VgxvM90
	QbGWf4VQgTWFsfujgmgD71xFkfFGzTuB969eceN1pT1UM2BAth9Uz5fnEBubxNXF
	+VAmXWYN7g5hqitU9DTAIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747919050; x=
	1748005450; bh=wNY6l4wV3IAmGUJTqydxuvOlnaTtVOB+aMvhQaHtVWA=; b=R
	Hc4CrXLcj4HuLWeag8Kk/p6bHCfVfWYmnnBH2+3DtVF1vAWX4zzORtzP/QFaIn0E
	3bS97tw6OcacCcyx8hI519Hib6dgTBwBg1XwKhwI0NQSIIDxb/pMIzg2qt3BoEBy
	Ti7Tg2D/wSWtvw+BrUd8/MZH62Ne79l2dSI7GEtqOpjrjQrdpnrmHszPVOygxGBs
	YkbaJOWx/ON929kwrBG1ip5ZY3dJPD3KTtZMOWs6ZeJ8k2Pi3pyRL4faah19yv6W
	bupj6tvUbUqVDmM4otukef6Dzsg4F5KFoXpgOpLTDDhapt/MIw/IER/e7QyO2TcE
	flhyY1u9xovZkFctd7Q8Q==
X-ME-Sender: <xms:yiAvaLIXGOYnpknNeuic_2_H4CzF6o34wzzLP7shOB3nrIZckJA1HQ>
    <xme:yiAvaPIemhk-upI8VNTkzvEDzSSjBKwzmk43qU6W9Atwo0mM6J_bYxdmZF_2bMEN0
    8U_W67deb47NCl3y_4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdeitdefucdltddurdegfedvrddttd
    dmucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgf
    nhhsuhgsshgtrhhisggvpdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttd
    enucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgj
    fhfutgfgsehtqhertdertdejnecuhfhrohhmpedflfhirgiguhhnucgjrghnghdfuceojh
    hirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhep
    jeehfeduvddtgffgvdffkeethefhlefgvdevvdekuefffeekheehgeevhfevteejnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhn
    rdihrghnghesfhhlhihgohgrthdrtghomhdpnhgspghrtghpthhtohepkedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhk
    vghnrdguvgdprhgtphhtthhopehgrhgvghhorhihrdgtlhgvmhgvnhhtsegsohhothhlih
    hnrdgtohhmpdhrtghpthhtohepthhhvghordhlvggsrhhunhessghoohhtlhhinhdrtgho
    mhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtg
    homhdprhgtphhtthhopehtrgiffhhikhdrsggrhihouhhksehmohgsihhlvgihvgdrtgho
    mhdprhgtphhtthhopehvlhgrughimhhirhdrkhhonhgurhgrthhivghvsehmohgsihhlvg
    ihvgdrtghomhdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhmihhpshesvhhgvghrrdhkvghrnh
    gvlhdrohhrgh
X-ME-Proxy: <xmx:yiAvaDvx5LhDr_9xDav7flMGm2kZX_UJTaigqFoDmuXK9LFt-Y5kWg>
    <xmx:yiAvaEYkfTtpdTAW7ds_xZ396KfmTcrkEZqywm8TQL0aw72q8KPTiA>
    <xmx:yiAvaCYaqyM8HzUOb_DO5NifM_hg96mmcRJkuHj7aSbfaZDKiO8Pqw>
    <xmx:yiAvaIDiRnmXXhPo1gDT9EvIj6hZx6-LgkhMaSmfkDbX3xP41BU_Fw>
    <xmx:yiAvaLAloZ9iRNdcUPy1ZY4BPGikWvonUnAz4qY9SuOT9bp2fOvEANxE>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1DD2A1060064; Thu, 22 May 2025 09:04:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: Tfc8a567c59a896e5
Date: Thu, 22 May 2025 14:03:49 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Gregory CLEMENT" <gregory.clement@bootlin.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "Vladimir Kondratiev" <vladimir.kondratiev@mobileye.com>,
 =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Message-Id: <105ed884-9ee8-429a-9937-d8f58a221faa@app.fastmail.com>
In-Reply-To: <87ecwipfr2.fsf@BLaptop.bootlin.com>
References: <20250520-smp_calib-v1-1-cd04f0a78648@bootlin.com>
 <8c4ef90e-82db-4711-a5f3-446bcca00e9d@app.fastmail.com>
 <87ecwipfr2.fsf@BLaptop.bootlin.com>
Subject: Re: [PATCH] MIPS: CPS: Optimise delay CPU calibration for SMP
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82025=E5=B9=B45=E6=9C=8821=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=
=8D=888:47=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A
> Hello Jiaxun,
>
>> =E5=9C=A82025=E5=B9=B45=E6=9C=8820=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=
=E5=8D=884:21=EF=BC=8CGregory CLEMENT=E5=86=99=E9=81=93=EF=BC=9A
>> [...]
>>>
>>> This allows to implement calibrate_delay_is_known(), which will retu=
rn
>>> 0 (triggering calibration) only for the primary CPU of each
>>> cluster. For other CPUs, we can simply reuse the value from their
>>> cluster's primary CPU core.
>>
>> Is __cpu_primary_cluster_mask really necessary?
>>
>> Maybe we can just test if current CPU is the first powered up CPU
>> in the cluster?
>
> That is exactly the point of __cpu_primary_cluster_mask: setting in an
> efficient way the first powered-up CPU for each cluster. This adds only
> a single variable (which is actually just a long) and allows for minim=
al
> impact during boot time, by doing the minimum write and read operations
>
> I don't see a better alternative. What do you have in mind ?

Maybe we can try mips_cps_first_online_in_cluster()?

[...]

Thanks

--=20
- Jiaxun

