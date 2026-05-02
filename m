Return-Path: <linux-mips+bounces-14427-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WM4IEgAP9mkiSAIAu9opvQ
	(envelope-from <linux-mips+bounces-14427-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sat, 02 May 2026 16:49:36 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A944B28C3
	for <lists+linux-mips@lfdr.de>; Sat, 02 May 2026 16:49:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66E1C3014963
	for <lists+linux-mips@lfdr.de>; Sat,  2 May 2026 14:49:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74A993806C4;
	Sat,  2 May 2026 14:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="oF8wqdex";
	dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b="DsMG1es8"
X-Original-To: linux-mips@vger.kernel.org
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9315C1D7E41;
	Sat,  2 May 2026 14:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777733345; cv=pass; b=hItaSJctuLvg6hFrkJjAA6tVBj8aJwdOnRQYLTtZIkp+cvyZYVF01vy5V4ioQaHeTEt27hJwM/ykVDmAdCQg/uwQACZiSkVNBh4zxB/NT+LQOXJU81t4WeDEjDBb8F2mcpXP4BOa+9RK5AXRjrFakGac4ciNxBmjfmXCzKeCiak=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777733345; c=relaxed/simple;
	bh=H1gP1uQxmN0GOvEug9MTUgTvKbWjePcwyXu0ijdfHlQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=OR9O6iOV1/M79gn863MFv4nWSfOkougsjoA0NOEK37MspGf4brh57KKetinnzQRZVdF0vc1vUsUaGF5P/bTdt4tWeJMZuQAlofr4K4yHOGGwbewHZJaREfofJhn2E/L+Ip7YeP8ymo+wUrN4xSu3ZJcnhL80FsxW2K/jeMysPeU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com; spf=pass smtp.mailfrom=goldelico.com; dkim=pass (2048-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=oF8wqdex; dkim=permerror (0-bit key) header.d=goldelico.com header.i=@goldelico.com header.b=DsMG1es8; arc=pass smtp.client-ip=85.215.255.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=goldelico.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goldelico.com
ARC-Seal: i=1; a=rsa-sha256; t=1777733313; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=e6itlIHEut/CPuoZDesPd7jHWDdjrBNN76l2JwPCfyZ4Gw59aM1IPCoaaFA2EW0E1K
    cCjOyklcepHi/5yYR7RjHKqn0GgwY1upw/fgQsd02P5TiBxcqWlwNWP9BTp9QgGGds5C
    bypITQKtIRB+q9iFnKIxFDPCJMDdkKi1mBN3jExEb9vxAvprKAi8D7/47WHjcFot8m9i
    hOC87SQiB54yVKdDMtjxFoXCjsen8R6TwlqCMlRP28sYpJd1Zig3o1JMzcRSXd/klQ5a
    njJx27kenk6mXE88dPm5XRq/VJzjBflQ2f8YreCPJu9AaZ/kMACj5xD1ZxkFxsoFIOot
    i2Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1777733313;
    s=strato-dkim-0002; d=strato.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=U0F2bp1mazAkJtSUEyvJv/Ar4TEUHcrJS1Sxc7iPu/w=;
    b=kkm/jEv8Q1coPGRqAgw00IKDsMPIwC51eh0QeESYrOJGLBR/kJwJVkAuiy84Du37o2
    TIb69fK9uQNVslVWVvpSUF1d342IJk+vULHmaZdoukmmv/chYUHQmm/APYJBjnOTWDdf
    aEneVBcGXA421puqzSae4jpRGgKshs18WOoCuJsl5W6H8jAHrTUH6oN/frmO7ZvhCfMH
    BtgqkTLBLbGl46LiVZ78e06G12jk4G8AETfigVR5u8GnG7jq5LG1ws5h6Q1q1hR2Ssuz
    IVJ0xfzQKVcyOsm4+NVxm7Uv9IHlhGjebxkC4RJB39ar/1mf21ebWkwTyM3Kdhs0Mj3l
    4b5g==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1777733313;
    s=strato-dkim-0002; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=U0F2bp1mazAkJtSUEyvJv/Ar4TEUHcrJS1Sxc7iPu/w=;
    b=oF8wqdexWxrJxhDdkT9Mzf+qQGrDtLy4Pvg6y3lk49nJvo2rXASQaXUzKQRXM43ER0
    QijNJo7tLfJuoxQdH+1gQa3HO5TugDLPTVXz/3kJehD9zagUXfPIptbMOa5LA9VO9F1h
    UaZYgdebAB6jUMr6djVQthmAeMaX2VbyO0v945iIYrTEdbT/3cFKUi46/GMK/Hs7yvnI
    +190gTdYAI5CtPtb6k2qyKxQ5D+g0XrgmyWEuINQYBbuXdO+9sFJcrGCj+eh+kca1bew
    BD01Q3PWhg1o9IKe2wq5UkhWA+qsM9LUp58SqeVXnqf6NAXd0YnW1APBZJ8EYjEDRAeT
    6wQg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1777733313;
    s=strato-dkim-0003; d=goldelico.com;
    h=To:References:Message-Id:Cc:Date:In-Reply-To:From:Subject:Cc:Date:
    From:Subject:Sender;
    bh=U0F2bp1mazAkJtSUEyvJv/Ar4TEUHcrJS1Sxc7iPu/w=;
    b=DsMG1es88ao8/91HpH1qVJILUUqJnJWArDBTRTvoiAjIP1WkUgj1fMYXCdfVcIQ4/v
    VusIXROai6OSAYusMbAw==
X-RZG-AUTH: ":JGIXVUS7cutRB/49FwqZ7WcJeFKiMhflhwDubTJ9o12DNOsPj0lFzL1yfzkZ"
Received: from smtpclient.apple
    by smtp.strato.de (RZmta 55.0.1 DYNA|AUTH)
    with ESMTPSA id Qcf97c242EmWZPM
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve X9_62_prime256v1 with 256 ECDH bits, eq. 3072 bits RSA))
	(Client did not present a certificate);
    Sat, 2 May 2026 16:48:32 +0200 (CEST)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81.1.6\))
Subject: Re: [PATCH 3/7] pinctrl: ingenic: Fix type in .pin_config_group_get()
 callback
From: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <9f50c234c44af9075b5252ee7e59452ed2179b27.1777562725.git.geert+renesas@glider.be>
Date: Sat, 2 May 2026 16:48:21 +0200
Cc: Linus Walleij <linusw@kernel.org>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Sean Wang <sean.wang@kernel.org>,
 Paul Cercueil <paul@crapouillou.net>,
 Tony Lindgren <tony@atomide.com>,
 Haojian Zhuang <haojian.zhuang@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 linux-gpio@vger.kernel.org,
 linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-omap@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <98F0E379-88A0-414E-B24A-187374E5FCAD@goldelico.com>
References: <cover.1777562725.git.geert+renesas@glider.be>
 <9f50c234c44af9075b5252ee7e59452ed2179b27.1777562725.git.geert+renesas@glider.be>
To: Geert Uytterhoeven <geert+renesas@glider.be>
X-Mailer: Apple Mail (2.3826.700.81.1.6)
X-Rspamd-Queue-Id: C2A944B28C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[goldelico.com,quarantine];
	R_DKIM_ALLOW(-0.20)[goldelico.com:s=strato-dkim-0002,goldelico.com:s=strato-dkim-0003];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-14427-lists,linux-mips=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,crapouillou.net,atomide.com,linaro.org,gmail.com,collabora.com,bp.renesas.com,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hns@goldelico.com,linux-mips@vger.kernel.org];
	DKIM_TRACE(0.00)[goldelico.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,glider.be:email,goldelico.com:dkim,goldelico.com:mid]



> Am 30.04.2026 um 17:33 schrieb Geert Uytterhoeven =
<geert+renesas@glider.be>:
>=20
> On 64-bit platforms, "unsigned long" is 64-bit.  Hence checking if all
> "unsigned long" configuration values are equal should be done using an
> "unsigned long" temporary.
>=20
> While Ingenic is a 32-bit platform, it is still better to use the
> correct type, to serve as an example.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

tested to show no visible difference on Ingenic X1600 based board (Letux =
X16) on top of v7.1-rc1.

BR and thanks,
Nikolaus



