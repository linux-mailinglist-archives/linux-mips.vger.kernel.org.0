Return-Path: <linux-mips+bounces-4015-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 259AC91B42C
	for <lists+linux-mips@lfdr.de>; Fri, 28 Jun 2024 02:41:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3840B23837
	for <lists+linux-mips@lfdr.de>; Fri, 28 Jun 2024 00:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03AF24C74;
	Fri, 28 Jun 2024 00:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="m9IzlACb";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="g63nJDkr"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh2-smtp.messagingengine.com (fhigh2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F44EBA2F;
	Fri, 28 Jun 2024 00:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719535009; cv=none; b=Vg0Pn4il1DBEb2WAf4PMOf4CdforOFRUuQNShPCi4JshzpeDMAQyPoX1ihq+a1VAnqOPqSI44eEpJB52NH4nDxgncinq95Kl4qUS2/VZ7K43Voj2ba3NoR6kZUTLTjCyIlINnNV86Z+TUDUu9/Fk8+oqjsTCbVpn0Uhtvz4ru5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719535009; c=relaxed/simple;
	bh=6FeNaEk983gv0oi71Hy3QUiWUXGuEt4Dg/zsaW6TMc4=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=tQpAIrfgBt9oWrQlftePojiAdVDhX1FtmpsyYXgSs296X6sOkfY+iHftmlsrAjqcAndewP8JjEicb7/Z0XgvdDEHU9mKMb0rN6RfKcJU1xZ85h7XS24zGFi8P3tysxTD3f/R77GiZOHUbokS5d+U5EPn8Za3g/ogUbe41Np5k7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=m9IzlACb; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=g63nJDkr; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 8430411401FB;
	Thu, 27 Jun 2024 20:36:47 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Thu, 27 Jun 2024 20:36:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1719535007;
	 x=1719621407; bh=2bdVP6Gr0JVygxXiDLax6rFzl2pR37Qmj84xd4P8Oho=; b=
	m9IzlACbMuuDyuSTbqV97luVEVuZHTIDifiTH/N3EGKGY0+mCi5y3HPWaCwopyH+
	kU9AdMlxsoZkPYOHG80mMREV0eTNRpzsrlZMAibPtOkb/oezPvfd5d17Nwbnx/YC
	2QJLHdAa64Cb8xQfvZPDYxdTCJdB8ezfG78K/Ki74HFL5SKHPxHZVAKTGnGdVDbF
	cbzy+84wNG3V4E2kOMSYVOEn1VBiel6mBpbbnJSqgT9j8YXALh2zR6/h3RmSM7D4
	pkX7Zb7xkHPaQUY8SOeeK47Jaig1Dvi8KPmiyppvBxPlboLz/qgxKElM1Rvk2LBv
	f0VP5Paq9TQwXMm8m8/1cA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1719535007; x=
	1719621407; bh=2bdVP6Gr0JVygxXiDLax6rFzl2pR37Qmj84xd4P8Oho=; b=g
	63nJDkroaqPLD8/WPXAlKnNNyHV3TYWY6raPGS+bMX7Gav65IW9nXRRNCUudT8Do
	i6pqlJ2EHPkt/FVWWPet/ee1REk5d7A/w5BrTTdTesp3KI1epwocWRrRVmnuJ6WI
	JJ1U+bNK9RYZkOEnDGbsMvwqotZjHwO/wZKMXCKEt0UxKcxDTeSvLv6NjCJReKWi
	jZw9rOpWpqTmNKPrd9e+0h2EatdhTaROdOTqM+PHrXCdHH1lPYk/+y0yLf/7D4Bj
	N4o87p34ONhjrlS2gVGt3j/gySlWC8Zp/l/88j+2tRjeb8jXFuicTvdrNm4/1chH
	jAP0zaolSYpxRHIXXRLwA==
X-ME-Sender: <xms:nwV-ZliEB-HO-NZz2O5PqNQ_7PvgoM_dJYCuyjpsi3JEEVuOF5HWgw>
    <xme:nwV-ZqCFMCrZTukMS4xRbQRUeetBU46rXQzJI6mIEN70QK4Fw5t-8at19WYJNPAZM
    aMImF9s8P93oEeDzDQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrtdehgdefkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
    rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
    eqnecuggftrfgrthhtvghrnhepudefgeeftedugeehffdtheefgfevffelfefghefhjeeu
    geevtefhudduvdeihefgnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrg
    hilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:nwV-ZlH9lnXen6FcR7s1ODOqw9mQ_keF4fUlXgvSUwgFt6klCBs4iw>
    <xmx:nwV-ZqQNcMJXV4FZ9E_ILHIMd25DJFR2h6NR0v0ZOikspPlMRToShw>
    <xmx:nwV-Zizran0BpMamS7kOHoq66-XDBCL_GItsTYdn9Sbvz7X2Ai4fKA>
    <xmx:nwV-Zg5GRuvFc6qVRCKatiHjgoyNbMBzgJ71eUCY3afsCQN6q1-BbA>
    <xmx:nwV-Zsu7cilUp1bwcWw4rSPa_XEw3Jyr1_DfIzklmmQfMjRUtX5O4vBw>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 4004D36A0074; Thu, 27 Jun 2024 20:36:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-538-g1508afaa2-fm-20240616.001-g1508afaa
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <bf198418-ecb4-4880-8eed-f0af77d18e1a@app.fastmail.com>
In-Reply-To: <alpine.DEB.2.21.2406272046020.43454@angie.orcam.me.uk>
References: <20240616-mips-mt-fixes-v1-0-83913e0e60fc@flygoat.com>
 <20240616-mips-mt-fixes-v1-3-83913e0e60fc@flygoat.com>
 <Zn0qG5tsMBYcSWW+@alpha.franken.de>
 <394042b6-37ef-4011-b799-454036d8bc34@app.fastmail.com>
 <alpine.DEB.2.21.2406272046020.43454@angie.orcam.me.uk>
Date: Fri, 28 Jun 2024 01:36:12 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH fixes 3/4] MIPS: cps-vec: Replace MT instructions with macros
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B46=E6=9C=8827=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8B=E5=
=8D=888:51=EF=BC=8CMaciej W. Rozycki=E5=86=99=E9=81=93=EF=BC=9A
> On Thu, 27 Jun 2024, Jiaxun Yang wrote:
>
>> > how about simply enforcing the need for a correct toolchain instead
>> > of making the code ugly ?
>>=20
>> Unfortunately, MT for microMIPS which I'm trying to bring up is only =
in
>> binutils master, it's not in any binutils release yet.
>
>  It's not yet in binutils master either.  Has there been any actual ch=
ip=20
> taped out with this instruction subset supported?

interAptiv derivative (with MIPS R5 and microMIPS) from CIP which is not=
 GA yet.

Thanks
>
>   Maciej

--=20
- Jiaxun

