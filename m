Return-Path: <linux-mips+bounces-5518-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 82513974369
	for <lists+linux-mips@lfdr.de>; Tue, 10 Sep 2024 21:23:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B68F1F27065
	for <lists+linux-mips@lfdr.de>; Tue, 10 Sep 2024 19:23:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B5781A3BAF;
	Tue, 10 Sep 2024 19:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="pHx6udr6";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="TDuYfRvA"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout2-smtp.messagingengine.com (fout2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 539B2192B8E;
	Tue, 10 Sep 2024 19:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.145
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725996229; cv=none; b=PNG6CzrfPidrMqO1Pz4FCN6/oXk0lch29Z9l6MZA03fdiYDUj5+nsnOLQ+E6x440+pjZKCwIDGaEWBvHH2HwaoGH9sQMZQ+52YFChoNYDxH3YF+VcQoDsoLBNjIS60vazCyq16BPG+PENf7mVIUQatDId6ZMwPLixisgAfBRlr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725996229; c=relaxed/simple;
	bh=N0SZJZecx5PrYHytOqEKn2UWjaSSxHDk954jnXoy0f8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=UZ3seXTf02SKyP92gDTV6cvRm4bigFgpnzZHreE3LVcV5XHiBkuVU3RdI4+C41Z2I0VraxIzhxrNY17O+xjyvfXc1j7OBZ1xGkGN/J6rc0wVKOA2PLaUx5+jXFpJWF9WdfxZvijMF+VxUPXCBHA3m1PoF6u1jog4ij4VGWG4vug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=pHx6udr6; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=TDuYfRvA; arc=none smtp.client-ip=103.168.172.145
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfout.phl.internal (Postfix) with ESMTP id 56B9F138012B;
	Tue, 10 Sep 2024 15:23:46 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-09.internal (MEProxy); Tue, 10 Sep 2024 15:23:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1725996226;
	 x=1726082626; bh=kV0Mo3WeVcrK1903h/YVWhTggy9PQXCdOIKGBiih2LI=; b=
	pHx6udr6VoQZio584oHFB0cNf0hTNLd8lSc1aMInLX6rVt47A/rIBJh9vqNevVNz
	nCRO0HjLYWTTh+2Monqh/Qf7pGp7u7s6KaXARNfc0FK9z86GPmq2FAkLd8fnGrZK
	/zTBQaKTDsdRdf+nIMu1BaSSyt4XwG3ij8gcWt/ONyV9V8NSzNvESmA++ToO0ZXv
	f/LJp/L7/u17sb4l8GPWmbcxVrElo99TVej5ffTg7X1zNNPS5QzSbDjKH8MULaTC
	E0vbmjDqd7nJV2ufZiHTy1IgsJBK2DDOXju5oATSgosynDq/HBvYzfq/6iyFzn9s
	4GIelxK1B5ZSH3YdkUCUNg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725996226; x=
	1726082626; bh=kV0Mo3WeVcrK1903h/YVWhTggy9PQXCdOIKGBiih2LI=; b=T
	DuYfRvAG97Kw9nPXv5Mnbrb3jUTo9NvyMmnzRMGJrmNxYFdu77k+zH2EPH8iR1dp
	WLs/pnoP5ZZUxSrvsxXP+j2I8BHyFqwBlAIxaM3uQ3/43k9SKF0QyYd7FrSj1JJG
	yFJmNZ7ItwSPczUz2TIflpr9e2TCk7RVeo4L7ly2OFklmnycXTPMKit67CCf7J9w
	KW+aZO4blQfOUSGD+g/oKqUtKECZEw2b9Vf2DMn3rGbrGMhEYVkBxQZ3JcfxGQx/
	oqtXI8WeqR6UnWv2/4XpHuYiZZTIxnhWfkU9lguKdAPfsBj+aPT9V+vprqbVhhaG
	XXMEUkgfXLeQsT1RNJb9Q==
X-ME-Sender: <xms:wpzgZsfsdupekkULYVrye1VWqbnPddWXXPn3zSLsAK1yTu_TWooygA>
    <xme:wpzgZuO2x85WOwr31rhcY0MUd51bjUSh4UH9onzDQe1AMmQjj_pE3D4yvXCkopqZF
    loMmhHwzLF5bejUilk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeiledguddvjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredt
    jeenucfhrhhomhepfdflihgrgihunhcujggrnhhgfdcuoehjihgrgihunhdrhigrnhhgse
    hflhihghhorghtrdgtohhmqeenucggtffrrghtthgvrhhnpeejheefuddvtdfggfdvffek
    teehhfelgfdvvedvkeeuffefkeehheegvefhveetjeenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhihghho
    rghtrdgtohhmpdhnsggprhgtphhtthhopeeipdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopehtshgsohhgvghnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthht
    ohepfhgrnhgtvghrrdhlrghntggvrhesghhmrghilhdrtghomhdprhgtphhtthhopehprg
    hulhgsuhhrthhonheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhr
    vggvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrh
    hnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhi
    phhssehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:wpzgZtgo_eMrFLXREcbRK6xAQKXRsq0ABcg-OEdoE_KNiXZ_YCFqKw>
    <xmx:wpzgZh_gf8EbFLj6Pd15N4RQ9Y7tee34olox8tIQey5sK_Nyd0BWnA>
    <xmx:wpzgZosLpgHFFr8qcThgEhmQHsbdccZCIM0OqZJIIFxkLfAVxNeGxA>
    <xmx:wpzgZoFoHJHhTmKImH3WMYlb_D8ZN8zEzSTwbPvW_MjfnQOhay0_5g>
    <xmx:wpzgZiWH8rdJCb5BLA-UqTpCP0WK5xuHbQZvGCXi_d30LnQM3RDqliuE>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 26B9D1C20065; Tue, 10 Sep 2024 15:23:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Tue, 10 Sep 2024 20:23:25 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Serge Semin" <fancer.lancer@gmail.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "paulburton@kernel.org" <paulburton@kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Message-Id: <79acb1b1-9c1c-4a58-91a5-5dbb286717ec@app.fastmail.com>
In-Reply-To: 
 <ekvyyq3vzdbyi5suf4irfixyprvtko7rpkffwpc267kiex4ex2@lpu3ctysuviw>
References: <20240612-cm_probe-v2-0-a5b55440563c@flygoat.com>
 <20240612-cm_probe-v2-6-a5b55440563c@flygoat.com>
 <ekvyyq3vzdbyi5suf4irfixyprvtko7rpkffwpc267kiex4ex2@lpu3ctysuviw>
Subject: Re: [PATCH v2 6/6] MIPS: cm: Probe GCR address from DeviceTree
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B49=E6=9C=8810=E6=97=A5=E4=B9=9D=E6=9C=88 =E4=B8=8B=E5=
=8D=881:36=EF=BC=8CSerge Semin=E5=86=99=E9=81=93=EF=BC=9A
[...]
>
> This causes the kernel boot-up procedure to crash/hang-up because the
> CM GCR base address is supposed to be redefined by means of the
> already mapped CM GCR address space by accessing the
> CM_GCR_BASE_GCRBASE register:
> change_gcr_base()
> +-> read_gcr_base()
>     +-> addr_gcr_base()
>         +-> return mips_gcr_base + CM_GCR_BASE_GCRBASE
>
> By the time of the change_gcr_base() call in mips_cm_phys_base(), the
> mips_gcr_base variable hasn't been defined. So the IO operations
> performed in the change_gcr_base() method would be accessing the
> NULL-based memory space. That's why the kernel crash/hanging-up.

Thanks for the analysis!
This path was not taken on my audience hardware, so I didn't catch this,
will fix in next version.

>
> In order to fix this we have to first map the CM GCR block at the
> default base-address, then update the CM GCR-base CSR and after that
> remap the CM GCR-space.
>
> Please also note, the GCR_BASE field might be RO. It depends on the
> IP-core configuration. So it's possible that the CM_GCR_BASE_GCRBASE
> field update won't work. Although that will be detected a bit later in
> the mips_cm_probe() method by comparing the address returned from
> mips_cm_phys_base() and retrieved from the CM GCR-base CSR.

Hmm, I just checked RTL and RDL for CM2 and CM3 and I didn't see it as a
configurable option. It's possible to change hardware reset value but no=
t make it RO.

Maybe it was possible on earlier IP release, in this case it's always
user's responsibility to write correct address in DeviceTree :-)

Thanks

>
> -Serge(y)

--=20
- Jiaxun

