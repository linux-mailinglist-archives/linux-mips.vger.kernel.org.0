Return-Path: <linux-mips+bounces-12785-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D77ACD03E11
	for <lists+linux-mips@lfdr.de>; Thu, 08 Jan 2026 16:33:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AD0B1301D9DF
	for <lists+linux-mips@lfdr.de>; Thu,  8 Jan 2026 15:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EC38451DF7;
	Thu,  8 Jan 2026 09:56:33 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9318C451DD5
	for <linux-mips@vger.kernel.org>; Thu,  8 Jan 2026 09:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767866192; cv=none; b=JlM4DqJYE+m0z2sJeEWUEuINxJGqtVajHD22if/59ILofTBQbGs76jcnFeIRhmKemF+PG2+EcOUUKyrk0SuZm38MRFVVqPderg7lfz7mw4ZuxB1iwMwE6qAoSEYBJbZonF94bFE2g0iBMj4V9KHqitpzA3G6+QwxH2EGfnYuQys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767866192; c=relaxed/simple;
	bh=xD5y6I5ED+awsboXcZBD4Y4YB9ZOIqfXv+SpP7f45ag=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V6iYVBzcrlC/I7SeM5kgZw0q9vat+Kjtc80B2hIXvDtRko5T3FF/+YDY7ZNkKtMV8BLIu0S6TM908yWElI4+yXa2f/lxaliV6QO6F7fketKzUIr/kKLC2R9G2TVC+fE7sHwTSBuclszZrMCSYO31AnHgN1j8wKwaQRUUpxIwv2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vdmkN-0004h1-Ca; Thu, 08 Jan 2026 10:56:03 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vdmkM-009eit-2n;
	Thu, 08 Jan 2026 10:56:02 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vdmkM-0000000044p-3Gjs;
	Thu, 08 Jan 2026 10:56:02 +0100
Message-ID: <5efcdfff3b259294954fdd14d12e16f20944d4ab.camel@pengutronix.de>
Subject: Re: [PATCH v2 04/13] reset: eyeq: Add Mobileye EyeQ6Lplus OLB
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
Date: Thu, 08 Jan 2026 10:56:02 +0100
In-Reply-To: <20251223-eyeq6lplus-v2-4-cd1fd21d182c@bootlin.com>
References: <20251223-eyeq6lplus-v2-0-cd1fd21d182c@bootlin.com>
	 <20251223-eyeq6lplus-v2-4-cd1fd21d182c@bootlin.com>
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

On Di, 2025-12-23 at 11:02 +0100, Beno=C3=AEt Monin wrote:
> Declare the two reset domains found in the EyeQ6Lplus OLB and add
> them to the data matched by 'mobileye,eyeq6lplus-olb' compatible.
>=20
> Those reset domains are identical to those present in the EyeQ5
> OLB, so no changes are needed to support them.
>=20
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

