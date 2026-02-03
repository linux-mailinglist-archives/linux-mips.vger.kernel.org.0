Return-Path: <linux-mips+bounces-13096-lists+linux-mips=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-mips@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAf7Gu1LgWkPFgMAu9opvQ
	(envelope-from <linux-mips+bounces-13096-lists+linux-mips=lfdr.de@vger.kernel.org>)
	for <lists+linux-mips@lfdr.de>; Tue, 03 Feb 2026 02:14:21 +0100
X-Original-To: lists+linux-mips@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C55D345B
	for <lists+linux-mips@lfdr.de>; Tue, 03 Feb 2026 02:14:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E2687300CE7E
	for <lists+linux-mips@lfdr.de>; Tue,  3 Feb 2026 01:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60B231E5B9E;
	Tue,  3 Feb 2026 01:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MKNPOKXk"
X-Original-To: linux-mips@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7591E25F9;
	Tue,  3 Feb 2026 01:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770081239; cv=none; b=qYCd5cwBECybEln09gzvipG3T491J5zRflJog/PLINb7b+b/jiBHI9m7DWEhCT8vCvwIbL4TtDac7R0bocxn9mycA3/GEoyWR9zaVnQJBX+niyciRC1Z+CoiIK01t0Dm1FPjgEIGAZIEa1ZzqpVi2HPTV276nYxTJVRvzZNVJqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770081239; c=relaxed/simple;
	bh=SaJkrdt5k2anq2Urx8bRHPWyklckA/4xYEE5hJDDSgU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jUe8mZLQWAGrLjWnpXAoVqTdUFDe94tfRemCnwijJRDBCmdLD7rzGyelCaeaw3n3tBIjt3gAl1M4JA+iWrMQ8IXmhxlhsgxmhmT6aNfOLOncftAUTGzQ8Gk12r1JTp9B3nhIXHnZkAFMXZG5zO8MLntEQIpndgZSvLQLv3Bl1zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MKNPOKXk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F696C116C6;
	Tue,  3 Feb 2026 01:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770081239;
	bh=SaJkrdt5k2anq2Urx8bRHPWyklckA/4xYEE5hJDDSgU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MKNPOKXk6nE6ae8dgHfoMkC2fuHWgj35tCJuny4m1IzaeLKTJt8YR+P4vAFbqxpEw
	 O1lz5YEcMrtQd7GXLlUzEubVUUHSSZF2j2YWnV43RcSqv04ZlLSuYxYNYYKNzo8Jfl
	 c88VPqJoeJA+ICpzptdG3TJpIdEv479p6zitrXReSlVR07xbMEcyfl/w84TaTYFnLW
	 WIcWudRqvgglkoXywxfWYOD72U/DZSdFfKytZNGJwrSFozuEU/PDACAOAHinVAivCj
	 fbPieYd+ORrjxZ6nUTjbsMG9TlKaXxdhMEB13OdEjvNR76sDpRaGJztaLxFk5UwAKF
	 9Uamr29WXMgVA==
Date: Mon, 2 Feb 2026 17:13:57 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Paolo Abeni <pabeni@redhat.com>, David Miller <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>, Andrew
 Lunn <andrew+netdev@lunn.ch>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Hauke Mehrtens <hauke@hauke-m.de>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, OpenWrt
 Development List <openwrt-devel@lists.openwrt.org>, Daniel Golle
 <daniel@makrotopia.org>
Subject: Re: [PATCH v2 net-next] net: lantiq_etop: remove driver
Message-ID: <20260202171357.0e4a9e38@kernel.org>
In-Reply-To: <73f3ea5f-57ed-40b1-9acb-ab595083aab6@gmail.com>
References: <73f3ea5f-57ed-40b1-9acb-ab595083aab6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-mips@vger.kernel.org
List-Id: <linux-mips.vger.kernel.org>
List-Subscribe: <mailto:linux-mips+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-mips+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13096-lists,linux-mips=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kuba@kernel.org,linux-mips@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-mips,netdev];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B6C55D345B
X-Rspamd-Action: no action

On Fri, 30 Jan 2026 17:40:49 +0100 Heiner Kallweit wrote:
>  arch/mips/configs/xway_defconfig              |   1 -
>  .../include/asm/mach-lantiq/lantiq_platform.h |  18 -
>  drivers/net/ethernet/Kconfig                  |   6 -
>  drivers/net/ethernet/Makefile                 |   1 -
>  drivers/net/ethernet/lantiq_etop.c            | 745 ------------------
>  5 files changed, 771 deletions(-)
>  delete mode 100644 arch/mips/include/asm/mach-lantiq/lantiq_platform.h
>  delete mode 100644 drivers/net/ethernet/lantiq_etop.c

Also Documentation/devicetree/bindings/net/lantiq,etop-xway.yaml ?
and arch/mips/boot/dts/lantiq/danube_easy50712.dts but that needs 
to go via the MIPS tree
-- 
pw-bot: cr

