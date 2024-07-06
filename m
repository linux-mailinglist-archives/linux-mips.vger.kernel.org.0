Return-Path: <linux-mips+bounces-4174-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A05A92911A
	for <lists+linux-mips@lfdr.de>; Sat,  6 Jul 2024 07:13:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A66791F226E5
	for <lists+linux-mips@lfdr.de>; Sat,  6 Jul 2024 05:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC7110A1A;
	Sat,  6 Jul 2024 05:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b="ZJJ/3XuP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="X8a8QJuc"
X-Original-To: linux-mips@vger.kernel.org
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F341757E;
	Sat,  6 Jul 2024 05:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.150
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720242822; cv=none; b=ddMHa8va2uUAuShWC0Elgl6iLsT3WjHl8BSr7XhVxpWt2agJGgh8AcmtTVxwULTM81DHcyd/BswPAVEXr+8yKjFKNs5WAClB0wuO5ptH1d0Pwwv3c40if8vIOV8Y12B6t7wLSlZt2JI0bxM3Bz+mfbzTUhskAKRxrrX1koUe4Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720242822; c=relaxed/simple;
	bh=9RZgcQef9A8EDjSOss8dzeGpd1aXeonLkhkDDmhSVBw=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=o7So/jJIMhv4BS9E1MWulyMMlrzjVH5AIR2CdXI1dTayvbIvnn99ed7mOcsOVI6BfFfO/mtSoy7khEdA7tmeFCWivixm1WUKgLD56kgejIdTjAg/9mipu/vsX+qQk1XM03AuQo2qsSeKD6zHtJnRTiY6qXQ5UrSbT9j/QrsQYck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; spf=pass smtp.mailfrom=flygoat.com; dkim=pass (2048-bit key) header.d=flygoat.com header.i=@flygoat.com header.b=ZJJ/3XuP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=X8a8QJuc; arc=none smtp.client-ip=103.168.172.150
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flygoat.com
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailfout.nyi.internal (Postfix) with ESMTP id 47A6A1380603;
	Sat,  6 Jul 2024 01:13:40 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Sat, 06 Jul 2024 01:13:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1720242820;
	 x=1720329220; bh=0bzQ7Y5XTLJH38zVzN76yLI8mh1dQVhOzCGF8i6JY98=; b=
	ZJJ/3XuP4WKKGxPxloHLo0U1sebb5grAiNEsvQBEeIqOQVtzoAu5ItoS/6FCewyY
	mjt14pqzZtsRGjGgHIQut8+vgLSHH/r6QW2My4xzYu3yaYd+AMErnO0YR5SLjbG0
	ueA3Q1hnd9uTOd5y8WCUfe7hx1etNo6LCIA28FtCcRNN9Jj4/2gZ/X+S4DyRQ+nt
	6iwumK63Q8n2oD1tYqGpWwcI4BLsiEhy59CL7K1cHrqKqgkDdfsBwvu/3AyUb0A3
	eYhdV7Js7LcZSorCoV3RGivAkc6n5GTnhoviy4quZtyYW0ct2SNsDAUA2EEtkbTz
	l7UfRfW+86WUcUlSnA+JYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1720242820; x=
	1720329220; bh=0bzQ7Y5XTLJH38zVzN76yLI8mh1dQVhOzCGF8i6JY98=; b=X
	8a8QJucPewS/KMNM1q3Kzqka/4lTDcFrlL2eVIZ7YRHuML2GRMkTVIGa+QhzFXKo
	L5Ckseqjkdvg0kiXrkDn3iQv9hV1iHeDv4PP5wUTqYbzr9Pt3v9UAwm5xWe8ofBa
	CHp12cPDCjfc1z15MQalJfnlw0Q2KE2lWDlei4+MzWykwoVOL/6Hliyteu/849/G
	YBH6y3lUpMP6vcoT1MRWsqt8Oy5bTcBrDUX2rhMlCL15E4mUk9jrUFb9VY5mOZTQ
	44V7GsSDV+tDVeXWGs5h1M71eWqzuvveZSGPVDCDwlGHBK7Zm1pOnu2fcaRXfrft
	GzQ24ZjIxioCrVUw4Qffw==
X-ME-Sender: <xms:hNKIZmc6w5UFGkT3iM1QFZZDJIG1tWMpNv5xjE5wCUAU8gKOM63BsA>
    <xme:hNKIZgOEgpugBr0SJgfWZwPLcY_coRimPU_XYJKqhuT3JiGBEE3nO4Peq08jLiZbU
    D-v5onbtTgqInt-LKI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvgdeludcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
    rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
    eqnecuggftrfgrthhtvghrnhepkeelveffhedtiefgkeefhffftdduffdvueevtdffteeh
    ueeihffgteelkeelkeejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigr
    nhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:hNKIZng_Ub0UzksnyzJGR7JQZKVWDnpfIMCvbDvk1WgZhyQW5LeYOA>
    <xmx:hNKIZj9CIXKKjxTLRqHUUeK5PNfXXcsmOkA2mDc_ZdNIA8XPMfLl7w>
    <xmx:hNKIZiuTBWoUSrecCE0X5Vq0XfDAk-MR3882p0DR10650xZVCcHCSQ>
    <xmx:hNKIZqHnIp3ixycdtWlBOEEQc1Gld9aO-SXRa93QhwSf2aIkQcgI1g>
    <xmx:hNKIZkIVYTqDJvKP4ICVYpDp6I3dkH5Hl_aCCF48FT-7f5NtzdwJSY0->
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 0754236A0074; Sat,  6 Jul 2024 01:13:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-566-g3812ddbbc-fm-20240627.001-g3812ddbb
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-Id: <c95e4f86-b588-49a2-87d8-77d1e9d6472b@app.fastmail.com>
In-Reply-To: <20240612-cm_probe-v2-0-a5b55440563c@flygoat.com>
References: <20240612-cm_probe-v2-0-a5b55440563c@flygoat.com>
Date: Sat, 06 Jul 2024 13:13:09 +0800
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Serge Semin" <fancer.lancer@gmail.com>
Cc: "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/6] MIPS: cm: Probe GCR address from devicetree
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B46=E6=9C=8812=E6=97=A5=E5=85=AD=E6=9C=88 =E4=B8=8B=E5=
=8D=886:08=EF=BC=8CJiaxun Yang=E5=86=99=E9=81=93=EF=BC=9A
> Hi all,
>
> This series enabled mips-cm code to probe GCR address from devicetree.
>
> This feature has been implemented in MIPS's out-of-tree kernel for
> a while, and MIPS's u-boot fork on boston will generate required
> "mti,mips-cm" node as well.

Folks, any comments on this series?

Thanks

>
> Please review.
> Thanks
>
> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
> ---
> Changes in v2:
> - Fix probe order on malta (Serge)
> - dt binding improvements (Conor)
> - Build warning fix
> - Link to v1:=20
> https://lore.kernel.org/r/20240507-cm_probe-v1-0-11dbfd598f3c@flygoat.=
com
>
> ---
> Jiaxun Yang (6):
>       MIPS: generic: Do __dt_setup_arch in prom_init
>       MIPS: malta: Move SMP initialisation to device_tree_init
>       MIPS: cm: Prefix probe functions with __init
>       MIPS: Move mips_cm_probe after prom_init
>       dt-bindings: mips: Document mti,mips-cm
>       MIPS: cm: Probe GCR address from DeviceTree
>
>  .../devicetree/bindings/mips/mti,mips-cm.yaml      | 38 ++++++++++++
>  arch/mips/generic/init.c                           |  9 ++-
>  arch/mips/include/asm/mips-cm.h                    |  4 +-
>  arch/mips/kernel/mips-cm.c                         | 69 +++++++++++++=
+++++----
>  arch/mips/kernel/setup.c                           |  2 +-
>  arch/mips/mti-malta/malta-init.c                   |  8 ++-
>  6 files changed, 111 insertions(+), 19 deletions(-)
> ---
> base-commit: 2b84edefcad14934796fad37b16512b6a2ca467e
> change-id: 20240506-cm_probe-0c667c8b63bf
>
> Best regards,
> --=20
> Jiaxun Yang <jiaxun.yang@flygoat.com>

--=20
- Jiaxun

