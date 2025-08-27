Return-Path: <linux-mips+bounces-10651-lists+linux-mips=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-mips@lfdr.de
Delivered-To: lists+linux-mips@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E369EB38407
	for <lists+linux-mips@lfdr.de>; Wed, 27 Aug 2025 15:50:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 153B4189370A
	for <lists+linux-mips@lfdr.de>; Wed, 27 Aug 2025 13:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 385D8352FFD;
	Wed, 27 Aug 2025 13:50:15 +0000 (UTC)
X-Original-To: linux-mips@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02224C8EB
	for <linux-mips@vger.kernel.org>; Wed, 27 Aug 2025 13:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756302615; cv=none; b=RjXG7J4mEUrKLL/rWqlQkYOealjsAVbpUlIU62CVwDlXrYrKzbeaBD87VvcVWHSLkQ8JdGWBhzFcwAafdy5FoxxyIDZFEdqhA7peFVTpkB689XjZalo3AwSVaMxhDQ2YtA7oO8wAfqOv8XO5CgIf2CWCgdGYhOxr+RemrrInBlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756302615; c=relaxed/simple;
	bh=Zdmsj9SJdrQFmm972+bz9ZasMmLt557MLazdFFeMkM0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qiwrSke6YH+jFYJt3zTpHlzNEC1Ff8UJfABgBNBvOM1oSTNrAotW8/o3QBc4ariVZZiEkWzCuourLDGr99Hjquf03gr1SZka0WacPgz1nVsrn8NPv1rDUFfaxyQdJH6nEPTHIEKxKTqM+QogT+UeDkZd7EELPD3gFDBypbDPaSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1urGXF-0006Sp-5X; Wed, 27 Aug 2025 15:49:57 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1urGXE-002P33-29;
	Wed, 27 Aug 2025 15:49:56 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1urGXE-000K0a-1w;
	Wed, 27 Aug 2025 15:49:56 +0200
Message-ID: <2dc22b0a8f1dbad283786e0ab99e78d7468695d5.camel@pengutronix.de>
Subject: Re: [PATCH] reset: eyeq: fix OF node leak
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Johan Hovold <johan@kernel.org>, Vladimir Kondratiev
	 <vladimir.kondratiev@mobileye.com>, Gregory CLEMENT
	 <gregory.clement@bootlin.com>, =?ISO-8859-1?Q?Th=E9o?= Lebrun
	 <theo.lebrun@bootlin.com>
Cc: linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 27 Aug 2025 15:49:56 +0200
In-Reply-To: <20250708085613.15823-1-johan@kernel.org>
References: <20250708085613.15823-1-johan@kernel.org>
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

On Di, 2025-07-08 at 10:56 +0200, Johan Hovold wrote:
> Make sure to drop the OF node reference taken when probing the auxiliary
> device when the device is later unbound.
>=20
> Fixes: 487b1b32e317 ("reset: eyeq: add platform driver")
> Cc: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

