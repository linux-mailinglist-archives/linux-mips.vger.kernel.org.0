Return-Path: <linux-mips+bounces-10654-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1675CB38531
	for <lists+linux-mips@lfdr.de>; Wed, 27 Aug 2025 16:42:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 385477C1E22
	for <lists+linux-mips@lfdr.de>; Wed, 27 Aug 2025 14:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FD79216E24;
	Wed, 27 Aug 2025 14:41:38 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C5A20298D
	for <linux-mips@vger.kernel.org>; Wed, 27 Aug 2025 14:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756305698; cv=none; b=VYq1S8E6IvbhPU2NrwijsRNPF7irCN/DFFckh/UwBqcMRaOrUCbAoMMPkN9bvrTCN9qBfzyhcBmTCD6kkzM1tshTyhmwvyosy3SnCP80t5bD2OpEwdnlQaAL5XMPfQvc3skA5BltTcf8s09uAwnz4F1EXcuqWkAbHBJ8wkD6dYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756305698; c=relaxed/simple;
	bh=A0v5E35atnNyUAejA2XC9G9AGfZpybvn0B3jm9jLe54=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aZcI3Cn+kUInqcguU0Gph717ulHFFKQl8OYFnpyNZrOBiR0f5RS7iFUHF4oKWAckPAyvf7Swc8YVqRozG6zDiq9OHsPlRQNlY/ZNzKd4q0Wg94V9R9yRWC0Sb+E09huwWKDHeuUG1Vg6QIjkAP9EQdBtG4WRzHF/nlT2M4/5l40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1urHLA-0001Iy-1D; Wed, 27 Aug 2025 16:41:32 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1urHL9-002PS4-2D;
	Wed, 27 Aug 2025 16:41:31 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1urHL9-000Mek-1z;
	Wed, 27 Aug 2025 16:41:31 +0200
Message-ID: <6b52d1ea9d9a857e1ae9e4ab253edd6af10bfe47.camel@pengutronix.de>
Subject: Re: [PATCH] reset: eyeq: fix OF node leak
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Johan Hovold <johan@kernel.org>, Vladimir Kondratiev
	 <vladimir.kondratiev@mobileye.com>, Gregory CLEMENT
	 <gregory.clement@bootlin.com>, =?ISO-8859-1?Q?Th=E9o?= Lebrun
	 <theo.lebrun@bootlin.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 27 Aug 2025 16:41:31 +0200
In-Reply-To: <aK7Ua3GRBKSFC7Xu@hovoldconsulting.com>
References: <20250708085613.15823-1-johan@kernel.org>
	 <aK7Ua3GRBKSFC7Xu@hovoldconsulting.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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

On Mi, 2025-08-27 at 11:48 +0200, Johan Hovold wrote:
> On Tue, Jul 08, 2025 at 10:56:13AM +0200, Johan Hovold wrote:
> > Make sure to drop the OF node reference taken when probing the auxiliar=
y
> > device when the device is later unbound.
> >=20
> > Fixes: 487b1b32e317 ("reset: eyeq: add platform driver")
> > Cc: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> > Signed-off-by: Johan Hovold <johan@kernel.org>
>=20
> Can this one be picked up?

Thank you for the reminder, applied to reset/fixes.

[1/1] reset: eyeq: fix OF node leak
      https://git.pengutronix.de/cgit/pza/linux/commit/?id=3D9a52827a9bbb

regards
Philipp


