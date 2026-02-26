Return-Path: <linux-mips+bounces-13251-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OrwNG5UoGlLiQQAu9opvQ
	(envelope-from <linux-mips+bounces-13251-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Thu, 26 Feb 2026 15:10:54 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A64D1A7419
	for <lists+linux-mips@lfdr.de>; Thu, 26 Feb 2026 15:10:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 75DA0308D373
	for <lists+linux-mips@lfdr.de>; Thu, 26 Feb 2026 13:56:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BBAB3A1A2D;
	Thu, 26 Feb 2026 13:53:19 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F463BFE36
	for <linux-mips@vger.kernel.org>; Thu, 26 Feb 2026 13:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772113999; cv=none; b=HA4vEAg44d0JPjCzeFN7UEMmsAUrh1NxPOF8CmBdVOizZrZ1fy1wKy/WNybQkd3Xq1XkXepPRWp7zQh1ZjW5x+TszRH19HxyyzWAMH/dVhPvbHlR1QMfzEVYT+N5ZSqIBJ9/mkin/Rs7iva+HEJL7PDvc/IHELZpo7c5VJKCkIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772113999; c=relaxed/simple;
	bh=JfcaP+q1iJfCTanNOmnDbwr7hlfj95p3bo6fjnx2s4U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WCwL1uJh2hhvg7VRiCANPdvsSHoLr/h9RGLKkfhlyuGKBeqJ25iyeTflwMg9zjkWAhLk01OEsj5/e3reu2OhPAoCA7d5QB1uYBS03xdUsjGt4rvADnHFUHTkkZHpsPVybzl/gn8YV2w97IpKoR8AVNQKu+iF+sO3fbERM9ektuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vvbna-0006qH-Vi; Thu, 26 Feb 2026 14:53:02 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vvbnY-002juK-3A;
	Thu, 26 Feb 2026 14:53:02 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vvbna-00000000CvY-0yce;
	Thu, 26 Feb 2026 14:53:02 +0100
Message-ID: <9b98fd53f7ef580e4264dd69d94963a966f4b938.camel@pengutronix.de>
Subject: Re: [PATCH v3 04/13] reset: eyeq: Add Mobileye EyeQ6Lplus OLB
From: Philipp Zabel <p.zabel@pengutronix.de>
To: =?ISO-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>, Vladimir
 Kondratiev <vladimir.kondratiev@mobileye.com>, Gregory CLEMENT
 <gregory.clement@bootlin.com>,  =?ISO-8859-1?Q?Th=E9o?= Lebrun	
 <theo.lebrun@bootlin.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,  Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Linus Walleij
 <linusw@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk
	 <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Date: Thu, 26 Feb 2026 14:53:02 +0100
In-Reply-To: <20260226-eyeq6lplus-v3-4-9cbeb59268b0@bootlin.com>
References: <20260226-eyeq6lplus-v3-0-9cbeb59268b0@bootlin.com>
	 <20260226-eyeq6lplus-v3-4-9cbeb59268b0@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mips@vger.kernel.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13251-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[p.zabel@pengutronix.de,linux-mips@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pengutronix.de:mid,pengutronix.de:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,bootlin.com:email]
X-Rspamd-Queue-Id: 6A64D1A7419
X-Rspamd-Action: no action

On Do, 2026-02-26 at 14:33 +0100, Beno=C3=AEt Monin wrote:
> Declare the two reset domains found in the EyeQ6Lplus OLB and add
> them to the data matched by 'mobileye,eyeq6lplus-olb' compatible.
>=20
> Those reset domains are identical to those present in the EyeQ5
> OLB, so no changes are needed to support them.
>=20
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>
> ---
>  drivers/reset/Kconfig      |  4 ++--
>  drivers/reset/reset-eyeq.c | 31 +++++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index 7ce151f6a7e4..0cf49495d814 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -85,9 +85,9 @@ config RESET_EIC7700
> =20
>  config RESET_EYEQ
>  	bool "Mobileye EyeQ reset controller"
> -	depends on MACH_EYEQ5 || MACH_EYEQ6H || COMPILE_TEST
> +	depends on MACH_EYEQ5 || MACH_EYEQ6H || MACH_EYEQ6LPLUS || COMPILE_TEST
>  	select AUXILIARY_BUS
> -	default MACH_EYEQ5 || MACH_EYEQ6H
> +	default MACH_EYEQ5 || MACH_EYEQ6H || MACH_EYEQ6LPLUS

How about replacing "MACH_EYEQ5 || MACH_EYEQ6H" with just "EYEQ"
instead?


regards
Philipp

