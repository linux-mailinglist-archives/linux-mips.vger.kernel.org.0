Return-Path: <linux-mips+bounces-7645-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C8DA23516
	for <lists+linux-mips@lfdr.de>; Thu, 30 Jan 2025 21:32:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D6040166E82
	for <lists+linux-mips@lfdr.de>; Thu, 30 Jan 2025 20:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B559A17ADE8;
	Thu, 30 Jan 2025 20:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="uQ0xlPb8";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IbIFrljo"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578498831;
	Thu, 30 Jan 2025 20:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738269140; cv=none; b=FnfFkKWHL3NbDTk+2Ykjdi7OXOjx3F8J624U3cCWRRxG5wRdsSjOPVTrMFivUSSmIIwq/cZGtrFRjL5KOpBJAua30dZcxwgR+NFlVEZOQZ0bK5w5uBCicdjff9+yvGmHyRAWcrUI6Ja010UN2MmJnmJ0YyINhIch2k0chtSETlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738269140; c=relaxed/simple;
	bh=iaYNHhhLXkbq7mJkf42ccF01YsDpTZFYGrwSniKMFqs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=e8kvxJDiMU3AyZY3C7ADnSo+pg14sMBQvhJvtpkN0G71nq0XfFCJdAvP2AQFsWoPPcfFKbHSd8jo/om7ynGN9C0ETIH/byGlxnD8CelQ9CxINpDK6ibHktM+zLGaTtbHhXv8InWDYTA6xBfFBpV+QvydPSLspU4D2EJE88pEFRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=uQ0xlPb8; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IbIFrljo; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1AE9111400C3;
	Thu, 30 Jan 2025 15:32:15 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 30 Jan 2025 15:32:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1738269135;
	 x=1738355535; bh=VcCOIC2laycN9FXXC+nh5F2ghWSkgsT/FDZobV9yOt4=; b=
	uQ0xlPb8DXKpdNoB8uIrKmM1tCWW8njAgtauEQw1sMHpn8YaZvEAwLKKEUBQnWWX
	6t2eSkQhXEPRVjogo3vIUMxqKKQjybcmBKPiTwo3xjXQTefa2IOZB2IYDzfWRRw3
	U0XdzCRjLdQn0vQmU8Dgj1V51GaQRzWHYxgzAPJSBKVr5Y6X1gHTS0NZP/X/JILl
	1strp3vonViGOHbmC9vNvKcNkN2jlmfwMiMoRFxicmqYMW+RdvhjTosKnSIslFpX
	SfzqDeq8shyDx1HrVf8dupttjhPNFSLA8xY0QJm4b5Yn+wIDToh1eACmJSDZ5gNm
	y2O0GypL2ldlarLyXutKRA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1738269135; x=
	1738355535; bh=VcCOIC2laycN9FXXC+nh5F2ghWSkgsT/FDZobV9yOt4=; b=I
	bIFrljoX7TB4oaoFM+rXUCS/Ss17OROYcs5ey/rEnOQ1+9Cc0nRFZISrfMelIrcY
	SUWVYNeZHN0MNNAOfCE8JS8D+H6Td6ZI0dZ+DY0Ughzsk9hT8ScmiAliWHMyyUcK
	PW9ZQCqU1uJvu32obTGLZoNnKOXir5KQr2n2WJSa5+iTdEme3ectDNtbVQYF5obu
	ojAXTB0vzOfR9OvAlwvz2JFdkb7uVAmGHZxGjxrr5/3qlh5xN/AdksrIplH8y5o1
	RHaqSkNbGVoggsJErl8Anxs65a7xuFAsH1SDtq0Xd9ETYO7k/kMulV5D9tqY1/+j
	SokMMdF/B3BMmxVFpZkDg==
X-ME-Sender: <xms:zeGbZ6uiG17WGJVwSVXjLjbuPnRoTy7mTrPVmuEiREjyw8w65uFL0g>
    <xme:zeGbZ_cAhG2nL_fc-yRgtWsgsSX5j6-d0E3jQ9JK_hxqqf830x5s327bEBhuvOBkl
    -ombqnwS3gjFTkW7A0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeikedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepvdfhvdekueduveffffetgfdvveefvdelhedvvdeg
    jedvfeehtdeggeevheefleejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepledp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrd
    hfrhgrnhhkvghnrdguvgdprhgtphhtthhopehjvghffhiguhestghhrhhomhhiuhhmrdho
    rhhgpdhrtghpthhtohepihhsmhdrhhhonhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoh
    eptghgiihonhgvshesghhoohhglhgvmhgrihhlrdgtohhmpdhrtghpthhtohepsghrrghu
    nhgvrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfoh
    hunhgurghtihhonhdrohhrghdprhgtphhtthhopehhtggrsehlihhnuhigrdhisghmrdgt
    ohhmpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtoheplhhinhhugidqmhhiphhssehvghgvrhdrkhgvrhhnvghlrdho
    rhhg
X-ME-Proxy: <xmx:zeGbZ1yrJkf4MkPNPf9F1iuLBZHLe3uoJuC63Hr7-SyqbBt5ZXpTjw>
    <xmx:zeGbZ1MKHw8m0Y6oua2CbKQTGrzs_jyL3AC8muZY5uB9DmlZsbRn5w>
    <xmx:zeGbZ6-7RQ5DSm16FL4irshjJWTuZ_x2PN5OgDmzheFjafXAuhgycw>
    <xmx:zeGbZ9W_igLwCO76kLWPpBCq9fEWgE7Mb0kOdoipQk84-cNP9CWL4w>
    <xmx:z-GbZ-Qih7uTQSUr9S5gS038wsmKz3-uN8lERuPCRqd6pJgWbrnKQeIB>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A8CD92220072; Thu, 30 Jan 2025 15:32:13 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 30 Jan 2025 21:31:52 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ism Hong" <ism.hong@gmail.com>
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Christian Brauner" <brauner@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Heiko Carstens" <hca@linux.ibm.com>, "Jeff Xu" <jeffxu@chromium.org>,
 =?UTF-8?Q?Christian_G=C3=B6ttsche?= <cgzones@googlemail.com>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 "open list" <linux-kernel@vger.kernel.org>
Message-Id: <7afff28d-45e0-4e15-bb37-270856403bf7@app.fastmail.com>
In-Reply-To: <6d0659c3-fd86-4eab-879f-d9b149462358@gmail.com>
References: <20250106115227.1365643-1-ism.hong@gmail.com>
 <5427df64-658d-4377-89be-963ee7bb68ee@app.fastmail.com>
 <6d0659c3-fd86-4eab-879f-d9b149462358@gmail.com>
Subject: Re: [PATCH] mips: fix shmctl/semctl/msgctl syscall for o32
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 30, 2025, at 15:46, Ism Hong wrote:
> Arnd Bergmann =E6=96=BC 2025/1/28 =E6=B8=85=E6=99=A85:20 =E5=AF=AB=E9=81=
=93:
>
> Thank you for your explanation, and sorry for the late reply due to th=
e=20
> Chinese New Year.
>
>  From your response, I understand that the preferred solution would be=20
> to modify uClibc to align the behavior of semctl/shmctl/msgctl with=20
> glibc and musl by adopting a unified feature test macro. If that is th=
e=20
> case, I will work on preparing a patch for uClibc accordingly.

Yes, that is correct. I think musl doesn't call the separate
syscalls if the architecture provides the old-style socket() syscall,
so it's not affected either way, but glibc needs the revert.

     Arnd

