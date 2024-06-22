Return-Path: <linux-mips+bounces-3856-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0209135C6
	for <lists+linux-mips@lfdr.de>; Sat, 22 Jun 2024 21:06:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC4A22836A9
	for <lists+linux-mips@lfdr.de>; Sat, 22 Jun 2024 19:06:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2328E2D052;
	Sat, 22 Jun 2024 19:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="fkZ6bI9I";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="OnBs5KqO"
X-Original-To: linux-mips@vger.kernel.org
Received: from wfout6-smtp.messagingengine.com (wfout6-smtp.messagingengine.com [64.147.123.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5CD1863E;
	Sat, 22 Jun 2024 19:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=64.147.123.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719083212; cv=none; b=Bkau6AqZvMhuIVKrxFvYYUDJtZcIXioEEUzb1IDz6fu2UlcN3TqRINiXrlBx2P5RnS1qqibplCoBou0PmXxKFWoFgVrPcmYFIxAPVCvdD1FuBvgMiLydfW2xxXJDu6SsenFw03htXoD21LpxEL/DJxJUbaUEkouO3HP/CmNA3Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719083212; c=relaxed/simple;
	bh=r4NAfeztUwL/BJd+0mcWpNeVg5Ang9ARryrTpzHPa+k=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=M1aRaNiCNnzryjjX6Su/ELoEzCfPXQxjda5J/EaA/khjoI8M/Q0NDcjABZA7ekBmXIr5GdTuzkTzqJ/6WIrZteIely5x79N/9fnXfE4A9QfDryz0hAWZy0Kj77qZHC6qjNwgX53cHk3vAMTb2Q8RaCFPxxnqjBiu1OXNDCpxECQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=fkZ6bI9I; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=OnBs5KqO; arc=none smtp.client-ip=64.147.123.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.west.internal (Postfix) with ESMTP id 99BE91C000B8;
	Sat, 22 Jun 2024 15:06:48 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Sat, 22 Jun 2024 15:06:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1719083208;
	 x=1719169608; bh=3iSvzQUPYRn852sXVZfCY1CE4cmCTtU2TMLXcCOvQbM=; b=
	fkZ6bI9IpohMYDUUkPo3p/kyXC18E0xZqreS1hFTYErYS57Csgq2OAB4k3PN8piG
	TvP494JDC2rMYMybTge9rQpEFf7ezMu7W32jAp1PAtl0eTps0+xz0aypcazmP8OZ
	GTTdyThRz3wH0xhFIaHtqic57f4eGqg3zl1LbXgjwsiRUmnClCYZJi4N23SHgOVP
	X0Shlg7fCzu1pXuM1Wi1tMkZp+y8swoM8/kn7O1y8O1v2N9omChAuwrih2R+ImON
	L9mqmkmFTR61a/vx+l3CQ7b5s1mHxWJo5s2hH0B6vCDKJV7I5By5DVHep8iLtUVx
	0D407COsDaU5XRZ8ml2ZDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1719083208; x=
	1719169608; bh=3iSvzQUPYRn852sXVZfCY1CE4cmCTtU2TMLXcCOvQbM=; b=O
	nBs5KqO40qPEbgiIf/1hS2JxxYj0f0hh7prVVuTVyUo33qFK+CukkYVRlPA3ABmk
	Fdxhqk/jOrJaQj2lB+OGpFdWKjQS6JcXW/8ut9F0fBE6F/h+qNcINwuni7Laavqs
	oc5EhJkd+hglfCBfDhDTYuINaQe2q3C9rSI92NyHwA8Oj27sOpAJXa/CiCAH214R
	F2Dlxe4091EFOQsQW8G7bP55rRl54OJhRiLVh3F/6ImwJ8hrN/2SLRyMfs1F9000
	iC77Cr00LIeH/nd77Vlcdw1prqbZyYv7jP/Oez2zEbqPaCLI/KEwYPcKt36mPXqD
	MHEgEy5VmYo7SvlYTPGkg==
X-ME-Sender: <xms:xyB3ZuvTNkecoMW9OJVOmvTVG8kXV-ip7wd9tHjuKMjB_g8qqp8Z7w>
    <xme:xyB3Zjd5VwOkyaGw9ycMAbAf6BNwPDJNaj_M-5SYMBpK8FODw9ran9XhUeh3pMNor
    C6n8UyqfrfJU1zsXLw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeefiedgudefiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    lfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtg
    homheqnecuggftrfgrthhtvghrnhepudefgeeftedugeehffdtheefgfevffelfefghefh
    jeeugeevtefhudduvdeihefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:xyB3ZpxeOmsoIJZxnG5tIsSY_fpdPp2Wjru72Vwz57-ijtujXw8ifg>
    <xmx:xyB3ZpPcjd0ebMx-BJsybglASWzBGOANtVLtU5ZLp1pZ0oc2R788Mg>
    <xmx:xyB3Zu_AWtf5edbIQ8XOC4ziAUuG2YIpPKqJPIlnXzQWalyDPGv_kw>
    <xmx:xyB3ZhV8Ndp7pu4WIUa79TymhUpwO-Xg_jicB4uKL3M0llkg4uksHg>
    <xmx:yCB3ZhZIb4xe4TVgrocpb694OnJyzEAQlHLpVN4uHm5ZQkfJ_DGlwdou>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 957A636A0074; Sat, 22 Jun 2024 15:06:47 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-522-ga39cca1d5-fm-20240610.002-ga39cca1d
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <5eed908d-3943-4a4d-b0ec-c7acdae63c5e@app.fastmail.com>
In-Reply-To: <6ca74ccf-b93e-4d77-8609-a12a96c15f38@kernel.org>
References: <20240618-boston-syscon-v3-0-c47c06647a26@flygoat.com>
 <20240618-boston-syscon-v3-7-c47c06647a26@flygoat.com>
 <6d3fbd07-72a0-43fd-a1e5-c39e3a833bc1@kernel.org>
 <51557e31-0a59-4278-a8c1-25cf66fa3c3f@app.fastmail.com>
 <808f27bf-9dc7-407a-86ff-0a8fae79531c@kernel.org>
 <856ff7b0-774d-4120-8bd8-01270f5c14b4@app.fastmail.com>
 <6ca74ccf-b93e-4d77-8609-a12a96c15f38@kernel.org>
Date: Sat, 22 Jun 2024 20:06:24 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Lee Jones" <lee@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "paulburton@kernel.org" <paulburton@kernel.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH v3 7/8] dt-bindings: mfd: Add img,boston-platform-regs
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B46=E6=9C=8822=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8B=E5=
=8D=887:12=EF=BC=8CKrzysztof Kozlowski=E5=86=99=E9=81=93=EF=BC=9A
> On 21/06/2024 17:51, Jiaxun Yang wrote:
>>=20
>>=20
>> =E5=9C=A82024=E5=B9=B46=E6=9C=8820=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8A=
=E5=8D=887:40=EF=BC=8CKrzysztof Kozlowski=E5=86=99=E9=81=93=EF=BC=9A
>> [...]
>>>>
>>>> Hi Krzysztof,
>>>>
>>>> I believe U-Boot's implementation is correct. As per simple-mfd bin=
ding:
>>>>
>>>> ```
>>>> simple-mfd" - this signifies that the operating system should
>>>>   consider all subnodes of the MFD device as separate devices akin =
to how
>>>>   "simple-bus" indicates when to see subnodes as children for a sim=
ple
>>>>   memory-mapped bus.
>>>> ```
>>>>
>>>> This reads to me as "if you want sub nodes to be populated as devic=
es
>>>> you need this."
>>>>
>>>> In our case there are "clock" and "reset" node sub nodes which shou=
ld be
>>>> probed as regular device, so it's true for us.
>>>
>>> No, you already got comment from Rob.
>>>
>>> Your children depend on parent to provide IO address, so this is not
>>> simple-mfd. Rule for simple-mfd is that children do not rely on pare=
nt
>>> at all.
>>>
>> Hi Krzysztof,
>>=20
>> Sorry but can I ask for clarification on "depend on parent to provide=
 IO
>> address", do you mind explaining it a little bit? Does it mean childr=
en
>> should get regmap node from a phandle property, not the parent node? =
Or there
>> should be a reg property for child node to tell register offset etc?
>>=20
>> There are way too much usage that children "depends" on parents someh=
ow
>> in tree, so I want to confirm my understanding.
>
>
> Your driver relies on parent IO address to be provided - what's more to
> explain here? If parent does not provide syscon, does the child work?
> No. Therefore it is not suited for simple-mfd.
>
I can name too much "simple-mfd" devices that depending on parent to get
it's syscon, in fact it's true for almost all "simple-mfd" users now.

I greped RISC-V's DTS, and all two users have child nodes depends on par=
ent
node to get "IO address". For "canaan,k210-sysctl" it's both "canaan,k21=
0-clk"
and "canaan,k210-rst", for "starfive,jh7110-sys-syscon" that's "starfive=
,jh7110-pll".

If that's something prohibited, then we may need a generic driver in ker=
nel to
catch all those syscon devices lost eligibility to "simple-mfd" to get t=
heir childs
populated.

We also need to think about how to handle "syscon-reboot-mode" and "sysc=
on-reboot".
"syscon-reboot-mode" is explicitly relying on parent IO address, for "sy=
scon-reboot"
the ability of not relying on parent node (regmap property) is deprecate=
d as well.

I think we need to make those rules explicit, I'm happy to write a docum=
ent or update
Devicetree specification about that, but I need to make it crystal clear=
 to myself first.

Thanks
[...]
>
> Best regards,
> Krzysztof

--=20
- Jiaxun

