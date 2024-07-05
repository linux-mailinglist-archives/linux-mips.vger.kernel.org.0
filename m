Return-Path: <linux-mips+bounces-4154-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C36019284C6
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 11:09:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29EA6B25D19
	for <lists+linux-mips@lfdr.de>; Fri,  5 Jul 2024 09:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B30CC146A92;
	Fri,  5 Jul 2024 09:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="HIHRlsT+";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mDvMH4El"
X-Original-To: linux-mips@vger.kernel.org
Received: from fhigh7-smtp.messagingengine.com (fhigh7-smtp.messagingengine.com [103.168.172.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8341465B5;
	Fri,  5 Jul 2024 09:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720170558; cv=none; b=pv+XN9qh8LSiZO50egVyW47AZ5TNvOCSsT6Bt4kejfSC+zoskoyHp8HnEYkQC1lXWt6+/6kBYjBX/abSdcMfD7Qvxfqqt12qxpiK58gWughRnsJwqctij3zmXWg4damVpdh81PbOQwhbE5WvJ7vAQAf1FdzLOVkkyKU3TdqsmxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720170558; c=relaxed/simple;
	bh=Geb5jGnwjPcjwL5frTmbEUkuNp701X20Oewdu72/JAM=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=qsfrJIlHRC0INch94UZUkK7VdwSyOIWhi8yeTE69dunQWOcHiGc530Z2TxkvoeQljYN72mIBs0+ZZW6Joryfr0voXA1THHS2LkyHl8WY/SanhD02O/8YHGqxIT81BFmXN+IZ8wIWGvk7eEKhKTV4tYpNOn2eCTAd3+gSzXryIX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=HIHRlsT+; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=mDvMH4El; arc=none smtp.client-ip=103.168.172.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id E98111140286;
	Fri,  5 Jul 2024 05:09:15 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Fri, 05 Jul 2024 05:09:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1720170555;
	 x=1720256955; bh=caj0IOpoIy84ZuuS3aEvd7ipcA+dVWEwGvUzA+jg7/I=; b=
	HIHRlsT+FNqdSB76omyj7A47rc7IGGB8Bz36HfevDjsCa50E7Ec7j0bGQEOBgCTn
	+rfJaWvSFNDi/POkExTWLVjqOWGv8ftES5QL1QJ/zfJsJH8GxKBeJ4lNYl2qe+9R
	K9A5rlpPSg32SA/6QlDPkbajRgdhV+mMmgVGU0xAtnEUtJrMQi3bMcjbZaDmfYen
	ZO5dEFPwdDwKOvUISRwt2UvJQH6vwLJYEkio+wIf975dXa30MISXtzkJ8hdx0+fv
	h1kRid0zVWgkCuBp85Iez5859Clza4o2pmrihLFJA9MvnKeDH6sry+zi8FwulEG2
	6lXlidotNcFs8y+VF+bd5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720170555; x=
	1720256955; bh=caj0IOpoIy84ZuuS3aEvd7ipcA+dVWEwGvUzA+jg7/I=; b=m
	DvMH4Elbw1eymDCkblo1RnULSzeycd9g4F/uB/5EIaRdtRgSQoH/8rvaBrsDofPr
	eBcOY8ojR5oyoeEnTcWbKaeFXHF6JSnekWUygYlPBsule77jadIvicQG04c1YKBU
	wz9uXWY6cOQ1GPdw8O6GYyOqo3TxUqj6l0DtkyQqvke1/VdxQUbxVfjsH2N7Yzz1
	bY5Hj8IlAmK8X1eKmKTnlscX52hjXibEYjYyMm7YL91wxTC9lBozV501PJqJglOw
	LDZUxWArpsZ/aqbF8ld4sn+F7XDMLIUgo8PfwMG4gmnbltVXsoi4l4SxU8dGduqx
	5B7bbRGngtVbGPdS1jcqw==
X-ME-Sender: <xms:O7iHZtKlH63onytA_-POLdTgR5OdqqrjNu3RnQ1ZAsNEQ_FMD-wDQQ>
    <xme:O7iHZpJiAme1yl3P_5kkSfZcZ_sLkaY5UIHFKbTmMDgJeQzzI41lCO01MASfF7y3h
    OclPesOs86rmc15w7I>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddugddufecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
    rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
    eqnecuggftrfgrthhtvghrnhepudefgeeftedugeehffdtheefgfevffelfefghefhjeeu
    geevtefhudduvdeihefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:O7iHZlt8i3KeEnq4uga2M982AOz5Tx51-uhDx9NHK36dfPeUm07Ryg>
    <xmx:O7iHZuYg5ekO0RsY3jNN4SpGCCTluD2Dq8kCHbd5my5s6iS4hZGGdw>
    <xmx:O7iHZkZqaXajsOvgOBl82T-C163tmyJRoRPLlEc3GdJ3LKuOTvzbOA>
    <xmx:O7iHZiDAy019Pvf0i2deH4vgtaIKzDFs4xtaGxnsYTPEd-qgyHIryA>
    <xmx:O7iHZilHvHLCTRsGnOyAFJ5FMwp1FkuNowBDwxUahyT-u1W55rpaWLh9>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7B70D36A0075; Fri,  5 Jul 2024 05:09:15 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-566-g3812ddbbc-fm-20240627.001-g3812ddbb
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <0a65121b-cf33-4700-84cd-22bc9970f370@app.fastmail.com>
In-Reply-To: 
 <kzcncrqchl42itomsncvgjem6iddwhslw3djcgkyzxl6xtfi76@wsuswv3vty2x>
References: <20240616-b4-mips-ipi-improvements-v1-0-e332687f1692@flygoat.com>
 <20240616-b4-mips-ipi-improvements-v1-1-e332687f1692@flygoat.com>
 <ZoVokcDYqZnuqd2X@alpha.franken.de>
 <kzcncrqchl42itomsncvgjem6iddwhslw3djcgkyzxl6xtfi76@wsuswv3vty2x>
Date: Fri, 05 Jul 2024 17:08:36 +0800
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Serge Semin" <fancer.lancer@gmail.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Florian Fainelli" <florian.fainelli@broadcom.com>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: 
 "Broadcom internal kernel review list" <bcm-kernel-feedback-list@broadcom.com>,
 "Huacai Chen" <chenhuacai@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "paulburton@kernel.org" <paulburton@kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/10] MIPS: smp: Make IPI interrupts scalable
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B47=E6=9C=885=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=8B=E5=
=8D=884:40=EF=BC=8CSerge Semin=E5=86=99=E9=81=93=EF=BC=9A
> Hi folks,
>
> On Wed, Jul 03, 2024 at 05:04:49PM +0200, Thomas Bogendoerfer wrote:
>> On Sun, Jun 16, 2024 at 10:03:05PM +0100, Jiaxun Yang wrote:
>> > Define enum ipi_message_type as other architectures did to
>> > allow easy extension to number of IPI interrupts, fiddle
>> > around platform IPI code to adopt to the new infra, add
>> > extensive BUILD_BUG_ON on IPI numbers to ensure future
>> > extensions won't break existing platforms.
>> >=20
>> > IPI related stuff are pulled to asm/ipi.h to avoid include
>> > linux/interrupt.h in asm/smp.h.
>> >=20
>> > Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> > ---
>> >  arch/mips/cavium-octeon/smp.c   | 109 ++++++++++++----------------=
-------
>> >  arch/mips/include/asm/ipi.h     |  34 +++++++++++
>> >  arch/mips/include/asm/smp-ops.h |   8 +--
>> >  arch/mips/include/asm/smp.h     |  42 ++++++--------
>> >  arch/mips/kernel/smp-bmips.c    |  43 +++++++-------
>> >  arch/mips/kernel/smp-cps.c      |   1 +
>> >  arch/mips/kernel/smp.c          | 124 ++++++++++++++++++++--------=
------------
>> >  arch/mips/loongson64/smp.c      |  51 +++++++++--------
>> >  arch/mips/mm/c-octeon.c         |   2 +-
>> >  arch/mips/sgi-ip27/ip27-smp.c   |  15 +++--
>> >  arch/mips/sgi-ip30/ip30-smp.c   |  15 +++--
>> >  arch/mips/sibyte/bcm1480/smp.c  |  19 +++---
>> >  arch/mips/sibyte/sb1250/smp.c   |  13 +++--
>> >  13 files changed, 236 insertions(+), 240 deletions(-)
>>=20
>> you are touching a lot of platforms, how many did you test ?
>
> In a one or two days I'll be able to test the series on the SoC with
> 2x MIPS P5600 Warrior.

Thanks everyone for the collaborative effort, I=E2=80=99m  impressed!

Will respin this series later today.

Thanks
>
> -Serge(y)
>
>>=20
>> Thomas.
>>=20
>> --=20
>> Crap can work. Given enough thrust pigs will fly, but it's not necess=
arily a
>> good idea.                                                [ RFC1925, =
2.3 ]

--=20
- Jiaxun

