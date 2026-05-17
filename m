Return-Path: <linux-mips+bounces-14624-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WBdIAncgCmrkwwQAu9opvQ
	(envelope-from <linux-mips+bounces-14624-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Sun, 17 May 2026 22:09:27 +0200
X-Original-To: lists+linux-mips@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AD2563B2A
	for <lists+linux-mips@lfdr.de>; Sun, 17 May 2026 22:09:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5B93F3002B0D
	for <lists+linux-mips@lfdr.de>; Sun, 17 May 2026 20:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E6A3043C8;
	Sun, 17 May 2026 20:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=a16n.net header.i=@a16n.net header.b="NYN7MXhW"
X-Original-To: linux-mips@vger.kernel.org
Received: from server.a16n.net (server.a16n.net [82.67.174.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B48E30C179
	for <linux-mips@vger.kernel.org>; Sun, 17 May 2026 20:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.67.174.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779048564; cv=none; b=oPoDbrEiVV1BFvW4KidB26lGVAVMerdwba6lmZRtDnon5TvTocIDFwg6ARYZoIS1L8M00/trBw0XTDUFmmpQWPo2SpNfxvLCyRfxhpqGzWO9XqV7S2kmksNzDMw+lY2RR45dQWCMYX3wbqaoJNg0B9b+c4bGpHqzEjEaDNoP/mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779048564; c=relaxed/simple;
	bh=l8CkytgO7MsSs0ThxVZCUYjM6c9AHfIdQ4Bj4FoutNI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=k2ZFAEmatGhydfHA+AGYP1fygp9QcyvO6lZHel7x25n56tKewJWc7SmRqlkPjstYhiacYT/mBFqqhLR7w/rzxFeUGE47JtHnSe+oAXQUv31e2FV8dV6Y9fELx9JItmAsTGL65pRjZh4tWtSMgLXgcSPdWVjhee+R7sifoeFTZW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=a16n.net; spf=pass smtp.mailfrom=a16n.net; dkim=pass (2048-bit key) header.d=a16n.net header.i=@a16n.net header.b=NYN7MXhW; arc=none smtp.client-ip=82.67.174.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=a16n.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=a16n.net
Received: from ws.localdomain (21.197.30.93.rev.sfr.net [93.30.197.21])
	by server.a16n.net (Postfix) with ESMTPSA id 07A7E640654;
	Sun, 17 May 2026 22:09:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=a16n.net; s=a16n;
	t=1779048558; bh=kvz5kPi0OkhVSdw2fiPcGB5LCqbvyetPuhMb4A95O3s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=NYN7MXhWvQz/Uefk/cfmvSrgaDQEVXkc0zCpsLAagGNrxgNtY20j/EcGZkGDb5zV+
	 KyQrCIyId0uiPJS98n10s+YLZ2HcmkXlgWu0OsIMN9pDbCjVvS7qOluV7OjDXalUet
	 UV3LDnXfNYPtFC0FaGHrI7MoTSjQLby09wr7/fbTPdtDhRuk1w3ArDUQuXfBp+nhVx
	 Ftz3W/xlonlb+KSYdLMDMJCEXC4C32AMrzIGRHRMpBic/+I5WhNkhiP6vOxFLNdK7W
	 w+nUcCNV8YLF4/vjC9VrEa2q/QSyzjq94cY1r1nJLjRsAgTTESgEzOkdrUMDdKnUAu
	 rGfaxiDf/G5Mw==
Received: by ws.localdomain (Postfix, from userid 1000)
	id EECAD306CBF; Sun, 17 May 2026 22:09:16 +0200 (CEST)
From: =?utf-8?Q?Peter_M=C3=BCnster?= <pm@a16n.net>
To: linux-mips@vger.kernel.org
Cc: Waldemar Brodkorb <wbx@openadk.org>
Subject: Re: Asus WL500g Premium (BCM47XX) problem
In-Reply-To: <agoFSZ8pdS_bt3C-@waldemar-brodkorb.de>
References: <aZ3NVrKLKgsflL1H@waldemar-brodkorb.de>
	<aZ-Ldi2U-51z3tF5@waldemar-brodkorb.de> <87y0hhgbip.fsf@a16n.net>
	<agoFSZ8pdS_bt3C-@waldemar-brodkorb.de>
Date: Sun, 17 May 2026 22:09:16 +0200
Message-ID: <87cxytg5n7.fsf@a16n.net>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"
X-Rspamd-Queue-Id: 90AD2563B2A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.20 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.56)[subject];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[a16n.net,none];
	R_DKIM_ALLOW(-0.20)[a16n.net:s=a16n];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-14624-lists,linux-mips=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pm@a16n.net,linux-mips@vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[a16n.net:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-mips];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sun, May 17 2026, Waldemar Brodkorb wrote:

> It is not integrated.

Is it planned? If not, what could I do please, to make it happen?


> You can find the patch which applies on latest 6.18 kernel here:

I get "Error: Forbidden"...

=2D-=20
           Peter

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iGoEARECACoWIQS/5hHRBUjla4uZVXU6jitvQ7HLaAUCagogbAwccG1AYTE2bi5u
ZXQACgkQOo4rb0Oxy2gVRACfXpoQn4EMWPG/xBfAeMqkeN8K1mQAoOu2eKByFajh
gdlkAX/WxsvDKdyK
=l1lf
-----END PGP SIGNATURE-----
--=-=-=--

