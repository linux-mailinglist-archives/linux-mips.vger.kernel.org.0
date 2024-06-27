Return-Path: <linux-mips+bounces-3986-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2B891A4CA
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2024 13:14:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3563C28337F
	for <lists+linux-mips@lfdr.de>; Thu, 27 Jun 2024 11:14:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05562146D7D;
	Thu, 27 Jun 2024 11:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="eWoA35Ie";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="utL5o6d+"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfhigh2-smtp.messagingengine.com (wfhigh2-smtp.messagingengine.com [64.147.123.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1591513BACC;
	Thu, 27 Jun 2024 11:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719486889; cv=none; b=ei3Z8/XOwAFpWIehtQhbTrOpoG8FKg6uNdhcHHy+bixsCaky/K1nU7OzVepAWS215XixKiTbMwDesfZzc99pv0F7NbIyeE9g944s+YhBIeF7NzYfimyLX3hvasAELhabLepHw0CLsLtM2qza8C85zMDd8Uf6V/H/b+vSrwqcPRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719486889; c=relaxed/simple;
	bh=cYYR+xWpqfebO9yx3aTeOVdvVZYNJ+j942X0/SW/VSE=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=iuq5A29bEkZGC5ix9WKbZamsfvbOZe+8HaPuI8S8Dkm5Z1zfHtWKcNJZK1DXX1w/PDGRnv9ECiEOMARBjWHInOqtp/gRMWtefW4+JKV91ZHM/Not6huUbazHRfvpK/wX6NY/GXuFIjd0goCZmgIMSo8ZV73OWUhdR82XRwIkrO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=eWoA35Ie; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=utL5o6d+; arc=none smtp.client-ip=64.147.123.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.west.internal (Postfix) with ESMTP id E97A5180008D;
	Thu, 27 Jun 2024 07:14:46 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Thu, 27 Jun 2024 07:14:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1719486886;
	 x=1719573286; bh=ibMZBiUawSovWXeMUq73em+annDobAZMXPCgXk00oSA=; b=
	eWoA35IennGyeb3QyvcOTGSCBc1+iLoGsl5D4uIA1sLI+I6R2F0c/xw+EPiBOp6f
	WqjJbkIitHuBQMdnkBldaTYnX5UUy/9tvlAR5qVsfs+wHtYIjxnZ+gGFgPDeKQ6D
	I/gn7gMySG6nZLIVKvu29xvXdibGOuj+vuuIjyezxVotCYasWJrephUVAs6IiSKO
	PE8kfBcWPFjZ3/GJsnLNlPoNbGAs5IqjPh4FYt8pX5e61T691TvMb0XzneuXHjZZ
	yNnaGtb5of+sgFtiNgjp5MwfBsrGZQpmTrWjY28IMgk2dHZ91LpBZKNXsr0LZ/6X
	rZr6yycjMXZSooesbeljng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1719486886; x=
	1719573286; bh=ibMZBiUawSovWXeMUq73em+annDobAZMXPCgXk00oSA=; b=u
	tL5o6d+44YnaJM6023MRfejQ2Eojqwg50vEVYqq05f2xCUsSzus7pwhk9tVqLpu1
	epWFnA55JHLddAQNWng3dsxz+cLgxNPigpaogGeJr63uEbDGEu0rad0PMeLh8QB8
	SRKV4Rgz9z9Aj0CCaUOolDBKgTiwUNvrO0XEyV8eMj8XIOZfmO5fe0FusKPayh1G
	4f3qlW0bKYYe2Rpva4qALxk1Cz+As06sCOK651utO1u1JAkT2HLmNMYmnZxZZaWn
	1HUuWFTh+vwuGoK8icXy+IDCqJIbTyX2GC7dChy4lSxk7Jtg1kyzEOxw3npMJFVY
	IGisRQ4cvQ8LKNIfbiUKg==
X-ME-Sender: <xms:pkl9ZhVx-dxHbsCbpRR6aH177i96XHUguQx2Y_rogscP8rRbFA2MXQ>
    <xme:pkl9ZhkgIO9ERSBpK7On9uVaUwqmIPdKMPpW_AhAEBvPK1zr-iFYY_BtMkFTlPK0v
    5R5dShbszKFj6SbPq4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrtdeggdefkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
    rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
    eqnecuggftrfgrthhtvghrnhepudefgeeftedugeehffdtheefgfevffelfefghefhjeeu
    geevtefhudduvdeihefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:pkl9ZtZ48OmvURA4lXgsM_JPHFttZBs82YwbEmGN74_QrbWSugAngA>
    <xmx:pkl9ZkUjH-b5nTtm7BmvhoSDdooxfMjb9tFCZZHgWwsNlks82KAVbQ>
    <xmx:pkl9ZrnG0Yp6C4e6c8OhRgCqor0imlDIfcWo_6ucvyEhLGff_EBJbA>
    <xmx:pkl9ZhdvTrVuexl7eGQelRn8scPjcX4tXVaRnQcjObcD9DrkrLarzQ>
    <xmx:pkl9ZpgAF1Nx1ilnQSINakixhdYTHn54iIPnPIlqVq8NNrvtal2Y3RCu>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 415D036A0074; Thu, 27 Jun 2024 07:14:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-538-g1508afaa2-fm-20240616.001-g1508afaa
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <394042b6-37ef-4011-b799-454036d8bc34@app.fastmail.com>
In-Reply-To: <Zn0qG5tsMBYcSWW+@alpha.franken.de>
References: <20240616-mips-mt-fixes-v1-0-83913e0e60fc@flygoat.com>
 <20240616-mips-mt-fixes-v1-3-83913e0e60fc@flygoat.com>
 <Zn0qG5tsMBYcSWW+@alpha.franken.de>
Date: Thu, 27 Jun 2024 12:14:24 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH fixes 3/4] MIPS: cps-vec: Replace MT instructions with macros
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B46=E6=9C=8827=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8A=E5=
=8D=8810:00=EF=BC=8CThomas Bogendoerfer=E5=86=99=E9=81=93=EF=BC=9A
> On Sun, Jun 16, 2024 at 02:25:04PM +0100, Jiaxun Yang wrote:
>> Replace MT instructions with macros to deal with assemblers
>> not supporting MT ASE properly.
>
> how about simply enforcing the need for a correct toolchain instead
> of making the code ugly ?

Unfortunately, MT for microMIPS which I'm trying to bring up is only in
binutils master, it's not in any binutils release yet.

LLVM support is also pending.

Thanks
>
> Thomas.
>
> --=20
> Crap can work. Given enough thrust pigs will fly, but it's not necessa=
rily a
> good idea.                                                [ RFC1925, 2=
.3 ]

--=20
- Jiaxun

