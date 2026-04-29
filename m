Return-Path: <linux-mips+bounces-14390-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJZkF13L8Wn+kQEAu9opvQ
	(envelope-from <linux-mips+bounces-14390-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2026 11:11:57 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC19D4919CD
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2026 11:11:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D77A3017380
	for <lists+linux-mips@lfdr.de>; Wed, 29 Apr 2026 09:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 935433BD22B;
	Wed, 29 Apr 2026 09:11:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="zmRS1fZc"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781D739DBF2
	for <linux-mips@vger.kernel.org>; Wed, 29 Apr 2026 09:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777453913; cv=none; b=CCMqa2WRu/EWgOOjEvqavlHi/aCj4WCiKLIMMsJ3mcD5JujjKOx0+JPxzu0p7ZM3gV809afHrctbmWaz5zCkiQBytDem0kGGen96Y5H7Q23+vaE6B9Zr0l8ThtAq0xZLy2GYT9RG9HPafONgcn6MeCOGM3EH+vZx6Tte5iCxR1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777453913; c=relaxed/simple;
	bh=afQnCziSQw9RqyG0RZJ7CbnfZsgxFMZUmM5i6GoRTAE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=tNU6H5vmKfPtn6FIv55Ol80Kcx1CGJ14s7N2F/Y3sPbUGXUvBv5t60mKOExnUx4qz+BHfrQTAzwGm8o0b7ZwwqZ6dY9B7b2tcu67ScvyrlqYbz7YDXRrW2W48Xw5YAC/0gWNnOoMdCWeMZ5G8sbMdAxSsftfdxws2kmimIp372c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=zmRS1fZc; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7D240C5CD50;
	Wed, 29 Apr 2026 09:12:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4AFCE601DF;
	Wed, 29 Apr 2026 09:11:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5F6F91072981A;
	Wed, 29 Apr 2026 11:11:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777453902; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=i3fH3BpVMeeL6++Hnod35PBAc+GS+PtWdmZnjJ4bk/w=;
	b=zmRS1fZcRQcufPaj2iR31c+INVvnAYOmBMP2BMYDwjW9StiHpyVBDzZth60XATUgOafcBl
	iYKPVuAiddpcI3nVvFRltfkEMY52E8zag0A9xFINsCpYyHk5zQ7q4kiotQ1r02B1jdGNfY
	Gi9MIArPBeco30jJyZLWFdstaLnPu8e3OTHzdwmr7fmmQMTWIoLK9LI38PO/K2irBfFMJJ
	D3AvWnBEjR4vJeqacFj1sHSQXiwXXZwMvCTpmkv2ODLCnNTumQhAHyvjGNJAxICwgKJlMD
	i1zqy2+CE3P22+0Ax4k2ot8ynf7JOC/1pD6nSpcFGf+gz0iqW7XS1J86SZPjzw==
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Apr 2026 11:11:39 +0200
Message-Id: <DI5ITKXOJOEE.28MZGWL8UPDOA@bootlin.com>
Cc: <linux-mips@vger.kernel.org>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "Vladimir Kondratiev"
 <vladimir.kondratiev@mobileye.com>, "Gregory CLEMENT"
 <gregory.clement@bootlin.com>, =?utf-8?q?Beno=C3=AEt_Monin?=
 <benoit.monin@bootlin.com>, "Tawfik Bayouk" <tawfik.bayouk@mobileye.com>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Luca Ceresoli"
 <luca.ceresoli@bootlin.com>, "Jerome Brunet" <jbrunet@baylibre.com>
To: "Stephen Boyd" <sboyd@kernel.org>, "Michael Turquette"
 <mturquette@baylibre.com>, "Philipp Zabel" <p.zabel@pengutronix.de>
From: =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>
Subject: Re: [PATCH v7 3/3] reset: eyeq: drop device_set_of_node_from_dev()
 done by parent
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260225-macb-phy-v7-0-665bd8619d51@bootlin.com>
 <20260225-macb-phy-v7-3-665bd8619d51@bootlin.com>
 <177742824867.5403.11815560359227140766@localhost.localdomain>
In-Reply-To: <177742824867.5403.11815560359227140766@localhost.localdomain>
X-Last-TLS-Session-Version: TLSv1.3
X-Rspamd-Queue-Id: DC19D4919CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14390-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[theo.lebrun@bootlin.com,linux-mips@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	TO_DN_SOME(0.00)[]

On Wed Apr 29, 2026 at 4:04 AM CEST, Stephen Boyd wrote:
> Quoting Th=C3=A9o Lebrun (2026-02-25 08:55:07)
>> Our parent driver (clk-eyeq) now does the
>>         device_set_of_node_from_dev(dev, dev->parent)
>> call through the newly introduced devm_auxiliary_device_create() helper.
>>=20
>> Doing it again in the reset-eyeq probe would be redundant.
>> Drop both the WARN_ON() and the device_set_of_node_from_dev() call.
>> Also fix the following comment that talks about "our newfound OF node".
>>=20
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
>> Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
>> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>
>> ---
>
> Applied to clk-fixes

Thanks Stephen!

--
Th=C3=A9o Lebrun, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

